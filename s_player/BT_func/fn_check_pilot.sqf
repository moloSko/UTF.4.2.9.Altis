private _player = _this # 0;

_player addEventHandler ["GetInMan", {
	params ["_player","_role","_vehicle"];
	private _level = _player getVariable ["LEVEL",1];
	private _className = typeOf _vehicle;
	private _avia_t_1 = missionNamespace getVariable ["AVIA_T_1",[]];
	private _avia_t_2 = missionNamespace getVariable ["AVIA_T_2",[]];
	private _avia_b_1 = missionNamespace getVariable ["AVIA_B_1",[]];
	private _avia_b_2 = missionNamespace getVariable ["AVIA_B_2",[]];
	private _tank_1 = missionNamespace getVariable ["TANK_1",[]];
	private _tank_2 = missionNamespace getVariable ["TANK_2",[]];
	private _tank_3 = missionNamespace getVariable ["TANK_3",[]];
	private _tank_4 = missionNamespace getVariable ["TANK_4",[]];
	private _dopusk = 0;	

	//OPFOR vehicle checker
	If (PlayerSide == east)  then {
	//Parachute check
	if (_className != "Steerable_Parachute_F") then {
	if ((_role == "driver") || (_role == "gunner") || (_role == "commander")) then {
		if (_level == 1) exitWith {
			"Место водителя не доступно Новобранцам!" remoteExec ["hint",_player];
			moveOut _player;
		};
		switch (true) do {
			case ((_avia_t_1 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _player in ["O_helipilot_F","O_T_Medic_F","I_medic_F","O_T_Pilot_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_player];
					moveOut _player;
				} else {
					_dopusk = _player getVariable ["AVIA_T_H",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_player];
						moveOut _player;
					};
					_player setVariable ["INSKY",true];
					[_player,_vehicle] spawn BT_fnc_time_in_sky;
				};
			};
			case ((_avia_t_2 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _player in ["O_helipilot_F","O_T_Medic_F","I_medic_F","O_T_Pilot_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_player];
					moveOut _player;
				} else {
					_dopusk = _player getVariable ["AVIA_T_P",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_player];
						moveOut _player;
					};
					_player setVariable ["INSKY",true];
					[_player,_vehicle] spawn BT_fnc_time_in_sky;
				};
			};
			case ((_avia_b_1 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _player in ["O_helipilot_F","O_T_Medic_F","I_medic_F","O_T_Pilot_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_player];
					moveOut _player;
				} else {
					_dopusk = _player getVariable ["AVIA_B_H",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_player];
						moveOut _player;
					};
					_player setVariable ["INSKY",true];
					[_player,_vehicle] spawn BT_fnc_time_in_sky;
				};
			};
			case ((_avia_b_2 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _player in ["O_helipilot_F","O_T_Medic_F","I_medic_F","O_T_Pilot_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_player];
					moveOut _player;
				} else {
					_dopusk = _player getVariable ["AVIA_B_P",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_player];
						moveOut _player;
					};
					_player setVariable ["INSKY",true];
					[_player,_vehicle] spawn BT_fnc_time_in_sky;
				};
			};

			case ((_tank_1 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _player in ["O_soldierU_medic_F","O_soldierU_repair_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_player];
					moveOut _player;
				} else {
					_dopusk = _player getVariable ["TANK_1",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_player];
						moveOut _player;
					};
					_player setVariable ["INVEH",true];
					//[_player,_vehicle] spawn BT_fnc_time_in_veh;
				};
			};
			case ((_tank_2 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _player in ["O_soldierU_medic_F","O_soldierU_repair_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_player];
					moveOut _player;
				} else {
					_dopusk = _player getVariable ["TANK_2",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_player];
						moveOut _player;
					};
					_player setVariable ["INVEH",true];
					//[_player,_vehicle] spawn BT_fnc_time_in_veh;
				};
			};
			
			case ((_tank_3 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _player in ["O_soldierU_medic_F","O_soldierU_repair_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_player];
					moveOut _player;
				} else {
					_dopusk = _player getVariable ["TANK_3",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_player];
						moveOut _player;
					};
					_player setVariable ["INVEH",true];
					//[_player,_vehicle] spawn BT_fnc_time_in_veh;
				};
			};
			case ((_tank_4 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _player in ["O_soldierU_medic_F","O_soldierU_repair_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_player];
					moveOut _player;
				} else {
					_dopusk = _player getVariable ["TANK_4",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_player];
						moveOut _player;
					};
					_player setVariable ["INVEH",true];
					//[_player,_vehicle] spawn BT_fnc_time_in_veh;
				};
			};
		}; 
	};
	};
	};
}];

