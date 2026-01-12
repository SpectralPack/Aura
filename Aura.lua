--- STEAMODDED HEADER
--- MOD_NAME: Aura
--- MOD_ID: Aura
--- MOD_AUTHOR: [MRTorres, MathIsFun_, ChromaPIE, Bard, TwoBlueDogs]
--- MOD_DESCRIPTION: Adds animations to Jokers. Art by: Bard, Grassy311, RattlingSnow353, Solace, RadicaAprils, chloe_cromslor, SadCube, Mincoiin, Flowr and MRTorres
--- CONFLICTS: [Malverk]
--- BADGE_COLOUR: 3469ab
--- VERSION: 0.501

SMODS.Atlas { -- The Icon for the mod
  key = 'modicon',
  px = 32,
  py = 32,
  path = 'modicon.png'
}

SMODS.Mods.Aura.config_tab = function() -- Add a config tab to the mod for toggling the programmer art
	return {
		n = G.UIT.ROOT,
		config = {
			r = 0.1,
			minw = 5,
			align = "cm",
			padding = 0.2,
			colour = HEX("374244"),
		},
		nodes = {
			create_toggle({
                id = "Animation_Credits",
                label = "Show animation credits in the mod tag of each card",
				ref_table = SMODS.Mods["Aura"].config,
                ref_value = "Animation_Credits",
			}),
			{
				config = {
					text = "*requires restart to take effect",
					shadow = true,
					colour = G.C.UI.TEXT_INACTIVE,
				},
			},
		},
	}
end

