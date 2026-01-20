--FUNTIONS FOR GENERAL CARD GESTIONS

--Resetting animated individuals back to their targets on run start plus updating various jokers that need it
local gsr = Game.start_run
function Game:start_run(args)
    --Make sure no Individual from previous runs are carried over
    AnimatedIndividuals = {}
    --Original Game:start_run function call. It loads the saved AnimatedIndividuals if loading a saved run
    gsr(self,args)
    --Resetting all animated individuals to their targets
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
    --Updating various jokers that need it
    Aura.update_idol()
    Aura.update_ancient()
    Aura.update_castle()
    Aura.update_mail()
    Aura.update_drivers_license(true)
end

--Functions for saving and loading animated individuals' animation data
local cs = Card.save
function Card:save()
    local cardTable = cs(self) --Original Card:save function call
    if self.animation then
        cardTable.animation = self.animation
    end
    return cardTable
end
local cl = Card.load
function Card:load(cardTable, other_card)
    cl(self, cardTable) --Original Card:load function call
    if cardTable.animation then
        self.animation = cardTable.animation
        Aura.add_individual(self, true)
    end
end

--Detecting card being created to trigger various animations
local ci = Card.init
function Card:init(x,y,w,h,card,center,params)
    --Original Card:init function call
    ci(self,x,y,w,h,card,center,params)
    --Randomize Lovers between four options
    if self.config.center_key == "c_lovers" then
        Aura.add_individual(self)
        self.animation = { extra = { target = pseudorandom("aura_lovers",0,3) } }
    end
    --Update Rocket so it is animated from the start
    if self.config.center_key == "j_rocket" then
        Aura.add_individual(self)
        self.animation = { fps = 10*self.ability.extra.dollars, extra = { target = 4 - math.min(4, math.floor(self.ability.extra.dollars / self.ability.extra.increase)) } }
    end
    --Check if Trading Card gets an EX animation on creation, do not animate if not
    if self.config.center_key == "j_trading" then
        if pseudorandom("aura_trading_EX") < 1/10 then
            Aura.add_individual(self)
            self.animation.target = AuraTradingCards[11].EX.pos-1
            self.animation.EX = true
        end
    end
    --Updating various jokers to make sure they are in the correct state
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
--Make sure that when copying a card with individual animation, the copy is independent from the original. Also update Driver's License
local cc = copy_card
function copy_card(other, new_card, card_scale, playing_card, strip_edition)
    --Original copy_card function call
    local ret_card = cc(other, new_card, card_scale, playing_card, strip_edition)
    --Only do something if the original had individual animation
    local anim = ret_card.config.center.anim
    if anim and (anim.individual or (anim.extra and anim.extra.individual)) and other.animation then
        ret_card.config.center_key = ret_card.config.center.key --With the individual center, it doesnt update center_key properly without tihis 
        Aura.add_individual(ret_card)
    end
    --Update Driver's License jokers in case an enhancement was copied
    Aura.update_drivers_license()
    return ret_card
end
--Make sure that when removing a card, it is also removed from AnimatedIndividuals if it had individual animation. Also update Driver's License in case an enhancement was removed
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
    Aura.update_drivers_license()
end

--Make sure that when discovering a individual object, the original center is also updated
local dc = discover_card
function discover_card(card)
    card = card or {}
    if card.animation then
        dc(G.P_CENTERS[card.key]) --If individual object, discover the original center
    else
        dc(card) --If normal card, original discover_card function call
    end
end
--Make sure that when unlocking a individual object, the original center is also updated
local uc = unlock_card
function unlock_card(card)
    if card.animation then
        uc(G.P_CENTERS[card.key]) --If individual object, unlock the original center
    else
        uc(card) --If normal card, original unlock_card function call
    end
end
--Make sure that when clearing alerts for a individual object, the original center is also updated
local hov = Card.hover
function Card:hover()
    if self.animation and self.facing == 'front' and (not self.states.drag.is or G.CONTROLLER.HID.touch) and not self.no_ui and not G.debug_tooltip_toggle and self.children.alert and not self.config.center.alerted then
        G.P_CENTERS[self.config.center.key].alerted = true
    end
    hov(self) --Original Card:hover function call
end

--FUNCTIONS FOR MAKING THE ANIMATIONS LOOK RIGHT

