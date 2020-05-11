function Server_Created(game, settings)
    local overriddenBonuses = {};
	local MapID = game.Map.ID;
	
    for _, bonus in pairs(game.Map.Bonuses) do
	
	    -- Hardcoded cases for the INSS maps
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
		
		--skip negative bonuses unless AllowNegative was checked
		if (bonus.Amount > 0 or Mod.Settings.AllowNegative) and Allowed then 
		    if Mod.Settings.TimiRandom then
			    local BonusSize = 0;
				for _,_ in pairs( bonus.Territories ) do
					BonusSize = BonusSize + 1;
				end
				newBonusValueRandomized = math.random(BonusSize - 2, BonusSize - 1);
			else 
			    newBonusValueRandomized = bonus.Amount + math.random(-Mod.Settings.RandomizeAmountMin, Mod.Settings.RandomizeAmountMax);
			end
			if (newBonusValueRandomized ~= bonus.Amount) then --don't do anything if we're not changing the bonus.  We could leave this check off and it would work, but it would show up in Settings as an overridden bonus when it's not.

				-- don't take a positive or zero bonus negative unless AllowNegative was checked.
				if (newBonusValueRandomized < 0 and not Mod.Settings.AllowNegative) then
					newBonusValueRandomized = 0;
				end

				-- -1000 to +1000 is the maximum allowed range for overridden bonuses, never go beyond that
				if (newBonusValueRandomized < -1000) then newBonusValueRandomized = -1000 end;
				if (newBonusValueRandomized > 1000) then newBonusValueRandomized = 1000 end;
		
				overriddenBonuses[bonus.ID] = newBonusValueRandomized;
			end
		end
    end

    settings.OverriddenBonuses = overriddenBonuses;

end