AnimatedJokers = {
    j_joker = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_greedy_joker = { frames_per_row = 6, frames = 12, extra = { frames_per_row = 11, frames = 22 }, credits = {"Bard", "Chloe"} },
    j_lusty_joker = { frames_per_row = 5, frames = 20, extra = { frames_per_row = 11, frames = 22 }, credits = {"Bard", "Chloe"} },
    j_wrathful_joker = { frames_per_row = 5, frames = 18, extra = { frames_per_row = 11, frames = 22 }, credits = {"Bard", "Chloe"} },
    j_gluttenous_joker = { frames_per_row = 6, frames = 12, extra = { frames_per_row = 11, frames = 22 }, credits = {"Bard", "Chloe"} },
    j_jolly = { frames_per_row = 11, frames = 22, credits = {"Chloe", "SadCube"} },
    j_zany = { frames_per_row = 11, frames = 22, credits = {"Chloe", "SadCube"} },
    j_mad = { frames_per_row = 11, frames = 22, credits = {"Chloe", "SadCube"} },
    j_crazy = { frames_per_row = 11, frames = 22, credits = {"Chloe", "SadCube"} },
    j_droll = { frames_per_row = 11, frames = 22, credits = {"Chloe", "SadCube"} },
    j_sly = { frames_per_row = 11, frames = 22, credits = {"Chloe", "SadCube"} },
    j_wily = { frames_per_row = 11, frames = 22, credits = {"Chloe", "SadCube"} },
    j_clever = { frames_per_row = 11, frames = 22, credits = {"Chloe", "SadCube"} },
    j_devious = { frames_per_row = 11, frames = 22, credits = {"Chloe", "SadCube"} },
    j_crafty = { frames_per_row = 11, frames = 22, credits = {"Chloe", "SadCube"} },
    j_half = { frames_per_row = 11, frames = 22, credits = {"Chloe", "SadCube"} },
    j_stencil = { frames_per_row = 11, frames = 22, credits = {"Chloe", "SadCube"} },
    j_four_fingers = {},
    j_mime = {},
    j_credit_card = {},
    j_ceremonial = {},
    j_banner = {},
    j_mystic_summit = {},
    j_marble = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_loyalty_card = { frames = 7, individual = true, immediate = true, credits = {"Chloe"} },
    j_8_ball = {}, -- todo: animate when triggered. if succesful, one animation, if failed, another one
    j_misprint = { frames_per_row = 11, frames = 66, credits = {"Chloe"} },
    j_dusk = { frames_per_row = 13, frames = 78, fps = 5, credits = {"Chloe"} },
    j_raised_fist = { frames_per_row = 6, frames = 36, fps = 15, credits = {"MRTorres"} },
    j_chaos = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_fibonacci = { frames_per_row = 8, frames = 32, credits = {"MRTorres"} },
    j_steel_joker = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_scary_face = {},
    j_abstract = {},
    j_delayed_grat = {}, -- todo: animate when primed. constant backround animation. flip clock when triggered, but empty when failed
    j_hack = { frames_per_row = 8, frames = 64, credits = {"rattlingssnow353"} },
    j_pareidolia = { frames_per_row = 5, frames = 20, credits = {"SadCube"} },
    j_gros_michel = {frames = 13, extra = { frames = 18, fps = 15, individual = true }, credits = {"MightyKingVideo"} },
    j_even_steven = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_odd_todd = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_scholar = { frames_per_row = 11, frames = 22, extra = { frames_per_row = 9, frames = 45 } , credits = {"Chloe", "MRTorres"} },
    j_business = { frames_per_row = 13, frames = 120, credits = {"Mincoiin"} },
    j_supernova = {}, -- todo: an explosion animation that triggers each time it gives mult, and shows an amount of frames proportional to the mult given. framerate proportional to amount of frames to keep duration constant.
    j_ride_the_bus = { frames_per_row = 9, frames = 36, credits = {"Grassy353"} }, 
    j_space = { frames = 61, start_frame = 23, frames_per_row = 96, individual = true, extra = { frames_per_row = 11, frames = 22 }, credits = {"Bard", "Chloe"} },
    j_egg = { frames_per_row = 4, frames = 8, individual = true, credits = {"MRTorres"} },
    j_burglar = { frames = 76, individual = true, verticframes = 22, credits = {"Chloe"} },
    j_blackboard = { frames = 49, individual = true, verticframes = 22, credits = {"Comet_System", "Grassy311", "Chloe"} },
    j_runner = { frames_per_row = 10, frames = 110, credits = {"Chloe", "MRTorres"} },
    j_ice_cream = { frames = 6, individual = true, verticframes = 13, credits = {"MightyKingVideo"} }, --todo: add extra frames in between
    j_dna = { frames = 11, credits = {"SadCube"} },
    j_splash = {},
    j_blue_joker = { frames_per_row = 11, frames = 22 },
    j_sixth_sense = { verticframes = 22, frames = 39, individual = true, credits = {"Grassy353", "Chloe", "MRTorres"} },
    j_constellation = { frames_per_row = 6, frames = 66, credits = {"Chloe"} },
    j_hiker = { frames_per_row = 11, frames = 22, credits = {"MRTorres", "Chloe"} },
    j_faceless = { frames_per_row = 4, frames = 24, credits = {"rattlingssnow353"} },
    j_green_joker = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_superposition = { frames = 20, verticframes = 6, verticfps = 8, individual = true, credits = {"MRTorres"} },
    j_todo_list = { frames_per_row = 12, frames = 96, credits = {"RadicaAprils"} }, -- todo: show hand that needs to be played & animate on trigger. each hand played crosses out an item from the list, when all are crossed or round ends, pass page and write new list.
    j_cavendish = {},
    j_card_sharp = { frames = 6, target = 0, verticframes = 11, verticfps = 5, credits = {"MRTorres"} },
    j_red_card = { frames_per_row = 19, frames = 349, credits = {"Bard"} },
    j_madness = {}, -- Idea: randomize the time between laughs/eye twitches
    j_square = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_seance = {}, -- todo: animate when triggered
    j_riff_raff = { frames_per_row = 14, frames = 490, credits = {"Chloe"} },
    j_vampire = { frames_per_row = 11, frames = 22, extra = { frames_per_row = 6, frames = 30 }, credits = {"Mincoiin", "Chloe"} },
    j_shortcut = {},
    j_hologram = { frames = 1, extrasoul = true, extra = { frames_per_row = 22, frames = 22, start_frame = 198 }, credits = {"Chloe"} }, -- the texture needs to be this big so the scanlines are vanilla acurate.
    j_vagabond = { frames = 30, fps = 5, credits = {"Kitty"} },
    j_baron = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_cloud_9 = {},
    j_rocket = { frames_per_row = 11, frames = 87, fps = 10, individual = true, extra = { frames = 5, individual = true, immediate = true }, credits = {"MRTorres"} }, --todo: add thruster animation on the verticframes
    j_obelisk = {}, -- todo: animate when promoted / show hand that needs to not be played
    j_midas_mask = {},
    j_luchador = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_photograph = { frames = 48, credits = {"Grassy331"} },
    j_gift = {},
    j_turtle_bean = { frames_per_row = 7, frames = 14, extra = { verticframes = 14, verticfps = 8 }, credits = {"MRTorres"} },--extra = frames = 6, individual = true -- todo: add the diferent stages of eaten/roten
    j_erosion = {},
    j_reserved_parking = { frames_per_row = 6, frames = 36, credits = {"MightyKingVideo"} },
    j_mail = { frames_per_row = 5, frames = 15, target = 14, immediate = true, credits = {"MRTorres"} },
    j_to_the_moon = { frames = 40, fps = 8, target = 0, verticframes = 40, verticfps = 8, credits = {"MRTorres"} },
    j_hallucination = {},
    j_fortune_teller = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_juggler = { frames = 22, verticframes = 14, verticfps = 13, credits = {"MRTorres"} },
    j_drunkard = { frames = 22, verticframes = 14, verticfps = 13, credits = {"MRTorres"} },
    j_stone = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_golden = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_lucky_cat = { frames = 8, individual = true, verticframes = 29, credits = {"MightyKingVideo"} },
    j_baseball = {},
    j_bull = {},
    j_diet_cola = { frames = 20, credits = {"SadCube", "Chloe"} },
    j_trading = { frames = 96, frames_per_row = 12, individual = true, immediate = true, pos_x = 10, credits = {"MightyKingVideo", "Willow"} }, -- todo: needs more frames
    j_flash = { frames_per_row = 13, frames = 26, individual = true, immediate = true, pos_x = 9, credits = {"Grassy331"} },
    j_popcorn = { frames = 5, individual = true, credits = {"MRTorres"} },
    j_trousers = { frames_per_row = 4, frames = 12, extra = { frames_per_row = 4, frames = 16, fps = 8 }, credits = {"Solace"} },
    j_ancient = { start_frame = 18, frames = 6, target = 3, credits = {"SadCube"} },
    j_ramen = {},--{ frames = 21, individual = true }, --todo: create true animation
    j_walkie_talkie = {},
    j_selzer = { verticframes = 15, start_frame = 3, frames = 51, individual = true, credits = {"MRTorres"} },
    j_castle = { frames_per_row = 9, frames = 69, start_frame = 0, extra = { frames = 9, target = 3, immediate = true, verticframes = 5, verticfps = 5 }, credits = {"Bard"} },
    j_smiley = { frames_per_row = 13, frames = 150, credits = {"SadCube", "Chloe"} },
    j_campfire = {}, -- todo: animate fire, which gets bigger the more you burn, returning to normal when resetting
    j_ticket = {},
    j_mr_bones = { frames_per_row = 11, frames = 22, credits = {"Chloe"} }, -- todo: destroy animation? (if done, with the laugh as verticframes)
    j_acrobat = {},
    j_sock_and_buskin = { frames_per_row = 5, frames = 30, credits = {"MRTorres"} },
    j_swashbuckler = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_troubadour = {},
    j_certificate = { frames_per_row = 7, frames = 28, individual = true, extra = { frames_per_row = 6, frames = 13, individual = true, immediate = true }, credits = {"Chloe", "MightyKingVideo"} },
    j_smeared = { frames_per_row = 11, frames = 22, extra = { frames = 10 }, credits = {"SadCube", "Chloe"} },
    j_throwback = { verticframes = 18, frames = 100, extra = { frames_per_row = 11, frames = 22 }, credits = {"Chloe", "MRTorres"} }, -- todo: animate when promoted (if done, on extra layer, with the laugh as verticframes)
    j_hanging_chad = {},
    j_rough_gem = {},
    j_bloodstone = {},
    j_arrowhead = {},
    j_onyx_agate = {},
    j_glass = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_ring_master = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_flower_pot = { frames = 24, credits = {"Bard"} },
    j_blueprint = { frames = 31, individual = true, verticframes = 22, credits = {"Grassy331", "Chloe"} },
    j_wee = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_merry_andy = { frames_per_row = 11, frames = 22 },
    j_oops = { frames_per_row = 5, frames = 10, extra = { frames = 5, fps = 15, target = 0 }, credits = {"SadCube", "MRTorres"} }, -- todo: create stilized smear frames
    j_idol = { frames_per_row = 15, frames = 150, immediate = true, target = 51, extra = { frames_per_row = 6, frames = 6, fps = 3, target = 3 }, credits = {"MRTorres"} }, -- todo: fix broken code for custom suit icons
    j_seeing_double = { frames_per_row = 13, frames = 150, extra = { frames_per_row = 4, frames = 8, individual = true }, credits = {"SadCube"} },
    j_matador = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_hit_the_road = { frames = 10, individual = true, credits = {"MRTorres"} }, -- todo: create a true animation with pespective and not just the 2d car
    j_duo = { extra = { frames_per_row = 11, frames = 22 }, credits = {"SadCube"} },
    j_trio = { extra = { frames_per_row = 11, frames = 22 }, credits = {"SadCube"} },
    j_family = { extra = { frames_per_row = 11, frames = 22 }, credits = {"SadCube"} },
    j_order = { extra = { frames_per_row = 11, frames = 22 }, credits = {"SadCube"} },
    j_tribe = { extra = { frames_per_row = 11, frames = 22 }, credits = {"SadCube"} },
    j_stuntman = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_invisible = { frames = 11, fps = 5, individual = true, verticframes = 22, credits = {"Chloe"} },
    j_brainstorm = { frames = 39, individual = true, verticframes = 22, credits = {"Grassy331", "Chloe"} },
    j_satellite = {},
    j_shoot_the_moon = { frames_per_row = 11, frames = 22, credits = {"MRTorres"} },
    j_drivers_license = { frames = 2, target = 0, immediate = true, credits = {"Grassy331"} },
    j_cartomancer = { frames_per_row = 11, frames = 22, credits = {"Chloe"} },
    j_astronomer = { frames = 29, extra = { frames = 6, fps = 2, verticframes = 22 }, credits = {"Chloe"} },
    j_burnt = {}, -- todo: animate when primed?
    j_bootstraps = { frames_per_row = 19, frames = 38, credits = {"Chloe", "MRTorres"} },
    j_caino = {}, -- todo: add animations
    j_triboulet = {}, -- todo: add animations
    j_yorick = {}, -- todo: add animations
    j_chicot = {}, -- todo: add animations
    j_perkeo = {} -- todo: add animations
}
AnimatedConsumeables = {
    c_fool = {},
    c_magician = {},
    c_high_priestess = {},
    c_empress = {},
    c_emperor = {},
    c_heirophant = {},
    c_lovers = { frames_per_row = 6, frames = 30, extra = { frames_per_row = 2, frames = 4, individual = true, immediate = true }, credits = {"MRTorres"} },
    c_chariot = {},
    c_justice = {},
    c_hermit = { frames_per_row = 2, frames = 4, fps = 3, credits = {"MRTorres"} },
    c_wheel_of_fortune = { frames = 12, individual = true, credits = {"SadCube"} },
    c_strength = {},
    c_hanged_man = {},
    c_death = {},
    c_temperance = {},
    c_devil = {},
    c_tower = {},
    c_sun = { frames_per_row = 9, frames = 45, fps = 15, extra = { }, credits = {"MRTorres"} },
    c_moon = {},
    c_star = {},
    c_judgement = {},
    c_world = {},
    c_mercury = { frames = 24, credits = {"Bard"} },
    c_venus = { frames = 24, credits = {"Bard"} },
    c_earth = { frames = 24, credits = {"Bard"} },
    c_mars = { frames = 24, credits = {"Bard"} },
    c_jupiter = { frames = 24, credits = {"Bard"} },
    c_saturn = { frames = 24, credits = {"Bard"} },
    c_uranus = { frames = 24, credits = {"Bard"} },
    c_neptune = { frames = 24, credits = {"Bard"} },
    c_pluto = { frames = 24, credits = {"Bard"} },
    c_planet_x = { frames = 24, credits = {"Bard"} },
    c_ceres = { frames = 24, credits = {"Bard"} },
    c_eris = { frames = 24, credits = {"Bard"} },
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
    c_black_hole = { frames_per_row = 24, frames = 144, credits = {"SadCube", "MRTorres"} }
}
AnimatedVouchers = {
    v_overstock_norm = { frames = 5, credits = {"MRTorres"} },
    v_overstock_plus = {},
    v_clearance_sale = {},
    v_liquidation = {},
    v_hone = { frames = 24, frames_per_row = 12, credits = {"Chloe"} },
    v_glow_up = {},
    v_reroll_surplus = { frames = 11, credits = {"SadCube"} },
    v_reroll_glut = { frames = 8 },
    v_crystal_ball = { frames = 150, frames_per_row = 13, credits = {"SadCube"} },
    v_omen_globe = { frames = 150, frames_per_row = 13, credits = {"SadCube"} },
    v_telescope = {},
    v_observatory = {},
    v_grabber = { frames_per_row = 12, frames = 48, credits = {"GhostSalt"} },
    v_nacho_tong = {},
    v_wasteful = { frames = 9, credits = {"Chloe"} },
    v_recyclomancy = { frames = 9, credits = {"MRTorres"} },
    v_tarot_merchant = { frames = 12, credits = {"Chloe"} },
    v_tarot_tycoon = {},
    v_planet_merchant = { frames = 12, credits = {"Chloe"} },
    v_planet_tycoon = {},
    v_seed_money = {},
    v_money_tree = {},
    v_blank = { frames = 30, fps = (20/3), verticframes = 23, credits = {"SadCube"} },
    v_antimatter = { frames = 30, fps = (20/3), verticframes = 23, credits = {"T3rragon"} },
    v_magic_trick = { frames = 9, credits = {"MRTorres"} },
    v_illusion = { frames = 18, frames_per_row = 9, credits = {"MRTorres"} },
    v_hieroglyph = {},
    v_petroglyph = {},
    v_directors_cut = {},
    v_retcon = {},
    v_paint_brush = {},
    v_palette = {}
}
AnimatedTags = {
    tag_uncommon = { frames_per_row = 11, frames = 22, credits = {"MightyKingVideo"} },
    tag_rare = { frames_per_row = 11, frames = 22, credits = {"MightyKingVideo"} },
    tag_negative = { frames = 19, credits = {"MightyKingVideo"} },
    tag_foil = { frames = 19, credits = {"MightyKingVideo"} },
    tag_holo = { frames = 19, credits = {"MightyKingVideo"} },
    tag_polychrome = { frames = 19, credits = {"MightyKingVideo"} },
    tag_investment = { frames = 20, credits = {"MightyKingVideo"} },
    tag_voucher = { frames_per_row = 19, frames  = 57, credits = {"MightyKingVideo"} },
    tag_boss = { frames = 10, credits = {"SadCube"} },
    tag_standard = { frames = 18, credits = {"SadCube"} },
    tag_charm = { frames = 13, credits = {"Cebee"} },
    tag_meteor = { frames_per_row = 8, frames = 16, fps = 5, credits = {"SadCube", "MRTorres"} },
    tag_buffoon = { frames_per_row = 11, frames = 22, credits = {"Willow"} },
    tag_handy = { frames = 18, credits = {"Willow"} },
    tag_garbage = { frames = 19, credits = {"Willow"} },
    tag_ethereal = {},
    tag_coupon = { frames = 18, credits = {"SadCube"} },
    tag_double = { frames = 26, credits = {"SadCube"} },
    tag_juggle = { frames = 11, credits = {"MightyKingVideo"} },
    tag_d_six = { frames_per_row = 4, frames = 24, credits = {"MightyKingVideo"} },
    tag_top_up = { frames_per_row = 5, frames = 19, credits = {"MightyKingVideo"} },
    tag_skip = { frames = 10, credits = {"SadCube"} },
    tag_orbital = { frames = 12, credits = {"MightyKingVideo"} },
    tag_economy = { frames = 10, credits = {"SadCube"} }
}

