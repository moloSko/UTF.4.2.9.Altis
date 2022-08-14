[] spawn {_this call compile preProcessFileLineNumbers"s_player\init.sqf";};
player setVariable ["SaveInventory",false]; 
if (side player == east) then {
    [player] call srv_fnc_variableDefaultLoadOut;
} else {
    [player] call srv_fnc_variableDefaultLoadOutrp;
};
//проверка на мод ССУ апграйд
if(isClass(configFile / "CfgPatches" / "SSU_Protective_Gear_Upgrade")) exitWith {
    hint "Выгрузите модификацию SSU_Protective_Gear_Upgrade";
    sleep 10;
    endMission"END1"
};

//проверка на мод Doomsday Kozlice
if(isClass(configFile / "CfgPatches" / "Doomsday Kozlice")) exitWith {
    hint "Выгрузите модификацию Doomsday Kozlice";
    sleep 10;
    endMission"END1"
};
//------------------------------------------------------------------------------------------------------------

[] call srv_fnc_diary;

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

if(isNil {Gamer getVariable format ["ArrayactAllremovalVeh_%1",getPlayerUID player]}) then {
 Gamer SetVariable [format ["ArrayactAllremovalVeh_%1",getPlayerUID player],[],true];
};


waitUntil {!isNull player};
sleep 5;

[] call srv_fnc_NewTask;

player addEventHandler ["GetInMan", {[_this select 2] execVM "s_player\kp_fuel_consumption.sqf";}];
if (side player == east) then {
    player addeventhandler ["respawn",{_this spawn srv_fnc_respawn}];
} else {
    player addeventhandler ["respawn",{_this spawn srv_fnc_respawnrp}];
};

[] spawn {_this call compile preProcessFileLineNumbers "scripts\heliRearRamp.sqf";};                                // Block rear ramp actions for non-pilots
[] spawn {_this call compile preProcessFileLineNumbers "scripts\stickyCharge.sqf";};                                // Sticky C4 logic
[] spawn {_this call compile preProcessFileLineNumbers "scripts\outlw_magRepack\MagRepack_init_sv.sqf"};            // Magazines repack                // Magazines repack
[] spawn {_this call compile preProcessFileLineNumbers "scripts\tow\tow.sqf";};                                     // TOW land vehicles
[] spawn {_this call compile preProcessFileLineNumbers "scripts\disableThermal.sqf";};                              // Thermal vision restrictions
[] spawn {
	bt_fnc_deh_keDown = compile preprocessFileLineNumbers "s_player\deh_keydown.sqf";
	bt_fnc_deh_keUp = compile preprocessFileLineNumbers "s_player\deh_keyUp.sqf";
    disableSerialization;
    waitUntil {!isNull(findDisplay 46)};
    (findDisplay 46) displayAddEventHandler ["keyDown", "_this call TB_fnc_keyDown"];
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call bt_fnc_deh_keDown"];
	(findDisplay 46) displayAddEventHandler ["keyUp", "_this call bt_fnc_deh_keUp"];
};

player addEventHandler ["Fired", {
    if (_this select 4 == "DemoCharge_Remote_Ammo") then {
        [_this select 0] call C4_Attach;
    };
}];

[missionNamespace, "arsenalClosed", {    
    {
        _x removeAction (_x getVariable ['bis_fnc_arsenal_action', -1]);
    } forEach [arsenal1, arsenal2, box_arsenal_1, box_arsenal_2, box_arsenal_3];
    ["AmmoboxExit", player] call TB_fnc_arsenal; 
	[player] spawn TB_fnc_applyRestrictions;
    player removeAction (player getVariable ['bis_fnc_arsenal_action', -1]);
}] call BIS_fnc_addScriptedEventHandler;

[missionNamespace, "arsenalOpened", {
    disableSerialization;
    _display = _this select 0;
    _display displayAddEventHandler ["KeyDown", "if ((_this select 1) in [19,24,29,31,46,47]) then {true}"];
    {
        ( _display displayCtrl _x ) ctrlSetText "";
        ( _display displayCtrl _x ) ctrlRemoveAllEventHandlers "buttonclick";
    } forEach [44150, 44148, 44149];
    {
        _x removeAction (_x getVariable ['bis_fnc_arsenal_action', -1]);
    } forEach [arsenal1, arsenal2, box_arsenal_1, box_arsenal_2, box_arsenal_3];
}] call BIS_fnc_addScriptedEventHandler;