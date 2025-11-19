--- STEAMODDED HEADER
--- MOD_NAME: Aura
--- MOD_ID: Aura
--- MOD_AUTHOR: [MRTorres, MathIsFun_, ChromaPIE, Bard, TwoBlueDogs]
--- MOD_DESCRIPTION: Adds animations to Jokers. Art by: Bard, Grassy311, RattlingSnow353, Solace, RadicaAprils, chloe_cromslor, SadCube, Mincoiin, Flowr and MRTorres
--- CONFLICTS: [Malverk]
--- BADGE_COLOUR: 3469ab
--- VERSION: 0.350

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
				id = "Programmer_art",
				label = "Extra animations, but with programmer art",
				ref_table = SMODS.Mods["Aura"].config,
				ref_value = "Programmer_art",
			}),
            create_toggle({
                id = "Silent_ownership",
                label = "Disable Aura Mod tag in animated objects (requires restart to take effect)",
                ref_table = SMODS.Mods["Aura"].config,
                ref_value = "Silent_ownership",
            }),
            --[[create_toggle({
				id = "Experimental_Idol",
				label = "Experimental Idol, but with missalign texture",
				ref_table = SMODS.Mods["Aura"].config,
				ref_value = "Experimental_Idol",
			}),]]
		}
	}
end

