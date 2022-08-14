addMissionEventHandler ["Draw3D", {
	{
		if ((cursorTarget == vehicle _x) && ((vehicle player) distance _x < 50) && (side (group _x) == playerSide)) then
		{
			_clr = [0,1,0,1];
			_pos = vehicle _x modelToWorld (vehicle _x selectionPosition "camera");
			if (_x getVariable "isUnconscious") then
			{
				if (_x getVariable "isBleeding") then
				{
					_clr = [1,1,0,1];
				} else
				{
					_clr = [1,0.4,0,1];
				};
			};
						
			if (vehicle _x == _x && {side _x == east}) then 
			{
				_level = _x getVariable ["LEVEL",1];
				_bt_zvanie = _level call bt_fnc_getZvanie;
				_vt = roleDescription _x ;
				drawIcon3D
				[
					'',
					_clr,
					_pos,
					0,
					0,
					getdir player,
					format ["%1 %2",_bt_zvanie,name _x],
					2,
					0.04,
					'EtelkaMonospaceProBold'
				];
			} else
			{
				_pos = position (vehicle _x);
				_pos set [2, (((vehicle _x) modelToWorld [0,0,0]) select 2) + 1];
				_tx = format ["%1",(name vehicle _x)];
				_clr = [0,1,0,1];
				if ((count crew (vehicle _x)) > 1) then 
				{
					_tx = format ["%1 + [%2]",(name vehicle _x),(count crew (vehicle _x))-1];
				};
				drawIcon3D
				[
					'',
					_clr,
					_pos,
					0,
					0,
					getdir player,
					_tx,
					2,
					0.04,
					'EtelkaMonospaceProBold'
				];
			};
		};
	} count Playableunits - [player];
}];