AnimatedEnchancements = {
    m_bonus = { frames = 13, fps = 20, individual = true, credits = {"MRTorres"} },
    m_mult = { frames_per_row = 13, frames = 65, fps = 20, individual = true, credits = {"MRTorres"} },
    m_wild = {},
    m_glass = {},
    m_steel = {},
    m_stone = {},
    m_gold = {},
    m_lucky= {}
}

AuraTradingCards = {
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

AnimatedDeckSkins = {
}

AnimatedIndividuals = {}

Aura = {}

function Aura.add_individual(card, loaded)
    local is_in_individual = false
    for i = 1, #AnimatedIndividuals do
        if AnimatedIndividuals[i] == card then
            is_in_individual = true
            break
        end
    end
    if not is_in_individual then
        AnimatedIndividuals[#AnimatedIndividuals+1] = card
        local anim = card.config.center.anim
        if card.config.center.key == "j_flash" and not loaded then
            if card.animation then
                Aura.update_flash(card, card.animation.flash_order[card.animation.flash_index])
            else
                Aura.update_flash(card, (card.config.center.animpos.x + (13*card.config.center.animpos.y)))
            end
        end
        if card.config.center.key == "j_trading" and not loaded then
            if card.animation then
                Aura.update_trading(card, card.animation.trading_order[card.animation.trading_index])
            else
                Aura.update_trading(card, (card.config.center.animpos.x + (12*card.config.center.animpos.y) + 1))
            end
        end
        card.animation = card.animation or {}
        local center_copy = {}
        for k, v in pairs(card.config.center) do
            center_copy[k] = v
        end
        center_copy.animation = card.animation
        if anim.individual then
            center_copy.animpos = {x = card.config.center.animpos.x, y = card.config.center.animpos.y}
        else
            center_copy.animpos = card.config.center.animpos
        end
        if card.config.center.animpos.extra then
            if anim and anim.extra and anim.extra.individual then
                center_copy.animpos.extra = {x = card.config.center.animpos.extra.x, y = card.config.center.animpos.extra.y, atlas = card.config.center.animpos.extra.atlas} 
            else
                center_copy.animpos.extra = card.config.center.animpos.extra
            end
        end
        card.config.center = center_copy
        card:set_sprites(card.config.center)
    end
end

if SMODS.Atlas then
    --Register all Jokers/Sprites
    for k, v in pairs(AnimatedJokers) do
        local posx, posy, posex, posey
        if v.start_frame then
            posx = v.start_frame%(v.frames_per_row or v.frames)
            if v.verticframes and v.start_verticframe then
                posy = v.start_verticframe
            else
                posy = math.floor(v.start_frame / (v.frames_per_row or v.frames))
            end
        end
        if v.extra and v.extra.start_frame then
            posex = v.extra.start_frame%(v.extra.frames_per_row or v.extra.frames)
            if v.extra.verticframes and v.extra.start_verticframe then
                posey = v.extra.start_verticframe
            else
                posey = math.floor(v.extra.start_frame / (v.extra.frames_per_row or v.extra.frames))
            end
        end
        if v and next(v) then
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
            SMODS.Joker:take_ownership(k, {
                atlas = k,
                animpos = { x = v.pos_x or posx or 0, y = posy or 0, extra = v.extra and {x = v.extra.pos_x or posex or 0, y = v.extra.pos_y or posey or 0, atlas = "aura_"..k.."_extra"} },
                anim = v,
            }, not SMODS.Mods["Aura"].config.Animation_Credits)
        end
    end
    --Register all Planets/Sprites
    for k, v in pairs(AnimatedConsumeables) do
        local posx, posy, posex, posey
        if v.start_frame then
            posx = v.start_frame%(v.frames_per_row or v.frames)
            if v.verticframes and v.start_verticframe then
                posy = v.start_verticframe
            else
                posy = math.floor(v.start_frame / (v.frames_per_row or v.frames))
            end
        end
        if v.extra and v.extra.start_frame then
            posex = v.extra.start_frame%(v.extra.frames_per_row or v.extra.frames)
            if v.extra.verticframes and v.extra.start_verticframe then
                posey = v.extra.start_verticframe
            else
                posey = math.floor(v.extra.start_frame / (v.extra.frames_per_row or v.extra.frames))
            end
        end
        if v and next(v) then
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
            SMODS.Consumable:take_ownership(k, {
                atlas = k,
                animpos = { x = v.pos_x or posx or 0, y = v.pos_y or posy or 0, extra = v.extra and {x = v.extra.pos_x or posex or 0, y = v.extra.pos_y or posey or 0, atlas = "aura_"..k.."_extra"} },
                anim = v,
            },not SMODS.Mods["Aura"].config.Animation_Credits)
        end
    end
    --Register all Vouchers/Sprites
    for k, v in pairs(AnimatedVouchers) do
        local posx, posy, posex, posey
        if v.start_frame then
            posx = v.start_frame%(v.frames_per_row or v.frames)
            if v.verticframes and v.start_verticframe then
                posy = v.start_verticframe
            else
                posy = math.floor(v.start_frame / (v.frames_per_row or v.frames))
            end
        end
        if v.extra and v.extra.start_frame then
            posex = v.extra.start_frame%(v.extra.frames_per_row or v.extra.frames)
            if v.extra.verticframes and v.extra.start_verticframe then
                posey = v.extra.start_verticframe
            else
                posey = math.floor(v.extra.start_frame / (v.extra.frames_per_row or v.extra.frames))
            end
        end
        if v and next(v) then
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
            SMODS.Voucher:take_ownership(k, {
                atlas = k,
                animpos = { x = v.pos_x or posx or 0, y = v.pos_y or posy or 0, extra = v.extra and {x = v.extra.pos_x or posex or 0, y = v.extra.pos_y or posey or 0, atlas = "aura_"..k.."_extra"} },
                anim = v,
            },not SMODS.Mods["Aura"].config.Animation_Credits)
        end
    end

    --Register all enchancements/Sprites
    for k, v in pairs(AnimatedEnchancements) do
        local posx, posy, posex, posey
        if v.start_frame then
            posx = v.start_frame%(v.frames_per_row or v.frames)
            if v.verticframes and v.start_verticframe then
                posy = v.start_verticframe
            else
                posy = math.floor(v.start_frame / (v.frames_per_row or v.frames))
            end
        end
        if v.frames then
            --sprite
            SMODS.Atlas {
                key = k,
                path = k .. ".png",
                px = v.px or 71,
                py = v.py or 95
            }
            --enchancement override
            SMODS.Enhancement:take_ownership(k, {
                atlas = k,
                animpos = { x = v.pos_x or posx or 0, y = v.pos_y or posy or 0 },
                anim = v,
            },not SMODS.Mods["Aura"].config.Animation_Credits)
        end
    end
    --Register all Tags/Sprites
    for k, v in pairs(AnimatedTags) do
        if v.frames then
            --sprite
            SMODS.Atlas {
                key = k,
                path = k .. ".png",
                px = v.px or 34,
                py = v.py or 34
            }
            --tag override
            SMODS.Tag:take_ownership(k, {
                atlas = k,
                animpos = { x = 0, y = 0 },
                anim = v,
            },not SMODS.Mods["Aura"].config.Animation_Credits)
        else
            SMODS.Tag:take_ownership(k, {}, true)
        end
    end
end

--This function lets you know the pseudorandom value for a given seed without modifying future random calls
function peek_pseudorandom(seed, min, max)
    if type(seed) == 'string' then
        local base
        if G.GAME.pseudorandom[seed] then
            base = G.GAME.pseudorandom[seed]
        else
            base = pseudohash(seed..(G.GAME.pseudorandom.seed or ''))
        end
        seed = (math.abs(tonumber(string.format("%.13f", (2.134453429141 + base * 1.72431234) % 1))) + (G.GAME.pseudorandom.hashed_seed or 0)) / 2
    end
    math.randomseed(seed)
    if min and max then return math.random(min, max)
    else return math.random() end
end

-- Credit to Cryptid devs for this function. Credits for animations in the mod badges.
local cmb = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
	cmb(obj, badges)
    local Aura_credits = obj and obj.anim and obj.anim.credits
	if Aura_credits then
		local function calc_scale_fac(text)
			local size = 0.9
			local font = G.LANG.font
			local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
			local calced_text_width = 0
			-- Math reproduced from DynaText:update_text
			for _, c in utf8.chars(text) do
				local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
					+ 2.7 * 1 * G.TILESCALE * font.FONTSCALE
				calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
			end
			local scale_fac = calced_text_width > max_text_width and max_text_width / calced_text_width or 1
			return scale_fac
		end
		if Aura_credits then
			local scale_fac = {}
			local min_scale_fac = 1
			local strings = { "Aura" }
            if obj.key ~= "j_trading" then
                for i = 1, #Aura_credits do
                    if #Aura_credits > 1 then
                        strings[#strings + 1] = "Animators: "..Aura_credits[i]
                    else
                        strings[#strings + 1] = "Animator: "..Aura_credits[i]
                    end
                end
            else
                local tradingNumber = (obj.animation and obj.animation.trading_order and obj.animation.trading_order[obj.animation.trading_index]) or 11
                local trading_card = AuraTradingCards[tradingNumber]
                local trading_credits = (obj.animation and obj.animation.EX and AuraTradingCards[tradingNumber].EX and AuraTradingCards[tradingNumber].EX.credits) or AuraTradingCards[tradingNumber].credits
                for i = 1, #trading_credits do
                    strings[#strings + 1] = "Art #"..tostring(tradingNumber)..(obj.animation and obj.animation.EX and " EX" or "").." by: "..trading_credits[i]
				end
			end
			for i = 1, #strings do
				scale_fac[i] = calc_scale_fac(strings[i])
				min_scale_fac = math.min(min_scale_fac, scale_fac[i])
			end
			local ct = {}
			for i = 1, #strings do
				ct[i] = {
					string = strings[i],
				}
			end
			local Aura_badge = {
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					{
						n = G.UIT.R,
						config = {
							align = "cm",
							colour = HEX("3469ab"),
							r = 0.1,
							minw = 2 / min_scale_fac,
							minh = 0.36,
							emboss = 0.05,
							padding = 0.03 * 0.9,
						},
						nodes = {
							{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
							{
								n = G.UIT.O,
								config = {
									object = DynaText({
										string = ct or "ERROR",
										colours = { Aura_credits and Aura_credits.text_colour or G.C.WHITE },
										silent = true,
										float = true,
										shadow = true,
										offset_y = -0.03,
										spacing = 1,
										scale = 0.33 * 0.9,
									}),
								},
							},
							{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
						},
					},
				},
			}
			local function eq_col(x, y)
				for i = 1, 4 do
					if x[i] ~= y[i] then
						return false
					end
				end
				return true
			end
			for i = 1, #badges do
				if eq_col(badges[i].nodes[1].config.colour, HEX("3469ab")) then
                    if not obj.anim.IncorrectAtlas then -- if the atlas is incorrect, No badge at all
                        badges[i].nodes[1].nodes[2].config.object:remove()
                        badges[i] = Aura_badge
                    else
                        table.remove(badges, i)
                    end
					break
				end
			end
		end
	end
end

local chpop = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
    if card.ability_UIBox_table and card.config and card.config.center and card.config.center.key == "j_trading" then
        local tradingNumber = card.animation and card.animation.trading_order[card.animation.trading_index] or 11
        local trading_name = AuraTradingCards[tradingNumber].name or "Unknown Trading Card"
        trading_name = '"'..trading_name..(card.animation and card.animation.EX and ' EX"' or '"')
        card.ability_UIBox_table.name[2] = {
            n = G.UIT.R,
            config = { align = "cm" },
            nodes = {
                {
                    n = G.UIT.R,
                    config = {
                        padding = 0.03,
                        align = "cm",
                        res = 0.15,
                        r = 0.05,
                    },
                    nodes = {
                        {
                            n = G.UIT.O,
                            config = {
                                object = DynaText({
                                    string = trading_name,
                                    colours = {G.C.WHITE},
                                    silent = true,
                                    float = true,
                                    shadow = true,
                                    offset_y = -0.03,
                                    spacing = 1,
                                    scale = 0.35,
                                }),
                            },
                        },
                    },
                },
            },
        }
    end
    return chpop(card)
end

--fix edition shaders ignoring front layer. FIX MADE BY LARSWIJN
--In theory, this fix will be added natively to Steamodded, but until then, it will be here.
if SMODS.DrawStep then
	-- drawsteps are "only" supported since 0423a
	SMODS.DrawStep:take_ownership("front",
		-- delay drawing of front to be after `edition` drawstep for center
		{
			order = 22,
		}
	)

	SMODS.DrawStep {
		-- now we need to create a new drawing step to apply the edition shader to the front
		key = "front_edition",
		order = 24,
		func = function(self, layer)
			if self.children.front and not self:should_hide_front() then
				local edition = self.delay_edition or self.edition
				if edition then
					for k, v in pairs(G.P_CENTER_POOLS.Edition) do
						if edition[v.key:sub(3)] and v.shader then
							if type(v.draw) == 'function' then
								v:draw(self, layer)
							else
								self.children.front:draw_shader(v.shader, nil, self.ARGS.send_to_shader)
							end
						end
					end
				end
				if (edition and edition.negative) or (self.ability.name == 'Antimatter' and (self.config.center.discovered or self.bypass_discovery_center)) then
					self.children.front:draw_shader('negative_shine', nil, self.ARGS.send_to_shader)
				end
			end
		end,
		conditions = { vortex = false, facing = 'front', front_hidden = false },
	}
end

--Update animated sprites
local upd = Game.update

function Aura.update_frame(dt, k, obj, jkr)
    local anim = obj and obj.anim
    local animpos = obj and obj.animpos
    if anim and animpos then
        if anim.frames then
            local frames_passed = 0
            if jkr then
                if anim.individual then
                    if anim.immediate then
                        if jkr.target and (animpos.x + (not anim.verticframes and (animpos.y*(anim.frames_per_row or anim.frames)) or 0)) ~= jkr.target then
                                frames_passed = 1
                            end    
                        else
                        jkr.t = jkr.t or (anim.t and (anim.t - dt)) or 0
                        jkr.t = jkr.t + dt
                        frames_passed = math.floor(jkr.t / (1/(jkr.fps or anim.fps or 10)))
                        if frames_passed > 0 then
                            jkr.t = jkr.t - frames_passed/(jkr.fps or anim.fps or 10)
                        end
                    end
                end
            else
                if anim.immediate and anim.target then
                    if (animpos.x + (not anim.verticframes and (animpos.y*(anim.frames_per_row or anim.frames)) or 0)) ~= anim.target and not anim.individual then
                        frames_passed = 1
                    end
                else
                    anim.t = anim.t or 0
                    anim.t = anim.t + dt
                    frames_passed = math.floor(anim.t / (1/(anim.fps or 10)))
                    if frames_passed > 0 then
                        anim.t = anim.t - frames_passed/(anim.fps or 10)
                        if anim.individual then
                            frames_passed = 0
                        end
                    end
                end
            end
            if frames_passed > 0 then
                local loc = animpos.x
                if not anim.verticframes then
                    loc = loc + animpos.y*(anim.frames_per_row or anim.frames)
                end
                loc = loc - ((jkr and jkr.start_frame) or anim.start_frame or 0)
                if jkr and (jkr.target or jkr.fps or jkr.frames) and anim.individual then
                    if jkr.target then
                        if anim.immediate then
                            loc = jkr.target
                        else
                            local til_target = jkr.target - loc
                            if til_target < 0 then
                                til_target = til_target + (jkr.frames or anim.frames)
                            end
                            if til_target >= frames_passed then
                                loc = loc + frames_passed
                            else
                                if jkr.remaining_triggers then
                                    local targets_passed = math.floor((frames_passed - til_target) / (jkr.frames or anim.frames)) + 1
                                    if targets_passed > jkr.remaining_triggers then
                                        loc = jkr.target
                                        jkr.remaining_triggers = nil
                                    else
                                        loc = loc + (frames_passed % (jkr.frames or anim.frames))
                                        jkr.remaining_triggers = jkr.remaining_triggers - targets_passed
                                    end
                                elseif jkr.escape_target and til_target == 0 then
                                    loc = loc + math.min(frames_passed, jkr.frames or anim.frames)
                                else
                                    loc = jkr.target
                                end
                                if jkr.remaining_triggers and jkr.remaining_triggers <= 0 then jkr.remaining_triggers = nil end
                                jkr.escape_target = false
                            end
                        end
                    else
                        loc = loc + frames_passed
                    end
                elseif anim.target then
                    if anim.immediate then
                        loc = anim.target
                    else
                        local til_target = anim.target - loc
                        if til_target < 0 then
                            til_target = til_target + anim.frames
                        end
                        if til_target >= frames_passed then
                            loc = loc + frames_passed
                        else
                            if anim.remaining_triggers then
                                local targets_passed = math.floor((frames_passed - til_target) / anim.frames) + 1
                                if targets_passed > anim.remaining_triggers then
                                    loc = anim.target
                                    anim.remaining_triggers = nil
                                else
                                    loc = loc + (frames_passed % anim.frames)
                                    anim.remaining_triggers = anim.remaining_triggers - targets_passed
                                end
                            elseif anim.escape_target and til_target == 0 then
                                loc = loc + math.min(frames_passed, anim.frames)
                            else
                                loc = anim.target
                            end
                            if anim.remaining_triggers and anim.remaining_triggers <= 0 then anim.remaining_triggers = nil end
                            anim.escape_target = false
                        end
                    end
                elseif not anim.individual then
                    loc = loc + frames_passed
                end
                if loc >= ((jkr and jkr.frames) or anim.frames) then 
                    loc = loc % ((jkr and jkr.frames) or anim.frames)
                    if k == "j_ancient" then Aura.update_ancient() end
                end
                loc = loc + ((jkr and jkr.start_frame) or anim.start_frame or 0)
                animpos.x = loc%(anim.frames_per_row or anim.frames)
                if not anim.verticframes then
                    animpos.y = math.floor(loc / (anim.frames_per_row or anim.frames))
                end
            end
        end
        if anim.verticframes then
            if not jkr then
                anim.verticframest = anim.verticframest or (anim.t and (anim.t - dt)) or 0
                anim.verticframest = anim.verticframest + dt
                local frames_passed = math.floor(anim.verticframest / (1/(anim.verticfps or 10)))
                if frames_passed > 0 then
                    anim.verticframest = anim.verticframest - frames_passed/(anim.verticfps or 10)
                    anim.verticloc = anim.verticloc or start_verticframe or 0
                    anim.verticloc = anim.verticloc + frames_passed
                    if anim.verticloc >= anim.verticframes + (anim.start_verticframe or 0) then anim.verticloc = anim.start_verticframe or 0 end
                end
            end
            animpos.y = anim.verticloc
        end
        if anim.extra then
            if anim.extra.frames then
                local frames_passed = 0
                if jkr then
                    if anim.extra.individual then
                        jkr.extra = jkr.extra or {}
                        if anim.extra.immediate then
                            if jkr.extra.target and (animpos.extra.x + (not anim.extra.verticframes and animpos.extra.y*(anim.extra.frames_per_row or anim.extra.frames) or 0)) ~= jkr.extra.target then
                                frames_passed = 1
                            end
                        else
                            if jkr.extra then
                                jkr.extra.t = jkr.extra.t or (anim.extra.t and (anim.extra.t - dt)) or (anim.t and (anim.t - dt)) or 0
                                jkr.extra.t = jkr.extra.t + dt
                                frames_passed = math.floor(jkr.extra.t / (1/(jkr.extra.fps or anim.extra.fps or 10)))
                                if frames_passed > 0 then
                                    jkr.extra.t = jkr.extra.t - frames_passed/(jkr.extra.fps or anim.extra.fps or 10)
                                end
                            end
                        end
                    end
                else
                    if anim.extra.immediate then
                        if animpos.extra and animpos.extra.x ~= anim.extra.target and not anim.extra.individual then
                            frames_passed = 1
                    end
                    else
                    anim.extra.t = anim.extra.t or (anim.t and (anim.t - dt)) or 0
                    anim.extra.t = anim.extra.t + dt
                    frames_passed = math.floor(anim.extra.t / (1/(anim.extra.fps or 10)))
                    if frames_passed > 0 then
                        anim.extra.t = anim.extra.t - frames_passed/(anim.extra.fps or 10)
                            if anim.extra.individual then
                                frames_passed = 0
                            end
                        end
                    end
                end
                if frames_passed > 0 then 
                    if not animpos.extra then--Custom fix to prevent crash in Balatro Multiplayer in a sandbox play- idk why oops_all_6s didnt have animpos.extra, but if I give it to it it works
                        animpos.extra = {x = 0, y = 0, atlas = "aura_"..k.."_extra"}
                    end
                    local loc = animpos.extra.x
                    if not anim.extra.verticframes then
                        loc = loc + animpos.extra.y*(anim.extra.frames_per_row or anim.extra.frames)
                    end
                    loc = loc - ((jkr and jkr.extra.start_frame) or anim.extra.start_frame or 0)
                    if jkr and jkr.extra and (jkr.extra.target or jkr.extra.fps) and anim.extra.individual then
                        if jkr.extra.target then
                            if anim.extra.immediate then
                                loc = jkr.extra.target
                                else
                                local til_target = jkr.extra.target - loc
                                if til_target < 0 then
                                    til_target = til_target + (jkr.extra.frames or anim.extra.frames)
                                end
                                if til_target >= frames_passed then
                                    loc = loc + frames_passed
                                else
                                    if jkr.extra.remaining_triggers then
                                        local targets_passed = math.floor((frames_passed - til_target) / (jkr.extra.frames or anim.extra.frames)) + 1
                                        if targets_passed > jkr.extra.remaining_triggers then
                                            loc = jkr.extra.target
                                            jkr.extra.remaining_triggers = nil
                                        else
                                            loc = loc + (frames_passed % (jkr.extra.frames or anim.extra.frames))
                                            jkr.extra.remaining_triggers = jkr.extra.remaining_triggers - targets_passed
                                        end
                                    elseif jkr.extra.escape_target and til_target == 0 then
                                        loc = loc + math.min(frames_passed, jkr.extra.frames or anim.extra.frames)
                                    else
                                        loc = jkr.extra.target
                                    end
                                    if jkr.extra.remaining_triggers and jkr.extra.remaining_triggers <= 0 then jkr.extra.remaining_triggers = nil end
                                    jkr.extra.escape_target = false
                                end
                            end
                        else
                            loc = loc + frames_passed
                        end
                    elseif anim.extra.target then
                        if anim.extra.immediate then
                            loc = anim.extra.target
                        else
                            local til_target = anim.extra.target - loc
                            if til_target < 0 then
                                til_target = til_target + anim.extra.frames
                            end
                            if til_target >= frames_passed then
                                loc = loc + frames_passed
                            else
                                if anim.extra.remaining_triggers then
                                    local targets_passed = math.floor((frames_passed - til_target) / anim.extra.frames) + 1
                                    if targets_passed > anim.extra.remaining_triggers then
                                        loc = anim.extra.target
                                        anim.extra.remaining_triggers = nil
                                    else
                                        loc = loc + (frames_passed % anim.extra.frames)
                                        anim.extra.remaining_triggers = anim.extra.remaining_triggers - targets_passed
                                    end
                                elseif anim.extra.escape_target and til_target == 0 then
                                    loc = loc + math.min(frames_passed, anim.extra.frames)
                                else
                                    loc = anim.extra.target
                                end
                                if anim.extra.remaining_triggers and anim.extra.remaining_triggers <= 0 then anim.extra.remaining_triggers = nil end
                                anim.extra.escape_target = false
                            end
                        end
                    elseif not anim.extra.individual then
                        loc = loc + frames_passed
                    end
                    if loc >= (jkr and jkr.extra and jkr.extra.frames or anim.extra.frames) then
                        loc = loc % (jkr and jkr.extra and jkr.extra.frames or anim.extra.frames)
                        if k == "j_idol" then Aura.update_idol() end
                    end
                    loc = loc + ((jkr and jkr.extra.start_frame) or anim.extra.start_frame or 0)
                    animpos.extra.x = loc%(anim.extra.frames_per_row or anim.extra.frames)
                    if not anim.extra.verticframes then
                        animpos.extra.y = math.floor(loc / (anim.extra.frames_per_row or anim.extra.frames))
                    end
                end
            end
            if anim.extra.verticframes then
                if not jkr then
                    anim.extra.verticframest = anim.extra.verticframest or (anim.extra.t and (anim.extra.t - dt)) or (anim.t and (anim.t - dt)) or 0
                    anim.extra.verticframest = anim.extra.verticframest + dt
                    local frames_passed = math.floor(anim.extra.verticframest / (1/(anim.extra.verticfps or 10)))
                    if frames_passed > 0 then
                        anim.extra.verticframest = anim.extra.verticframest - frames_passed/(anim.extra.verticfps or 10)
                        anim.extra.verticloc = anim.extra.verticloc or 0
                        anim.extra.verticloc = anim.extra.verticloc + frames_passed
                        if anim.extra.verticloc >= anim.extra.verticframes + (anim.extra.start_verticframe or 0) then anim.extra.verticloc = anim.extra.start_verticframe or 0 end
                    end
                end
                animpos.extra.y = anim.extra.verticloc
            end
        end
    end
end

function Game:update(dt)
    upd(self, dt)
    local AnimatedDictionaries = {
        AnimatedJokers,
        AnimatedConsumeables,
        AnimatedVouchers,
        AnimatedEnchancements,
    }
    for _, AnimDict in pairs(AnimatedDictionaries) do
        for k, v in pairs(AnimDict) do
            if next(AnimDict[k] or {}) ~= nil then
                if AnimDict[k].IncorrectAtlas == nil then
                    AnimDict[k].IncorrectAtlas = CheckAtlas(G.P_CENTERS[k])
                end
                Aura.update_frame(dt, k, G.P_CENTERS[k])
            end
        end
    end
    for k, v in pairs(AnimatedTags) do
        if next(AnimatedTags[k] or {}) ~= nil then
            if AnimatedTags[k].IncorrectAtlas == nil then
                AnimatedTags[k].IncorrectAtlas = CheckAtlas(G.P_TAGS[k])
            end
        Aura.update_frame(dt, k, G.P_TAGS[k])
        end
    end
    for _, v in pairs(AnimatedIndividuals) do
        Aura.update_frame(dt, v.config.center_key, v.config.center, v.animation)
    end
    for k, v in pairs(AnimatedDeckSkins) do
        for ks, Suit in pairs(v) do
            for kv, value in pairs(Suit) do
                Aura.update_frame(dt, k.."_"..ks.."_"..kv, value)
            end
        end
    end
end

local cs = Card.save
function Card:save()
    local cardTable = cs(self)
    if self.animation then
        cardTable.animation = self.animation
    end
    return cardTable
end
local cl = Card.load
function Card:load(cardTable, other_card)
    cl(self, cardTable)
    if cardTable.animation then
        self.animation = cardTable.animation
        Aura.add_individual(self, true)
    end
end

--detect if the atlas is correct
function CheckAtlas(center)
    local anim = center.anim
    local k = center.key
    local expecter_atlas = anim.modded_atlas or "aura_"..k
    local current_atlas = center.atlas
    if current_atlas ~= expecter_atlas then
        return true
    end
    if anim and anim.extra then
        local expecter_extra_atlas = anim.extra.modded_atlas or "aura_"..k.."_extra"
        local current_extra_atlas = center.animpos.extra and center.animpos.extra.atlas
        if current_extra_atlas ~= expecter_extra_atlas then
            return true
        end
    end
    return false
end

--Sprite setting for multiple layers
local css = Card.set_sprites
function Card:set_sprites(c, f)
    css(self, c, f)
    local anim = self.config.center.anim
    if next(anim or {}) ~= nil and (self.config.center.discovered or self.bypass_discovery_center) then
        anim.IncorrectAtlas = CheckAtlas(self.config.center)
        if not anim.IncorrectAtlas then
            self.children.center:set_sprite_pos(self.config.center.animpos)
            if anim.extrasoul then
                self.children.floating_sprite = Sprite(self.children.floating_sprite.T.x, self.children.floating_sprite.T.y, self.children.floating_sprite.T.w, self.children.floating_sprite.T.h, G.ASSET_ATLAS[self.config.center.animpos.extra.atlas], self.config.center.animpos.extra)
                self.children.floating_sprite.role.draw_major = self
                self.children.floating_sprite.states.hover = self.states.hover
                self.children.floating_sprite.states.click = self.states.click
                self.children.floating_sprite.states.drag = self.states.drag
                self.children.floating_sprite.states.collide.can = false
            end
            if self.config.center and self.config.center.animpos and self.config.center.animpos.extra and self.config.center.animpos.extra.atlas and not (self.children.front or anim.extrasoul) then
                self.children.front = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[self.config.center.animpos.extra.atlas], self.config.center.animpos.extra)
                self.children.front.states.hover = self.states.hover
                self.children.front.states.click = self.states.click
                self.children.front.states.drag = self.states.drag
                self.children.front.states.collide.can = false
                self.children.front:set_role({major = self, role_type = 'Glued', draw_major = self})                
            end
        end
    end
end
--Pos for animated tags
local tgui = Tag.generate_UI
function Tag:generate_UI(_size)
    local tag_sprite_tab, tag_sprite = tgui(self, _size)
    local center = G.P_TAGS[self.key]
    local anim = center.anim
    if next(anim or {}) ~= nil then
        anim.IncorrectAtlas = CheckAtlas(center)
        if not anim.IncorrectAtlas then
            tag_sprite:set_sprite_pos(center.animpos)
        end
    end
    return tag_sprite_tab, tag_sprite
end
--Animated deck skins:
local gfsi = get_front_spriteinfo
function get_front_spriteinfo(_front)
    local atlas, pos = gfsi(_front)
    if _front and _front.suit and G.SETTINGS.CUSTOM_DECK and G.SETTINGS.CUSTOM_DECK.Collabs then
		local collab = G.SETTINGS.CUSTOM_DECK.Collabs[_front.suit]
        if collab and AnimatedDeckSkins[collab] then
            local suit = _front.suit
            local value = _front.value

            if AnimatedDeckSkins[collab][suit] and AnimatedDeckSkins[collab][suit][value] then
                if AnimatedDeckSkins[collab][suit][value].atlas and AnimatedDeckSkins[collab][suit][value].animpos then
                    atlas = G.ASSET_ATLAS[AnimatedDeckSkins[collab][suit][value].atlas]
                    pos = AnimatedDeckSkins[collab][suit][value].animpos
                end
            end
        end
    end
    return atlas, pos
end

local cd = Card.draw
function Card:draw(layer)
    if self.config.center.anim and self.config.center.anim.extrasoul then --Update soul viewport because if not, it doesnt animate properly
        local x, y, w, h = self.children.floating_sprite.sprite:getViewport()
        if x ~= (self.config.center.animpos.extra.x * 71) or y ~= (self.config.center.animpos.extra.y * 95) then
            self.children.floating_sprite.sprite:setViewport( self.config.center.animpos.extra.x * 71, self.config.center.animpos.extra.y * 95, 71, 95 )
        end
    end
    cd(self,layer)
end


--Remove animated cards of individual when deleted
local cr = Card.remove
function Card:remove()
    cr(self)
    if self.animation then
        for i = 1, #AnimatedIndividuals do
            if AnimatedIndividuals[i] == self then
                table.remove(AnimatedIndividuals, i)
            end
        end
    end
end

--adding cloned cards to individual
local cc = copy_card
function copy_card(other, new_card, card_scale, playing_card, strip_edition)
    local ret_card = cc(other, new_card, card_scale, playing_card, strip_edition)
    local key = ret_card.config.center.key
    local anim = ret_card.config.center.anim
    if anim and (anim.individual or (anim.extra and anim.extra.individual)) and other.animation then
        ret_card.config.center_key = key
        Aura.add_individual(ret_card)
    end
    return ret_card
end

--Reset animated cards on run start
local gsr = Game.start_run
function Game:start_run(args)
    --don't mess up on save load
    AnimatedIndividuals = {}
    gsr(self,args)
    for i = 1, #AnimatedIndividuals do
        local card = AnimatedIndividuals[i]
        local anim = card.config.center.anim
        if card.animation and card.animation.target and anim.individual then
            card.config.center.animpos.x = ((anim.start_frame or 0) + card.animation.target)%(anim.frames_per_row or anim.frames)
            if not anim.verticframes then
                card.config.center.animpos.y = math.floor( ((anim.start_frame or 0) + card.animation.target) / (anim.frames_per_row or anim.frames) )
            end
            card.animation.t = nil
        end
        if card.animation and card.animation.extra and card.animation.extra.target and anim.extra.individual then
            card.config.center.animpos.extra.x = ((anim.extra.start_frame or 0) + card.animation.extra.target)%(anim.extra.frames_per_row or anim.extra.frames)
            if not anim.extra.verticframes then
                card.config.center.animpos.extra.y = math.floor( ((anim.extra.start_frame or 0) + card.animation.extra.target) / (anim.extra.frames_per_row or anim.extra.frames) )
            end
            card.animation.extra.t = nil
        end
    end

    Aura.update_idol()
    Aura.update_ancient()
    Aura.update_castle()
    Aura.update_mail()
    Aura.update_drivers_license(true)
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
        self.animation = {target = 11}
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
    if self.config.center_key == "c_lovers" then
        if not self.animation then
            Aura.add_individual(self)
            self.animation = { extra = { target = pseudorandom("aura_lovers",0,3) } }
        end
    end
    if self.config.center_key == "j_rocket" then
        if not self.animation then
            Aura.add_individual(self)
            self.animation = { fps = 10*self.ability.extra.dollars, extra = { target = 4 - math.min(4, math.floor(self.ability.extra.dollars / self.ability.extra.increase)) } }
        end
    end
    if self.config.center_key == "j_idol" then
        Aura.update_idol()
    end
    if self.config.center_key == "j_ancient" then
        Aura.update_ancient()
    end
    if self.config.center_key == "j_castle" then
        Aura.update_castle()
    end
    if self.config.center_key == "j_mail" then
        Aura.update_mail()
    end
    if self.config.center_key == "j_drivers_license" then
        Aura.update_drivers_license(true)
    end
    if self.config.center_key == "j_trading" then
        if pseudorandom("aura_trading_EX") < 1/10 then
            Aura.add_individual(self)
            self.animation.target = AuraTradingCards[11].EX.pos-1
            self.animation.EX = true
        end
    end
end

--Castle, Mail, Ancient & Idol
function Aura.suit_sprite_order(suit)
    if suit == "Hearts" then return 0
    elseif suit == "Clubs" then return 1
    elseif suit == "Diamonds" then return 2
    elseif suit == "Spades" then return 3
    elseif suit == "six_Moons" then return 4
    elseif suit == "six_Stars" then return 5
    elseif suit == "paperback_Crowns" then return 6
    elseif suit == "paperback_Stars" then return 7
    else return 8 end
end

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
    elseif rank == "paperback_Apostle" then return 13
    else return 14 end
end

function Aura.seal_sprite_order(seal)
    if seal == "Gold" then
        return 1
    elseif seal == "Purple" then
        return 2
    elseif seal == "Red" then
        return 3
    elseif seal == "Blue" then
        return 4
    elseif seal == "poke_pink_seal" then
        return 5
    elseif seal == "poke_silver" then
        return 6
    elseif seal == "artb_brick" then
        return 7
    elseif seal == "artb_button" then
        return 8
    elseif seal == "artb_ouroboros" then
        return 9
    elseif seal == "cry_green" then
        return 10
    elseif seal == "cry_azure" then
        return 11
    elseif seal == "unstb_spades" then
        return 12
    elseif seal == "unstb_hearts" then
        return 13
    elseif seal == "unstb_clubs" then
        return 14
    elseif seal == "unstb_diamonds" then
        return 15
    elseif seal == "unstb_face" then
        return 16
    elseif seal == "unstb_heal" then
        return 17
    else
        return 0
    end
end

function Aura.update_flash(self, StartLetter)
    local anim_order = {}
    for i = 0, 25 do
        anim_order[i] = i
    end
    pseudoshuffle(anim_order, pseudoseed("aura_flash"))
    --force J to be first
    for i = 1, 25 do
        if anim_order[i] == StartLetter then
            anim_order[0], anim_order[i] = anim_order[i], anim_order[0]
        end
    end
    self.animation = {target = anim_order[0], flash_index = 0, flash_order = anim_order}
end

function Aura.update_trading(self, StartNumber)
    local anim_order = {}
    local count = 0
    local isEX = false
    for k, v in pairs(AuraTradingCards) do
        anim_order[count] = k
        count = count + 1
        if v.EX and v.EX.pos and v.EX.pos == StartNumber then
            StartNumber = k
            isEX = true
        end
    end
    pseudoshuffle(anim_order, pseudoseed("aura_trading"))
    --force StartNumber to be first
    for i = 1, #anim_order do
        if anim_order[i] == StartNumber then
            anim_order[0], anim_order[i] = anim_order[i], anim_order[0]
        end
    end
    local trading_target = isEX and AuraTradingCards[StartNumber].EX.pos -1 or StartNumber -1
    self.animation = {target = trading_target, trading_index = 0, trading_order = anim_order, EX = isEX}
end

function Aura.update_castle()
    local new_suit = G.GAME.current_round.castle_card.suit or 'Spades'
    local anim_offset = Aura.suit_sprite_order(new_suit)
    AnimatedJokers.j_castle.extra.target = anim_offset
    if (new_suit == "six_Moons" or new_suit == "six_Stars" or new_suit == "paperback_Stars") then
        if AnimatedJokers.j_castle.start_frame ~= 72 then
            AnimatedJokers.j_castle.start_frame = 72
            AnimatedJokers.j_castle.frames = 22
            G.P_CENTERS["j_castle"].animpos.y = 8
        end
    else
        if AnimatedJokers.j_castle.start_frame ~= 0 then
            AnimatedJokers.j_castle.start_frame = 0
            AnimatedJokers.j_castle.frames = 69
            G.P_CENTERS["j_castle"].animpos.y = 0
        end
    end
end

local rcc = reset_castle_card
function reset_castle_card()
    rcc()
    local castlelist = {}
    for _, jkr in ipairs(G.jokers.cards) do
        if jkr.ability.name == "Castle" then
            table.insert(castlelist, jkr)
        end
    end

    if not AnimatedJokers.j_castle.IncorrectAtlas then
        G.E_MANAGER:add_event(Event({
            func = (function()
                for _, jkr in pairs(castlelist) do
                    jkr:flip()
                end
                Aura.update_castle()
                delay(0.075*G.SPEEDFACTOR)
                for _, jkr in pairs(castlelist) do
                    jkr:flip()
                end
                return true
            end)
        }))
    end
end

function Aura.update_mail()
    local rank = G.GAME.current_round.mail_card.rank or nil
    AnimatedJokers.j_mail.target = Aura.rank_sprite_order(rank)
end

local rmr = reset_mail_rank

function reset_mail_rank()
    rmr()
    local maillist = {}
    for _, jkr in ipairs(G.jokers.cards) do
        if jkr.ability.name == "Mail-In Rebate" then
            table.insert(maillist, jkr)
        end
    end
    if not AnimatedJokers.j_mail.IncorrectAtlas then
        G.E_MANAGER:add_event(Event({
            func = (function()
                for _, jkr in pairs(maillist) do
                    jkr:flip()
                end
                Aura.update_mail()
                delay(0.075*G.SPEEDFACTOR)
                for _, jkr in pairs(maillist) do
                    jkr:flip()
                end
                return true
            end)
        }))
    end
end

function Aura.update_drivers_license(silent)
    local driver_tally = 0
    if not G.playing_cards then return end
    for k, v in pairs(G.playing_cards) do
        if v.config.center ~= G.P_CENTERS.c_base then driver_tally = driver_tally + 1 end
    end
    local licenselist = {}
    if not G.jokers or not G.jokers.cards then
        AnimatedJokers.j_drivers_license.target = 0
        return
    end
    for _, jkr in ipairs(G.jokers.cards) do
        if jkr.ability.name == "Driver's License" and jkr.facing == "front" then
            table.insert(licenselist, jkr)
        end
    end
    local target_frame = nil
    if driver_tally > 15 and AnimatedJokers.j_drivers_license.target == 0 then
        target_frame = 1
    elseif driver_tally <= 15 and AnimatedJokers.j_drivers_license.target == 1 then
        target_frame = 0
    end
    if target_frame then
        if silent then
            AnimatedJokers.j_drivers_license.target = target_frame
        else
            if not AnimatedJokers.j_drivers_license.IncorrectAtlas then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        for _, jkr in pairs(licenselist) do
                            jkr:flip()
                        end
                        AnimatedJokers.j_drivers_license.target = target_frame
                        delay(0.075*G.SPEEDFACTOR)
                        for _, jkr in pairs(licenselist) do
                            jkr:flip()
                        end
                        return true
                    end)
                }))
            end
        end
    end
end

function Aura.update_ancient()
    local suit = Aura.suit_sprite_order(G.GAME.current_round.ancient_card.suit or nil)
    AnimatedJokers.j_ancient.start_frame = suit * 6
    G.P_CENTERS["j_ancient"].animpos.y = suit
end

local rac = reset_ancient_card
function reset_ancient_card()
    rac()
    AnimatedJokers.j_ancient.escape_target = true
end

function Aura.update_idol()-- Triggered if the mouth is closed
    local suit = G.GAME.current_round.idol_card.suit or nil
    local rank = G.GAME.current_round.idol_card.rank or nil
    AnimatedJokers.j_idol.target = (Aura.suit_sprite_order(suit) * AnimatedJokers.j_idol.frames_per_row) + Aura.rank_sprite_order(rank)
end

local ric = reset_idol_card
function reset_idol_card()
    ric()
    AnimatedJokers.j_idol.extra.escape_target = true
end

--Oops All 6s
function Aura.Trigger_oops_all_6s()
    G.E_MANAGER:add_event(Event({
        func = (function()
            AnimatedJokers.j_oops.extra.fps = 10*(G.SPEEDFACTOR/G.SETTINGS.GAMESPEED)
            AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
            return true
        end)
    }))
end

--To The Moon
local arer = add_round_eval_row
function add_round_eval_row(config)
    local ret = arer(config)
    if config.name == "interest" then
        local has_ttm = false
        for _, jkr in ipairs(G.jokers.cards) do
            if jkr.ability.name == "To the Moon" then
                has_ttm = true
                break
            end
        end
        if has_ttm then
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

--Card Sharp
local uht = update_hand_text
function update_hand_text(config, vals)
    uht(config, vals)
    if config.immediate and not config.volume and vals.handname ~= nil then -- I looked trough the source code, and this should exclude leveling up hands and and actually playing the hand, meanining it only checks hands selected
        if G.GAME.hands[vals.handname] and G.GAME.hands[vals.handname].played_this_round > 0 then
            AnimatedJokers.j_card_sharp.target = 3
        else
            AnimatedJokers.j_card_sharp.target = 0
        end
    end
    return true
end

--On trigger effects
local cj = Card.calculate_joker
function Card:calculate_joker(context)

    --Certificate
    if self.ability.name == "Certificate" and not context.blueprint and context.first_hand_drawn then
        Aura.add_individual(self)
        self.animation.certificate_ran = false -- reset for next round
    end

    --Sixth Sense
    if self.ability.name == "Sixth Sense" and
      context.destroying_card and not context.blueprint and not self.debuff and
      #context.full_hand == 1 and context.full_hand[1]:get_id() == 6 and G.GAME.current_round.hands_played == 0 and
      #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and
      not AnimatedJokers.j_sixth_sense.IncorrectAtlas then

        G.E_MANAGER:add_event(Event({ delay = 1.6*G.SETTINGS.GAMESPEED,
        trigger = 'before',
        func = (function()
            Aura.add_individual(self)
            self.animation = { target = 0, escape_target = true, fps = 10*(G.SPEEDFACTOR/G.SETTINGS.GAMESPEED) }
            return true
        end)}))

    end

    --Gros Michel
    if self.ability.name == "Gros Michel"  and context.end_of_round and context.main_eval and not context.blueprint then
        Aura.Trigger_oops_all_6s()
        if peek_pseudorandom('gros_michel') < G.GAME.probabilities.normal/self.ability.extra.odds and not AnimatedJokers.j_gros_michel.IncorrectAtlas then
            G.E_MANAGER:add_event(Event({
                delay = 1*G.SPEEDFACTOR,
                trigger = 'before',
                func = (function()
                    Aura.add_individual(self)
                    self.animation = { extra = { target = 17 } }
                    return true
                end)
            }))
        end
    end

    local ret = cj(self, context)

    --Flash Card
    if self.ability.name == "Flash Card" and context.reroll_shop and not context.blueprint and not AnimatedJokers.j_flash.IncorrectAtlas then
        G.E_MANAGER:add_event(Event({
            func = (function()
                self:flip()
                play_sound('card1')
                Aura.add_individual(self)
                self.animation.flash_index = self.animation.flash_index + 1
                if self.animation.flash_index > 25 then self.animation.flash_index = 0 end
                self.animation.target = self.animation.flash_order[self.animation.flash_index]
                self:juice_up(0.3, 0.3)
                delay(0.075*G.SPEEDFACTOR)
                self:flip()
                play_sound('tarot2', 1, 0.6)
                return true
            end)
        }))
    end


    --Trading Card
    if self.ability.name == "Trading Card" and ret and ret.message and not context.blueprint and not AnimatedJokers.j_trading.IncorrectAtlas then
        G.E_MANAGER:add_event(Event({
            func = (function()
                self:flip()
                play_sound('card1')
                Aura.add_individual(self)
                self.animation.trading_index = self.animation.trading_index + 1
                if self.animation.trading_index > #self.animation.trading_order then self.animation.trading_index = 0 end
                local trading_target = self.animation.trading_order[self.animation.trading_index] and self.animation.trading_order[self.animation.trading_index] or 11
                if AuraTradingCards[trading_target].EX and (pseudorandom("aura_trading_EX") < 1/10) then
                    trading_target = AuraTradingCards[trading_target].EX.pos
                    self.animation.EX = true
                else
                    self.animation.EX = false
                end
                self.animation.target = trading_target - 1
                self:juice_up(0.3, 0.3)
                delay(0.075*G.SPEEDFACTOR)
                self:flip()
                play_sound('tarot2', 1, 0.6)
                return true
            end)
        }))
    end

    --Blackboard
    if self.ability.name == "Blackboard" and ret and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                self.animation = { target = 0, escape_target = true }
                return true
            end)
        }))
    end

    --Seeing Double
    if self.ability.name == "Seeing Double" and ret and not context.blueprint then
        G.E_MANAGER:add_event(Event({
        func = (function()
            Aura.add_individual(self)
                if self.config.center.animpos.extra.y == 0 then
                self.animation = { extra = { target = 4 } }
            else
                self.animation = { extra = { target = 0 } }
            end
                return true
            end)
        }))
    end

    --Superposition
    if self.ability.name == "Superposition" and ret and not context.blueprint then
        G.E_MANAGER:add_event(Event({
        func = (function()
            Aura.add_individual(self)
                if self.config.center.animpos.x < 10 then
                self.animation = {target = 10}
            else
                self.animation = {target = 0}
            end
                return true
            end)
        }))
            
    end

    --Driver's License
    if self.ability.name == "Driver's License" and context.cardarea == G.jokers and self.ability.driver_tally then
        Aura.update_drivers_license()
    end

    --Invisible Joker
    if self.ability.name == "Invisible Joker" and context.end_of_round and not context.blueprint then
        Aura.add_individual(self)
        self.animation = { target = math.min( 10, math.floor((self.ability.invis_rounds * (AnimatedJokers.j_invisible.frames-1) / self.ability.extra) + 0.5)) }
    end

    --Turtle Bean
    if self.ability.name == "Turtle Bean" and context.end_of_round and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                self.animation = { extra = { target =  5 - self.ability.extra.h_size } }
                return true
            end)
        }))

    end

    --Ice Cream
    if self.ability.name == "Ice Cream" and context.cardarea == G.jokers and context.after and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                self.animation = { target = math.floor((100 - self.ability.extra.chips) / 20) }
                return true
            end)
        }))
    end

    --Ramen
    if self.ability.name == "Ramen" and context.discard and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                self.animation = { target =  AnimatedJokers.j_ramen.frames-1 - math.floor(((self.ability.x_mult - 1)*(AnimatedJokers.j_ramen.frames-1)) + 0.5) }
                return true
            end)
        }))
    end

    --Popcorn
    if self.ability.name == "Popcorn" and context.end_of_round and not context.blueprint then
        G.E_MANAGER:add_event(Event({
                func = (function()
                    Aura.add_individual(self)
                    self.animation = { target =  5 - self.ability.mult/4 }
                    return true
                end)
            }))
    end

    --Seltzer
    if self.ability.name == "Seltzer" and context.cardarea == G.jokers and context.after and not context.blueprint then
        G.E_MANAGER:add_event(Event({
                func = (function()
                    Aura.add_individual(self)
                    self.animation = { target =  AnimatedJokers.j_selzer.frames-1 - math.floor(((self.ability.extra*(AnimatedJokers.j_selzer.frames-1)/10)) + 0.5 ) }
                    return true
                end)
            }))
    end

    --Burglar
    if self.ability.name == "Burglar" and not (context.blueprint_card or self).getting_sliced and context.setting_blind and not self.debuff then
        G.E_MANAGER:add_event(Event({
                func = (function()
                    Aura.add_individual(self)
                    self.animation = { target = 0, escape_target = true }
                    return true
                end)
            }))
    end

    --Rocket
    if self.ability.name == "Rocket" and context.end_of_round and G.GAME.blind.boss and not self.debuff and not context.blueprint then
        Aura.add_individual(self)
        self.animation = { fps = 10*self.ability.extra.dollars, extra = { target = 4 - math.min(4, math.floor(self.ability.extra.dollars / self.ability.extra.increase)) } }
    end

    --Hit the Road
    if self.ability.name == "Hit the Road" and context.discard and not context.other_card.debuff and context.other_card:get_id() == 11 and not self.debuff and not context.blueprint then
        Aura.add_individual(self)
        self.animation = { target = 0, remaining_triggers = (self.animation and self.animation.remaining_triggers or 0) + 1 }
    end

    --Loyalty Card
    if self.config.center_key == "j_loyalty_card" then
        if self.animation then
            if (5 - self.ability.loyalty_remaining) ~= self.animation.target then -- loyalty_remaining is the. loyalty card procs remaining, duh
                --self.children.center:set_sprite_pos({x = 5 - (self.ability.loyalty_remaining or 0), y = 0}) -- set sprite pos acc to loy_remaining
                Aura.add_individual(self)
                self.animation = { target = 5 - (self.ability.loyalty_remaining or 0) }
                self:juice_up(0.2,0.2) -- small jiggle when the frame changes
                --play_sound("goldseal") -- this sound actually interprets as hole punching
            end
        else
            Aura.add_individual(self)
            self.animation = { target = 5 - (self.ability.loyalty_remaining or 0) }
        end
    end

    --Space Joker (with Oops trigger)
    if self.ability.name == "Space Joker" and context.cardarea == G.jokers and context.before and not self.debuff then
        Aura.Trigger_oops_all_6s()
        if not context.blueprint and ret and ret.level_up then -- only on successful trigger 
            G.E_MANAGER:add_event(Event({
                func = (function()
                    Aura.add_individual(self)
                    self.animation = { target = 0, escape_target = true }
                    return true
                end)
            }))
        end
    end

    --Lucky Cat
    if self.ability.name == "Lucky Cat" and ret and ret.extra and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                self.animation = { target = 0, remaining_triggers = (self.animation and self.animation.remaining_triggers or 0) + 1, fps = 10*(G.SPEEDFACTOR/G.SETTINGS.GAMESPEED) }
            end)
        }))
    end

    --Various Oops triggers
    if self.ability.name == "Hallucination" and context.open_booster then
        Aura.Trigger_oops_all_6s()
    end

    if self.ability.name == "Cavendish" and context.end_of_round and context.main_eval and not context.blueprint then
        Aura.Trigger_oops_all_6s()
    end
    if self.ability.name == "8 Ball" and context.individual and context.cardarea == G.play and context.other_card and context.other_card:get_id() == 8 then
        Aura.Trigger_oops_all_6s()
    end

    if self.ability.name == "Business Card" and context.individual and context.cardarea == G.play and context.other_card and context.other_card:is_face() then
        Aura.Trigger_oops_all_6s()
    end

    if self.ability.name == "Bloodstone" and context.individual and context.cardarea == G.play and context.other_card and context.other_card:is_suit("Hearts") then
        Aura.Trigger_oops_all_6s()
    end

    if self.ability.name == "Reserved Parking" and context.individual and context.cardarea == G.hand and context.other_card and context.other_card:is_face() then
        Aura.Trigger_oops_all_6s()
    end

    return ret
