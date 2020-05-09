function Client_PresentConfigureUI(rootParent)
	local initialValueMin = Mod.Settings.RandomizeAmount;
	local initialValueMax = Mod.Settings.RandomizeAmountMin;
	local initialValueMax = Mod.Settings.RandomizeAmountMax;
	local initialNegatives = Mod.Settings.AllowNegative;
	local TimiRandom = Mod.Settings.TimiRandom;
	if initialValueMin == nil then initialValueMin = 1; end
	if initialValueMax == nil then initialValueMax = 1; end
	if initialNegatives == nil then initialNegatives = false; end
    if TimiRandom == nil then initialNegatives = false; end
	local vert = UI.CreateVerticalLayoutGroup(rootParent);

	horz = {};

    horz[1] = UI.CreateHorizontalLayoutGroup(vert);
	
	UI.CreateLabel(horz[1]).SetText('Maximum subtraction per bonus');
    numberInputFieldMin = UI.CreateNumberInputField(horz[1])
		.SetSliderMinValue(0)
		.SetSliderMaxValue(10)
		.SetValue(initialValueMin);
	
	horz[2] = UI.CreateHorizontalLayoutGroup(vert);
	UI.CreateLabel(horz[2]).SetText('Maximum addition per bonus');
    numberInputFieldMax = UI.CreateNumberInputField(horz[2])
		.SetSliderMinValue(0)
		.SetSliderMaxValue(10)
		.SetValue(initialValueMax);

	UI.CreateLabel(vert).SetText("Sets bonus values of bonuses of size n to n-1 or n-2 with 50% chance. Overwrites maximum subtraction/addition per bonus.");

	TimiRandomCheckBox = UI.CreateCheckBox(vert).SetText('Play Timi Random').SetIsChecked(TimiRandom);


	UI.CreateLabel(vert).SetText("Normally, negative bonuses will not be modified and bonuses will not go negative.  However, you can check the \"Allow Negative Bonuses\" box to make this happen.");

	allowNegativeBonusesCheckBox = UI.CreateCheckBox(vert).SetText('Allow Negative Bonuses').SetIsChecked(initialNegatives);

	
end