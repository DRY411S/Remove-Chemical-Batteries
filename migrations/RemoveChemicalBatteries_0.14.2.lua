-- Enables the vanilla battery recipe if batteries have been researched but the recipe was not unlocked
-- Provides migration for saved games broken by https://github.com/DRY411S/Remove-Chemical-Batteries/issues/3
game.reload_script()

for index, nextforce in pairs(game.forces) do
	nextforce.reset_recipes()
	nextforce.reset_technologies()
    if nextforce.technologies["battery"].researched and nextforce.technologies["battery"].researched == true then
        nextforce.recipes["battery"].enabled = true
    end

end

