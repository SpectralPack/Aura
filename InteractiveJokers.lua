--FUNCTIONS FOR JOKERS THAT NEED TO DETECT CERTAIN EVENTS

--Detecting Egg price increase and triggering animation
local csc = Card.set_cost
function Card:set_cost()
    if self.ability and self.ability.name == "Egg" then
        if not self.animation then --Should only happen on creation
            Aura.add_individual(self)
            self.animation = { target = 0, egg_old_value = self.ability.extra_value }
        elseif self.ability.extra_value > self.animation.egg_old_value then --When the price increases
            Aura.add_individual(self)
            self.animation = { target = 0, escape_target = true, egg_old_value = self.ability.extra_value }
        end
    end
    csc(self) --Original Card:set_cost function call
end

--Detecting when the hand selected is already played to trigger Card Sharp animation
local uht = update_hand_text
function update_hand_text(config, vals)
    uht(config, vals) --Original update_hand_text function call
    --At least in vanilla, the only situation where the following conditions are met is when selecting a hand, not when playing it or leveling it up
    if config.immediate and not config.volume and vals.handname ~= nil then
        --Check if the selected hand has already been played this round and set Card Sharp animation target accordingly
        if G.GAME.hands[vals.handname] and G.GAME.hands[vals.handname].played_this_round > 0 then
            AnimatedJokers.j_card_sharp.target = 3
        else
            AnimatedJokers.j_card_sharp.target = 0
        end
    end
    return true
end

--Detecting when interest is evaluated to trigger To The Moon animation.
local arer = add_round_eval_row
function add_round_eval_row(config)
    --Original add_round_eval_row function call
    local ret = arer(config)
    --Trigger animation when the interest row is added
    if config.name == "interest" then
        --Only trigger if there is a To The Moon joker in play
        local has_ttm = false
        for _, jkr in ipairs(G.jokers.cards) do
            if jkr.ability.name == "To the Moon" then
                has_ttm = true
                break
            end
        end
        if has_ttm then
            --Add animation inside an event
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blocking = false,
                func = (function()
                    AnimatedJokers.j_to_the_moon.escape_target = true
                    return true
                end)
            }))
        end
    end
    return ret
end

--Function for Oops All 6s. Called by Gros Michel, The Space Joker, 8 Ball, Business Card, Reserved Parking, Cavendish, Hallucination, Bloodstone, The Wheel of Fortune, Lucky Cards and Glass Cards
function Aura.Trigger_oops_all_6s()
    --Add animation inside an event
    G.E_MANAGER:add_event(Event({
        func = (function()
            AnimatedJokers.j_oops.extra.fps = 10*(G.SPEEDFACTOR/G.SETTINGS.GAMESPEED) --Adapt fps to game speed
            AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
            return true
        end)
    }))
end


--FUNCTIONS FOR JOKERS THAT ANIMATE WHEN DRAGGED

--Detecting when certain jokers are grabbed to trigger their animations
local ccl = Node.set_offset
function Node:set_offset(x,y)
    --Original Node:set_offset function call
    ccl(self,x,y)
    --Detecting Brainstorm grab
    if y == "Click" and self.config and self.config.center_key == 'j_brainstorm' and (G.shop_jokers and self.area ~= G.shop_jokers or true) then
        Aura.add_individual(self)
        self.animation = {target = 5}
    end
    --Detecting Blueprint grab
    if y == "Click" and self.config and self.config.center_key == 'j_blueprint' and (G.shop_jokers and self.area ~= G.shop_jokers or true) then
        Aura.add_individual(self)
        self.animation = {target = 11}
    end
end
--Detecting when certain jokers are released to trigger their animations
local crl = Node.stop_drag
function Node:stop_drag()
    --Original Node:stop_drag function call
    crl(self)
    --Detecting both Brainstorm and Blueprint release, as they share idle postion
    if self.config and (self.config.center_key == 'j_brainstorm' or self.config.center_key == 'j_blueprint') then
        Aura.add_individual(self)
        self.animation = {target = 0}
    end
end

--FUNCTIONS FOR JOKERS THAT ANIMATE ON CALCULATION

