--DICTIONARIES FOR ADVANCED INTERACTIVE JOKERS ANIMATIONS

--Suit Order for Castle, Ancient & Idol -- Modded suits will never occur on Ancient
function Aura.suit_sprite_order(suit)
    if suit == "Hearts" then return 0
    elseif suit == "Clubs" then return 1
    elseif suit == "Diamonds" then return 2
    elseif suit == "Spades" then return 3
    elseif suit == "six_Moons" then return 4 -- From Six Suits mod
    elseif suit == "six_Stars" then return 5 -- From Six Suits mod
    elseif suit == "paperback_Crowns" then return 6 -- From Paperback mod
    elseif suit == "paperback_Stars" then return 7 -- From Paperback mod
    elseif suit == "bunc_Fleurons" then return 8 -- From Bunco mod
    elseif suit == "bunc_Halberds" then return 9 -- From Bunco mod
    else return 10 end -- Unknown suit
end
--Rank Order for Mail & Idol
function Aura.rank_sprite_order(rank)
    if rank == "2" then return 0
    elseif rank == "3" then return 1
    elseif rank == "4" then return 2
    elseif rank == "5" then return 3
    elseif rank == "6" then return 4
    elseif rank == "7" then return 5
    elseif rank == "8" then return 6
    elseif rank == "9" then return 7
    elseif rank == "10" then return 8
    elseif rank == "Jack" then return 9
    elseif rank == "Queen" then return 10
    elseif rank == "King" then return 11
    elseif rank == "Ace" then return 12
    elseif rank == "paperback_Apostle" then return 13 -- From Paperback mod
    else return 14 end
end
--Dictionary with Certificate seals
Aura.CertificateSealsTable = {
    Gold   = {pos = { x = 1, y = 0 }},
    Purple = {pos = { x = 2, y = 0 }},
    Red    = {pos = { x = 3, y = 0 }},
    Blue   = {pos = { x = 4, y = 0 }},
    poke_pink_seal = {pos = { x = 5, y = 0 }}, -- From Pokermon mod
    poke_silver    = {pos = { x = 0, y = 1 }}, -- From Pokermon mod
    artb_button    = {pos = { x = 1, y = 1 }}, -- From ArtBox mod
    artb_brick     = {pos = { x = 2, y = 1 }}, -- From ArtBox mod
    artb_ouroboros = {pos = { x = 3, y = 1 }}, -- From ArtBox mod
    cry_green      = {pos = { x = 4, y = 1 }}, -- From Cryptid mod
    cry_azure      = {pos = { x = 5, y = 1 }}, -- From Cryptid mod
    unstb_spades   = {pos = { x = 0, y = 2 }}, -- From Unstable mod -- Will never occur on Certificate
    unstb_hearts   = {pos = { x = 1, y = 2 }}, -- From Unstable mod -- Will never occur on Certificate
    unstb_clubs    = {pos = { x = 2, y = 2 }}, -- From Unstable mod -- Will never occur on Certificate
    unstb_diamonds = {pos = { x = 3, y = 2 }}, -- From Unstable mod -- Will never occur on Certificate
    unstb_face     = {pos = { x = 4, y = 2 }}, -- From Unstable mod -- Will never occur on Certificate
    unstb_heal     = {pos = { x = 5, y = 2 }}, -- From Unstable mod -- Will never occur on Certificate
}
function Aura.CertificateSeals(seal)
    local atlas = Aura.CertificateSealsTable[seal] and Aura.CertificateSealsTable[seal].atlas or "aura_j_certificate_extra"
    local pos = Aura.CertificateSealsTable[seal] and Aura.CertificateSealsTable[seal].pos or { x = 0, y = 0 }
    return atlas, pos
