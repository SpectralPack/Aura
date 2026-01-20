--FUNCTIONS FOR GENERAL INTERACTIVE ENHANCEMENTS USE

--Cleaning animation data when changing enhancements
local csa = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    --Original Card:set_ability function call
    csa(self, center, initial, delay_sprites)
    --Detect if card has animation when it shouldnt or if it set to an enhancement that needs clean animation data
    if (not center.anim or center.key == ("m_bonus" or "m_mult")) and self.animation then
        --Clean animation data
        self.animation = nil
        --Remove from AnimatedIndividuals list
        for i = 1, #AnimatedIndividuals do
            if AnimatedIndividuals[i] == self then
                AnimatedIndividuals[i] = nil
            end
        end
    end
    Aura.update_drivers_license() --Check if enhancement count has changed
end


--FUNCTIONS FOR BONUS AND MULT CARDS ANIMATIONS

--Detect Mult cards calculation to load animation, and trigger Oops All 6s if it is instead a Lucky Card
local gcm = Card.get_chip_mult
function Card:get_chip_mult()
    --Original Card:get_chip_mult function call
    local ret = gcm(self)
    --Detect Lucky Card for Oops All 6s
    if self.ability.effect == "Lucky Card" then
        Aura.Trigger_oops_all_6s()
    end
    --Detect Mult Card to load animation
    if self.ability.effect == "Mult Card" then
        Aura.add_individual(self)
        self.animation.animation_loaded = true
    end
    return ret
end
--Detect Bonus cards calculation to load animation
local gcb = Card.get_chip_bonus
function Card:get_chip_bonus()
    local ret = gcb(self)--Original Card:get_chip_bonus function call
    if self.ability.effect == "Bonus Card" then
        Aura.add_individual(self)
        self.animation.animation_loaded = true
    end
    return ret
end
--Detecting Bonus and Mult cards displaying score change to trigger animation
local cest = card_eval_status_text
function card_eval_status_text(c, eval_type, a, p, d, e)
    --If the card was previously loaded when calculating
    if c.animation and c.animation.animation_loaded then
        --Triggering for the first chips of bonus cards
        if eval_type == "chips" and c.ability.effect == "Bonus Card" then
            --Add animation inside an event
            G.E_MANAGER:add_event(Event({
                func = (function()
                    Aura.add_individual(c)
                    c.animation = {target = 0, remaining_triggers = (c.animation.remaining_triggers or 0) + 1, fps = 16*(G.SPEEDFACTOR) } --Adapt fps to game speed
                    return true
                end)
            }))
            c.animation.animation_loaded = false
        --Triggering for the first mult of mult cards
        elseif eval_type == "mult" and c.ability.effect == "Mult Card" then
            --Add animation inside an event
            G.E_MANAGER:add_event(Event({
                func = (function()
                    Aura.add_individual(c)
                    c.animation = {target = (((c.config.center.animpos.y or 0) + 1 ) % 5) * 13, fps = 16*(G.SPEEDFACTOR) } --Change idle frame to the next in line (wraps around), and adapt fps to game speed
                    return true
                end)
            }))
            c.animation.animation_loaded = false
        end
    end
    return cest(c, eval_type, a, p, d, e) --Original card_eval_status_text function call
end


--FUNCTIONS FOR GLASS CARDS (CURRENTLY ONLY FOR OOPS ALL 6S)

--Detecting Glass Cards trying to break for Oops All 6s
local gfep = G.FUNCS.evaluate_play
function G.FUNCS.evaluate_play(e)
    local ret = gfep(e) --Original G.FUNCS.evaluate_play function call
    if G.play and G.play.cards then
        --Find all played Glass Cards (no debuffed) and trigger Oops All 6s for each of them
        local _, _, _, scoring_hand = G.FUNCS.get_poker_hand_info(G.play.cards)
        if scoring_hand then
            for i=1, #scoring_hand do
                if scoring_hand[i].ability.name == 'Glass Card' and not scoring_hand[i].debuff then
                    Aura.Trigger_oops_all_6s()
                end
            end
        end
    end
    return ret
end