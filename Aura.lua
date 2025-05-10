--- STEAMODDED HEADER
--- MOD_NAME: Aura
--- MOD_ID: Aura
--- MOD_AUTHOR: [MathIsFun_, ChromaPIE, Bard, TwoBlueDogs]
--- MOD_DESCRIPTION: Adds animations to Jokers. Art by: Bard, Grassy311, RattlingSnow353, Solace, RadicaAprils, chloe_cromslor, SadCube, Mincoiin, and Flowr
--- BADGE_COLOUR: 3469ab
--- VERSION: 0.033

AnimatedJokers = {
    j_joker = { frames_per_row = 11, frames = 22 },
    j_greedy_joker = { frames = 12 },
    j_lusty_joker = { frames_per_row = 5, frames = 20 },
    j_wrathful_joker = { frames_per_row = 1, frames = 18 },
    j_gluttenous_joker = { frames = 12 },
    j_jolly = {},
    j_zany = {},
    j_mad = {},
    j_crazy = {},
    j_droll = {},
    j_sly = {},
    j_wily = {},
    j_clever = {},
    j_devious = {},
    j_crafty = {},
    j_half = {},
    j_stencil = {},
    j_four_fingers = {},
    j_mime = {},
    j_credit_card = {},
    j_ceremonial = {},
    j_banner = {},
    j_mystic_summit = {},
    j_marble = {},
    j_loyalty_card = { frames = 7 },
    j_8_ball = {}, -- todo: animate when triggered
    j_misprint = { frames_per_row = 13, frames = 65 },
    j_dusk = { frames_per_row = 13, frames = 78, fps = 5 },
    j_raised_fist = { frames_per_row = 4, frames = 14 },
    j_chaos = {},
    j_fibonacci = {},
    j_steel_joker = {},
    j_scary_face = {},
    j_abstract = {},
    j_delayed_grat = {}, -- todo: animate when primed
    j_hack = { frames_per_row = 8, frames = 64 },
    j_pareidolia = { frames_per_row = 5, frames = 20 },
    j_gros_michel = {},
    j_even_steven = {},
    j_odd_todd = {},
    j_scholar = { frames_per_row = 9, frames = 45 },
    j_business = { frames_per_row = 13, frames = 120 },
    j_supernova = {},
    j_ride_the_bus = { frames_per_row = 9, frames = 36 },
    j_space = { frames = 96 },
    j_egg = { frames_per_row = 4, frames = 8 },
    j_burglar = { frames_per_row = 19, frames = 76 },
    j_blackboard = { frames_per_row = 9, frames = 59, individual = true },
    j_runner = {},
    j_ice_cream = {}, -- todo: change sprite as it is used
    j_dna = { frames = 11 },
    j_splash = {},
    j_blue_joker = {},
    j_sixth_sense = { frames = 13, extra = { frames = 20 } }, --todo: card destroy animation
    j_constellation = { frames_per_row = 6, frames = 60 },
    j_hiker = {},
    j_faceless = { frames_per_row = 4, frames = 24 },
    j_green_joker = {},
    j_superposition = {}, -- todo: animate when triggered
    j_todo_list = { frames_per_row = 12, frames = 96 }, -- todo: show hand that needs to be played/animate on trigger
    j_cavendish = {},
    j_card_sharp = {},
    j_red_card = { frames_per_row = 19, frames = 349 },
    j_madness = {},
    j_square = { frames_per_row = 11, frames = 22 },
    j_seance = {}, -- todo: animate when triggered
    j_riff_raff = { frames_per_row = 14, frames = 490 },
    j_vampire = { frames_per_row = 6, frames = 30 },
    j_shortcut = {},
    j_hologram = {},
    j_vagabond = { frames = 30, fps = 5 },
    j_baron = {},
    j_cloud_9 = {},
    j_rocket = {},
    j_obelisk = {}, -- todo: animate when promoted
    j_midas_mask = {},
    j_luchador = {},
    j_photograph = { frames = 48 },
    j_gift = {},
    j_turtle_bean = {}, -- todo: change sprite as it is used
    j_erosion = {},
    j_reserved_parking = {},
    j_mail = {}, -- todo: show rank
    j_to_the_moon = { frames_per_row = 10, frames = 50 },
    j_hallucination = {},
    j_fortune_teller = {},
    j_juggler = {},
    j_drunkard = {},
    j_stone = {},
    j_golden = {},
    j_lucky_cat = {}, -- todo: animate when promoted
    j_baseball = {},
    j_bull = {},
    j_diet_cola = { frames = 20 },
    j_trading = {},
    j_flash = { frames_per_row = 13, frames = 26, individual = true, immediate = true },
    j_popcorn = {}, -- todo: change sprite as it is used
    j_trousers = { frames = 48 },
    j_ancient = {}, -- todo: change sprite to indicate suit
    j_ramen = {}, -- todo: change sprite as it is used
    j_walkie_talkie = {},
    j_selzer = { frames = 5, individual = true },
    j_castle = { frames_per_row = 9, frames = 69, start_frame = 0, extra = { frames_per_row = 5, frames = 5, fps = 5, start_frame = 0 } },
    j_smiley = { frames_per_row = 13, frames = 150 },
    j_campfire = {},
    j_ticket = {},
    j_mr_bones = {}, -- todo: destroy animation?
    j_acrobat = {},
    j_sock_and_buskin = {},
    j_swashbuckler = {},
    j_troubadour = {},
    j_certificate = { frames_per_row = 7, frames = 28, individual = true, extra = { frames = 5, fps = 0 } },
    j_smeared = { frames = 10 },
    j_throwback = {}, -- todo: animate when promoted
    j_hanging_chad = {},
    j_rough_gem = {},
    j_bloodstone = {},
    j_arrowhead = {},
    j_onyx_agate = {},
    j_glass = {},
    j_ring_master = {},
    j_flower_pot = { frames = 24 },
    j_blueprint = { frames_per_row = 8, frames = 44, individual = true },
    j_wee = { frames_per_row = 11, frames = 22 },
    j_merry_andy = {},
    j_oops = {},
    j_idol = {}, -- todo: open mouth to show suit and rank
    j_seeing_double = {frames_per_row = 13, frames = 150, extra = { frames_per_row = 5, frames = 20, start_frame = 0 } },
    j_matador = {},
    j_hit_the_road = {}, -- todo: animate when promoted
    j_duo = {},
    j_trio = {},
    j_family = {},
    j_order = {},
    j_tribe = {},
    j_stuntman = {},
    j_invisible = {frames = 11, individual = true},
    j_brainstorm = { frames_per_row = 8, frames = 39, individual = true },
    j_satellite = {},
    j_shoot_the_moon = {},
    j_drivers_license = { frames = 2, individual = true },
    j_cartomancer = {},
    j_astronomer = {frames = 29 },
    j_burnt = {}, -- todo: animate when primed?
    j_bootstraps = {frames_per_row = 19, frames = 38 },
    j_caino = {}, -- todo: add animations
    j_triboulet = {}, -- todo: add animations
    j_yorick = {}, -- todo: add animations
    j_chicot = {}, -- todo: add animations
    j_perkeo = {} -- todo: add animations
}
AnimatedPlanets = {
    c_fool = {},
    c_magician = {},
    c_high_priestess = {},
    c_empress = {},
    c_emperor = {},
    c_hierophant = {},
    c_lovers = { frames = 11 },
    c_chariot = {},
    c_justice = {},
    c_hermit = {},
    c_wheel_of_fortune = { frames = 12 },
    c_strength = {},
    c_hanged_man = {},
    c_death = {},
    c_temperance = {},
    c_devil = {},
    c_tower = {},
    c_sun = {},
    c_moon = {},
    c_star = {},
    c_judgement = {},
    c_world = {},
    c_mercury = { frames = 24 },
    c_venus = { frames = 24 },
    c_earth = { frames = 24 },
    c_mars = { frames = 24 },
    c_jupiter = { frames = 24 },
    c_saturn = { frames = 24 },
    c_uranus = { frames = 24 },
    c_neptune = { frames = 24 },
    c_pluto = { frames = 24 },
    c_planet_x = { frames = 24 },
    c_ceres = { frames = 24 },
    c_eris = { frames = 24 },
    c_familiar = {},
    c_grim = {},
    c_incantation = {},
    c_talisman = {},
    c_aura = {},
    c_wraith = {},
    c_sigil = {},
    c_ouija = {},
    c_ectoplasm = {},
    c_immolate = {},
    c_ankh = {},
    c_deja_vu = {},
    c_hex = {},
    c_trance = {},
    c_medium = {},
    c_cryptid = {},
    c_soul = {},
    c_black_hole = {}
}
AnimatedVouchers = {
    v_overstock = {},
    v_overstock_plus = {},
    v_clearance_sale = {},
    v_liquidation = {},
    v_hone = { frames = 24, frames_per_row = 12 },
    v_glow_up = {},
    v_reroll_surplus = { frames = 11 },
    v_reroll_glut = { frames = 8 },
    v_crystal_ball = { frames = 150, frames_per_row = 13 },
    v_omen_globe = { frames = 150, frames_per_row = 13 },
    v_telescope = {},
    v_observatory = {},
    v_grabber = {},
    v_nacho_tong = {},
    v_wasteful = { frames = 9 },
    v_recyclomancy = {},
    v_tarot_merchant = { frames = 12 },
    v_tarot_tycoon = {},
    v_planet_merchant = { frames = 12 },
    v_planet_tycoon = {},
    v_seed_money = {},
    v_money_tree = {},
    v_blank = { frames = 23 },
    v_antimatter = {},
    v_magic_trick = {},
    v_illusion = {},
    v_hieroglyph = {},
    v_petroglyph = {},
    v_directors_cut = {},
    v_retcon = {},
    v_paint_brush = {},
    v_palette = {}
}
AnimatedIndividuals = {}