end
--Dictionary with finished Trading Cards
Aura.TradingCards = {
    [11] = {class = "JOKER", name = "The Joker of Poker", credits = {"LocalThunk"}, EX = {credits = {"MightyKingVideo"}, pos = 12}},
    [15] = {class = "JOKER", name = "Applause for Acrobats", credits = {"MightyKingVideo"}},
    [17] = {class = "JOKER", name = "Mind Over Madness", credits = {"Willow"}},
    [21] = {class = "JOKER", name = "At Evens & Odds", credits = {"Willow"}},
    [22] = {class = "JOKER", name = "Despair Trousers!!", credits = {"MightyKingVideo"}},
    [41] = {class = "JOKER", name = "Riff Raff Rumble", credits = {"MightyKingVideo"}, EX = {pos = 42}},
    [51] = {class = "SPELL", name = "Dangerous Dunce-like DNA", credits = {"Willow"}},
    [61] = {class = "SPELL", name = "Paralleling Pyres of Plasma", credits = {"MightyKingVideo"}, EX = {pos = 62}},
    [66] = {class = "SPELL", name = "Frightful Face of Fear", credits = {"MightyKingVideo"}},
    [70] = {class = "LAND",  name = "Constellation Station", credits = {"MightyKingVideo"}},
    [71] = {class = "LAND",  name = "No Jack's Land", credits = {"MightyKingVideo"}},
    [79] = {class = "ITEM",  name = "Generous Gift", credits = {"MightyKingVideo"}},
    [95] = {class = "SPELL", name = "Interplanetary Alignment", credits = {"MightyKingVideo"}},
}

--FUNCTIONS FOR FLASH CARD AND TRADING CARD ANIMATIONS

--Function for setting Flash card order. Called in Aura.AddIndividual()
function Aura.update_flash(self, StartLetter)
    --Gather all letters positions
    local anim_order = {}
    for i = 0, 25 do
        anim_order[i] = i
    end
    --Shuffle them
    pseudoshuffle(anim_order, pseudoseed("aura_flash"))
    --Force StartLetter to be first (it will be j when a new Flash card is created, and whatever letter it had when cloned)
    for i = 1, 25 do
        if anim_order[i] == StartLetter then
            anim_order[0], anim_order[i] = anim_order[i], anim_order[0]
        end
    end
    --Store animation data
    self.animation = {target = anim_order[0], flash_index = 0, flash_order = anim_order}
end
--Function for setting Trading card order. Called in Aura.AddIndividual()
function Aura.update_trading(self, StartPos, StartAtlas)
    --Gather all trading cards positions
    local anim_order = {}
    local count = 0
    local isEX = false
    local FirstCard = StartPos
    for k, v in pairs(Aura.TradingCards) do
        anim_order[count] = k
        count = count + 1
        --Detect which card is the starting one
        if StartAtlas == (v.atlas or (Malverk and "alt_tex_" or "").."aura_j_trading") then -- Matching atlases in case another mod injects its own cards
            if v.EX and v.EX.pos and v.EX.pos == StartPos then
                FirstCard = k
            isEX = true
            end
            if v.pos == StartPos then
                FirstCard = k
            end
        end
    end
    --Shuffle them
    pseudoshuffle(anim_order, pseudoseed("aura_trading"))
    --Force FirstCard to be first (it will be 11 when a new Trading card is created, and whatever number it had when cloned)
    for i = 1, #anim_order do
        if anim_order[i] == FirstCard then
            anim_order[0], anim_order[i] = anim_order[i], anim_order[0]
        end
    end
    --Store animation data. This includes if the starting card is an EX
    local trading_target = ((isEX and Aura.TradingCards[FirstCard].EX.pos) or (Aura.TradingCards[FirstCard].pos and Aura.TradingCards[FirstCard].pos) or StartPos) - 1
    self.animation = {target = trading_target, trading_index = 0, trading_order = anim_order, EX = isEX}
end


--FUNCTIONS FOR CASTLE ANIMATION

--Function for setting Castle card to the current Suit. Called in reset_castle_card(), Game.start_run() and when a Castle joker is created
function Aura.update_castle()
    --Find current castle suit position an set it as target
    local new_suit = G.GAME.current_round.castle_card.suit or nil
    Aura.AnimatedJokers.j_castle.extra.target = Aura.suit_sprite_order(new_suit)
    --Detect if sky should be Day or Night and update animation data accordingly
    if (new_suit == "six_Moons" or new_suit == "six_Stars" or new_suit == "paperback_Stars") then
        if Aura.AnimatedJokers.j_castle.start_frame ~= 72 then --Only update if needed
            Aura.AnimatedJokers.j_castle.start_frame = 72
            Aura.AnimatedJokers.j_castle.frames = 22
            G.P_CENTERS["j_castle"].animpos.y = 8
        end
    else
        if Aura.AnimatedJokers.j_castle.start_frame ~= 0 then --Only update if needed
            Aura.AnimatedJokers.j_castle.start_frame = 0
            Aura.AnimatedJokers.j_castle.frames = 69
            G.P_CENTERS["j_castle"].animpos.y = 0
        end
    end