AnimatedJokers = {
    j_joker = { frames_per_row = 11, frames = 22 },
    j_greedy_joker = { frames_per_row = 6, frames = 12, extra = { frames_per_row = 11, frames = 22 } },
    j_lusty_joker = { frames_per_row = 5, frames = 20, extra = { frames_per_row = 11, frames = 22 } },
    j_wrathful_joker = { frames_per_row = 5, frames = 18, extra = { frames_per_row = 11, frames = 22 } },
    j_gluttenous_joker = { frames_per_row = 6, frames = 12, extra = { frames_per_row = 11, frames = 22 } },
    j_jolly = { frames_per_row = 11, frames = 22 },
    j_zany = { frames_per_row = 11, frames = 22 },
    j_mad = { frames_per_row = 11, frames = 22 },
    j_crazy = { frames_per_row = 11, frames = 22 },
    j_droll = { frames_per_row = 11, frames = 22 },
    j_sly = { frames_per_row = 11, frames = 22 },
    j_wily = { frames_per_row = 11, frames = 22 },
    j_clever = { frames_per_row = 11, frames = 22 },
    j_devious = { frames_per_row = 11, frames = 22 },
    j_crafty = { frames_per_row = 11, frames = 22 },
    j_half = { frames_per_row = 11, frames = 22 },
    j_stencil = { frames_per_row = 11, frames = 22 },
    j_four_fingers = {},
    j_mime = {},
    j_credit_card = {},
    j_ceremonial = {},
    j_banner = {},
    j_mystic_summit = {},
    j_marble = { frames_per_row = 11, frames = 22 },
    j_loyalty_card = { frames = 7, individual = true, immediate = true },
    j_8_ball = {}, -- todo: animate when triggered. if succesful, one animation, if failed, another one
    j_misprint = { frames_per_row = 11, frames = 66 },
    j_dusk = { frames_per_row = 13, frames = 78, fps = 5 },
    j_raised_fist = { frames_per_row = 6, frames = 36, fps = 15 },
    j_chaos = { frames_per_row = 11, frames = 22 },
    j_fibonacci = { frames_per_row = 8, frames = 32 },
    j_steel_joker = { frames_per_row = 11, frames = 22 },
    j_scary_face = {},
    j_abstract = {},
    j_delayed_grat = {}, -- todo: animate when primed. constant backround animation. flip clock when triggered, but empty when failed
    j_hack = { frames_per_row = 8, frames = 64 },
    j_pareidolia = { frames_per_row = 5, frames = 20 },
    j_gros_michel = {},
    j_even_steven = { frames_per_row = 11, frames = 22 },
    j_odd_todd = { frames_per_row = 11, frames = 22 },
    j_scholar = { frames_per_row = 11, frames = 22, extra = { frames_per_row = 9, frames = 45 }},
    j_business = { frames_per_row = 13, frames = 120 },
    j_supernova = {}, -- todo: an explosion animation that triggers each time it gives mult, and shows an amount of frames proportional to the mult given. framerate proportional to amount of frames to keep duration constant.
    j_ride_the_bus = { frames_per_row = 9, frames = 36 }, 
    j_space = { frames = 61, start_frame = 23, frames_per_row = 96, individual = true, extra = { frames_per_row = 11, frames = 22 } },
    j_egg = { frames_per_row = 4, frames = 8, individual = true },
    j_burglar = { frames = 76, individual = true, verticframes = 22 },
    j_blackboard = { frames = 49, individual = true, verticframes = 22 },
    j_runner = { frames_per_row = 10, frames = 110 },
    j_ice_cream = { frames = 21, individual = true, programart = true }, --todo: create true animation
    j_dna = { frames = 11 }, --frames = 9
    j_splash = {},
    j_blue_joker = { frames_per_row = 11, frames = 22 },
    j_sixth_sense = { verticframes = 22, frames = 39, individual = true },
    j_constellation = { frames_per_row = 6, frames = 66 },--
    j_hiker = { frames_per_row = 11, frames = 22 },
    j_faceless = { frames_per_row = 4, frames = 24 },
    j_green_joker = { frames_per_row = 11, frames = 22 },
    j_superposition = { frames = 20, verticframes = 6, verticfps = 8, individual = true },
    j_todo_list = { frames_per_row = 12, frames = 96 }, -- todo: show hand that needs to be played & animate on trigger. each hand played crosses out an item from the list, when all are crossed or round ends, pass page and write new list.
    j_cavendish = {},
    j_card_sharp = { frames = 6, target = 0, verticframes = 11, verticfps = 5 },
    j_red_card = { frames_per_row = 19, frames = 349 },
    j_madness = {}, -- Idea: randomize the time between laughs/eye twitches
    j_square = { frames_per_row = 11, frames = 22 },
    j_seance = {}, -- todo: animate when triggered
    j_riff_raff = { frames_per_row = 14, frames = 490 },
    j_vampire = { frames_per_row = 11, frames = 22, extra = { frames_per_row = 6, frames = 30 } },
    j_shortcut = {},
    j_hologram = { frames = 1, extra = { extrasoul = true, frames_per_row = 22, frames = 22, start_frame = 198 } }, -- the texture needs to be this big so the scanlines are vanilla acurate.
    j_vagabond = { frames = 30, fps = 5 },
    j_baron = { frames_per_row = 11, frames = 22 },
    j_cloud_9 = {},
    j_rocket = { frames_per_row = 11, frames = 87, fps = 10, individual = true, extra = { frames = 5, individual = true, immediate = true } }, --todo: add thruster animation on the verticframes
    j_obelisk = {}, -- todo: animate when promoted / show hand that needs to not be played
    j_midas_mask = {},
    j_luchador = { frames_per_row = 11, frames = 22 },
    j_photograph = { frames = 48 },
    j_gift = {},
    j_turtle_bean = { frames_per_row = 7, frames = 14, extra = { frames = 6, individual = true, programart = true, verticframes = 14, verticfps = 8 } }, -- todo: add the diferent stages of eaten/roten
    j_erosion = {},
    j_reserved_parking = {},
    j_mail = { frames_per_row = 7, frames = 14, target = 13, immediate = true },
    j_to_the_moon = { frames = 40, fps = 8, target = 0, verticframes = 40, verticfps = 8 },
    j_hallucination = {},
    j_fortune_teller = { frames_per_row = 11, frames = 22 },
    j_juggler = { frames = 22, verticframes = 14, verticfps = 13 },
    j_drunkard = { frames = 22, verticframes = 14, verticfps = 13 },
    j_stone = { frames_per_row = 11, frames = 22 },
    j_golden = { frames_per_row = 11, frames = 22 },
    j_lucky_cat = {}, -- todo: animate when promoted
    j_baseball = {},
    j_bull = {},
    j_diet_cola = { frames = 20 },
    j_trading = {}, -- todo: make multiple variants. reuse code for flash
    j_flash = { frames_per_row = 13, frames = 26, individual = true, immediate = true },
    j_popcorn = { frames = 5, individual = true },
    j_trousers = { frames_per_row = 4, frames = 12, extra = { frames_per_row = 4, frames = 16, fps = 8 } },
    j_ancient = { start_frame = 18, frames = 6, target = 3 },
    j_ramen = { frames = 21, individual = true, programart = true }, --todo: create true animation
    j_walkie_talkie = {},
    j_selzer = { verticframes = 15, start_frame = 3, frames = 51, individual = true },
    j_castle = { frames_per_row = 9, frames = 69, start_frame = 0, extra = { frames = 9, target = 3, immediate = true, verticframes = 5, verticfps = 5 } },
    j_smiley = { frames_per_row = 13, frames = 150 },
    j_campfire = {}, -- todo: animate fire, which gets bigger the more you burn, returning to normal when resetting
    j_ticket = {},
    j_mr_bones = { frames_per_row = 11, frames = 22 }, -- todo: destroy animation? (if done, with the laugh as verticframes)
    j_acrobat = {},
    j_sock_and_buskin = { frames_per_row = 5, frames = 30 },
    j_swashbuckler = { frames_per_row = 11, frames = 22 },
    j_troubadour = {},
    j_certificate = { frames_per_row = 7, frames = 28, individual = true, extra = { frames = 5, individual = true, immediate = true } },
    j_smeared = { frames_per_row = 11, frames = 22, extra = { frames = 10 } },
    j_throwback = { verticframes = 18, frames = 100, extra = { frames_per_row = 11, frames = 22 } }, -- todo: animate when promoted (if done, on extra layer, with the laugh as verticframes)
    j_hanging_chad = {},
    j_rough_gem = {},
    j_bloodstone = {},
    j_arrowhead = {},
    j_onyx_agate = {},
    j_glass = { frames_per_row = 11, frames = 22 },
    j_ring_master = { frames_per_row = 11, frames = 22 },
    j_flower_pot = { frames = 24 },
    j_blueprint = { frames = 31, individual = true, verticframes = 22 },
    j_wee = { frames_per_row = 11, frames = 22 },
    j_merry_andy = { frames_per_row = 11, frames = 22 },
    j_oops = { frames_per_row = 5, frames = 10, extra = { frames = 5, fps = 15, target = 0, programart = true } }, -- todo: create stilized smear frames
    j_idol = { frames_per_row = 14, frames = 140, immediate = true, target = 51, extra = { frames_per_row = 6, frames = 6, fps = 3, target = 3 } }, -- todo: fix broken code for custom suit icons
    j_seeing_double = { frames_per_row = 13, frames = 150, extra = { frames_per_row = 5, frames = 20 } },
    j_matador = { frames_per_row = 11, frames = 22 },
    j_hit_the_road = { frames = 10, individual = true }, -- todo: create a true animation with pespective and not just the 2d car
    j_duo = {},
    j_trio = {},
    j_family = {},
    j_order = {},
    j_tribe = {},
    j_stuntman = { frames_per_row = 11, frames = 22 },
    j_invisible = { frames = 11, fps = 5, individual = true, verticframes = 22 },
    j_brainstorm = { frames = 39, individual = true, verticframes = 22 },
    j_satellite = {},
    j_shoot_the_moon = { frames_per_row = 11, frames = 22 },
    j_drivers_license = { frames = 2, target = 0, immediate = true },
    j_cartomancer = { frames_per_row = 11, frames = 22 },
    j_astronomer = { frames = 29, extra = { frames = 6, fps = 2, verticframes = 22 } },--
    j_burnt = {}, -- todo: animate when primed?
    j_bootstraps = { frames_per_row = 19, frames = 38 },
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
    c_lovers = { frames_per_row = 6, frames = 30, extra = { frames_per_row = 2, frames = 4, individual = true, immediate = true } },
    c_chariot = {},
    c_justice = {},
    c_hermit = { frames_per_row = 2, frames = 4, fps = 3 },
    c_wheel_of_fortune = { frames = 12, individual = true },
    c_strength = {},
    c_hanged_man = {},
    c_death = {},
    c_temperance = {},
    c_devil = {},
    c_tower = {},
    c_sun = { frames_per_row = 9, frames = 45, fps = 15, extra = { } },
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
    c_black_hole = {},
}
AnimatedVouchers = {
    v_overstock_norm = { frames = 5 },
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
    v_recyclomancy = { frames = 9 },
    v_tarot_merchant = { frames = 12 },
    v_tarot_tycoon = {},
    v_planet_merchant = { frames = 12 },
    v_planet_tycoon = {},
    v_seed_money = {},
    v_money_tree = {},
    v_blank = { frames = 23 },
    v_antimatter = {},
    v_magic_trick = { frames = 9 },
    v_illusion = { frames = 18, frames_per_row = 9 },
    v_hieroglyph = {},
    v_petroglyph = {},
    v_directors_cut = {},
    v_retcon = {},
    v_paint_brush = {},
    v_palette = {}
}