Aura = {}
Aura.LayeredCards = {}
function Aura.add_individual(card)
    if not card.animated then
        AnimatedIndividuals[#AnimatedIndividuals+1] = card
        card.animated = true
        local center_copy = {}
        for k, v in pairs(card.config.center) do
            center_copy[k] = v
        end
        center_copy.pos = {x = card.config.center.pos.x, y = card.config.center.pos.y}
        card.config.center = center_copy
        card:set_sprites(card.config.center)
    end
end

if SMODS.Atlas then
    --Register all Jokers/Sprites
    for i = 1, 150 do
        local k = G.P_CENTER_POOLS.Joker[i].key
        local v = AnimatedJokers[k]
        if v and v.frames then
            --sprite
            SMODS.Atlas {
                key = k,
                path = k .. ".png",
                px = v.px or 71,
                py = v.py or 95
            }
            if v.extra then
                SMODS.Atlas {
                    key = k.."_extra",
                    path = k .. "_extra.png",
                    px = v.px or 71,
                    py = v.py or 95
                }
            end
            --joker override
            SMODS[v.set or "Joker"]:take_ownership(k, {
                atlas = k,
                pos = { x = 0, y = 0, extra = v.extra and {x = 0, y = 0, atlas = "aura_"..k.."_extra"} },
            })
        else
            SMODS[v and v.set or "Joker"]:take_ownership(k, {}, true)
        end
    end
    --Register all Planets/Sprites
    for k, v in pairs(AnimatedPlanets) do
        if v.frames then
            --sprite
            SMODS.Atlas {
                key = k,
                path = k .. ".png",
                px = v.px or 71,
                py = v.py or 95
            }
            if v.extra then
                SMODS.Atlas {
                    key = k.."_extra",
                    path = k .. "_extra.png",
                    px = v.px or 71,
                    py = v.py or 95
                }
            end
            --planet override
            SMODS[v.set or "Consumable"]:take_ownership(k, {
                atlas = k,
                pos = { x = 0, y = 0, extra = v.extra and {x = 0, y = 0, atlas = "aura_"..k.."_extra"} },
            })
        else
            SMODS[v and v.set or "Consumable"]:take_ownership(k, {}, true)
        end
    end
    --Register all Vouchers/Sprites
    for k, v in pairs(AnimatedVouchers) do
        if v.frames then
            --sprite
            SMODS.Atlas {
                key = k,
                path = k .. ".png",
                px = v.px or 71,
                py = v.py or 95
            }
            if v.extra then
                SMODS.Atlas {
                    key = k.."_extra",
                    path = k .. "_extra.png",
                    px = v.px or 71,
                    py = v.py or 95
                }
            end
            --voucher override
            SMODS[v.set or "Voucher"]:take_ownership(k, {
                atlas = k,
                pos = { x = 0, y = 0, extra = v.extra and {x = 0, y = 0, atlas = "aura_"..k.."_extra"} },
            })
        else
            SMODS[v and v.set or "Voucher"]:take_ownership(k, {}, true)
        end
    end
else
    local init = SMODS["INIT"]
    function init.Aura()
        --0.9.8 compat by @ChromaPIE
        --Register all Jokers/Sprites
        for i = 1, 150 do
            local k = G.P_CENTER_POOLS.Joker[i].key
            local v = AnimatedJokers[k]
            if v then
            --joker override
            SMODS[v.set or "Joker"]:take_ownership(k):register()
            --sprite
            --todo: add extra layer, waiting unitl 0.9.8 compat is fixed
            if v.frames then
                SMODS.Sprite:new(
                    k,
                    SMODS.findModByID('Aura').path,
                    k .. ".png",
                    v.px or 71,
                    v.py or 95,
                    "asset_atli"
                ):register()
                SMODS.Jokers[k].atlas = k
                SMODS.Jokers[k].pos = { x = 0, y = 0 }
                if v.extra then
                    SMODS.Sprite:new(
                        k .. "_extra",
                        SMODS.findModByID('Aura').path,
                        k .. "_extra.png",
                        v.px or 71,
                        v.py or 95,
                        "asset_atli"
                    ):register()
                    SMODS.Jokers[k].pos.extra = { x = 0, y = 0, atlas = k .. "_extra"}
                end
            end end
        end
    end
end

--Update animated sprites
local upd = Game.update

function Aura.update_frame(dt, k, obj, jkr)
    local anim = AnimatedJokers[k] or AnimatedPlanets[k] or AnimatedVouchers[k]
    if anim and obj and (anim.frames or anim.individual) then
        local next_frame = false
        local next_frame_extra = false
        if anim.individual then
            if jkr then
                if not jkr.animation then jkr.animation = {} end
                if not jkr.animation.t then jkr.animation.t = 0 end
                jkr.animation.t = jkr.animation.t + dt
                if jkr.animation.t > 1/(jkr.animation.fps or 10) then
                    jkr.animation.t = jkr.animation.t - 1/(jkr.animation.fps or 10)
                    next_frame = true
                end
                if jkr.animation.extra then
                    if not jkr.animation.extra.t then jkr.animation.extra.t = 0 end
                    jkr.animation.extra.t = jkr.animation.extra.t + dt
                    if jkr.animation.extra.t > 1/(jkr.animation.extra.fps or 10) then
                        jkr.animation.extra.t = jkr.animation.extra.t - 1/(jkr.animation.extra.fps or 10)
                        next_frame_extra = true
                    end
                end
            end
        else
            if not anim.t then anim.t = 0 end
            anim.t = anim.t + dt
            if anim.t > 1/(anim.fps or 10) then
                anim.t = anim.t - 1/(anim.fps or 10)
                next_frame = true
            end
            if anim.extra then
                if not anim.extra.t then anim.extra.t = 0 end
                anim.extra.t = anim.extra.t + dt
                if anim.extra.t > 1/(anim.extra.fps or 10) then
                    anim.extra.t = anim.extra.t - 1/(anim.extra.fps or 10)
                    next_frame_extra = true
                end
            end
        end
        if next_frame then
            local loc = obj.pos.y*(anim.frames_per_row or anim.frames)+obj.pos.x
            if (not anim.individual) or (jkr and jkr.animation.target and loc ~= jkr.animation.target) then
                loc = loc + 1
                if anim.immediate and jkr and jkr.animation.target then
                    loc = jkr.animation.target
                end
            end
            if loc >= anim.frames then loc = anim.start_frame or 0 end
            obj.pos.x = loc%(anim.frames_per_row or anim.frames)
            obj.pos.y = math.floor(loc/(anim.frames_per_row or anim.frames))
        end
        if next_frame_extra then
            local loc = obj.pos.extra.y*(anim.extra.frames_per_row or anim.extra.frames)+obj.pos.extra.x
            if (not anim.individual) or (jkr and jkr.animation.extra and jkr.animation.extra.target and loc ~= jkr.animation.extra.target) then
                loc = loc + 1
                if anim.extra.immediate and jkr and jkr.animation.extra and jkr.animation.extra.target then
                    loc = jkr.animation.extra.target
                end
            end
            if loc >= anim.extra.frames then loc = anim.extra.start_frame or 0 end
            obj.pos.extra.x = loc%(anim.extra.frames_per_row or anim.extra.frames)
            obj.pos.extra.y = math.floor(loc/(anim.extra.frames_per_row or anim.extra.frames))
        end
    end
end

function Game:update(dt)
    upd(self, dt)
    for k, v in pairs(AnimatedJokers) do
        Aura.update_frame(dt, k, G.P_CENTERS[k])
    end
    for k, v in pairs(AnimatedPlanets) do
        Aura.update_frame(dt, k, G.P_CENTERS[k])
    end
    for k, v in pairs(AnimatedVouchers) do
        Aura.update_frame(dt, k, G.P_CENTERS[k])
    end
    for _, v in pairs(AnimatedIndividuals) do
        Aura.update_frame(dt, v.config.center_key, v.config.center, v)
    end
end

--On Click/Release Animations
local ccl = Node.set_offset
function Node:set_offset(x,y)
    ccl(self,x,y)
    if y == "Click" and self.config and self.config.center_key == 'j_brainstorm' and (G.shop_jokers and self.area ~= G.shop_jokers or true) then
        Aura.add_individual(self)
        self.animation = {target = 5}
    end
    if y == "Click" and self.config and self.config.center_key == 'j_blueprint' and (G.shop_jokers and self.area ~= G.shop_jokers or true) then
        Aura.add_individual(self)
        self.animation = {target = 16}
    end
end

local crl = Node.stop_drag
function Node:stop_drag()
    crl(self)
    if self.config and (self.config.center_key == 'j_brainstorm' or self.config.center_key == 'j_blueprint') then
        Aura.add_individual(self)
        self.animation = {target = 0}
    end
end

--On Creation Effects
local ci = Card.init
function Card:init(x,y,w,h,card,center,params)
    ci(self,x,y,w,h,card,center,params)
    if self.config.center_key == 'j_flash' then
        if not self.animation then
            Aura.add_individual(self)
            local anim_order = {}
            for i = 1, 26 do
                anim_order[i] = i-1
            end
            pseudoshuffle(anim_order, pseudoseed("aura_flash"))
            --force J to be first
            for i = 1, 26 do
                if anim_order[i] == 9 then
                    anim_order[1], anim_order[i] = anim_order[i], anim_order[1]
                end
            end
            self.animation = {target = anim_order[1], config = {index = 1, order = anim_order}}
            --instantly update animation
            Aura.update_frame(0, self.config.center_key, self.config.center, self)
        end
    end
end

--Sprite setting for multiple layers
local css = Card.set_sprites
function Card:set_sprites(c, f)
    css(self, c,f)
    if self.config.center and self.config.center.pos and self.config.center.pos.extra and self.config.center.pos.extra.atlas then
        if not self.children.front then
            self.children.front = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[self.config.center.pos.extra.atlas], self.config.center.pos)
            self.children.front.states.hover = self.states.hover
            self.children.front.states.click = self.states.click
            self.children.front.states.drag = self.states.drag
            self.children.front.states.collide.can = false
            self.children.front:set_role({major = self, role_type = 'Glued', draw_major = self})
        else
            self.children.front:set_sprite_pos(self.config.center.pos.extra)
        end
    end