end

--On consume effects

local cuc = Card.use_consumeable
function Card:use_consumeable(context)
    if self.ability.name == "The Wheel of Fortune" then
        Aura.Trigger_oops_all_6s()
        Aura.add_individual(self)
        self.animation = { target = 12, fps = 10*G.SPEEDFACTOR }
    end
    local ret = cuc(self, context)
    return ret
end

Aura.ss = Card.set_seal
function Card:set_seal(seal, silent, immediate)
    if seal and G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 and G.GAME.facing_blind then
        for i = 1, #G.jokers.cards do
            local selfjkr = G.jokers.cards[i]
            if selfjkr.config.center_key == "j_certificate" and not selfjkr.debuff and ( not selfjkr.animation or not selfjkr.animation.certificate_ran ) then
                Aura.add_individual(selfjkr)
                selfjkr.animation.certificate_ran = true
                G.E_MANAGER:add_event(Event({ delay = 10*G.SPEEDFACTOR,
                    func = (function()
                        selfjkr.animation = { target = 27, escape_target = true, extra = { target = Aura.seal_sprite_order(seal) }, certificate_ran = selfjkr.animation.certificate_ran }
                        --selfjkr:juice_up(0.3, 0.3)
                        return true
                    end)
                }))
                break
            end
        end
    end
    Aura.ss(self,seal,silent,immediate)