AnimatedIndividuals = {}

Aura = {}

function Aura.add_individual(card)
    local is_in_individual = false
    for i = 1, #AnimatedIndividuals do
        if AnimatedIndividuals[i] == card then
            is_in_individual = true
            break
        end
    end
    if not is_in_individual then
        AnimatedIndividuals[#AnimatedIndividuals+1] = card
        local name = card.config.center_key
        local anim = AnimatedJokers[name] or AnimatedPlanets[name] or AnimatedVouchers[name]

        card.animation = card.animation or {}
        if card.config.key == "j_flash" and card.animation.flash_order then
            Aura.update_flash(card, card.animation.flash_order[card.animation.flash_index])
        end
        local center_copy = {}
        for k, v in pairs(card.config.center) do
            center_copy[k] = v
        end
        if anim.individual then
            center_copy.pos = {x = card.config.center.pos.x, y = card.config.center.pos.y}
        else
            center_copy.pos = card.config.center.pos
        end
        if card.config.center.pos.extra then
            if anim and anim.extra and anim.extra.individual then
                center_copy.pos.extra = {x = card.config.center.pos.extra.x, y = card.config.center.pos.extra.y, atlas = card.config.center.pos.extra.atlas} 
            else
                center_copy.pos.extra = card.config.center.pos.extra
            end
        end
        card.config.center = center_copy
        card:set_sprites(card.config.center)
        if card.children and card.children.front then
            card.children.front.sprite_pos = center_copy.pos.extra
        end
    end
end

if SMODS.Atlas then
    --Register all Jokers/Sprites
    for i = 1, 150 do
        local k = G.P_CENTER_POOLS.Joker[i].key
        local v = AnimatedJokers[k]
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
            SMODS[v.set or "Joker"]:take_ownership(k, {
                atlas = k,
                pos = { x = posx or 0, y = posy or 0, extra = v.extra and {x = posex or 0, y = posey or 0, atlas = "aura_"..k.."_extra"} },
                extrasoul = v.extra and v.extra.extrasoul,
            },SMODS.Mods["Aura"].config.Silent_ownership)
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
                pos = { x = posx or 0, y = posy or 0, extra = v.extra and {x = posex or 0, y = posey or 0, atlas = "aura_"..k.."_extra"} },
                extrasoul = v.extra and v.extra.extrasoul,
            },SMODS.Mods["Aura"].config.Silent_ownership)
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
                pos = { x = posx or 0, y = posy or 0, extra = v.extra and {x = posex or 0, y = posey or 0, atlas = "aura_"..k.."_extra"} },
                extrasoul = v.extra and v.extra.extrasoul,
            },SMODS.Mods["Aura"].config.Silent_ownership)
        else
            SMODS[v and v.set or "Voucher"]:take_ownership(k, {}, true)
        end
    end
