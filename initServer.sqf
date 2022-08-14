diag_log "++++++++++++++++++++++++++++++++++старт сервера++++++++++++++++++++++++++++++++";
diag_log "++++++++++++++++++++++++++++++++++старт сервера++++++++++++++++++++++++++++++++";

[] execVM "HPAwesomeQuery.sqf";

addMissionEventHandler ["PlayerDisconnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner"];
	missionNamespace setVariable [format ["TIMEDIS_%1",_uid],true,true];
}];

missionNamespace setVariable ["IgrokVIgre",[],true];

onPlayerConnected "[_uid,_name] spawn srv_fnc_PlayerConnected";

addMissionEventHandler ["HandleDisconnect",{_this spawn srv_fnc_playerdisconnected}];
missionNamespace setVariable ["shof", false, true];
null = [] spawn Srv_fnc_init_fps;
["Initialize"] call BIS_fnc_dynamicGroups;

//Wether and timeskip
_numbers = [1,3,5,7,8,9,10,11,12,13,14,15,16,13,15,17,19];
_numbers = _numbers call BIS_fnc_arrayShuffle;
_numbers = _numbers call BIS_fnc_arrayShuffle;
_num = selectRandom _numbers;
skipTime _num;
_nms = [0.25,0,0,0.5,0.8];
_nms = _nms call BIS_fnc_arrayShuffle;
_nms = _nms call BIS_fnc_arrayShuffle;
_nm = selectRandom _nms;
0 setRain _nm;
_nm = selectRandom _nms;
0 setOvercast _nm;
forceWeatherChange;


//------------------Установки НШ--------------------
missionNamespace setVariable ["3pw", false,true];
missionNamespace setVariable ["stamina", false,true];
missionNamespace setVariable ["traska", false,true];
missionNamespace setVariable ["MapNV", false,true];


if(PointSelectionMethod == 0) then {
    [] spawn srv_fnc_createPoint;
} else {
if(!_NoPoints) then {[] spawn srv_fnc_createPoint};
};
sleep 1;
switch AirPatrol do {
    case 1:{};
    case 2:{[selectRandom EnemyAir,2] spawn srv_fnc_enemyairCycle};
	case 3:{[selectRandom EnemyHelli,3] spawn srv_fnc_enemyairCycle};
	case 4:{
		if((random 10)>5) then {
			[selectRandom EnemyAir,2] spawn srv_fnc_enemyairCycle;
		} else {
			[selectRandom EnemyHelli,3] spawn srv_fnc_enemyairCycle;
		};
	};
};
//---------------------------------------------------добавление зевсу видимость
if (isServer) then
{
	[] spawn 
	{
		while {true} do
		{
			{
				_x addCuratorEditableObjects [allUnits, true];
				_x addCuratorEditableObjects [vehicles, true];
			} forEach allCurators; 
		sleep 2;
		};
	};
};
//---------------------------------------------------------------------------------------------------------------------------
[] spawn bt_db_fnc_selectData;