end


--Cleaning animation data when changing enhancements
local csa = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    csa(self, center, initial, delay_sprites)
    if (not center.anim or center.key == ("m_bonus" or "m_mult")) and self.animation then
        self.animation = nil
        for i = 1, #AnimatedIndividuals do
            if AnimatedIndividuals[i] == self then
                table.remove(AnimatedIndividuals, i)
            end
        end
    end
end

--Detecting Lucky Cards for oops
--And load Mult Cards
local gcm = Card.get_chip_mult

function Card:get_chip_mult()
    local ret = gcm(self)
    if self.ability.effect == "Lucky Card" then
        Aura.Trigger_oops_all_6s()
    end
    if self.ability.effect == "Mult Card" then
        Aura.add_individual(self)
        self.animation.animation_loaded = true
    end
    return ret
end

--Loading Bonus Cards
local gcb = Card.get_chip_bonus
function Card:get_chip_bonus()
    local ret = gcb(self)
    if self.ability.effect == "Bonus Card" then
        Aura.add_individual(self)
        self.animation.animation_loaded = true
    end
    return ret
end

--Triggering Mult and Bonus Cards
local cest = card_eval_status_text
function card_eval_status_text(c, eval_type, a, p, d, e)
    if c.animation and c.animation.animation_loaded then
        if eval_type == "chips" and c.ability.effect == "Bonus Card" then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    Aura.add_individual(c)
                    c.animation = {target = 0, remaining_triggers = (c.animation.remaining_triggers or 0) + 1, fps = 16*(G.SPEEDFACTOR) }
                    return true
                end)
            }))
            c.animation.animation_loaded = false
        elseif eval_type == "mult" and c.ability.effect == "Mult Card" then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    Aura.add_individual(c)
                    c.animation = {target = (((c.config.center.animpos.y or 0) + 1 ) % 5) * 13, fps = 16*(G.SPEEDFACTOR) }
                    return true
                end)
            }))
            c.animation.animation_loaded = false
        end
    end
    local ret = cest(c, eval_type, a, p, d, e)
    return ret
end

--Detecting Glass Cards for oops

local gfep = G.FUNCS.evaluate_play

function G.FUNCS.evaluate_play(e)
    local ret = gfep(e)
    if G.play and G.play.cards then
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

--Detecting Egg price increase
local csc = Card.set_cost
function Card:set_cost()
    if self.ability and self.ability.name == "Egg" then
        if not self.animation then--should only happen on creation
            Aura.add_individual(self)
            self.animation = { target = 0, egg_old_value = self.ability.extra_value }
        elseif self.ability.extra_value > self.animation.egg_old_value then
            Aura.add_individual(self)
            self.animation = { target = 0, escape_target = true, egg_old_value = self.ability.extra_value }
        end
    end
    csc(self)
end