--Function for giving cards their pos and extra layer/soul if they are animated and require it
local css = Card.set_sprites
function Card:set_sprites(c, f)
    --Original Card:set_sprites function call
    css(self, c, f)
    --Detect if card has to be animated.
    local anim = self.config.center.anim
    if next(anim or {}) ~= nil and (self.config.center.discovered or self.bypass_discovery_center) then
        --Check if atlas is correct
        anim.IncorrectAtlas = Aura.CheckAtlas(self.config.center)
        if not anim.IncorrectAtlas then
            --Set sprite position for animation
            self.children.center:set_sprite_pos(self.config.center.animpos)
            --Set soul sprite data if needed. soul instead of extra
            if anim.extrasoul then
                self.children.floating_sprite = Sprite(self.children.floating_sprite.T.x, self.children.floating_sprite.T.y, self.children.floating_sprite.T.w, self.children.floating_sprite.T.h, G.ASSET_ATLAS[self.config.center.animpos.extra.atlas], self.config.center.animpos.extra)
                self.children.floating_sprite.role.draw_major = self
                self.children.floating_sprite.states.hover = self.states.hover
                self.children.floating_sprite.states.click = self.states.click
                self.children.floating_sprite.states.drag = self.states.drag
                self.children.floating_sprite.states.collide.can = false
            end
            --Set extra layer if needed and has not already been set
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
--Function for giving Tags their pos if they are animated
local tgui = Tag.generate_UI
function Tag:generate_UI(_size)
    local tag_sprite_tab, tag_sprite = tgui(self, _size) --Original Tag:generate_UI function call
    local center = G.P_TAGS[self.key]
    local anim = center.anim
    --Detect if tag has to be animated.
    if next(anim or {}) ~= nil and (center.discovered or not self.hide_ability) then
        anim.IncorrectAtlas = Aura.CheckAtlas(center) --Check if atlas is correct
        if not anim.IncorrectAtlas then
            tag_sprite:set_sprite_pos(center.animpos)
        end
    end
    return tag_sprite_tab, tag_sprite
end
--Function for detecting if DeckSkin is supposed to be animated, and setting the correct atlas and animpos if so
local gfsi = get_front_spriteinfo
function get_front_spriteinfo(_front)
    --Original get_front_spriteinfo function call
    local atlas, pos = gfsi(_front)
    --Get current deck skin
    if _front and _front.suit and G.SETTINGS.CUSTOM_DECK and G.SETTINGS.CUSTOM_DECK.Collabs then
		local collab = G.SETTINGS.CUSTOM_DECK.Collabs[_front.suit]
        --Check if it has to be animated
        if collab and AnimatedDeckSkins[collab] then
            local value = _front.value
            if AnimatedDeckSkins[collab][value] then
                --If the "atlas" is a table, each key within it corresponds to a palette. If it is a string, it aplies to all palettes
                local new_atlas = AnimatedDeckSkins[collab][value].atlas[G.SETTINGS.colour_palettes[_front.suit]] or (type(AnimatedDeckSkins[collab][value].atlas) == "string" and AnimatedDeckSkins[collab][value].atlas or nil)
                if new_atlas and AnimatedDeckSkins[collab][value].animpos then
                    --Set atlas and animpos
                    atlas = G.ASSET_ATLAS[new_atlas]
                    pos = AnimatedDeckSkins[collab][value].animpos
                end
            end
        end
    end
    return atlas, pos
end
--As the soul pos was never made to be changed, it is necesary to update manually its viewport when changing frames
local cd = Card.draw
function Card:draw(layer)
    if self.config.center.anim and self.config.center.anim.extrasoul then
        local x, y, w, h = self.children.floating_sprite.sprite:getViewport()
        if x ~= (self.config.center.animpos.extra.x * 71) or y ~= (self.config.center.animpos.extra.y * 95) then
            self.children.floating_sprite.sprite:setViewport( self.config.center.animpos.extra.x * 71, self.config.center.animpos.extra.y * 95, 71, 95 )
        end
    end
    cd(self,layer)--Original Card:draw function call
end