end

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
    local anim = AnimatedJokers[k] or AnimatedPlanets[k] or AnimatedVouchers[k]
    if anim and obj then
        if anim.frames then
            local next_frame = false
            local frames_passed = 0
            if jkr then
                if anim.individual then
                    if anim.immediate then
                        if jkr.target and (obj.pos.x + (not anim.verticframes and (obj.pos.y*(anim.frames_per_row or anim.frames)) or 0)) ~= jkr.target then
                        next_frame = true
                    end
                    else
                    jkr.t = jkr.t or (anim.t and (anim.t - dt)) or 0
                    jkr.t = jkr.t + dt
                    frames_passed = math.floor(jkr.t / (1/(jkr.fps or anim.fps or 10)))
                    if frames_passed > 0 then
                        jkr.t = jkr.t - frames_passed/(jkr.fps or anim.fps or 10)
                        next_frame = true
                        end
                    end
                end
            else
                if anim.immediate and anim.target then
                    if (obj.pos.x + (not anim.verticframes and (obj.pos.y*(anim.frames_per_row or anim.frames)) or 0)) ~= anim.target and not anim.individual then
                        next_frame = true
                    end
                else
                    anim.t = anim.t or 0
                    anim.t = anim.t + dt
                    frames_passed = math.floor(anim.t / (1/(anim.fps or 10)))
                    if frames_passed > 0 then
                        anim.t = anim.t - frames_passed/(anim.fps or 10)
                        if not anim.individual then
                            next_frame = true
                        end
                    end
                end
            end
            if next_frame and ( SMODS.Mods["Aura"].config.Programmer_art or not anim.programart ) then
                local loc = obj.pos.x
                if not anim.verticframes then
                    loc = loc + obj.pos.y*(anim.frames_per_row or anim.frames)
                end
                loc = loc - (anim.start_frame or 0)
                if jkr and (jkr.target or jkr.fps) and anim.individual then
                    if jkr.target then
                        if anim.immediate then
                            loc = jkr.target
                        else
                            local til_target = jkr.target - loc
                            if til_target < 0 then
                                til_target = til_target + anim.frames
                            end
                            if til_target >= frames_passed then
                                loc = loc + frames_passed
                            else
                                if jkr.remaining_triggers then
                                    local targets_passed = math.floor((frames_passed - til_target) / anim.frames) + 1
                                    if targets_passed > jkr.remaining_triggers then
                                        loc = jkr.target
                                        jkr.remaining_triggers = nil
                                    else
                                        loc = loc + (frames_passed % anim.frames)
                                        jkr.remaining_triggers = jkr.remaining_triggers - targets_passed
                                    end
                                elseif jkr.escape_target and til_target == 0 then
                                    loc = loc + math.min(frames_passed, anim.frames)
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
                if loc >= anim.frames then 
                    loc = loc % anim.frames
                    if k == "j_ancient" then Aura.update_ancient() end
                end
                loc = loc + (anim.start_frame or 0)
                obj.pos.x = loc%(anim.frames_per_row or anim.frames)
                if not anim.verticframes then
                    obj.pos.y = math.floor(loc / (anim.frames_per_row or anim.frames))
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
            obj.pos.y = anim.verticloc
        end
        if anim.extra then
            if anim.extra.frames then
                local next_frame_extra = false
                local frames_passed = 0
                if jkr then
                    if anim.extra.individual then
                        jkr.extra = jkr.extra or {}
                        if anim.extra.immediate then
                            if jkr.extra.target and (obj.pos.extra.x + (not anim.extra.verticframes and obj.pos.extra.y*(anim.extra.frames_per_row or anim.extra.frames) or 0)) ~= jkr.extra.target then
                                next_frame_extra = true
                            end
                        else
                            if jkr.extra then
                                jkr.extra.t = jkr.extra.t or (anim.extra.t and (anim.extra.t - dt)) or (anim.t and (anim.t - dt)) or 0
                                jkr.extra.t = jkr.extra.t + dt
                                frames_passed = math.floor(jkr.extra.t / (1/(jkr.extra.fps or anim.extra.fps or 10)))
                                if frames_passed > 0 then
                                    jkr.extra.t = jkr.extra.t - frames_passed/(jkr.extra.fps or anim.extra.fps or 10)
                                    next_frame_extra = true
                                end
                            end
                        end
                    end
                else
                    if anim.extra.immediate then
                        if obj.pos.extra and obj.pos.extra.x ~= anim.extra.target and not anim.extra.individual then
                        next_frame_extra = true
                    end
                    else
                    anim.extra.t = anim.extra.t or (anim.t and (anim.t - dt)) or 0
                    anim.extra.t = anim.extra.t + dt
                    frames_passed = math.floor(anim.extra.t / (1/(anim.extra.fps or 10)))
                    if frames_passed > 0 then
                        anim.extra.t = anim.extra.t - frames_passed/(anim.extra.fps or 10)
                        if not anim.extra.individual then
                            next_frame_extra = true
                            end
                        end
                    end
                end
                if next_frame_extra and ( SMODS.Mods["Aura"].config.Programmer_art or not anim.extra.programart ) then
                    if not obj.pos.extra then--Custom fix to prevent crash in Balatro Multiplayer in a sandbox play- idk why oops_all_6s didnt have obj.pos.extra, but if I give it to it it works
                        obj.pos.extra = {x = 0, y = 0, atlas = "aura_"..k.."_extra"}
                    end
                    local loc = obj.pos.extra.x
                    if not anim.extra.verticframes then
                        loc = loc + obj.pos.extra.y*(anim.extra.frames_per_row or anim.extra.frames)
                    end
                    loc = loc - (anim.extra.start_frame or 0)
                    if jkr and jkr.extra and (jkr.extra.target or jkr.extra.fps) and anim.extra.individual then
                        if jkr.extra.target then
                            if anim.extra.immediate then
                                loc = jkr.extra.target
                                else
                                local til_target = jkr.extra.target - loc
                                if til_target < 0 then
                                    til_target = til_target + anim.extra.frames
                                end
                                if til_target >= frames_passed then
                                    loc = loc + frames_passed
                                else
                                    if jkr.extra.remaining_triggers then
                                        local targets_passed = math.floor((frames_passed - til_target) / anim.extra.frames) + 1
                                        if targets_passed > jkr.extra.remaining_triggers then
                                            loc = jkr.extra.target
                                            jkr.extra.remaining_triggers = nil
                                        else
                                            loc = loc + (frames_passed % anim.extra.frames)
                                            jkr.extra.remaining_triggers = jkr.extra.remaining_triggers - targets_passed
                                        end
                                    elseif jkr.extra.escape_target and til_target == 0 then
                                        loc = loc + math.min(frames_passed, anim.extra.frames)
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
                    if loc >= anim.extra.frames then
                        loc = loc % anim.extra.frames
                        if k == "j_idol" then Aura.update_idol() end
                    end
                    loc = loc + (anim.extra.start_frame or 0)
                    obj.pos.extra.x = loc%(anim.extra.frames_per_row or anim.extra.frames)
                    if not anim.extra.verticframes then
                        obj.pos.extra.y = math.floor(loc / (anim.extra.frames_per_row or anim.extra.frames))
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
                obj.pos.extra.y = anim.extra.verticloc
            end
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
        Aura.update_frame(dt, v.config.center_key, v.config.center, v.animation)
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
        Aura.add_individual(self)
    end
