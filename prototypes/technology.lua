--
-- Fix for issue https://github.com/DRY411S/Remove-Chemical-Batteries/issues/1
--
-- Remove the battery from the unlocked recipes in the technology tree
--
local neweffects = {}
for _,effect in pairs(data.raw["technology"]["battery"].effects) do
	if effect.type ~= "unlock-recipe" or effect.recipe ~= "battery" then
		table.insert(neweffects,effect)
	end
end
data.raw["technology"]["battery"].effects = neweffects