end
local cd = Card.draw
function Card:draw(layer)
    if self.config and self.config.center and self.config.center.pos and self.config.center.pos.extra and self.config.center.pos.extra.atlas then self:set_sprites() end
    cd(self,layer)
end

--Castle
function Aura.castle_suit_num(suit)
    if (suit == "Spades") then return 0 end
    if (suit == "Hearts") then return 5 end
    if (suit == "Clubs") then return 10 end
    if (suit == "Diamonds") then return 15 end
    if (suit == "Moons") then return 25 end
    if (suit == "Stars") then return 30 end
    return 20
end
local rcc = reset_castle_card
function reset_castle_card(dont_reset)
    if not dont_reset then rcc() end
    local new_suit = G.GAME.current_round.castle_card.suit or 'Spades'
    local anim_offset = Aura.castle_suit_num(new_suit)
    AnimatedJokers.j_castle.extra.frames = anim_offset+5
    AnimatedJokers.j_castle.extra.start_frame = anim_offset
    G.P_CENTERS["j_castle"].pos.extra.y = anim_offset/5
    if (new_suit == "Moons" or new_suit == "Stars") then
        if AnimatedJokers.j_castle.start_frame == 0 then
            AnimatedJokers.j_castle.start_frame = 72
            AnimatedJokers.j_castle.frames = 94
            G.P_CENTERS["j_castle"].pos.y = 8
        end
    else
        if AnimatedJokers.j_castle.start_frame == 72 then
            AnimatedJokers.j_castle.start_frame = 0
            AnimatedJokers.j_castle.frames = 69
            G.P_CENTERS["j_castle"].pos.y = 0
        end
    end
