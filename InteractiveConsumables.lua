--FUNCTIONS FOR INTERACTIVE CONSUMABLES

--On consume effects (Only The Wheel of Fortune for now)
local cuc = Card.use_consumeable
function Card:use_consumeable(context)
    if self.ability.name == "The Wheel of Fortune" then
        Aura.Trigger_oops_all_6s() --Trigger Oops All 6s animation
        --Add animation inside an event
        G.E_MANAGER:add_event(Event({
            func = (function()
                Aura.add_individual(self)
                self.animation = { target = 12, fps = 10*G.SPEEDFACTOR } --Adapt fps to game speed
                return true
            end)
        }))
    end
    return cuc(self, context) --Original Card:use_consumeable function call
end

--Lovers has a target randomized between 1 and 4 when being created in Card.init