_player addEventHandler ["SeatSwitchedMan", {
	params ["_unit1","_unit2","_vehicle"];
	private _level = _unit1 getVariable ["LEVEL",1];
	private _className = typeOf _vehicle;
	private _avia_t_1 = missionNamespace getVariable ["AVIA_T_1",[]];
	private _avia_t_2 = missionNamespace getVariable ["AVIA_T_2",[]];
	private _avia_b_1 = missionNamespace getVariable ["AVIA_B_1",[]];
	private _avia_b_2 = missionNamespace getVariable ["AVIA_B_2",[]];
	private _tank_1 = missionNamespace getVariable ["TANK_1",[]];
	private _tank_2 = missionNamespace getVariable ["TANK_2",[]];
	private _tank_3 = missionNamespace getVariable ["TANK_3",[]];
	private _tank_4 = missionNamespace getVariable ["TANK_4",[]];
	private _dopusk = 0;
    _role = assignedVehicleRole player;	
	//OPFOR vehicle checker
	If (PlayerSide == east)  then {
	//Parachute check
	if (_className != "Steerable_Parachute_F") then {
	if (("driver" in _role) || ("turret" in _role) || ("turret path" in _role)) then {
		if (_level == 1) exitWith {
			"Место водителя не доступно Новобранцам!" remoteExec ["hint",_unit1];
			moveOut _unit1;
		};
		switch (true) do {
			case ((_avia_t_1 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _unit1 in ["O_helipilot_F","O_T_Medic_F","I_medic_F","O_T_Pilot_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_unit1];
					moveOut _unit1;
				} else {
					_dopusk = _unit1 getVariable ["AVIA_T_H",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_unit1];
						moveOut _unit1;
					};
					_unit1 setVariable ["INSKY",true];
					[_unit1,_vehicle] spawn BT_fnc_time_in_sky;
				};
			};
			case ((_avia_t_2 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _unit1 in ["O_helipilot_F","O_T_Medic_F","I_medic_F","O_T_Pilot_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_unit1];
					moveOut _unit1;
				} else {
					_dopusk = _unit1 getVariable ["AVIA_T_P",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_unit1];
						moveOut _unit1;
					};
					_unit1 setVariable ["INSKY",true];
					[_unit1,_vehicle] spawn BT_fnc_time_in_sky;
				};
			};
			case ((_avia_b_1 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _unit1 in ["O_helipilot_F","O_T_Medic_F","I_medic_F","O_T_Pilot_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_unit1];
					moveOut _unit1;
				} else {
					_dopusk = _unit1 getVariable ["AVIA_B_H",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_unit1];
						moveOut _unit1;
					};
					_unit1 setVariable ["INSKY",true];
					[_unit1,_vehicle] spawn BT_fnc_time_in_sky;
				};
			};
			case ((_avia_b_2 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _unit1 in ["O_helipilot_F","O_T_Medic_F","I_medic_F","O_T_Pilot_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_unit1];
					moveOut _unit1;
				} else {
					_dopusk = _unit1 getVariable ["AVIA_B_P",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_unit1];
						moveOut _unit1;
					};
					_unit1 setVariable ["INSKY",true];
					[_unit1,_vehicle] spawn BT_fnc_time_in_sky;
				};
			};

			case ((_tank_1 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _unit1 in ["O_soldierU_medic_F","O_soldierU_repair_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_unit1];
					moveOut _unit1;
				} else {
					_dopusk = _unit1 getVariable ["TANK_1",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_unit1];
						moveOut _unit1;
					};
					_unit1 setVariable ["INVEH",true];
					//[_unit1,_vehicle] spawn BT_fnc_time_in_veh;
				};
			};
			case ((_tank_2 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _unit1 in ["O_soldierU_medic_F","O_soldierU_repair_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_unit1];
					moveOut _unit1;
				} else {
					_dopusk = _unit1 getVariable ["TANK_2",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_unit1];
						moveOut _unit1;
					};
					_unit1 setVariable ["INVEH",true];
					//[_unit1,_vehicle] spawn BT_fnc_time_in_veh;
				};
			};
			
			case ((_tank_3 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _unit1 in ["O_soldierU_medic_F","O_soldierU_repair_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_unit1];
					moveOut _unit1;
				} else {
					_dopusk = _unit1 getVariable ["TANK_3",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_unit1];
						moveOut _unit1;
					};
					_unit1 setVariable ["INVEH",true];
					//[_unit1,_vehicle] spawn BT_fnc_time_in_veh;
				};
			};
			case ((_tank_4 findIf {(toLower (_x # 0)) == (toLower _className)}) >= 0): {
				if !(typeOf _unit1 in ["O_soldierU_medic_F","O_soldierU_repair_F"]) then {
					"Вы не на том слоте" remoteExec ["hint",_unit1];
					moveOut _unit1;
				} else {
					_dopusk = _unit1 getVariable ["TANK_4",0];
					if (_dopusk == 0) exitWith {
						"У Вас нет  допуска" remoteExec ["hint",_unit1];
						moveOut _unit1;
					};
					_unit1 setVariable ["INVEH",true];
					//[_unit1,_vehicle] spawn BT_fnc_time_in_veh;
				};
			};
		}; 
	};
	};
	};
}];

_player addEventHandler ["SeatSwitchedMan", {
	params ["_unit1","_unit2","_vehicle"];
		if (PlayerSide == west) exitWith {
			"Вы не можете занимать технику" remoteExec ["hint",_unit1];
			moveOut _unit1;
		}; 
}];


_player addEventHandler ["GetInMan", {
	params ["_player","_role","_vehicle"];
	private _className = typeOf _vehicle;
		if (PlayerSide == west) then {
		if (_className != "Steerable_Parachute_F") exitWith {
			"Вы не можете занимать технику" remoteExec ["hint",_player];
			moveOut _player;
		};
		};
}];


_player addEventHandler ["GetOutMan", {
	params ["_player","_role","_vehicle"];
	_player setVariable ["INSKY",false];
	_player setVariable ["INVEH",false];
}];