private ["_unit","_chute"];
_unit = _this select 0;
moveOut _unit;
_unit allowDamage false;
waitUntil {position _unit select 2 <=70};
_chute = createVehicle ["Steerable_Parachute_F", position _unit, [], 0, "NONE"];
_chute setDir getDir _unit;
_unit moveInDriver _chute;
_unit allowDamage true;
waitUntil {position _unit select 2 <1};
deleteVehicle _chute;