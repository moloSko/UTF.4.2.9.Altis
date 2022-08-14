// заставка
[] spawn {
	scriptName "initMission.hpp: mission start";
	["pics\intro.ogv"] spawn BIS_fnc_titlecard;	
	waitUntil {!(isNil "BIS_fnc_titlecard_finished")};   
};
if (player != player) then {waitUntil {player == player};}; 


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


SZNE = true;
_trg = createTrigger ["EmptyDetector", getPos zon, false]; 
_trg setTriggerArea [800, 300, 10, true]; 
_trg setTriggerActivation ["WEST", "PRESENT", true]; 
_trg setTriggerStatements ["this", "SZNE = FALSE", "SZNE = TRUE"];
_trg setTriggerInterval 10;

// бессмертные зоны на Базе и на Стрельбище
[] spawn {
	while {true} do {
		if (SZNE) then {
			if ((player inArea "BaseDammage") || (player inArea "BaseDammage_1")) then {
				player allowDamage false;
			} else {
				player allowDamage true;
			};
		};
		if !(SZNE) then {
			if ((player inArea "BaseDammage") || (player inArea "BaseDammage_1")) then {
				player allowDamage true;	
			} else {
				player allowDamage true;
			};
		};
		uiSleep 4;
	};
};

pereh = false;

//проверка пилотов и танкистов
if (side player == east) then {
	[player] spawn BT_fnc_check_pilot;
};

[] spawn {_this call compile preprocessFileLineNumbers "s_player\GREEN.sqf";};
[] spawn {_this call compile preprocessFileLineNumbers "s_player\BLUE.sqf";};
[] spawn {_this call compile preProcessFileLineNumbers "medicine\init.sqf";};
[] spawn {_this call compile preProcessFileLineNumbers "s_player\icons.sqf";};
[] spawn {_this call compile preProcessFileLineNumbers "s_player\diary.sqf";};
[] spawn {_this call compile preProcessFileLineNumbers "s_player\icons_base.sqf";};
[] spawn {_this call compile preProcessFileLineNumbers "s_player\icons3d.sqf";};
[] spawn {_this call compile preProcessFileLineNumbers "s_player\veh_icons.sqf";};
[] spawn {_this call compile preProcessFileLineNumbers "s_player\heli_ropes_script\init.sqf";};
 

//синии настройки
if (side player == west) then {
[player] spawn BT_fnc_check_pilot;

    player enableFatigue true;
    player enableStamina true; 
    player setCustomAimCoef 1;
    player addRating -9990;
    [] spawn blu_fnc_dzoneil;
};




serverFPS = 0;
fnc_para = compile preprocessFile "s_player\para.sqf";
onkey_spect_terminate = compile preprocessFile "s_player\onkey_spect_terminate.sqf";
fnc_sepa = compile preprocessFileLineNumbers "s_player\simpleEP.sqf";
[player, [player, "Var_SavedBK"]] call BIS_fnc_saveInventory;
[player] spawn {player call compile preProcessFileLineNumbers "s_player\teplak.sqf";};

player addAction [ "<t color='#ffa200'>Выпрыгнуть с парашютом</t>",{[player] spawn fnc_para;}, 0, 100, false, true, "", "(getpos player select 2 > 70) and (vehicle player != player)"];

player addEventHandler ["Respawn", {
	/*
	player setCustomAimCoef 0;
	player enableFatigue false;
	player enableStamina false;
	*/
	player addRating 9999;
	1 fadeSound 1;
	showSubtitles false;
	player setSpeaker "NoVoice";
	player addAction [ "<t color='#ffa200'>Выпрыгнуть с парашютом</t>",{[player] spawn fnc_para;}, 0, 100, false, true, "", "(getpos player select 2 > 70) and (vehicle player != player)"];
}];

/*
player setCustomAimCoef 0;
player enableFatigue false;
player enableStamina false;
*/
//------------------Установки НШ--------------------
missionNamespace getVariable ["stamina", []];
missionNamespace getVariable ["traska", []];
missionNamespace getVariable ["3pw", []];
[] remoteExec ["srv_fnc_stamina"];

player addRating 9999;
showSubtitles false;
player setSpeaker "NoVoice";


[] spawn {
	while {true} do
	{
		sleep 10;
		showSubtitles false;
		player setSpeaker "NoVoice";
	};
};