end
--Detecting Castle suit change to update castle and flip all castle jokers 
local rcc = reset_castle_card
function reset_castle_card()
    --Original reset_castle_card function call
    rcc()
    --Detect if Castle is animated to flip all castle jokers to grab attention
    if not Aura.AnimatedJokers.j_castle.IncorrectAtlas then
        --Find all castle jokers
        local castlelist = {}
        for _, jkr in ipairs(G.jokers.cards) do
            if jkr.ability.name == "Castle" then
                table.insert(castlelist, jkr)
            end
        end
        --Add animation inside an event
        G.E_MANAGER:add_event(Event({
            func = (function()
                --Flip all castle jokers away
                for _, jkr in pairs(castlelist) do
                    jkr:flip()
                end
                play_sound('card1')
                --Update castle once they are on the back side
                delay(0.075*G.SPEEDFACTOR)
                Aura.update_castle()
                for _, jkr in pairs(castlelist) do
                    jkr:juice_up(0.3, 0.3) --Atract attention to the change
                end
                delay(0.075*G.SPEEDFACTOR)
                --Flip all castle jokers back to normal
                for _, jkr in pairs(castlelist) do
                    jkr:flip()
                end
                play_sound('tarot2', 1, 0.6)
                return true
            end)
        }))
    else
        Aura.update_castle() --Update castle anyway if not animated
    end
end


--FUNCTIONS FOR MAIL-IN REBATE ANIMATION

--Function for setting Mail card to the current Rank. Called in reset_mail_rank(), Game.start_run() and when a Mail joker is created
function Aura.update_mail()
    local rank = G.GAME.current_round.mail_card.rank or nil
    Aura.AnimatedJokers.j_mail.target = Aura.rank_sprite_order(rank)
end
--Detecting Mail rank change to update mail and flip all mail jokers
local rmr = reset_mail_rank
function reset_mail_rank()
    --Original reset_mail_rank function call
    rmr()
    --Detect if Mail is animated to flip all mail jokers to grab attention
    if not Aura.AnimatedJokers.j_mail.IncorrectAtlas then
        --Find all mail jokers
        local maillist = {}
        for _, jkr in ipairs(G.jokers.cards) do
            if jkr.ability.name == "Mail-In Rebate" then
                table.insert(maillist, jkr)
            end
        end
        --Add animation inside an event
        G.E_MANAGER:add_event(Event({
            func = (function()
                --Flip all mail jokers away
                for _, jkr in pairs(maillist) do
                    jkr:flip()
                end
                play_sound('tarot2', 1, 0.6)
                --Update mail once they are on the back side
                delay(0.075*G.SPEEDFACTOR)
                Aura.update_mail()
                for _, jkr in pairs(maillist) do
                    jkr:juice_up(0.3, 0.3) --Atract attention to the change
                end
                delay(0.075*G.SPEEDFACTOR)
                --Flip all mail jokers back to normal
                for _, jkr in pairs(maillist) do
                    jkr:flip()
                end
                    play_sound('tarot2', 1, 0.6)
                return true
            end)
        }))
    else
        Aura.update_mail() --Update mail anyway if not animated
    end
end

--FUNCTIONS FOR ANCIENT JOKER ANIMATION

--Function for setting Ancient card to the current Suit. Called in Game.start_run() and in update_frame() and when an Ancient joker is created
function Aura.update_ancient()
    --Find current ancient suit position and set it as "target"
    local suit = Aura.suit_sprite_order(G.GAME.current_round.ancient_card.suit or nil)
    Aura.AnimatedJokers.j_ancient.start_frame = suit * 6
    --Manually move ancient to the correct row
    G.P_CENTERS["j_ancient"].animpos.y = suit
end
--Detecting Ancient suit change and triggering animation. Inside update_frame() it is detected when the suit is obscured to update ancient
local rac = reset_ancient_card
function reset_ancient_card()
    rac() --Original reset_ancient_card function call
    Aura.AnimatedJokers.j_ancient.escape_target = true
end


--FUNCTIONS FOR IDOL ANIMATION

--Function for setting Idol card to the current Suit and Rank. Called in Game.start_run() and in update_frame() and when an Idol joker is created
function Aura.update_idol()
    local suit = G.GAME.current_round.idol_card.suit or nil
    local rank = G.GAME.current_round.idol_card.rank or nil
    Aura.AnimatedJokers.j_idol.target = (Aura.suit_sprite_order(suit) * Aura.AnimatedJokers.j_idol.frames_per_row) + Aura.rank_sprite_order(rank)
