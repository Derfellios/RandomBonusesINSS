function Server_Created(game, settings)
    local overriddenBonuses = {};
	local MapID = game.Map.ID;
	
    for _, bonus in pairs(game.Map.Bonuses) do
		--skip negative bonuses unless AllowNegative was checked
		local Allowed = true;
		if MapID == 69965 then
			if bonus.ID > 42 then
				Allowed = false;
			end	
		elseif MapID == 81206 then
			if bonus.ID > 30 then
				Allowed = false;
			end	
		end
		if (bonus.Amount > 0 or Mod.Settings.AllowNegative) and Allowed then 
			local rndAmount = math.random(-Mod.Settings.RandomizeAmountMin, Mod.Settings.RandomizeAmountMax);

			if (rndAmount ~= 0) then --don't do anything if we're not changing the bonus.  We could leave this check off and it would work, but it show up in Settings as an overridden bonus when it's not.

				local newValue = bonus.Amount + rndAmount;

				-- don't take a positive or zero bonus negative unless AllowNegative was checked.
				if (newValue < 0 and not Mod.Settings.AllowNegative) then
					newValue = 0;
				end

				-- -1000 to +1000 is the maximum allowed range for overridden bonuses, never go beyond that
				if (newValue < -1000) then newValue = -1000 end;
				if (newValue > 1000) then newValue = 1000 end;
		
				overriddenBonuses[bonus.ID] = newValue;
			end
		end
    end

    settings.OverriddenBonuses = overriddenBonuses;

end