[] spawn bt_gui_fnc_init;
[] spawn bt_pdata_fnc_playerGetData;



if ( typeOf player in ["O_G_medic_F"] ) then { [] spawn {_this call compile preProcessFileLineNumbers "s_player\nscomp.sqf";}};
if ( typeOf player in ["O_T_Medic_F", "O_T_Pilot_F"] ) then { [] spawn {_this call compile preProcessFileLineNumbers "s_player\dispcomp.sqf";}};
private _isNSH = player getVariable ["NSH",false];
private _cap = player getVariable ["NSH",true];
private _isInstruktor = player getVariable ["INSTRUKTOR",false];

waitUntil {
	uiSleep 0.1;
	((player getVariable ["LEVEL",0]) > 0)
};
private _level = player getVariable ["LEVEL",1];
waitUntil {
	uiSleep 0.1;
	((count (player getVariable ["slot",""])) > 0)
};

private _slot = player getVariable ["slot","rifleman"];
player setVariable ["slot",_slot,true];
if (_isNSH && (_level < 10)) exitWith {
	hint "Слот Начальника Штаба доступен со звания Лейтенант и выше! Смените слот!";
	uiSleep 10;

	["Слот Начальника Штаба доступен со звания Лейтенант и выше! Смените слот!",false,true,false,false] call BIS_fnc_endMission;
};
/*
if (_isInstruktor && (_level < 10)) exitWith {
	hint "Слот Инструктора доступен со звания Лейтенант и выше! Смените слот!";
	uiSleep 10;

	["Слот Инструктора доступен со звания Лейтенант и выше! Смените слот!",false,true,false,false] call BIS_fnc_endMission;
};
*/
switch (_slot) do {
	case "medic": {
		if (_level < 3) then {
			hint "Слот Медика доступен со звания мл.сержант и выше! Смените слот!";
			uiSleep 10;

			["Слот Медика доступен со звания мл.сержант и выше! Смените слот!",false,true,false,false] call BIS_fnc_endMission;
		};
	};
	case "engineer": {
		if (_level < 3) then {
			hint "Слот Инженера доступен со звания мл.сержант и выше! Смените слот!";
			uiSleep 10;

			["Слот Инженера доступен со звания мл.сержант и выше! Смените слот!",false,true,false,false] call BIS_fnc_endMission;
		};
	};
	case "sniper": {
		if (_level < 3) then {
			hint "Слот Снайпера доступен со звания мл.сержант и выше! Смените слот!";
			uiSleep 10;

			["Слот Снайпера доступен со звания мл.сержант и выше! Смените слот!",false,true,false,false] call BIS_fnc_endMission;
		};
	};
	case "pilot": {
		if (_level < 3) then {
			hint "Слот Пилота доступен со звания мл.сержант и выше! Смените слот!";
			uiSleep 10;

			["Слот Пилота доступен со звания мл.сержант и выше! Смените слот!",false,true,false,false] call BIS_fnc_endMission;
		};
	};
	case "tankman": {
		if (_level < 3) then {
			hint "Слот Танкиста доступен со звания мл.сержант и выше! Смените слот!";
			uiSleep 10;

			["Слот Танкиста доступен со звания мл.сержант и выше! Смените слот!",false,true,false,false] call BIS_fnc_endMission;
		};
	};
};
//8 kanal??
private _channels = [1,3,4,6,7,8];
if (side player == east) then {
	if (_level == 1) then {
		{
			_x enableChannel false;
		} forEach _channels;

		uiSleep 1;

		setCurrentChannel 5;

		waitUntil {
			uiSleep 3;
			(((player getVariable ["LEVEL",1]) > 1) || (player != player))
		};

		{
			_x enableChannel true;
		} forEach _channels;
	};
};

If (side player != West) then {
while {player == player} do {
	uiSleep 3;
	if ((player getVariable ["LEVEL",1]) > 1) exitWith {
		{
			_x enableChannel true;
		} forEach _channels;
	};
};
};

//bluechannels
private _BC = [3,4];
If (side player == West) then {
while {player == player} do {
	uiSleep 3;
	if ((player getVariable ["LEVEL",1]) > 1) exitWith {
		{
			_x enableChannel true;
		} forEach _BC;
	};
};
};


//0 enableChannel [true, false]; 