-- Enables the mod in saved worlds where mod was not previously used
for index, nextforce in pairs(game.forces) do
	nextforce.reset_recipes()
	nextforce.reset_technologies()

end

