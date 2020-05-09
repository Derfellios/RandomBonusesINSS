function Client_PresentSettingsUI(rootParent)
	local vert = UI.CreateVerticalLayoutGroup(rootParent);
	
	UI.CreateLabel(vert).SetText('Maximum subtraction per bonus ' .. Mod.Settings.RandomizeAmountMin);
	UI.CreateLabel(vert).SetText('Maximum addition per bonus ' .. Mod.Settings.RandomizeAmountMax);
	UI.CreateLabel(vert).SetText('Allow negative: ' .. tostring(Mod.Settings.AllowNegative));
end