--Funtion to make sure that the texture menu of Malverk shows the correct pos for all cards after animation messed it up
if Malverk then
    local ctc = create_texture_card
    function create_texture_card(area, texture_pack)
        local card = ctc(area, texture_pack) --Original create_texture_card function call
        --Find what texture is being used
        local texture = AltTextures[TexturePacks[texture_pack].textures[1]]
        if TexturePacks[texture_pack].dynamic_display and Malverk.config.texture_configs[texture_pack] then
            local textures = SMODS.merge_lists({TexturePacks[texture_pack].textures, TexturePacks[texture_pack].toggle_textures})
            local i = 1
            while (not Malverk.config.texture_configs[texture_pack][textures[i]]) and i < #textures do
                i = i + 1
                if AltTextures[textures[i]].display_pos then texture = AltTextures[textures[i]] end
            end
        end
        --Find what pos corresponds to that texture
        local game_table = AltTextures_Utils.game_table[texture.set] or 'P_CENTERS'
        --If the texture was supoused to be animated, set the animpos
        if texture_pack == "texpack_aura_animated_jokers" then
            card.children.center:set_sprite_pos(G[game_table][texture.display_pos or texture.keys[1]].animpos)
        else
            --If not, set the default pos
            card.children.center:set_sprite_pos(G[game_table][texture.display_pos or texture.keys[1]].default_pos or G[game_table][texture.display_pos or texture.keys[1]].pos)
        end
        return card
    end
end

--Takeover to fix edition shaders ignoring front layer when being calculated. Credits to LARSWIJN for the fix
--In theory, this fix will be added natively to Steamodded, but until then, it will be here
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


--FUNCTIONS FOR SETING UI ELEMENTS

--Function for adding animation credits in the mod badge. Credit to Cryptid devs for the base form of this function
local cmb = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
    --Original SMODS.create_mod_badges function call
	cmb(obj, badges)
    --Find the credits to be shown
    local Aura_credits = obj and obj.anim and not obj.anim.IncorrectAtlas and obj.anim.credits
    --Find what badge to modify
    local Our_badge = nil
    local function eq_col(x, y) --Easiest way find our badge is by colour
		for i = 1, 4 do
			if x[i] ~= y[i] then
				return false
			end
		end
		return true
	end
    for i = 1, #badges do
		if eq_col(badges[i].nodes[1].config.colour, HEX("3469ab")) then
            Our_badge = i
			break
		end
	end
	if Our_badge then
        if Aura_credits then
            --Prepare to calculate scale factor for text
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
            local scale_fac = {}
            local min_scale_fac = 1
            --First show the mod name, then the credits. If there are more than one, show "Animators:" so the user knows they are multiple people
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
                --Trading card has special credits, as each art has its own artist
                local tradingNumber = (obj.animation and obj.animation.trading_order and obj.animation.trading_order[obj.animation.trading_index]) or 11
                local trading_card = AuraTradingCards[tradingNumber]
                local trading_credits = (obj.animation and obj.animation.EX and AuraTradingCards[tradingNumber].EX and AuraTradingCards[tradingNumber].EX.credits) or AuraTradingCards[tradingNumber].credits
                for i = 1, #trading_credits do
                    strings[#strings + 1] = "Art #"..tostring(tradingNumber)..(obj.animation and obj.animation.EX and " EX" or "").." by: "..trading_credits[i]
                end
            end
            --Find the scale factor needed to fit the biggest string
            for i = 1, #strings do
                scale_fac[i] = calc_scale_fac(strings[i])
                min_scale_fac = math.min(min_scale_fac, scale_fac[i])
            end
            local ct = {}
            --Prepare the credit strings
            for i = 1, #strings do
                ct[i] = {
                    string = strings[i],
                }
            end
            --Compose the new badge
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
            --Replace old badge with new one
            badges[Our_badge].nodes[1].nodes[2].config.object:remove()
            badges[Our_badge] = Aura_badge
        else
            --Remove badge if no credits to show
            badges[Our_badge].nodes[1].nodes[2].config.object:remove()
            table.remove(badges, Our_badge)
        end
	end
end
--Function for modifying the trading card hover popup to show the card name
local chpop = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
    --Check if it is trading card
    if card.ability_UIBox_table and card.config and card.config.center and card.config.center.key == "j_trading" and not AnimatedJokers.j_trading.IncorrectAtlas and card.config.center.discovered then
        --Find which name to show. Add EX to the end if needed
        local tradingNumber = card.animation and card.animation.trading_order[card.animation.trading_index] or 11
        local trading_name = AuraTradingCards[tradingNumber].name or "Unknown Trading Card"
        trading_name = '"'..trading_name..(card.animation and card.animation.EX and ' EX"' or '"')
        --set the name just bellow the original name
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