--Calculate_joker is called almost constantly after almost anything happens. What changes is the context. Lookout for context.blueprint to avoid triggering animation on the wrong card
local cj = Card.calculate_joker
function Card:calculate_joker(context)

    --Detecting when Gros Michel is about to extinguish to trigger animation
    if self.ability.name == "Gros Michel"  and context.end_of_round and context.main_eval and not context.blueprint then
        --Trigger Oops All 6s animation
        Aura.Trigger_oops_all_6s()
        --Use peek_pseudorandom to see the next value without altering it and know if it will extinguish
        if peek_pseudorandom('gros_michel') < G.GAME.probabilities.normal/self.ability.extra.odds and not AnimatedJokers.j_gros_michel.IncorrectAtlas then
            G.E_MANAGER:add_event(Event({
                delay = 1*G.SPEEDFACTOR, --Delay to let the animation play before destroying the card
                trigger = 'before',
                func = (function()
                    Aura.add_individual(self)
                    self.animation = { extra = { target = 17 } }
                    return true
                end)
            }))
        end
    end

    --Detecting when Sixth Sense is about to create a spectral card to trigger animation
    if self.ability.name == "Sixth Sense" and
      context.destroying_card and not context.blueprint and not self.debuff and
      #context.full_hand == 1 and context.full_hand[1]:get_id() == 6 and G.GAME.current_round.hands_played == 0 and
      #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and
      not AnimatedJokers.j_sixth_sense.IncorrectAtlas then --It is important to not add delay if sixth sense is not animated
        G.E_MANAGER:add_event(Event({ delay = 1.6*G.SETTINGS.GAMESPEED, --Delay the "+1 spectral" pop up to sync it with the flash
        trigger = 'before',
        func = (function()
            Aura.add_individual(self)
            self.animation = { target = 0, escape_target = true, fps = 10*(G.SPEEDFACTOR/G.SETTINGS.GAMESPEED) } --Adapt fps to SpeedFactor but not to Game Speed
            return true
        end)}))
    end

    --Detecting when Certificate is about to create a card with a seal to load animation
    if self.ability.name == "Certificate" and not context.blueprint and context.first_hand_drawn then
        Aura.add_individual(self)
        self.animation.animation_loaded = true
    end

    --Original Card:calculate_joker function call
    local ret = cj(self, context)

    --Detecting when Flash Card is upgraded to trigger animation
    if self.ability.name == "Flash Card" and context.reroll_shop and not context.blueprint and not AnimatedJokers.j_flash.IncorrectAtlas then
        G.E_MANAGER:add_event(Event({
            func = (function()
                --Flip Flash Card away
                self:flip()
                play_sound('card1')
                --Change to next letter once on back side
                delay(0.075*G.SPEEDFACTOR)
                Aura.add_individual(self)
                self.animation.flash_index = self.animation.flash_index + 1
                if self.animation.flash_index > 25 then self.animation.flash_index = 0 end --Wrap around
                self.animation.target = self.animation.flash_order[self.animation.flash_index]
                self:juice_up(0.3, 0.3) --Atract attention to the change
                delay(0.075*G.SPEEDFACTOR)
                --Flip Flash Card back
                self:flip()
                play_sound('tarot2', 1, 0.6)
                return true
            end)
        }))
    end

    --Detecting when Trading Card activates to trigger animation
    if self.ability.name == "Trading Card" and ret and ret.message and not context.blueprint and not AnimatedJokers.j_trading.IncorrectAtlas then --ret.message carrying info means will show the money pop up
        G.E_MANAGER:add_event(Event({
            func = (function()
                --Flip Trading Card away
                self:flip()
                play_sound('card1')
                delay(0.075*G.SPEEDFACTOR)
                --Change to next card once on back side
                Aura.add_individual(self)
                self.animation.trading_index = self.animation.trading_index + 1
                if self.animation.trading_index > #self.animation.trading_order then self.animation.trading_index = 0 end
                local trading_target = self.animation.trading_order[self.animation.trading_index] and self.animation.trading_order[self.animation.trading_index] or 11
                --Update atlas if needed
                if (AuraTradingCards[trading_target].atlas or (Malverk and "alt_tex_" or "").."aura_j_trading") ~= self.config.center.atlas then
                    self.config.center.atlas = AuraTradingCards[trading_target].atlas or (Malverk and "alt_tex_" or "").."aura_j_trading"
                    self:set_sprites(self.config.center)
                end
                --Determine if EX or regular version is obtained
                if AuraTradingCards[trading_target].EX and (pseudorandom("aura_trading_EX") < 1/10) then --10% chance for EX version only if EX version exists
                    trading_target = AuraTradingCards[trading_target].EX.pos
                    self.animation.EX = true
                else
                    trading_target = AuraTradingCards[trading_target].pos and AuraTradingCards[trading_target].pos or trading_target
                    self.animation.EX = false
                end
                self.animation.target = trading_target - 1
                self:juice_up(0.3, 0.3) --Atract attention to the change
                delay(0.075*G.SPEEDFACTOR)
                --Flip Trading Card back
                self:flip()
                play_sound('tarot2', 1, 0.6)
                return true
            end)
        }))
    end

    --Update Loyalty Card animation according to remaining hands
    if self.config.center_key == "j_loyalty_card" then
        if self.animation then
            if (5 - self.ability.loyalty_remaining) ~= self.animation.target then
                Aura.add_individual(self)
                self.animation = { target = 5 - (self.ability.loyalty_remaining or 0) }
                self:juice_up(0.2,0.2)
                play_sound("goldseal") --This sounds can be interpreted as a hole being punched in the card
            end
        else
            Aura.add_individual(self)
            self.animation = { target = 5 - (self.ability.loyalty_remaining or 0) }
        end
    end

    --Update Ice Cream animation according to remaining chips
    if self.ability.name == "Ice Cream" and context.cardarea == G.jokers and context.after and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                self.animation = { target = math.floor((100 - self.ability.extra.chips) / 5) } --Divide frames for each 20 chips 
                return true
            end)
        }))
    end

    --Update Rocket animation according to dollars gained
    if self.ability.name == "Rocket" and context.end_of_round and G.GAME.blind.boss and not context.blueprint then
        Aura.add_individual(self)
        self.animation = { fps = 10*self.ability.extra.dollars, extra = { target = 4 - math.min(4, math.floor(self.ability.extra.dollars / self.ability.extra.increase)) } } --Divide frames among the first 4 increments
    end

    --Update Popcorn animation according to remaining mult
    if self.ability.name == "Popcorn" and context.end_of_round and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                self.animation = { target =  5 - self.ability.mult/4 } --Divide frames for each 4 mult
                return true
            end)
        }))
    end

    --Update Seltzer animation according to remaining hands
    if self.ability.name == "Seltzer" and context.cardarea == G.jokers and context.after and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                self.animation = { target =  AnimatedJokers.j_selzer.frames-1 - math.floor(((self.ability.extra*(AnimatedJokers.j_selzer.frames-1)/10)) + 0.5 ) } --Automaticly divide frames (except first one) between al stages
                return true
            end)
        }))
    end

    --Update Invisible Joker animation according to remaining rounds
    if self.ability.name == "Invisible Joker" and context.end_of_round and not context.blueprint then
        Aura.add_individual(self)
        self.animation = { target = math.min( 10, math.floor((self.ability.invis_rounds * (AnimatedJokers.j_invisible.frames-1) / self.ability.extra) + 0.5)) } --Automaticly divide frames between al stages
    end

    --Detect when Space Joker activates to trigger animation
    if self.ability.name == "Space Joker" and context.cardarea == G.jokers and context.before and not self.debuff then
        --Trigger Oops All 6s animation
        Aura.Trigger_oops_all_6s()
        if not context.blueprint and ret and ret.level_up then -- ret.level_up means it is leveling up a hand
            G.E_MANAGER:add_event(Event({
                func = (function()
                    Aura.add_individual(self)
                    self.animation = { target = 0, escape_target = true }
                    return true
                end)
            }))
        end
    end

    --Detecting when Burglar activates to trigger animation
    if self.ability.name == "Burglar" and not (context.blueprint_card or self.getting_sliced) and context.setting_blind and not self.debuff then
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                self.animation = { target = 0, escape_target = true }
                return true
            end)
        }))
    end

    --Detecting when Blackboard activates to trigger animation
    if self.ability.name == "Blackboard" and ret and not context.blueprint then --ret carryng info means it is giving times mult
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                self.animation = { target = 0, escape_target = true }
                return true
            end)
        }))
    end

    --Detecting when Superposition activates to trigger animation
    if self.ability.name == "Superposition" and ret and not context.blueprint then --ret carrying info means it is creating a tarot card
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                -- Toggle between frames 0 and 10
                if self.config.center.animpos.x < 10 then
                    self.animation = {target = 10}
                else
                    self.animation = {target = 0}
                end
                return true
            end)
        }))  
    end

    --Detect when Lucky Cat upgrades to trigger animation
    if self.ability.name == "Lucky Cat" and ret and ret.extra and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                self.animation = { target = 0, remaining_triggers = (self.animation and self.animation.remaining_triggers or 0) + 1, fps = 10*(G.SPEEDFACTOR/G.SETTINGS.GAMESPEED) } --Adapt fps to SpeedFactor but not to Game Speed
                return true
            end)
        }))
    end

    --Detecting when Seeing Double activates to trigger animation
    if self.ability.name == "Seeing Double" and ret and not context.blueprint then --ret carrying info means it is giving times mult
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                -- Toggle between idle frame 0 and 4
                if self.config.center.animpos_extra.y == 0 then
                    self.animation = { extra = { target = 4 } }
                else
                    self.animation = { extra = { target = 0 } }
                end
                return true
            end)
        }))
    end

    --Detecting when Hit the Road upgrades to trigger animation. The animation will last longer than the discards
    if self.ability.name == "Hit the Road" and context.discard and not context.other_card.debuff and context.other_card:get_id() == 11 and not self.debuff and not context.blueprint then
        Aura.add_individual(self)
        self.animation = { target = 0, remaining_triggers = (self.animation and self.animation.remaining_triggers or 0) + 1 }
    end

    --Detect various jokers with probabilities that trigger Oops All 6s animation
    if (self.ability.name == "8 Ball" and context.individual and context.cardarea == G.play and context.other_card and context.other_card:get_id() == 8) or
    (self.ability.name == "Business Card" and context.individual and context.cardarea == G.play and context.other_card and context.other_card:is_face()) or
    (self.ability.name == "Reserved Parking" and context.individual and context.cardarea == G.hand and context.other_card and context.other_card:is_face()) or
    (self.ability.name == "Cavendish" and context.end_of_round and context.main_eval and not context.blueprint) or
    (self.ability.name == "Hallucination" and context.open_booster) or
    (self.ability.name == "Bloodstone" and context.individual and context.cardarea == G.play and context.other_card and context.other_card:is_suit("Hearts")) then
        Aura.Trigger_oops_all_6s()
    end

    return ret
end