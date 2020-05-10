function Client_GameRefresh(game)
	if (game.Game.TurnNumber > 0 or game.Map.ID ~= 69965) then return end; -- don't pop up in ongoing games, could be removed later

	if not Mod.PlayerGameData.InitialPopupDisplayed and game.Us ~= nil then
		UI.Alert("This game includes randomized bonuses on INSS. Only the top bonuses are affected.")
		local payload = {};
		payload.Message = "InitialPopupDisplayed";
		game.SendGameCustomMessage("Please wait... ", payload, function(reply)end);
	end
end