end

--Sprite setting for multiple layers
local css = Card.set_sprites
function Card:set_sprites(c, f)
    css(self, c,f)
    if self.config.center.extrasoul then
        self.children.floating_sprite = Sprite(self.children.floating_sprite.T.x, self.children.floating_sprite.T.y, self.children.floating_sprite.T.w, self.children.floating_sprite.T.h, G.ASSET_ATLAS[self.config.center.pos.extra.atlas], self.config.center.pos.extra)
        self.children.floating_sprite.role.draw_major = self
        self.children.floating_sprite.states.hover = self.states.hover
        self.children.floating_sprite.states.click = self.states.click
        self.children.floating_sprite.states.drag = self.states.drag
        self.children.floating_sprite.states.collide.can = false
    end

    if self.config.center and self.config.center.pos and self.config.center.pos.extra and self.config.center.pos.extra.atlas and (self.config.center.discovered or self.bypass_discovery_center) and not (self.children.front or self.config.center.extrasoul) then
        --[[if self.config.center.pos.extra.atlas == "aura_j_idol_extra" then
            self.children.front = get_suit_ui_sprite("Spades")
            self.children.front:set_role({
                major = self, 
                role_type = 'Minor', 
                draw_major = self,
                --xy_bond = 'Strong',  -- Use Strong bond for precise tracking
                wh_bond = 'Weak',   -- Use Weak bond to prevent size-based centering adjustments
                offset = {x = 1.05, y = 1.55}  -- This is the offset for positioning
            })
            if not self.children.front then
                self.children.front = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[self.config.center.pos.extra.atlas], self.config.center.pos.extra)
                self.children.front:set_role({major = self, role_type = 'Glued', draw_major = self})
            end
        else]]
            self.children.front = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[self.config.center.pos.extra.atlas], self.config.center.pos.extra)
            self.children.front.states.hover = self.states.hover
            self.children.front.states.click = self.states.click
            self.children.front.states.drag = self.states.drag
            self.children.front.states.collide.can = false
            self.children.front:set_role({major = self, role_type = 'Glued', draw_major = self})                
        --end
    end