end
--Detecting Idol suit or rank change and triggering animation. Inside update_frame() it is detected when the mouth is closed to update idol
local ric = reset_idol_card
function reset_idol_card()
    ric() --Original reset_idol_card function call
    Aura.AnimatedJokers.j_idol.extra.escape_target = true
end


--FUNCTIONS FOR CERTIFICATE ANIMATION

--Detecting when Certificate creates a card with a seal to trigger animation. Certificates get their animations loaded when the first hand is drawn
local ss = Card.set_seal
function Card:set_seal(seal, silent, immediate)
    --See if conditions of when certificate triggers are met
    if seal and G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 and G.GAME.facing_blind then
        --Find first Certificate joker with an animation loaded that hasn't triggered yet
        for i = 1, #G.jokers.cards do
            local selfjkr = G.jokers.cards[i]
            if selfjkr.config.center_key == "j_certificate" and not selfjkr.debuff and selfjkr.animation and selfjkr.animation.animation_loaded then
                Aura.add_individual(selfjkr)
                --Trigger signature + unloading in case there are multiple Certificates + storing seal so it can be set when reolading card
                selfjkr.animation = { target = 27, escape_target = true, animation_loaded = false, current_seal = seal }
                --Setting the seal in the extra layer
                local atlas, pos = Aura.CertificateSeals(seal)
                selfjkr.children.front = Sprite(selfjkr.T.x, selfjkr.T.y, selfjkr.T.w, selfjkr.T.h, G.ASSET_ATLAS[atlas], pos)
                selfjkr.children.front.states.hover = selfjkr.states.hover
                selfjkr.children.front.states.click = selfjkr.states.click
                selfjkr.children.front.states.drag = selfjkr.states.drag
                selfjkr.children.front.states.collide.can = false
                selfjkr.children.front:set_role({major = selfjkr, role_type = 'Glued', draw_major = selfjkr})
                --Only one Certificate should trigger per seal created
                break
            end
        end
    end
    ss(self,seal,silent,immediate) --Original Card:set_seal function call
end


--FUNCTIONS FOR DRIVER'S LICENSE ANIMATION --URGENTE: COPY CARD NO TIENE EN CUENTA LA CARTA COPIADA

--Function that checks in what state the Driver's License jokers should be and triggers their animation if needed. Called silent in Game.start_run() and when Drivers License jokers is created, and normally in Card.set_ability(), copy_card() and Card.remove()
function Aura.update_drivers_license(silent)
    --Count all enhanced cards
    local driver_tally = 0
    for k, v in pairs(G.playing_cards or {}) do
        if v.config.center ~= G.P_CENTERS.c_base then driver_tally = driver_tally + 1 end
    end
    --Set new target if not already in correct state
    local target_frame = nil
    if driver_tally >= 16 and Aura.AnimatedJokers.j_drivers_license.target == 0 then
        target_frame = 1
    elseif driver_tally <= 15 and Aura.AnimatedJokers.j_drivers_license.target == 1 then
        target_frame = 0
    end
    if target_frame then
        --Detect if Driver's License is animated to flip all Drivers License jokers to grab attention
        if not (silent or Aura.AnimatedJokers.j_drivers_license.IncorrectAtlas) then
            --Find all Driver's License jokers
            local licenselist = {}
            for _, jkr in ipairs(G.jokers and G.jokers.cards or {}) do
                if jkr.ability.name == "Driver's License" and jkr.facing == "front" then
                    licenselist[#licenselist + 1] = jkr
                end
            end
            --Add animation inside an event
            G.E_MANAGER:add_event(Event({
                func = (function()
                    --Flip all Driver's License jokers away
                    for _, jkr in pairs(licenselist) do
                        jkr:flip()
                    end
                    play_sound('card1')
                    --Update Driver's License once they are on the back side
                    delay(0.075*G.SPEEDFACTOR)
                    Aura.AnimatedJokers.j_drivers_license.target = target_frame
                    for _, jkr in pairs(licenselist) do
                        jkr:juice_up(0.3, 0.3) --Atract attention to the change
                    end
                    delay(0.075*G.SPEEDFACTOR)
                    --Flip all Driver's License jokers back to normal
                    for _, jkr in pairs(licenselist) do
                        jkr:flip()
                    end
                    play_sound('tarot2', 1, 0.6)
                    return true
                end)
            }))
        else
            Aura.AnimatedJokers.j_drivers_license.target = target_frame --update Driver's License anyway if not animated, or if silent
        end
    end
end