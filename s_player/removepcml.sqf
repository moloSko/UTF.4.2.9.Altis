while {true} do
{
	sleep 60;
	{
		if (side _x == west) then
		{
			_pcml = ["launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F","launch_Titan_short_F","launch_B_Titan_short_tna_F","launch_NLAW_F"];
			_sw = secondaryWeapon _x;
			if (_sw in _pcml) then
			{
				_x removeWeapon _sw;
				sleep 1;
				_x addWeapon "launch_RPG32_F";
				sleep 1;
				_x addMagazines ["RPG32_F", 1];
			};
		};
	} forEach allUnits;
};