end
local cd = Card.draw
function Card:draw(layer)
    if self.config.center.extrasoul then --Update soul viewport because if not, it doesnt animate properly
        local x, y, w, h = self.children.floating_sprite.sprite:getViewport()
        if x ~= (self.config.center.pos.extra.x * 71) or y ~= (self.config.center.pos.extra.y * 95) then
            self.children.floating_sprite.sprite:setViewport( self.config.center.pos.extra.x * 71, self.config.center.pos.extra.y * 95, 71, 95 )
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
    local anim = AnimatedJokers[key] or AnimatedPlanets[key] or AnimatedVouchers[key]
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
        local anim = AnimatedJokers[card.config.center_key] or AnimatedPlanets[card.config.center_key] or AnimatedVouchers[card.config.center_key]
        if card.animation and card.animation.target and anim.individual then
            card.config.center.pos.x = card.animation.target%(anim.frames_per_row or anim.frames)
            if not anim.verticframes then
                card.config.center.pos.y = math.floor(card.animation.target / (anim.frames_per_row or anim.frames))
            end
            card.animation.t = nil
        end
        if card.animation and card.animation.extra and card.animation.extra.target and anim.extra.individual then
            card.config.center.pos.extra.x = card.animation.extra.target%(anim.extra.frames_per_row or anim.extra.frames)
            if not anim.extra.verticframes then
                card.config.center.pos.extra.y = math.floor(card.animation.extra.target / (anim.extra.frames_per_row or anim.extra.frames))
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
    if self.config.center_key == 'j_flash' then
        if not self.animation then
            Aura.add_individual(self)
            Aura.update_flash(self, 9)
        end
    end
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
    else return 13 end
end

function Aura.seal_sprite_order(seal)
    if seal == "Gold" then
        return 1
    elseif seal == 'Purple' then
        return 2
    elseif seal == 'Red' then
        return 3
    elseif seal == 'Blue' then
        return 4
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
    for i = 0, 25 do
        if anim_order[i] == StartLetter then
            anim_order[0], anim_order[i] = anim_order[i], anim_order[0]
        end
    end
    self.animation = {target = anim_order[0], flash_index = 0, flash_order = anim_order}
end

function Aura.update_castle()
    local new_suit = G.GAME.current_round.castle_card.suit or 'Spades'
    local anim_offset = Aura.suit_sprite_order(new_suit)
    AnimatedJokers.j_castle.extra.target = anim_offset
    if (new_suit == "six_Moons" or new_suit == "six_Stars") then
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

local rcc = reset_castle_card
function reset_castle_card()
    rcc()
    local castlelist = {}
    for _, jkr in ipairs(G.jokers.cards) do
        if jkr.ability.name == "Castle" then
            table.insert(castlelist, jkr)
        end
    end

    G.E_MANAGER:add_event(Event({
        func = (function()
            for _, jkr in pairs(castlelist) do
                jkr:flip()
            end
            Aura.update_castle()
            delay(0.075*G.SETTINGS.GAMESPEED)
            for _, jkr in pairs(castlelist) do
                jkr:flip()
            end
            return true
        end)
    }))
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
    G.E_MANAGER:add_event(Event({
        func = (function()
            for _, jkr in pairs(maillist) do
                jkr:flip()
            end
            Aura.update_mail()
            delay(0.075*G.SETTINGS.GAMESPEED)
            for _, jkr in pairs(maillist) do
                jkr:flip()
            end
            return true
        end)
    }))
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
        if silent then -- or (G.GAME.blind.name == "Amber Acorn" and G.GAME.facing_blind)
            AnimatedJokers.j_drivers_license.target = target_frame
        else
            G.E_MANAGER:add_event(Event({
                func = (function()
                    for _, jkr in pairs(licenselist) do
                        jkr:flip()
                    end
                    AnimatedJokers.j_drivers_license.target = target_frame
                    delay(0.075*G.SETTINGS.GAMESPEED)
                    for _, jkr in pairs(licenselist) do
                        jkr:flip()
                    end
                    return true
                end)
            }))
        end
    end
end

function Aura.update_ancient()
    local suit = Aura.suit_sprite_order(G.GAME.current_round.ancient_card.suit or nil) * 6
    AnimatedJokers.j_ancient.start_frame = suit
    G.P_CENTERS["j_ancient"].pos.y = suit
end

local rac = reset_ancient_card
function reset_ancient_card()
    rac()
    AnimatedJokers.j_ancient.escape_target = true
end

function Aura.update_idol()-- Triggered if the mouth is closed
    local suit = G.GAME.current_round.idol_card.suit or nil
    local rank = G.GAME.current_round.idol_card.rank or nil

    --sendDebugMessage("Experimental Idol: " .. tostring(SMODS.Mods["Aura"].config.Experimental_Idol))
    --if SMODS.Mods["Aura"].config.Experimental_Idol then 
        --sendDebugMessage("Experimental Idol enabled")
        --AnimatedJokers.j_idol.target = 126 + Aura.rank_sprite_order(rank)
    --else 
        AnimatedJokers.j_idol.target = (Aura.suit_sprite_order(suit) * 14) + Aura.rank_sprite_order(rank)
    --end