end
local gsr = Game.start_run
function Game:start_run(args)
    --don't mess up on save load
    gsr(self,args)
    reset_castle_card(true)
end

--On trigger effects
local cj = Card.calculate_joker
function Card:calculate_joker(context)
    --Flash Card (pre-calculation)
    if self.ability.name == "Flash Card" and context.reroll_shop and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                self:flip()
                play_sound('card1')
                return true
            end)
        }))
    end


    local ret1, ret2 = cj(self, context)

    --Blackboard
    if self.ability.name == "Blackboard" and context.cardarea == G.jokers and context.joker_main then
        local black_suits, all_cards = 0, 0
        for k, v in ipairs(G.hand.cards) do
            all_cards = all_cards + 1
            if v:is_suit('Clubs', nil, true) or v:is_suit('Spades', nil, true) then
                black_suits = black_suits + 1
            end
        end
        if black_suits == all_cards then
            --triggered
            G.E_MANAGER:add_event(Event({
                func = (function()
                    Aura.add_individual(self)
                    self.animation = {target = 0}
                    self.config.center.pos.x = 1 --start on second frame
                    return true
                end)
            }))
        end
    end
    --Flash Card
    if self.ability.name == "Flash Card" and context.reroll_shop and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                self.animation.config.index = self.animation.config.index + 1
                if self.animation.config.index > 26 then self.animation.config.index = 1 end
                self.animation.target = self.animation.config.order[self.animation.config.index]
                self:juice_up(0.3, 0.3)
                return true
            end)
        }))
        delay(0.075*G.SETTINGS.GAMESPEED)
        G.E_MANAGER:add_event(Event({
            func = (function()
                self:flip()
                play_sound('tarot2', 1, 0.6)
                return true
            end)
        }))
    end

    --Driver's License
    if self.ability.name == "Driver's License" and context.cardarea == G.jokers and self.ability.driver_tally then
        if self.ability.driver_tally > 15 then
            if self.config.center.pos.x == 0 then
                self:flip()
                Aura.add_individual(self)
                self.animation = {target = 1}
                Aura.update_frame(0, self.config.center_key, self.config.center, self)
                self:flip()
            end
        else if self.ability.driver_tally < 16 then
            if self.config.center.pos.x == 1 then
                self:flip()
                Aura.add_individual(self)
                self.animation = {target = 0}
                self:flip()
            end
        end
        end
    end

    local ss = Card.set_seal
    function Card:set_seal(seal, silent, immediate)
        ss(self,seal,silent,immediate)
        if seal then
            Aura.current_seal = seal
        end
    end
    if self.ability.name == "Certificate" then
        if context.first_hand_drawn then
            ss(self)
            if Aura.current_seal == 'Gold' then
                G.E_MANAGER:add_event(Event({ delay = 10*G.SETTINGS.GAMESPEED,
                    func = (function()
                        Aura.add_individual(self)
                        self.animation = { target = 27 }
                        AnimatedJokers.j_certificate.extra.fps = 1
                        G.P_CENTERS["j_certificate"].pos.extra.x = 1
                        AnimatedJokers.j_certificate.extra.fps = 0
                        return true
                    end)
                }))
            end
            if Aura.current_seal == 'Purple' then
                G.E_MANAGER:add_event(Event({ delay = 10*G.SETTINGS.GAMESPEED,
                    func = (function()
                        Aura.add_individual(self)
                        self.animation = { target = 27 }
                        AnimatedJokers.j_certificate.extra.fps = 1
                        G.P_CENTERS["j_certificate"].pos.extra.x = 2
                        AnimatedJokers.j_certificate.extra.fps = 0
                        return true
                    end)
                }))
            end
            if Aura.current_seal == 'Red' then
                G.E_MANAGER:add_event(Event({ delay = 10*G.SETTINGS.GAMESPEED,
                    func = (function()
                        Aura.add_individual(self)
                        self.animation = { target = 27 }
                        AnimatedJokers.j_certificate.extra.fps = 1
                        G.P_CENTERS["j_certificate"].pos.extra.x = 3
                        AnimatedJokers.j_certificate.extra.fps = 0
                        return true
                    end)
                }))
            end
            if Aura.current_seal == 'Blue' then
                G.E_MANAGER:add_event(Event({ delay = 10*G.SETTINGS.GAMESPEED,
                    func = (function()
                        Aura.add_individual(self)
                        self.animation = { target = 27 }
                        AnimatedJokers.j_certificate.extra.fps = 1
                        G.P_CENTERS["j_certificate"].pos.extra.x = 4
                        AnimatedJokers.j_certificate.extra.fps = 0
                        return true
                    end)
                }))
            end
        end
        if context.game_over or (context.setting_blind and G.GAME.round_resets.ante == 1 and G.GAME.round == 1) then
            Aura.add_individual(self)
            self.animation = { target = 0 }
            G.P_CENTERS["j_certificate"].pos.x = 0
            G.P_CENTERS["j_certificate"].pos.y = 0
            AnimatedJokers.j_certificate.extra.fps = 1
            G.P_CENTERS["j_certificate"].pos.extra.x = 0
            AnimatedJokers.j_certificate.extra.fps = 0
        end
    end

    if self.ability.name == "Invisible Joker" and context.end_of_round then
        if self.ability.invis_rounds == self.ability.extra/2 then
            Aura.add_individual(self)
            self.animation = { target = 5 }
        else if self.ability.invis_rounds >= self.ability.extra then
            Aura.add_individual(self)
            self.animation = { target = 10 }
        end
        end
    end

    if self.ability.name == "Seltzer" and context.cardarea == G.jokers then
        if self.ability.extra == (10 or 9) then
            Aura.add_individual(self)
            self.animation = { target = 0 }
        end
        if self.ability.extra == 8 then
            Aura.add_individual(self)
            self.animation = { target = 1 }
        end
        if self.ability.extra == 6 then
            Aura.add_individual(self)
            self.animation = { target = 2 }
        end
        if self.ability.extra == 4 then
            Aura.add_individual(self)
            self.animation = { target = 3 }
        end
        if self.ability.extra == 2 then
            Aura.add_individual(self)
            self.animation = { target = 4 }
        end
    end

    return ret1, ret2
