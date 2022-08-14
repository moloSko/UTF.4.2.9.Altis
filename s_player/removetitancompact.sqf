while {true} do
{
	sleep 10;
	{
			_titan = ["","launch_Vorona_base_F","launch_O_Titan_short_ghex_F","launch_O_Titan_ghex_F","launch_B_Titan_tna_F","launch_O_Vorona_brown_F","launch_NLAW_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F","launch_Titan_short_F","launch_B_Titan_short_tna_F","launch_O_vorona_green_F","launch_O_Vorona_green_F"];
			_sw = secondaryWeapon _x;
			if (_sw in _titan) then
			{
				_x removeWeapon _sw;
				sleep 1;
			};
	} forEach playableUnits;
};