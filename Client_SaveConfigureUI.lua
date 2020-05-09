function Client_SaveConfigureUI(alert)
    
    Mod.Settings.RandomizeAmountMin = numberInputFieldMin.GetValue();
	Mod.Settings.RandomizeAmountMax = numberInputFieldMax.GetValue();
	Mod.Settings.AllowNegative = allowNegativeBonusesCheckBox.GetIsChecked();
end