end

SMODS.Joker:take_ownership('loyalty_card',
    { -- the table of properties you want to change
   update = function(self, card, dt) -- change only update() to not mess with calculate()
         if card.ability then
            if card.ability.loyalty_remaining ~= card.children.center.sprite_pos_copy.x - 1 then -- loyalty_remaining is the. loyalty card procs remaining, duh
               card.children.center:set_sprite_pos({x = card.ability.loyalty_remaining + 1 or 0, y = 0}) -- set sprite pos acc to loy_remaining
               card:juice_up(0.2,0.2) -- small jiggle when the frame changes
            --    play_sound("cardSlide2") -- this sound actually interprets as hole punching
            end
         else
            card.children.center:set_sprite_pos({x = 0, y = 0}) -- Just In Case
         end
   end
    }
)

--There's a bug with this function in 0.9.8 that screws up the joker pool
--So we just override it to fix our problems
if SMODS.injectJokers then
    function SMODS.injectJokers()
        local minId = table_length(G.P_CENTER_POOLS['Joker']) + 1
        local id = 0
        local i = 0
        local joker = nil
        for k, slug in ipairs(SMODS.BUFFERS.Jokers) do
            joker = SMODS.Jokers[slug]
            if joker.order then
                id = joker.order
            else
                i = i + 1
                id = i + minId
            end
            local joker_obj = {
                discovered = joker.discovered,
                name = joker.name,
                set = "Joker",
                unlocked = joker.unlocked,
                order = id,
                key = joker.slug,
                pos = joker.pos,
                config = joker.config,
                rarity = joker.rarity,
                blueprint_compat = joker.blueprint_compat,
                eternal_compat = joker.eternal_compat,
                effect = joker.effect,
                cost = joker.cost,
                cost_mult = 1.0,
                atlas = joker.atlas or nil,
                mod_name = joker.mod_name,
                badge_colour = joker.badge_colour,
                soul_pos = joker.soul_pos,
                -- * currently unsupported
                no_pool_flag = joker.no_pool_flag,
                yes_pool_flag = joker.yes_pool_flag,
                unlock_condition = joker.unlock_condition,
                enhancement_gate = joker.enhancement_gate,
                start_alerted = joker.start_alerted
            }
            for _i, sprite in ipairs(SMODS.Sprites) do
                if sprite.name == joker_obj.key then
                    joker_obj.atlas = sprite.name
                end
            end
    
            -- Now we replace the others
            G.P_CENTERS[slug] = joker_obj
            if not joker.taken_ownership then
                table.insert(G.P_CENTER_POOLS['Joker'], joker_obj)
                table.insert(G.P_JOKER_RARITY_POOLS[joker_obj.rarity], joker_obj)
            else
                for kk, v in ipairs(G.P_CENTER_POOLS['Joker']) do
                    if v.key == slug then G.P_CENTER_POOLS['Joker'][kk] = joker_obj end
                end
                if joker_obj.rarity == joker.rarity_original then
                    for kk, v in ipairs(G.P_JOKER_RARITY_POOLS[joker_obj.rarity]) do
                        if v.key == slug then G.P_JOKER_RARITY_POOLS[joker_obj.rarity][kk] = joker_obj end
                    end
                else
                    table.insert(G.P_JOKER_RARITY_POOLS[joker_obj.rarity], joker_obj)
                    local j
                    for kk, v in ipairs(G.P_JOKER_RARITY_POOLS[joker.rarity_original]) do
                        if v.key == slug then j = kk end
                    end
                    table.remove(G.P_JOKER_RARITY_POOLS[joker.rarity_original], j)
                end
            end
            -- Setup Localize text
            G.localization.descriptions["Joker"][slug] = joker.loc_txt
    
            sendInfoMessage("Registered Joker " .. joker.name .. " with the slug " .. joker.slug .. " at ID " .. id .. ".")
        end
    end
end