end

local ric = reset_idol_card
function reset_idol_card()
    ric()
    --if SMODS.Mods["Aura"].config.Experimental_Idol then set_experimental_idol() end
    AnimatedJokers.j_idol.extra.escape_target = true
end
--[[ --Experimental Idol (disabled for now, looks very bad)
function get_suit_ui_sprite(suit, offset_x, offset_y)
    -- Default offsets to 0 if not provided
    offset_x = offset_x or 0
    offset_y = offset_y or 0
    
    local deckskin = SMODS.DeckSkins[ G.SETTINGS.CUSTOM_DECK.Collabs[suit] ]
    local palette = deckskin and (deckskin.palette_map and deckskin.palette_map[G.SETTINGS.colour_palettes[suit] or ''] or (deckskin.palettes or {})[1])
    local exportexture
    
    if palette and palette.suit_icon and palette.suit_icon.atlas then
        -- Custom deck skin with suit icon
        local _x = (suit == 'Spades' and 3) or (suit == 'Hearts' and 0) or (suit == 'Clubs' and 2) or (suit == 'Diamonds' and 1)
        local pos_x = SMODS.Mods["Aura"].config.Experimental_Idol and _x or -1
        local pos_y = SMODS.Mods["Aura"].config.Experimental_Idol and ((type(palette.suit_icon.pos) == "number" and palette.suit_icon.pos) or 
                                                  (palette.suit_icon.pos and palette.suit_icon.pos.y) or 0) or -1

        exportexture = Sprite(offset_x, offset_y, 0.3, 0.3, 
            G.ASSET_ATLAS[palette.suit_icon.atlas or 'ui_1'], 
            {x = pos_x, y = pos_y})
    elseif G.SETTINGS.colour_palettes[suit] == 'lc' or G.SETTINGS.colour_palettes[suit] == 'hc' then
        -- High contrast or low contrast palette
        local pos = SMODS.Mods["Aura"].config.Experimental_Idol and SMODS.Suits[suit].ui_pos or {x = -1, y = -1}
        exportexture = Sprite(offset_x, offset_y, 0.3, 0.3,
            G.ASSET_ATLAS[ SMODS.Suits[suit][G.SETTINGS.colour_palettes[suit] == 'hc' and "hc_ui_atlas" or G.SETTINGS.colour_palettes[suit] == 'lc' and "lc_ui_atlas"] ] or
            G.ASSET_ATLAS[("ui_" .. (G.SETTINGS.colourblind_option and "2" or "1"))], 
            pos)
    else
        -- Default atlas
        local atlas = G.SETTINGS.colour_palettes[suit] == "hc" and SMODS.Suits[suit].hc_ui_atlas or SMODS.Suits[suit].lc_ui_atlas
        local pos = SMODS.Mods["Aura"].config.Experimental_Idol and SMODS.Suits[suit].ui_pos or {x = -1, y = -1}
        exportexture = Sprite(offset_x, offset_y, 0.3, 0.3, 
            G.ASSET_ATLAS[atlas and atlas or ("ui_" .. (G.SETTINGS.colourblind_option and "2" or "1"))], 
            pos)
    end
    
    return exportexture
end
function set_experimental_idol()
    self.children.front = get_suit_ui_sprite(G.GAME.current_round.idol_card.suit)
    self.children.front:set_role({
        major = self, 
        role_type = 'Minor', 
        draw_major = self,
        --xy_bond = 'Strong',  -- Use Strong bond for precise tracking
        wh_bond = 'Weak',   -- Use Weak bond to prevent size-based centering adjustments
        offset = {x = 1.05, y = 1.55}  -- This is the offset for positioning
    })
end]]

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
    if config.immediate and not config.volume and vals.handname ~= nil then --- I looked trough the source code, and this should exclude leveling up hands and and actually playing the hand, meanining it only checks hands selected
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
      #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then

        local delay = 1.6*G.SETTINGS.GAMESPEED --16 frames at 10 fps * compensation for game speed

        --Compensation to properly sync
        if G.SETTINGS.GAMESPEED == 1 or G.SETTINGS.GAMESPEED == 0.5 then-------Values reached through experimentation:  when x4-> 2, when x1-> 0, when x0.5-> 0, when x2-> 0.5
            --delay = delay + (G.GAME.consumeable_buffer * 0)
        elseif G.SETTINGS.GAMESPEED == 2 then
            delay = delay + (G.GAME.consumeable_buffer * 0.5)
        elseif G.SETTINGS.GAMESPEED == 4 then
            delay = delay + (G.GAME.consumeable_buffer * 2)
        else --If modded game speed
            delay = 0
        end

        G.E_MANAGER:add_event(Event({ delay = delay,
        trigger = 'before',
        func = (function()
            Aura.add_individual(self)
            self.animation = { target = 0, escape_target = true }
            return true
        end)}))

    end

    local ret = cj(self, context)

    --Flash Card
    if self.ability.name == "Flash Card" and context.reroll_shop and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                self:flip()
                play_sound('card1')
                Aura.add_individual(self)
                self.animation.flash_index = self.animation.flash_index + 1
                if self.animation.flash_index > 25 then self.animation.flash_index = 0 end
                self.animation.target = self.animation.flash_order[self.animation.flash_index]
                self:juice_up(0.3, 0.3)
                delay(0.075*G.SETTINGS.GAMESPEED)
                self:flip()
                play_sound('tarot2', 1, 0.6)
                return true
            end)
        }))
    end

    --Blackboard
    if self.ability.name == "Blackboard" and context.cardarea == G.jokers and context.joker_main and not context.blueprint then
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
                    self.animation = { target = 0, escape_target = true }
                    return true
                end)
            }))
        end
    end

    --Superposition
    if self.ability.name == "Superposition" and context.cardarea == G.jokers and context.joker_main and next(context.poker_hands["Straight"]) then
        local aces = 0
        for i = 1, #context.scoring_hand do
            if context.scoring_hand[i]:get_id() == 14 then aces = aces + 1 end
        end
        if aces >= 1 then
            Aura.add_individual(self)
            if self.config.center.pos.x < 10 then
                G.E_MANAGER:add_event(Event({
                func = (function()
                    self.animation = {target = 10}
                    return true
                end)
                }))
            else
                G.E_MANAGER:add_event(Event({
                func = (function()
                    self.animation = {target = 0}
                    return true
                end)
                }))
            end
        end
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
                self.animation = { target = 20 - math.floor((self.ability.extra.chips / 5) + 0.5) }
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

    --Space Joker (with Oops trigger)
    if self.ability.name == "Space Joker" and context.cardarea == G.jokers and context.before and not self.debuff then
        AnimatedJokers.j_oops.extra.fps = 10*G.SETTINGS.GAMESPEED
        AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
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

    --Various Oops triggers
    if self.ability.name == "Hallucination" and context.open_booster then
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            func = (function()
                AnimatedJokers.j_oops.extra.fps = 10*G.SETTINGS.GAMESPEED
                AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
                return true
            end)
        }))
    end

    if self.ability.name == "Gros Michel"  and context.end_of_round and context.main_eval and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                AnimatedJokers.j_oops.extra.fps = 10*G.SETTINGS.GAMESPEED
                AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
                return true
            end)
        }))
    end

    if self.ability.name == "Cavendish" and context.end_of_round and context.main_eval and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            func = (function()
                AnimatedJokers.j_oops.extra.fps = 10*G.SETTINGS.GAMESPEED
                AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
                return true
            end)
        }))
    end
    if self.ability.name == "8 Ball" and context.individual and context.cardarea == G.play and context.other_card and context.other_card:get_id() == 8 then
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            func = (function()
                AnimatedJokers.j_oops.extra.fps = 10*G.SETTINGS.GAMESPEED
                AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
                return true
            end)
        }))
    end

    if self.ability.name == "Business Card" and context.individual and context.cardarea == G.play and context.other_card and context.other_card:is_face() then
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            func = (function()
                AnimatedJokers.j_oops.extra.fps = 10*G.SETTINGS.GAMESPEED
                AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
                return true
            end)
        }))
    end

    if self.ability.name == "Bloodstone" and context.individual and context.cardarea == G.play and context.other_card and context.other_card:is_suit("Hearts") then
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            func = (function()
                AnimatedJokers.j_oops.extra.fps = 10*G.SETTINGS.GAMESPEED
                AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
                return true
            end)
        }))
    end

    if self.ability.name == "Reserved Parking" and context.individual and context.cardarea == G.hand and context.other_card and context.other_card:is_face() then
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            func = (function()
                AnimatedJokers.j_oops.extra.fps = 10*G.SETTINGS.GAMESPEED
                AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
                return true
            end)
        }))
    end

    return ret
