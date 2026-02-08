--BASIC MOD SETUP

--Setting the mod icon
SMODS.Atlas {
    key = 'modicon',
    px = 32,
    py = 32,
    path = 'modicon.png'
}
--Setting the mod config menu
SMODS.Mods.Aura.config_tab = function()
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


--DICTIONARIES FOR ALL THE ANIMATION DATA
AnimatedJokers = {
    j_joker = { order = 1, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_greedy_joker = { order = 2, frames_per_row = 6, frames = 12, extra = { frames_per_row = 11, frames = 22 }, credits = {"Bard", "chloe_cromslor"} },
    j_lusty_joker = { order = 3, frames_per_row = 5, frames = 20, extra = { frames_per_row = 11, frames = 22 }, credits = {"Bard", "chloe_cromslor"} },
    j_wrathful_joker = { order = 4, frames_per_row = 5, frames = 18, extra = { frames_per_row = 11, frames = 22 }, credits = {"Bard", "chloe_cromslor"} },
    j_gluttenous_joker = { order = 5, frames_per_row = 6, frames = 12, extra = { frames_per_row = 11, frames = 22 }, credits = {"Bard", "chloe_cromslor"} },
    j_jolly = { order = 6, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor", "SadCube"} },
    j_zany = { order = 7, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor", "SadCube"} },
    j_mad = { order = 8, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor", "SadCube"} },
    j_crazy = { order = 9, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor", "SadCube"} },
    j_droll = { order = 10, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor", "SadCube"} },
    j_sly = { order = 11, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor", "SadCube"} },
    j_wily = { order = 12, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor", "SadCube"} },
    j_clever = { order = 13, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor", "SadCube"} },
    j_devious = { order = 14, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor", "SadCube"} },
    j_crafty = { order = 15, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor", "SadCube"} },
    j_half = { order = 16, py = 62, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor", "SadCube"} },
    j_stencil = { order = 17, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor", "SadCube"} },
    j_four_fingers = {},
    j_mime = {},
    j_credit_card = {},
    j_ceremonial = {},
    j_banner = {},
    j_mystic_summit = {},
    j_marble = { order = 24, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_loyalty_card = { order = 25, frames = 7, individual = true, immediate = true, credits = {"chloe_cromslor"} },
    j_8_ball = {}, -- todo: animate when triggered. if succesful, one animation, if failed, another one
    j_misprint = { order = 27, frames_per_row = 11, frames = 66, credits = {"chloe_cromslor"} },
    j_dusk = { order = 28, frames_per_row = 13, frames = 78, fps = 5, credits = {"chloe_cromslor"} },
    j_raised_fist = { order = 29, frames_per_row = 6, frames = 36, fps = 15, credits = {"MRTorres"} },
    j_chaos = { order = 30, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_fibonacci = { order = 31, frames_per_row = 8, frames = 32, fps = 20, credits = {"MRTorres"} },
    j_steel_joker = { order = 32, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_scary_face = {},
    j_abstract = {},
    j_delayed_grat = {}, -- todo: animate when primed. constant backround animation. flip clock when triggered, but empty when failed
    j_hack = { order = 36, frames_per_row = 8, frames = 64, credits = {"rattlingssnow353"} },
    j_pareidolia = { order = 37, frames_per_row = 5, frames = 20, credits = {"SadCube"} },
    j_gros_michel = { order = 38, frames = 13, extra = { frames = 18, fps = 15, individual = true }, credits = {"MightyKingVideo"} },
    j_even_steven = { order = 39, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_odd_todd = { order = 40, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_scholar = { order = 41, frames_per_row = 11, frames = 22, extra = { frames_per_row = 9, frames = 45 } , credits = {"chloe_cromslor", "MRTorres"} },
    j_business = { order = 42, frames_per_row = 13, frames = 120, credits = {"Mincoiin"} },
    j_supernova = {}, -- todo: an explosion animation that triggers each time it gives mult, and shows an amount of frames proportional to the mult given. framerate proportional to amount of frames to keep duration constant
    j_ride_the_bus = { order = 44, frames_per_row = 9, frames = 36, credits = {"Grassy353"} }, 
    j_space = { order = 45, frames = 61, start_frame = 23, frames_per_row = 96, individual = true, extra = { frames_per_row = 11, frames = 22 }, credits = {"Bard", "chloe_cromslor"} },
    j_egg = { order = 46, frames_per_row = 4, frames = 8, individual = true, credits = {"MRTorres"} },
    j_burglar = { order = 47, frames = 76, individual = true, verticframes = 22, credits = {"chloe_cromslor"} },
    j_blackboard = { order = 48, frames = 49, individual = true, verticframes = 22, credits = {"Comet_System", "Grassy311", "chloe_cromslor"} },
    j_runner = { order = 49, frames_per_row = 10, frames = 110, credits = {"chloe_cromslor", "MRTorres"} },
    j_ice_cream = { order = 50, frames = 51, individual = true, verticframes = 13, immediate = true, credits = {"MRTorres", "MightyKingVideo"} }, --todo: add extra frames in between
    j_dna = { order = 51, frames = 11, credits = {"SadCube"} },
    j_splash = {},
    j_blue_joker = { order = 53, frames_per_row = 11, frames = 22 },
    j_sixth_sense = { order = 54, verticframes = 22, frames = 39, individual = true, credits = {"Grassy353", "chloe_cromslor", "MRTorres"} },
    j_constellation = { order = 55, frames_per_row = 6, frames = 66, credits = {"chloe_cromslor"} },
    j_hiker = { order = 56, frames_per_row = 11, frames = 22, credits = {"MRTorres", "chloe_cromslor"} },
    j_faceless = { order = 57, frames_per_row = 4, frames = 24, credits = {"rattlingsnow353"} },
    j_green_joker = { order = 58, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_superposition = { order = 59, frames = 20, verticframes = 6, verticfps = 8, individual = true, credits = {"MRTorres"} },
    j_todo_list = { order = 60, frames_per_row = 12, frames = 96, credits = {"RadicaAprils"} }, -- todo: show hand that needs to be played & animate on trigger. each hand played crosses out an item from the list, when all are crossed or round ends, pass page and write new list
    j_cavendish = {},
    j_card_sharp = { order = 62, frames = 6, target = 0, verticframes = 11, verticfps = 5, credits = {"MRTorres"} },
    j_red_card = { order = 63, frames_per_row = 19, frames = 349, credits = {"Bard"} },
    j_madness = {}, -- Idea: randomize the time between laughs/eye twitches
    j_square = { order = 65, py = 71, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_seance = {}, -- todo: animate when triggered
    j_riff_raff = { order = 67, frames_per_row = 14, frames = 490, credits = {"chloe_cromslor"} },
    j_vampire = { order = 68, frames_per_row = 11, frames = 22, extra = { frames_per_row = 6, frames = 30 }, credits = {"Mincoiin", "chloe_cromslor"} },
    j_shortcut = {},
    j_hologram = { order = 70, frames = 1, extrasoul = true, extra = { frames_per_row = 22, frames = 22, start_frame = 198 }, credits = {"chloe_cromslor"} }, -- the texture needs to be this big so the scanlines are vanilla acurate
    j_vagabond = { order = 71, frames = 30, fps = 5, credits = {"Kitty"} },
    j_baron = { order = 72, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_cloud_9 = {},
    j_rocket = { order = 74, frames_per_row = 11, frames = 87, fps = 10, individual = true, extra = { frames = 5, individual = true, immediate = true }, credits = {"MRTorres"} }, --todo: add thruster animation on the verticframes
    j_obelisk = {}, -- todo: animate when promoted / show hand that needs to not be played
    j_midas_mask = {},
    j_luchador = { order = 77, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_photograph = { order = 78, frames = 48, credits = {"Grassy331"} },
    j_gift = {},
    j_turtle_bean = { order = 80, frames_per_row = 7, frames = 14, extra = { verticframes = 14, verticfps = 8 }, credits = {"MRTorres"} },--extra = frames = 6, individual = true -- todo: add the diferent stages of eaten/roten
    j_erosion = {},
    j_reserved_parking = { order = 82, frames_per_row = 6, frames = 36, credits = {"MightyKingVideo"} },
    j_mail = { order = 83, frames_per_row = 5, frames = 15, target = 14, immediate = true, credits = {"MRTorres"} },
    j_to_the_moon = { order = 84, frames = 40, fps = 8, target = 0, verticframes = 40, verticfps = 8, credits = {"MRTorres"} },
    j_hallucination = { order = 85, frames_per_row = 11, frames = 22, credits = {"MightyKingVideo"} },
    j_fortune_teller = { order = 86, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_juggler = { order = 87, frames = 22, verticframes = 14, verticfps = 13, credits = {"MRTorres"} },
    j_drunkard = { order = 88, frames = 22, verticframes = 14, verticfps = 13, credits = {"MRTorres"} },
    j_stone = { order = 89, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_golden = { order = 90, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_lucky_cat = { order = 91, frames = 8, individual = true, verticframes = 29, credits = {"MightyKingVideo"} },
    j_baseball = {},
    j_bull = { order = 93, frames_per_row = 6, frames = 30, credits = {"MightyKingVideo"} },
    j_diet_cola = { order = 94, frames = 20, credits = {"SadCube", "chloe_cromslor"} },
    j_trading = { order = 95, frames = 96, frames_per_row = 12, individual = true, immediate = true, pos_x = 10, credits = {"MightyKingVideo", "Willow"}}, -- todo: needs more frames
    j_flash = { order = 96, frames_per_row = 13, frames = 26, individual = true, immediate = true, pos_x = 9, credits = {"Grassy331"} },
    j_popcorn = { order = 97, frames = 5, individual = true, credits = {"MRTorres"} },
    j_trousers = { order = 98, frames_per_row = 4, frames = 12, extra = { frames_per_row = 4, frames = 16, fps = 8 }, credits = {"Solace"} },
    j_ancient = { order = 99, start_frame = 18, frames = 6, target = 3, credits = {"SadCube"} },
    j_ramen = {},--{ frames = 21, individual = true }, --todo: create true animation
    j_walkie_talkie = {},
    j_selzer = { order = 101, verticframes = 15, start_frame = 3, frames = 51, individual = true, credits = {"MRTorres"} },
    j_castle = { order = 102, frames_per_row = 9, frames = 69, start_frame = 0, extra = { frames = 11, target = 3, immediate = true, verticframes = 5, verticfps = 5 }, credits = {"Bard"} },
    j_smiley = { order = 103, frames_per_row = 13, frames = 150, credits = {"SadCube", "chloe_cromslor"} },
    j_campfire = {}, -- todo: animate fire, which gets bigger the more you burn, returning to normal when resetting
    j_ticket = {},
    j_mr_bones = { order = 106, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} }, -- todo: destroy animation? (if done, with the laugh as verticframes)
    j_acrobat = {},
    j_sock_and_buskin = { order = 108, frames_per_row = 5, frames = 30, credits = {"MRTorres"} },
    j_swashbuckler = { order = 109, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_troubadour = {},
    j_certificate = { order = 111, frames_per_row = 7, frames = 28, individual = true, extra = { frames_per_row = 6, frames = 13, individual = true, immediate = true }, credits = {"chloe_cromslor"} },--, "MightyKingVideo", "SadCube"
    j_smeared = { order = 112, frames_per_row = 11, frames = 22, extra = { frames = 10 }, credits = {"SadCube", "chloe_cromslor"} },
    j_throwback = { order = 113, verticframes = 18, frames = 100, extra = { frames_per_row = 11, frames = 22 }, credits = {"chloe_cromslor", "MRTorres"} }, -- todo: animate when promoted (if done, on extra layer, with the laugh as verticframes)
    j_hanging_chad = {},
    j_rough_gem = {},
    j_bloodstone = {},
    j_arrowhead = {},
    j_onyx_agate = {},
    j_glass = { order = 120, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_ring_master = { order = 121, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_flower_pot = { order = 122, frames = 24, credits = {"Bard"} },
    j_blueprint = { order = 123, frames = 31, individual = true, verticframes = 22, credits = {"Grassy331", "chloe_cromslor"} },
    j_wee = { order = 124, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_merry_andy = { order = 125, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_oops = { order = 126, frames_per_row = 5, frames = 10, extra = { frames = 5, fps = 15, target = 0 }, credits = {"SadCube", "MRTorres"} }, -- todo: create stilized smear frames
    j_idol = { order = 127, frames_per_row = 15, frames = 180, immediate = true, target = 51, extra = { frames_per_row = 6, frames = 6, fps = 3, target = 3 }, credits = {"MRTorres"} }, -- todo: fix broken code for custom suit icons
    j_seeing_double = { order = 128, frames_per_row = 13, frames = 150, extra = { frames_per_row = 4, frames = 8, individual = true }, credits = {"SadCube"} },
    j_matador = { order = 129, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_hit_the_road = { order = 130, frames = 10, individual = true, credits = {"MRTorres"} }, -- todo: create a true animation with pespective and not just the 2d car
    j_duo = { order = 131, extra = { frames_per_row = 11, frames = 22 }, credits = {"SadCube"} },
    j_trio = { order = 132, extra = { frames_per_row = 11, frames = 22 }, credits = {"SadCube"} },
    j_family = { order = 133, extra = { frames_per_row = 11, frames = 22 }, credits = {"SadCube"} },
    j_order = { order = 134, extra = { frames_per_row = 11, frames = 22 }, credits = {"SadCube"} },
    j_tribe = { order = 135, extra = { frames_per_row = 11, frames = 22 }, credits = {"SadCube"} },
    j_stuntman = { order = 136, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_invisible = { order = 137, frames = 11, fps = 5, individual = true, verticframes = 22, credits = {"chloe_cromslor"} },
    j_brainstorm = { order = 138, frames = 39, individual = true, verticframes = 22, credits = {"Grassy331", "chloe_cromslor"} },
    j_satellite = {},
    j_shoot_the_moon = { order = 140, frames_per_row = 11, frames = 22, credits = {"MRTorres"} },
    j_drivers_license = { order = 141, frames = 2, target = 0, immediate = true, credits = {"Grassy331"} },
    j_cartomancer = { order = 142, frames_per_row = 11, frames = 22, credits = {"chloe_cromslor"} },
    j_astronomer = { order = 143, frames = 29, extra = { frames = 6, fps = 2, verticframes = 22 }, credits = {"chloe_cromslor"} },
    j_burnt = {}, -- todo: animate when primed?
    j_bootstraps = { order = 145, frames_per_row = 19, frames = 38, credits = {"chloe_cromslor", "MRTorres"} },
    j_caino = {}, -- todo: add animations
    j_triboulet = {}, -- todo: add animations
    j_yorick = {}, -- todo: add animations
    j_chicot = {}, -- todo: add animations
    j_perkeo = {} -- todo: add animations
}
AnimatedTarots = {
    c_fool = {},
    c_magician = {},
    c_high_priestess = {},
    c_empress = {},
    c_emperor = {},
    c_heirophant = {},
    c_lovers = { order = 7, frames_per_row = 6, frames = 30, extra = { frames_per_row = 2, frames = 4, individual = true, immediate = true }, credits = {"MRTorres"} },
    c_chariot = {},
    c_justice = {},
    c_hermit = { order = 10, frames_per_row = 2, frames = 4, fps = 3, credits = {"MRTorres"} },
    c_wheel_of_fortune = { order = 11, frames = 12, individual = true, credits = {"SadCube"} },
    c_strength = {},
    c_hanged_man = {},
    c_death = {},
    c_temperance = {},
    c_devil = {},
    c_tower = {},
    c_sun = { order = 18, frames_per_row = 9, frames = 45, fps = 15, extra = { }, credits = {"MRTorres"} },
    c_moon = {},
    c_star = {},
    c_judgement = {},
    c_world = {}
}
AnimatedPlanets = {
    c_mercury = { order = 1, frames = 24, credits = {"Bard"} },
    c_venus = { order = 2, frames = 24, credits = {"Bard"} },
    c_earth = { order = 3, frames = 24, credits = {"Bard"} },
    c_mars = { order = 4, frames = 24, credits = {"Bard"} },
    c_jupiter = { order = 5, frames = 24, credits = {"Bard"} },
    c_saturn = { order = 6, frames = 24, credits = {"Bard"} },
    c_uranus = { order = 7, frames = 24, credits = {"Bard"} },
    c_neptune = { order = 8, frames = 24, credits = {"Bard"} },
    c_pluto = { order = 9, frames = 24, credits = {"Bard"} },
    c_planet_x = { order = 10, frames = 24, credits = {"Bard"} },
    c_ceres = { order = 11, frames = 24, credits = {"Bard"} },
    c_eris = { order = 12, frames = 24, credits = {"Bard"} }
}
AnimatedSpectrals = {
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
    c_black_hole = { order = 18, frames_per_row = 24, frames = 144, credits = {"SadCube", "MRTorres"} }
}
AnimatedVouchers = {
    v_overstock_norm = { order = 1, frames = 5, credits = {"MRTorres"} },
    v_overstock_plus = {},
    v_clearance_sale = {},
    v_liquidation = {},
    v_hone = { order = 5, frames = 24, frames_per_row = 12, credits = {"chloe_cromslor"} },
    v_glow_up = {},
    v_reroll_surplus = { order = 7, frames = 11, credits = {"SadCube"} },
    v_reroll_glut = { order = 8, frames = 8, credits = {"SadCube"} },
    v_crystal_ball = { order = 9, frames = 150, frames_per_row = 13, credits = {"SadCube"} },
    v_omen_globe = { order = 10, frames = 150, frames_per_row = 13, credits = {"SadCube"} },
    v_telescope = {},
    v_observatory = {},
    v_grabber = { order = 13, frames_per_row = 12, frames = 48, credits = {"GhostSalt"} },
    v_nacho_tong = {},
    v_wasteful = { order = 15, frames = 9, credits = {"chloe_cromslor"} },
    v_recyclomancy = { order = 16, frames = 9, credits = {"MRTorres"} },
    v_tarot_merchant = { order = 17, frames = 12, credits = {"chloe_cromslor"} },
    v_tarot_tycoon = {},
    v_planet_merchant = { order = 19, frames = 12, credits = {"chloe_cromslor"} },
    v_planet_tycoon = {},
    v_seed_money = {},
    v_money_tree = {},
    v_blank = { order = 23, frames = 30, fps = (20/3), verticframes = 23, credits = {"SadCube"} },
    v_antimatter = { order = 24, frames = 30, fps = (20/3), verticframes = 23, credits = {"T3rragon"} },
    v_magic_trick = { order = 25, frames = 9, credits = {"MRTorres"} },
    v_illusion = { order = 26, frames = 18, frames_per_row = 9, credits = {"MRTorres"} },
    v_hieroglyph = {},
    v_petroglyph = {},
    v_directors_cut = {},
    v_retcon = {},
    v_paint_brush = {},
    v_palette = {}
}
AnimatedTags = {
    tag_uncommon = { order = 1, frames_per_row = 11, frames = 22, credits = {"MightyKingVideo"} },
    tag_rare = { order = 2, frames_per_row = 11, frames = 22, credits = {"MightyKingVideo"} },
    tag_negative = { order = 3, frames = 19, credits = {"MightyKingVideo"} },
    tag_foil = { order = 4, frames = 19, credits = {"MightyKingVideo"} },
    tag_holo = { order = 5, frames = 19, credits = {"MightyKingVideo"} },
    tag_polychrome = { order = 6, frames = 19, credits = {"MightyKingVideo"} },
    tag_investment = { order = 7, frames = 20, credits = {"MightyKingVideo"} },
    tag_voucher = { order = 8, frames_per_row = 19, frames  = 57, credits = {"MightyKingVideo"} },
    tag_boss = { order = 9, frames = 10, credits = {"SadCube"} },
    tag_standard = { order = 10, frames = 18, credits = {"SadCube"} },
    tag_charm = { order = 11, frames = 13, credits = {"Cebee"} },
    tag_meteor = { order = 12, frames_per_row = 8, frames = 16, fps = 5, credits = {"SadCube", "MRTorres"} },
    tag_buffoon = { order = 13, frames_per_row = 11, frames = 22, credits = {"Willow"} },
    tag_handy = { order = 14, frames = 18, credits = {"Willow"} },
    tag_garbage = { order = 15, frames = 19, credits = {"Willow"} },
    tag_ethereal = { order = 16, frames_per_row = 5, frames = 20, credits = {"SadCube"} },
    tag_coupon = { order = 17, frames = 18, credits = {"SadCube"} },
    tag_double = { order = 18, frames = 26, credits = {"SadCube"} },
    tag_juggle = { order = 19, frames = 11, credits = {"MightyKingVideo"} },
    tag_d_six = { order = 20, frames_per_row = 4, frames = 24, credits = {"MightyKingVideo"} },
    tag_top_up = { order = 21, frames_per_row = 5, frames = 19, credits = {"MightyKingVideo"} },
    tag_skip = { order = 22, frames = 10, credits = {"SadCube"} },
    tag_orbital = { order = 23, frames = 12, credits = {"MightyKingVideo"} },
    tag_economy = { order = 24, frames = 10, credits = {"SadCube"} }
}
AnimatedEnchancements = {
    m_bonus = { order = 1, frames = 13, fps = 20, individual = true, credits = {"MRTorres"} },
    m_mult = { order = 2, frames_per_row = 13, frames = 65, fps = 20, individual = true, credits = {"MRTorres"} },
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
    collab_AU = { King = { anim = { frames_per_row = 13, frames = 34, start_frame = 0 }, atlas = { lc_anim = "aura_collab_AU_lc", hc_anim = "aura_collab_AU_hc" }, animpos = { x = 0, y = 0 }, credits = {"Hoja"} },
                Queen = { anim = { frames_per_row = 13, frames = 40, start_frame = 34 }, atlas = { lc_anim = "aura_collab_AU_lc", hc_anim = "aura_collab_AU_hc" }, animpos = { x = 8, y = 2 }, credits = {"Hoja"} },
                Jack = { anim = { frames_per_row = 13, frames = 4, start_frame = 74 }, atlas = { lc_anim = "aura_collab_AU_lc", hc_anim = "aura_collab_AU_hc" }, animpos = { x = 9, y = 5 }, credits = {"Hoja"} } },
}
--Dictionary to store all cards that get individual animations
AnimatedIndividuals = {}
--Dictionary to store various animation related functions
Aura = {}


--SETTING UP EVERYTHIN NEEDED FOR THE ANIMATED DECK SKINS, RIGHT NOW IS ALL MANUAL BUT FUTURE UPDATES MAY AUTOMATIZE IT

--Atlases for animated deck skins. currently it isnt automatized
SMODS.Atlas {
    key = 'collab_AU_lc',
    px = 71,
    py = 95,
    disable_mipmap = true,
    path = 'collab_AU_lc.png'
}
SMODS.Atlas {
    key = 'collab_AU_hc',
    px = 71,
    py = 95,
    disable_mipmap = true,
    path = 'collab_AU_hc.png'
}
--The animations go in new palettes so the player can choose between animated and static versions.
SMODS.DeckSkins.collab_AU:add_palette({
    key = "lc_anim",
    ranks = { "King", "Queen", "Jack" },
    atlas = "collab_AU_1",
    pos_style = "collab",
    loc_txt = "Low Contrast Animated",
})
SMODS.DeckSkins.collab_AU:add_palette({
    key = "hc_anim",
    ranks = { "King", "Queen", "Jack" },
    atlas = "collab_AU_2",
    pos_style = "collab",
    loc_txt = "High Contrast Animated",
    hc_default = true,
})

--Atlas for the backside of Half and Square Joker.
SMODS.Atlas {
    key = 'j_half_back',
    px = 71,
    py = 62,
    disable_mipmap = true,
    path = 'j_half_back.png'
}
SMODS.Atlas {
    key = 'j_square_back',
    px = 71,
    py = 62,
    disable_mipmap = true,
    path = 'j_square_back.png'
}

--SETTING UP THE ATLASES FOR EVERYTHING

if SMODS.Atlas then
    --If there is Malverk active, a list with all animated thing will be needed
    local malverk_items = {}
    --The key are the sets where the centers are being stored, the values have the animation data
    local animated_dictionaries = {
        {set = "Joker", dict = AnimatedJokers},
        {set = "Tarot", dict = AnimatedTarots},
        {set = "Planet", dict = AnimatedPlanets},
        {set = "Spectral", dict = AnimatedSpectrals},
        {set = "Voucher", dict = AnimatedVouchers}
    }

    for _, set_dict in pairs(animated_dictionaries) do
        local set = set_dict.set
        local dict = set_dict.dict
        local shorted_list = {}
        for k, v in pairs(dict) do
            if v.order then
                shorted_list[v.order] = k
            else
                shorted_list[k] = k
            end
        end
        for _, k in pairs(shorted_list) do
            local v = dict[k]
            --Only register if there is an animation
            if v and next(v) then
                --Determine if the starting position isn't 0,0
                local posx, posy, posex, posey
                if v.start_frame then
                    posx = v.start_frame%(v.frames_per_row or v.frames)
                    if v.verticframes and v.start_verticframe then
                        posy = v.start_verticframe
                    else
                        posy = math.floor(v.start_frame / (v.frames_per_row or v.frames))
                    end
                end
                --The same for the extra  layer
                if v.extra and v.extra.start_frame then
                    posex = v.extra.start_frame%(v.extra.frames_per_row or v.extra.frames)
                    if v.extra.verticframes and v.extra.start_verticframe then
                        posey = v.extra.start_verticframe
                    else
                        posey = math.floor(v.extra.start_frame / (v.extra.frames_per_row or v.extra.frames))
                    end
                end
                --Making the atlas for the main layer. Malverk creates its own atlas if it used
                if Malverk then
                    AltTexture({
                        key = k,
                        set = set,
                        path = k .. ".png",
                        keys = { k },
                        loc_txt = { name = G.P_CENTERS[k] and G.P_CENTERS[k].name or k }, --The name for the menu where you can deactivate certain animations
                        px = v.px or 71,
                        py = v.py or 95
                    })
                    malverk_items[#malverk_items + 1] = "aura_"..k --Tracking all animated items for Malverk. Don't forget the prefix
                else
                    SMODS.Atlas {
                        key = k,
                        path = k .. ".png",
                        px = v.px or 71,
                        py = v.py or 95
                    }
                end
                --If needed, make the atlas for the extra layer
                if v.extra then
                    SMODS.Atlas {
                        key = k.."_extra",
                        path = k .. "_extra.png",
                        px = v.px or 71,
                        py = v.py or 95
                    }
                end
                --Overeinding the center to set the new atlas and store the position used if animated
                SMODS[set]:take_ownership(k, {
                    atlas = not Malverk and k or nil, --If Malverk is used, don't touch the atlas
                    animpos = { x = v.pos_x or posx or 0, y = v.pos_y or posy or 0 }, --the pos are custom, auromaticly determined or 0,0. The extra dict stores all relevant info for the extra layer. Don't forget the prefix
                    animpos_extra = v.extra and {x = v.extra.pos_x or posex or 0, y = v.extra.pos_y or posey or 0} or nil,
                    atlas_extra = v.extra and "aura_"..k.."_extra" or nil,
                    anim = v,
                }, not SMODS.Mods["Aura"].config.Animation_Credits) --Disable mod badge if configured so
            end

        end
    end
    --The same for enhancements. But enhancements can't have extra layers
    local shorted_list = {}
    for k, v in pairs(AnimatedEnchancements) do
        if v.order then
            shorted_list[v.order] = k
        else
            shorted_list[k] = k
        end
    end
    for _, k in pairs(shorted_list) do
        local v = AnimatedEnchancements[k]
        if v.frames then
            --Determine if the starting position isn't 0,0
            local posx, posy, posex, posey
            if v.start_frame then
                posx = v.start_frame%(v.frames_per_row or v.frames)
                if v.verticframes and v.start_verticframe then
                    posy = v.start_verticframe
                else
                    posy = math.floor(v.start_frame / (v.frames_per_row or v.frames))
                end
            end
            --Make the atlas. Malverk creates its own atlas if it used
            if Malverk then
                AltTexture({
                    key = k,
                    set = "Enhanced",
                    path = k .. ".png",
                    keys = { k },
                    loc_txt = { name = G.P_CENTERS[k] and G.P_CENTERS[k].name or k }, --The name for the menu where you can deactivate certain animations
                    px = v.px or 71,
                    py = v.py or 95
                })
                malverk_items[#malverk_items + 1] = "aura_"..k --Tracking all animated items for Malverk. Don't forget the prefix
            else
                SMODS.Atlas {
                    key = k,
                    path = k .. ".png",
                    px = v.px or 71,
                    py = v.py or 95
                }
            end
            --Overriding the center to set the new atlas and store the position used if animated
            SMODS.Enhancement:take_ownership(k, {
                atlas = not Malverk and k or nil, --If Malverk is used, don't touch the atlas
                animpos = { x = v.pos_x or posx or 0, y = v.pos_y or posy or 0 }, --the pos are custom, auromaticly determined or 0,0
                anim = v,
            },not SMODS.Mods["Aura"].config.Animation_Credits) --Disable mod badge if configured so
        end
    end
    --The same for tags. But with a different default size
    for k, v in pairs(AnimatedTags) do
        if v.frames then
            --Make the atlas. Malverk creates its own atlas if it used
            if Malverk then
                AltTexture({
                    key = k,
                    set = "Tag",
                    path = k .. ".png",
                    keys = { k },
                    loc_txt = { name = G.P_TAGS[k] and G.P_TAGS[k].name or k }, --The name for the menu where you can deactivate certain animations
                    px = v.px or 34,
                    py = v.py or 34
                })
                malverk_items[#malverk_items + 1] = "aura_"..k --Tracking all animated items for Malverk. Don't forget the prefix
            else
                SMODS.Atlas {
                    key = k,
                    path = k .. ".png",
                    px = v.px or 34,
                    py = v.py or 34
                }
            end
            --Overriding the center to set the new atlas and store the position used if animated
            SMODS.Tag:take_ownership(k, {
                atlas = not Malverk and k or nil, --If Malverk is used, don't touch the atlas
                animpos = { x = 0, y = 0 },
                anim = v,
            },not SMODS.Mods["Aura"].config.Animation_Credits) --Disable mod badge if configured so
        end
    end

    --If Malverk is used, create a texture pack with all animated items
    if Malverk then
        TexturePack({
            key = "aura_animated_jokers",
            textures = malverk_items,
            dynamic_display = true,
            loc_txt = {
            name = "Aura Animations Pack",
            text = {"This is getting quite animated!"}
            }
        })
    end
end


--VERY USEFUL FUNCTIONS THAT CAN BE CALLED AND USED ELSEWHERE

--Function to make cards have their animatins be handled independently
function Aura.add_individual(card, loaded)
    --Check if the card is already in the list
    local is_in_individual = false
    for i = 1, #AnimatedIndividuals do
        if AnimatedIndividuals[i] == card then
            is_in_individual = true
            break
        end
    end
    --If not, add it and set up its individual animation parameters
    if not is_in_individual then
        AnimatedIndividuals[#AnimatedIndividuals+1] = card
        --If the card is Flash or Trading, randomize the their orders while keeping the current frame
        if card.config.center.key == "j_flash" and not loaded then
            if card.animation then
                Aura.update_flash(card, card.animation.flash_order[card.animation.flash_index])
            else
                Aura.update_flash(card, (card.config.center.animpos.x + (13*card.config.center.animpos.y)))
            end
        end
        if card.config.center.key == "j_trading" then
            --If not loaded from a save, randomize the order. If loaded, make sure it has the correct target and most importantly atlas (if another mod injects its own cards)
            if not loaded then
                Aura.update_trading(card, (card.config.center.animpos.x + (12*card.config.center.animpos.y) + 1), card.config.center.atlas)
            else
                local trading_target = card.animation.trading_order[card.animation.trading_index] and card.animation.trading_order[card.animation.trading_index] or 11
                card.config.center.atlas = AuraTradingCards[trading_target].atlas or (Malverk and "alt_tex_" or "").."aura_j_trading"
                card:set_sprites(card.config.center)
                card.animation.target = ((card.animation.EX and AuraTradingCards[trading_target].EX.pos) or (AuraTradingCards[trading_target].pos and AuraTradingCards[trading_target].pos) or trading_target) - 1
            end
        end
        --Find what kind of animaiton is suposed to have
        local anim = card.config.center.anim
        --Prepare the dictionary where the individual animation data will be stored
        card.animation = card.animation or {}
        --Make the config center independent from the general one
        local center_copy = {}
        for k, v in pairs(card.config.center) do
            center_copy[k] = v
        end
        --Store the animation data in the center for easier access (only used for the trading name)
        center_copy.animation = card.animation
        --Each layer can be independently set as individual. If it isn't, keep the original animpos
        if anim.individual then
            center_copy.animpos = {x = card.config.center.animpos.x, y = card.config.center.animpos.y}
        else
            center_copy.animpos = card.config.center.animpos
        end
        if card.config.center.animpos_extra then
            if anim and anim.extra and anim.extra.individual then
                center_copy.animpos_extra = {x = card.config.center.animpos_extra.x, y = card.config.center.animpos_extra.y} 
            else
                center_copy.animpos_extra = card.config.center.animpos_extra
            end
        end
        --Assign the new center
        card.config.center = center_copy
        --Update the sprites to make sure the new animpos are used
        card:set_sprites(card.config.center)
        if anim.extra and card.children.front then
            card.children.front.sprite_pos = center_copy.animpos_extra
        end
    end
end

--Function to determine if the atlas has been modified by any other mod so it isnt animated and thus have the wrong pos. Called at the start of the game for every animated object and every time a new object is rendered
function Aura.CheckAtlas(center)
    --take the animation data to know if there are modded atlases and/or extra layers. take the key to know the default atlas name
    local anim = center.anim
    local k = center.key
    --Check if the current atlas iis among the set as valid by other mods
    local is_moded_atlas = false
    local current_atlas = center.atlas
    if anim.modded_atlases then
        for _, atlas in ipairs(anim.modded_atlases) do
            if current_atlas == atlas then
                is_moded_atlas = true
                break
            end
        end
    end
    --If it doesnt match a modded atlas, check if it has the default one. Don't forget that if Malverk made the atlas, it will have its prefix
    if not is_moded_atlas and current_atlas ~= (Malverk and "alt_tex_" or "").."aura_"..k then
        return true
    end
    --If there is an extra layer, also check its atlas
    if anim and anim.extra then
        --Check if the current extra atlas iis among the set as valid by other mods
        local is_moded_extra_atlas = false
        local current_extra_atlas = center.atlas_extra
        if anim.extra.modded_atlases then
            for _, atlas in ipairs(anim.extra.modded_atlases) do
                if current_extra_atlas == atlas then
                    is_moded_extra_atlas = true
                    break
                end
            end
        end
        --If it doesnt match a modded extra atlas, check if it has the default one
        if not is_moded_extra_atlas and current_extra_atlas ~= "aura_"..k.."_extra" then
            return true
        end
    end
    --If no mistake found, then it doesn't have an incorrect atlas
    return false
end

--Function to know the next pseudorandom value for a given seed without modifying future random calls. Used for predicting extinction of Gross Michele
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


--FUNCTIONS FOR HANDELING THE PASSOGE OF FRAMES

--Function to update the frames of all animated objects every frame
local upd = Game.update
function Game:update(dt)
    --Original Game:update function call
    upd(self, dt)
    --Updating all animated objects
    local AnimatedDictionaries = {
        AnimatedJokers,
        AnimatedTarots,
        AnimatedPlanets,
        AnimatedSpectrals,
        AnimatedVouchers,
        AnimatedEnchancements,
    }
    for _, AnimDict in pairs(AnimatedDictionaries) do
        for k, v in pairs(AnimDict) do
            if next(AnimDict[k] or {}) ~= nil then
                if AnimDict[k].IncorrectAtlas == nil then --When the game starts, check every atlas
                    AnimDict[k].IncorrectAtlas = Aura.CheckAtlas(G.P_CENTERS[k])
                end
                Aura.update_frame(dt, k, G.P_CENTERS[k]) 
            end
        end
    end
    --Tags are not stored in P_CENTERS, so they need a different loop
    for k, v in pairs(AnimatedTags) do
        if next(AnimatedTags[k] or {}) ~= nil then
            if AnimatedTags[k].IncorrectAtlas == nil then --When the game starts, check every atlas
                AnimatedTags[k].IncorrectAtlas = Aura.CheckAtlas(G.P_TAGS[k])
            end
            Aura.update_frame(dt, k, G.P_TAGS[k]) 
        end
    end
    --Updating all individual animated cards
    for _, v in pairs(AnimatedIndividuals) do
        Aura.update_frame(dt, v.config.center_key, v.config.center, v.animation)
    end
    --Updating all animated deck skins
    for k, v in pairs(AnimatedDeckSkins) do
        for kv, vv in pairs(v) do
            Aura.update_frame(dt, k.."_"..kv, vv)
        end
    end
end
--Function to determine if the frame has to change and update it accordingly. Handles both general and individual animations and both main and extra layers. Called in Game:update()
function Aura.update_frame(dt, k, obj, jkr)
    --Take the animation data and current position
    local anim = obj and obj.anim
    local animpos = obj and obj.animpos
    local animpos_extra = obj and obj.animpos_extra
    --This sould never fail, but just in case
    if anim and animpos then
        --It is posible to animate the extra layer but not the main one. So check if the main layer is animated
        if anim.frames then
            --Determine how many frames have to be advanced. It will only be more than 1 if the animation fps is greater than the framerate
            local frames_passed = 0
            --Dont touch the general animation if it a individual object
            if jkr then
                --Check that the individual animation is for the main layer and not the extra one
                if anim.individual then
                    --If it is immediate, don't care for the fps. Pass frame if not at the target
                    if anim.immediate then
                        if jkr.target and (animpos.x + (not anim.verticframes and (animpos.y*(anim.frames_per_row or anim.frames)) or 0)) ~= jkr.target then
                            frames_passed = 1
                        end
                    else
                        --Else, check if the acumulated time passes the fps threshold
                        jkr.t = jkr.t or (anim.t and (anim.t - dt)) or 0 --If not acumulated time, it is taken from the general animation to keep it sync
                        jkr.t = jkr.t + dt
                        frames_passed = math.floor(jkr.t / (1/(jkr.fps or anim.fps or 10)))
                        if frames_passed > 0 then
                            --Subtract the passed frames to the acumulated time
                            jkr.t = jkr.t - frames_passed/(jkr.fps or anim.fps or 10)
                        end
                    end
                end
            else
                --If it is immediate, don't care for the fps. Pass frame if not at the target
                if anim.immediate and anim.target then
                    if (animpos.x + (not anim.verticframes and (animpos.y*(anim.frames_per_row or anim.frames)) or 0)) ~= anim.target and not anim.individual then
                        frames_passed = 1
                    end
                else
                    --Else, check if the acumulated time passes the fps threshold
                    anim.t = anim.t or 0
                    anim.t = anim.t + dt
                    frames_passed = math.floor(anim.t / (1/(anim.fps or 10)))
                    if frames_passed > 0 then
                        --Subtract the passed frames to the acumulated time
                        anim.t = anim.t - frames_passed/(anim.fps or 10)
                        --If the animation is individual, calculate the acumulated time in the main animation so individuals can sync to it but don't pass frames 
                        if anim.individual then
                            frames_passed = 0
                        end
                    end
                end
            end
            --If any frame has to be passed, update the position
            if frames_passed > 0 then
                --Calculate in which frame of the animation we are
                local loc = animpos.x
                if not anim.verticframes then --Ignore y component if verticframes
                    loc = loc + animpos.y*(anim.frames_per_row or anim.frames)
                end
                loc = loc - ((jkr and jkr.start_frame) or anim.start_frame or 0)
                --Determine how many of the passed frames are gonna be advanced. Individual objects only use their own parameters
                if jkr and (jkr.target or jkr.fps or jkr.frames) and anim.individual then
                    --Animations are suposed to stop at their target, but there are ways to bypass that
                    if jkr.target then
                        --If immediate, go directly to the target
                        if anim.immediate then
                            loc = jkr.target
                        else
                            --If not, calculate if the target is gona be reached this frame update
                            local til_target = jkr.target - loc
                            if til_target < 0 then --Wrap around
                                til_target = til_target + (jkr.frames or anim.frames)
                            end
                            --If not, just advance the passed frames
                            if til_target >= frames_passed then
                                loc = loc + frames_passed
                            else
                                --Remaining triggers allow to pass the target a certain number of times before stopping
                                if jkr.remaining_triggers then
                                    --Calculate how many times the target is gonna be passed
                                    local targets_passed = math.floor((frames_passed - til_target) / (jkr.frames or anim.frames)) + 1
                                    --If more than the remaining triggers, stop at the target and consume all remaining triggers
                                    if targets_passed > jkr.remaining_triggers then
                                        loc = jkr.target
                                        jkr.remaining_triggers = nil
                                    else
                                        --Else, advance the passed frames and consume the appropriate amount of remaining triggers
                                        loc = loc + (frames_passed % (jkr.frames or anim.frames))
                                        jkr.remaining_triggers = jkr.remaining_triggers - targets_passed
                                    end
                                --Escape target allows to advance one frame even if at the target
                                elseif jkr.escape_target and til_target == 0 then
                                    loc = loc + math.min(frames_passed, jkr.frames or anim.frames)
                                else
                                    loc = jkr.target --If no special condition, just stop at the target
                                end
                                if jkr.remaining_triggers and jkr.remaining_triggers <= 0 then jkr.remaining_triggers = nil end --No remaining triggers left is nil so it can be detected on the above if
                            end
                            jkr.escape_target = false --Escape target is consumed even if it wasn't at the target
                        end
                    else
                        --If no target, just advance the passed frames with no restrictions
                        loc = loc + frames_passed
                    end
                -- General animations can also have targets
                elseif anim.target then
                    --If immediate, go directly to the target
                    if anim.immediate then
                        loc = anim.target
                    else
                        --If not, calculate if the target is gona be reached this frame update
                        local til_target = anim.target - loc
                        if til_target < 0 then --Wrap around
                            til_target = til_target + anim.frames
                        end
                        --If not, just advance the passed frames
                        if til_target >= frames_passed then
                            loc = loc + frames_passed
                        else
                            --Remaining triggers allow to pass the target a certain number of times before stopping
                            if anim.remaining_triggers then
                                --Calculate how many times the target is gonna be passed
                                local targets_passed = math.floor((frames_passed - til_target) / anim.frames) + 1
                                --If more than the remaining triggers, stop at the target and consume all remaining triggers
                                if targets_passed > anim.remaining_triggers then
                                    loc = anim.target
                                    anim.remaining_triggers = nil
                                else
                                    --Else, advance the passed frames and consume the appropriate amount of remaining triggers
                                    loc = loc + (frames_passed % anim.frames)
                                    anim.remaining_triggers = anim.remaining_triggers - targets_passed
                                end
                            --Escape target allows to advance one frame even if at the target
                            elseif anim.escape_target and til_target == 0 then
                                loc = loc + math.min(frames_passed, anim.frames)
                            else
                                loc = anim.target --If no special condition, just stop at the target
                            end
                            if anim.remaining_triggers and anim.remaining_triggers <= 0 then anim.remaining_triggers = nil end --No remaining triggers left is nil so it can be detected on the above if
                        end
                        anim.escape_target = false --Escape target is consumed even if it wasn't at the target
                    end
                elseif not anim.individual then
                    --If no target, just advance the passed frames with no restrictions, but only if it is the general animation
                    loc = loc + frames_passed
                end
                --Wrap around if needed
                if loc >= ((jkr and jkr.frames) or anim.frames) then 
                    loc = loc % ((jkr and jkr.frames) or anim.frames)
                    if k == "j_ancient" then Aura.update_ancient() end --Special case for Ancient, as in the frame 0 is when it updates its suit
                end
                --Calculate coordinates back from the frame number
                loc = loc + ((jkr and jkr.start_frame) or anim.start_frame or 0)
                animpos.x = loc%(anim.frames_per_row or anim.frames)
                if not anim.verticframes then --Ignore y component if verticframes
                    animpos.y = math.floor(loc / (anim.frames_per_row or anim.frames))
                end
            end
        end
        --Handle verticframes if needed
        if anim.verticframes then
            --Verticframes are always handled by the general animation. all indviduals sync to it
            if not jkr then
                --Check if the acumulated time passes the verticfps threshold
                anim.verticframest = anim.verticframest or (anim.t and (anim.t - dt)) or 0
                anim.verticframest = anim.verticframest + dt
                local frames_passed = math.floor(anim.verticframest / (1/(anim.verticfps or 10)))
                --If frames passed, calculate the new position
                if frames_passed > 0 then
                    anim.verticframest = anim.verticframest - frames_passed/(anim.verticfps or 10) --Subtract the passed frames to the acumulated time
                    anim.verticloc = anim.verticloc or start_verticframe or 0
                    anim.verticloc = anim.verticloc + frames_passed
                    if anim.verticloc >= anim.verticframes + (anim.start_verticframe or 0) then anim.verticloc = anim.start_verticframe or 0 end --Wrap around
                end
            end
            --Update the vertical position. All individuals sync to the general animation
            animpos.y = anim.verticloc
        end
        --Now handle the extra layer if needed
        if anim.extra and animpos_extra then
            --It is posible to animate the main layer but not the extra one. So check if the extra layer is animated
            if anim.extra.frames then
                --Determine how many frames have to be advanced. It will only be more than 1 if the animation fps is greater than the framerate
                local frames_passed = 0
                --Dont touch the general animation if it a individual object
                if jkr then
                    --Check that the individual animation is for the extra layer and not the main one
                    if anim.extra.individual then
                        jkr.extra = jkr.extra or {}
                        --If it is immediate, don't care for the fps. Pass frame if not at the target
                        if anim.extra.immediate then
                            if jkr.extra.target and (animpos_extra.x + (not anim.extra.verticframes and animpos_extra.y*(anim.extra.frames_per_row or anim.extra.frames) or 0)) ~= jkr.extra.target then
                                frames_passed = 1
                            end
                        else
                            --Else, check if the acumulated time passes the fps threshold
                            if jkr.extra then
                                jkr.extra.t = jkr.extra.t or (anim.extra.t and (anim.extra.t - dt)) or (anim.t and (anim.t - dt)) or 0
                                jkr.extra.t = jkr.extra.t + dt
                                frames_passed = math.floor(jkr.extra.t / (1/(jkr.extra.fps or anim.extra.fps or 10)))
                                if frames_passed > 0 then
                                    --Subtract the passed frames to the acumulated time
                                    jkr.extra.t = jkr.extra.t - frames_passed/(jkr.extra.fps or anim.extra.fps or 10)
                                end
                            end
                        end
                    end
                else
                    --If it is immediate, don't care for the fps. Pass frame if not at the target
                    if anim.extra.immediate then
                        if animpos_extra.x ~= anim.extra.target and not anim.extra.individual then
                            frames_passed = 1
                        end
                    else
                        --Else, check if the acumulated time passes the fps threshold
                        anim.extra.t = anim.extra.t or (anim.t and (anim.t - dt)) or 0
                        anim.extra.t = anim.extra.t + dt
                        frames_passed = math.floor(anim.extra.t / (1/(anim.extra.fps or 10)))
                        if frames_passed > 0 then
                            --Subtract the passed frames to the acumulated time
                            anim.extra.t = anim.extra.t - frames_passed/(anim.extra.fps or 10)
                            --If the animation is individual, calculate the acumulated time in the main animation so individuals can sync to it but don't pass frames
                            if anim.extra.individual then
                                frames_passed = 0
                            end
                        end
                    end
                end
                --If any frame has to be passed, update the position
                if frames_passed > 0 then
                    --Calculate in which frame of the animation we are
                    local loc = animpos_extra.x
                    if not anim.extra.verticframes then --Ignore y component if verticframes
                        loc = loc + animpos_extra.y*(anim.extra.frames_per_row or anim.extra.frames)
                    end
                    loc = loc - ((jkr and jkr.extra.start_frame) or anim.extra.start_frame or 0)
                    --Determine how many of the passed frames are gonna be advanced. Individual objects only use their own parameters
                    if jkr and jkr.extra and (jkr.extra.target or jkr.extra.fps) and anim.extra.individual then
                        --Animations are suposed to stop at their target, but there are ways to bypass that
                        if jkr.extra.target then
                            --If immediate, go directly to the target
                            if anim.extra.immediate then
                                loc = jkr.extra.target
                            else
                                --If not, calculate if the target is gona be reached this frame update
                                local til_target = jkr.extra.target - loc
                                if til_target < 0 then --Wrap around
                                    til_target = til_target + (jkr.extra.frames or anim.extra.frames)
                                end
                                --If not, just advance the passed frames
                                if til_target >= frames_passed then
                                    loc = loc + frames_passed
                                else
                                    --Remaining triggers allow to pass the target a certain number of times before stopping
                                    if jkr.extra.remaining_triggers then
                                        --Calculate how many times the target is gonna be passed
                                        local targets_passed = math.floor((frames_passed - til_target) / (jkr.extra.frames or anim.extra.frames)) + 1
                                        --If more than the remaining triggers, stop at the target and consume all remaining triggers
                                        if targets_passed > jkr.extra.remaining_triggers then
                                            loc = jkr.extra.target
                                            jkr.extra.remaining_triggers = nil
                                        else
                                            --Else, advance the passed frames and consume the appropriate amount of remaining triggers
                                            loc = loc + (frames_passed % (jkr.extra.frames or anim.extra.frames))
                                            jkr.extra.remaining_triggers = jkr.extra.remaining_triggers - targets_passed
                                        end
                                    --Escape target allows to advance one frame even if at the target
                                    elseif jkr.extra.escape_target and til_target == 0 then
                                        loc = loc + math.min(frames_passed, jkr.extra.frames or anim.extra.frames)
                                    else
                                        loc = jkr.extra.target --If no special condition, just stop at the target
                                    end
                                    if jkr.extra.remaining_triggers and jkr.extra.remaining_triggers <= 0 then jkr.extra.remaining_triggers = nil end --No remaining triggers left is nil so it can be detected on the above if
                                end
                                jkr.extra.escape_target = false --Escape target is consumed even if it wasn't at the target
                            end
                        else
                            --If no target, just advance the passed frames with no restrictions
                            loc = loc + frames_passed
                        end
                    -- General animations can also have targets
                    elseif anim.extra.target then
                        --If immediate, go directly to the target
                        if anim.extra.immediate then
                            loc = anim.extra.target
                        else
                            --If not, calculate if the target is gona be reached this frame update
                            local til_target = anim.extra.target - loc
                            if til_target < 0 then
                                til_target = til_target + anim.extra.frames
                            end
                            --If not, just advance the passed frames
                            if til_target >= frames_passed then
                                loc = loc + frames_passed
                            else
                                --Remaining triggers allow to pass the target a certain number of times before stopping
                                if anim.extra.remaining_triggers then
                                    --Calculate how many times the target is gonna be passed
                                    local targets_passed = math.floor((frames_passed - til_target) / anim.extra.frames) + 1
                                    --If more than the remaining triggers, stop at the target and consume all remaining triggers
                                    if targets_passed > anim.extra.remaining_triggers then
                                        loc = anim.extra.target
                                        anim.extra.remaining_triggers = nil
                                    else
                                        --Else, advance the passed frames and consume the appropriate amount of remaining triggers
                                        loc = loc + (frames_passed % anim.extra.frames)
                                        anim.extra.remaining_triggers = anim.extra.remaining_triggers - targets_passed
                                    end
                                --Escape target allows to advance one frame even if at the target
                                elseif anim.extra.escape_target and til_target == 0 then
                                    loc = loc + math.min(frames_passed, anim.extra.frames)
                                else
                                    loc = anim.extra.target --If no special condition, just stop at the target
                                end
                                if anim.extra.remaining_triggers and anim.extra.remaining_triggers <= 0 then anim.extra.remaining_triggers = nil end --No remaining triggers left is nil so it can be detected on the above if
                            end
                            anim.extra.escape_target = false --Escape target is consumed even if it wasn't at the target
                        end
                    elseif not anim.extra.individual then
                        --If no target, just advance the passed frames with no restrictions, but only if it is the general animation
                        loc = loc + frames_passed
                    end
                    --Wrap around if needed
                    if loc >= (jkr and jkr.extra and jkr.extra.frames or anim.extra.frames) then
                        loc = loc % (jkr and jkr.extra and jkr.extra.frames or anim.extra.frames)
                        if k == "j_idol" then Aura.update_idol() end --Special case for Idol, as in the frame 0 is when it updates its suit and rank
                    end
                    --Calculate coordinates back from the frame number
                    loc = loc + ((jkr and jkr.extra.start_frame) or anim.extra.start_frame or 0)
                    animpos_extra.x = loc%(anim.extra.frames_per_row or anim.extra.frames)
                    if not anim.extra.verticframes then --Ignore y component if verticframes
                        animpos_extra.y = math.floor(loc / (anim.extra.frames_per_row or anim.extra.frames))
                    end
                end
            end
            --Handle verticframes if needed
            if anim.extra.verticframes then
                --Verticframes are always handled by the general animation. all indviduals sync to it
                if not jkr then
                    --Check if the acumulated time passes the verticfps threshold
                    anim.extra.verticframest = anim.extra.verticframest or (anim.extra.t and (anim.extra.t - dt)) or (anim.t and (anim.t - dt)) or 0
                    anim.extra.verticframest = anim.extra.verticframest + dt
                    local frames_passed = math.floor(anim.extra.verticframest / (1/(anim.extra.verticfps or 10)))
                    --If frames passed, calculate the new position
                    if frames_passed > 0 then
                        anim.extra.verticframest = anim.extra.verticframest - frames_passed/(anim.extra.verticfps or 10) --Subtract the passed frames to the acumulated time
                        anim.extra.verticloc = anim.extra.verticloc or 0
                        anim.extra.verticloc = anim.extra.verticloc + frames_passed
                        if anim.extra.verticloc >= anim.extra.verticframes + (anim.extra.start_verticframe or 0) then anim.extra.verticloc = anim.extra.start_verticframe or 0 end --Wrap around
                    end
                end
                --Update the vertical position. All individuals sync to the general animation
                animpos_extra.y = anim.extra.verticloc
            end
        end
    end
end


--LOAD ALL THE CODE STORED IN OTHER FILES

--Functions modified to take into account animation data
assert(SMODS.load_file('GeneralOverrides.lua'))()

--Functions for animating consumables
assert(SMODS.load_file('InteractiveConsumables.lua'))()

--Functions for animating enchancements
assert(SMODS.load_file('InteractiveEnhancements.lua'))()

--Functions for animating jokers
assert(SMODS.load_file('InteractiveJokers.lua'))()

--Functions for jokers that require more information to determine their animation
assert(SMODS.load_file('AdvancedInteractiveJokers.lua'))()