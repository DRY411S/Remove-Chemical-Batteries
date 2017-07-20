-- Fix for: https://github.com/DRY411S/Remove-Chemical-Batteries/issues/3
-- The technology.effects have been modified to stop the vanilla battery appearing on the research tab
-- This means the vanilla battery recipe is not unlocked when battery is researched
-- Therefore we need to manually unlock it when the battery research finishes
-- Otherwise the vanilla battery won't be available if AddAssemberBatteries mod is disabled
-- Disabling that mod, disables this mod, due to dependency
-- Even though we enable it, the vanilla item won't be craftable because the recipe has been hidden
local function on_research_finished(event)

        for _, nextforce in pairs(game.forces) do
        force = nextforce
        -- DEBUG: game.write_file("mylog.log", event.research.name .. ": battery.hidden: " .. tostring(force.recipes["battery"].hidden) .. "\n", true) -- appending
        -- DEBUG: game.write_file("mylog.log", event.research.name .. ": assembler-battery.hidden: " .. tostring(force.recipes["assembler-battery"].hidden) .. "\n", true) -- appending
        if event.research.name == "battery" then
            force.recipes["battery"].enabled = true
            force.recipes["assembler-battery"].enabled = true
        end
    end
end

-- GAME Event Handlers

script.on_event(defines.events.on_research_finished,function(event)
	on_research_finished(event)
end
)