end

--On consume effects

local cuc = Card.use_consumeable
function Card:use_consumeable(context)
    if self.ability.name == "The Wheel of Fortune" then
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.35,
            func = (function()
                AnimatedJokers.j_oops.extra.fps = 10*G.SETTINGS.GAMESPEED
                AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
                return true
            end)
        }))
        Aura.add_individual(self)
        AnimatedPlanets.c_wheel_of_fortune.fps = 10*G.SETTINGS.GAMESPEED-- so it can be seen on higher gamespeeds
        self.animation = { target = 12 }
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
                G.E_MANAGER:add_event(Event({ delay = 10*G.SETTINGS.GAMESPEED,
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

--Detecting Lucky Cards for oops

local gcm = Card.get_chip_mult

function Card:get_chip_mult()
    local ret = gcm(self)

    if self.ability.effect == "Lucky Card" then
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            func = (function()
                AnimatedJokers.j_oops.extra.fps = 10*G.SETTINGS.GAMESPEED
                AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
                return true
            end)
        }))
    end

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
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            AnimatedJokers.j_oops.extra.fps = 10*G.SETTINGS.GAMESPEED
                            AnimatedJokers.j_oops.extra.remaining_triggers = (AnimatedJokers.j_oops.extra.remaining_triggers or 0) + 1
                            return true
                        end)
                    }))
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