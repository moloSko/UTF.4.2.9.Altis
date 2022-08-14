enableSaving [false,false];

enableSentences false;//отключение радио докладов

//---------------------------ускорение времени ночью
_time = [] spawn {_this call compile preProcessFileLineNumbers "time.sqf"};
[] spawn {_this call compile preProcessFileLineNumbers "medicine\heal.sqf"};

_posangar = getMarkerPos "marker_angar";
(_posangar nearestObject 491010) allowDamage false;
(_posangar nearestObject 491093) allowDamage false;
(_posangar nearestObject 490956) allowDamage false;


if (isServer) then {
	
	fnc_cleanup = compileFinal preprocessFileLineNumbers "s_player\cleanup.sqf";
	_null1 = [
		[worldSize/2,worldSize/2,0],
		worldSize/2,
		0,
		0.1,
		false,
		600
	] spawn fnc_cleanup;
	
	fnc_cleanupbase = compileFinal preprocessFileLineNumbers "s_player\cleanupbase.sqf";
	_null2 = [
		"delallbase",
		((getMarkerSize "delallbase") call BIS_fnc_greatestNum),
		0,
		0.1,
		false,
		120
	] spawn fnc_cleanupbase;
};
/* Реклама платёжки
_reklama = [] spawn {
	while {true} do {
		uiSleep 600;
		[east,"HQ"] sideChat "Наши контакты и реквизиты для помощи проекту Вы найдете на карте";
	};
};
*/
west setFriend [resistance, 0];

{
    _x params [["_chan",-1,[0]], ["_noText","true",[""]], ["_noVoice","true",[""]]];
    _chan enableChannel [(_noText != "true"), (_noVoice != "true")];
} forEach getArray (missionConfigFile >> "disableChannels");
[] call TB_fnc_createChannels;

{
		_x addEventHandler ["CuratorObjectPlaced", {
			params ["_curator", "_entity"];
			switch (true) do {
				case (_entity isKindOf "Man"): {
					_entity addEventHandler ["Killed",{
						params ["_unit", "_killer", "_instigator", "_useEffects"];
						[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
					}];
					/*{
						_entity addEventHandler ["Killed",{
							params ["_unit", "_killer", "_instigator", "_useEffects"];
							[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
						}];
					} forEach (_entity);*/
				};
				case (_entity isKindOf "Car"): {
					_entity addEventHandler ["Killed",{
						params ["_unit", "_killer", "_instigator", "_useEffects"];
						[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
					}];
					{
						_entity addEventHandler ["Killed",{
							params ["_unit", "_killer", "_instigator", "_useEffects"];
							[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
						}];
					} forEach (crew _entity);
				};
				case (_entity isKindOf "Tank"): {
					_entity addEventHandler ["Killed",{
						params ["_unit", "_killer", "_instigator", "_useEffects"];
						[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
					}];
					{
						_entity addEventHandler ["Killed",{
							params ["_unit", "_killer", "_instigator", "_useEffects"];
							[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
						}];
					} forEach (crew _entity);
				};
				case (_entity isKindOf "Helicopter"): {
					_entity addEventHandler ["Killed",{
						params ["_unit", "_killer", "_instigator", "_useEffects"];
						[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
					}];
					{
						_entity addEventHandler ["Killed",{
							params ["_unit", "_killer", "_instigator", "_useEffects"];
							[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
						}];
					} forEach (crew _entity);
				};
				case (_entity isKindOf "Plane"): {
					_entity addEventHandler ["Killed",{
						params ["_unit", "_killer", "_instigator", "_useEffects"];
						[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
					}];
					{
						_entity addEventHandler ["Killed",{
							params ["_unit", "_killer", "_instigator", "_useEffects"];
							[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
						}];
					} forEach (crew _entity);
				};
				case (_entity isKindOf "Ship"): {
					_entity addEventHandler ["Killed",{
						params ["_unit", "_killer", "_instigator", "_useEffects"];
						[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
					}];
					{
						_entity addEventHandler ["Killed",{
							params ["_unit", "_killer", "_instigator", "_useEffects"];
							[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
						}];
					} forEach (crew _entity);
				};
			};
		}];	
} forEach allCurators;
del = false;