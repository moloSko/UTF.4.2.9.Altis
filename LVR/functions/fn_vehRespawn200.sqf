if ( ! ( isServer ) ) exitWith {};

// SET SCOPE OF LOCAL VARIABLES
private ["_veh","_abandonDelay","_destroyedDelay","_vehInit","_vehName","_vehDir","_vehPos","_vehtype","_abandoned","_dead","_vehpyl","_unit"];

// PASSED ARGUMENTS ( OBJECT, ABANDONED DELAY, DESTROYED DELAY )
_veh = 			 [_this, 0, objNull, [objNull]] call BIS_fnc_param; 
_abandonDelay =  	 [_this, 1, 60, [0]] call BIS_fnc_param; 
_destroyedDelay =	 [_this, 2, 60, [0]] call BIS_fnc_param; 
_vehInit =        [_this, 3, {}, [{}] ] call BIS_fnc_param;
_unit = player;

[_veh] call TB_fnc_addDoorsAction;

_veh addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_killer,-5] spawn bt_fnc_addExp;
}];


// STORE THE VEHICLES NAME, DIRECTION, POSITION AND TYPE
_vehName =        vehicleVarName _veh;
_vehDir = 		 getDir _veh; 
_vehPos = 		 getPos _veh; 
_vehtype = 		 typeOf _veh; 
_vehpyl = 		 GetPylonMagazines _veh;
_item = getItemCargo _veh;
_weapon = getWeaponCargo _veh;
_magazine = getMagazineCargo _veh;
_backpack = getBackpackCargo _veh;
[_veh, _item, _weapon, _magazine, _backpack] call TB_fnc_initVehicle;

_textures = getObjectTextures _veh;
_anim_names = animationNames _veh;

_arr_anim = [];
{
	_phase = _veh animationPhase _x;
	_arr_anim pushBack [_x,_phase];
}foreach _anim_names;

// START LOOP TO MONITOR THE VEHICLE
while { true } Do {

	sleep 1;
	
	if (_abandonDelay !=0 && ( alive _veh ) /*&& { ( canMove _veh )*/ && { { ( alive _x ) } count ( crew _veh ) == 0 } ) then {
	
		_abandoned = true;
		
		//_veh_pos = getPos _veh;
		{
			if (_x distance2D _veh < 200) exitWith {_abandoned = false;};
		}foreach playableUnits;

		
		// IF THE VEHICLE IS ABANDONED AND ISN'T CLOSE TO IT'S STARTING POSITION THEN DELETE IT AND CREATE A NEW ONE AT THE STARTING POSITION
		if ( ( _abandoned ) && { _veh distance2D _vehPos > 10 } && { _unit distance2D _veh > 200 } ) then {
			deleteVehicle _veh;
			sleep 1;
			_veh = createVehicle [ _vehtype, _vehPos, [], 0, "CAN_COLLIDE" ];
			_veh setDir _vehDir;
			_veh setPos [ ( _vehPos select 0 ), ( _vehPos select 1 ), 0 ];
			_veh setVariable ["dnt_remove_me",true];
			_veh call _vehInit;
			[_veh] call TB_fnc_addDoorsAction;
			[_veh, _item, _weapon, _magazine, _backpack] call TB_fnc_initVehicle;
			if (_vehName != "") then {
				missionNamespace setVariable [_vehName, _veh];
				publicVariable _vehName;
			};
			_veh addEventHandler ["Killed", {
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				[_killer,-5] spawn bt_fnc_addExp;
			}];

			_count = 0;
			{
				_veh setObjectTextureGlobal [ _count, _x ];
				_count = _count + 1;
			} forEach _textures;
			{
				_veh animate [(_x select 0), (_x select 1),true]; 
			}forEach _arr_anim;
			_pylons = _vehpyl;
			_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
			{ _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _veh;
			{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
			if (typeOf _veh in ["O_UAV_02_dynamicLoadout_F","O_UGV_01_rcws_F"]) then {
				createVehicleCrew _veh;
			};
		};
	};
	
	// IF THE VEHICLE IS DESTROYED OR IF IT CAN'T MOVE THEN ITS DEAD
	if ( !( alive _veh )) then {
	
		_dead = true;

			// COUNTDOWN THE DEAD DELAY - STALL SCRIPT HERE
			for "_i" from 0 to _destroyedDelay do {  
			
				// IF THE VEHICLE ISN'T EMPTY, OR IF IT CAN MOVE ( HAS BEEN REPAIRED ) THEN IT'S NOT DEAD SO EXIT THE COUNTDOWN EARLY - CONTINUE THE SCRIPT
				if ( { ( alive _x ) } count ( crew _veh ) > 0 || { ( canMove _veh ) } ) exitWith { _dead = false; };
				sleep 1;  
				
			};
		 
		// IF THE VEHICLE IS DEAD THEN DELETE IT AND CREATE A NEW ONE AT THE STARTING POSITION
		if ( _dead ) then {
			deleteVehicle _veh;
			sleep 1;
			_veh = createVehicle [ _vehtype, _vehPos, [], 0, "CAN_COLLIDE" ];
			_veh setDir _vehDir;
			_veh setPos [ ( _vehPos select 0 ), (_vehPos select 1 ), 0 ];
			_veh setVariable ["dnt_remove_me",true];
			_veh call _vehInit;
			[_veh] call TB_fnc_addDoorsAction;
			[_veh, _item, _weapon, _magazine, _backpack] call TB_fnc_initVehicle;
			if (_vehName != "") then {
				missionNamespace setVariable [_vehName, _veh];
				publicVariable _vehName;
			};
			_veh addEventHandler ["Killed", {
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				[_killer,-5] spawn bt_fnc_addExp;
			}];

			_count = 0;
			{
				_veh setObjectTextureGlobal [ _count, _x ];
				_count = _count + 1;
			} forEach _textures;
			{
				_veh animate [(_x select 0), (_x select 1),true]; 
			}forEach _arr_anim;
			_pylons = _vehpyl;
			_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
			{ _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _veh;
			{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
			if (typeOf _veh in ["O_UAV_02_dynamicLoadout_F","O_UGV_01_rcws_F"]) then {
				createVehicleCrew _veh;
			};
		};
	};
};
