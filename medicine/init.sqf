fnc_handledamage = compile preprocessFile "medicine\fnc_handledamage.sqf";
fnc_setunconscious = compile preprocessFile "medicine\fnc_setunconscious.sqf";
fnc_revive = compile preprocessFile "medicine\fnc_revive.sqf";
fnc_canrevive = compile preprocessFile "medicine\fnc_canrevive.sqf";
fnc_canreviveveh = compile preprocessFile "medicine\fnc_canreviveveh.sqf";
fnc_candrag = compile preprocessFile "medicine\fnc_candrag.sqf";
fnc_isMedic = compile preprocessFile "medicine\fnc_isMedic.sqf";
fnc_drag = compile preprocessFile "medicine\fnc_drag.sqf";
fnc_canunload = compile preprocessFile "medicine\fnc_canunload.sqf";
fnc_unload = compile preprocessFile "medicine\fnc_unload.sqf";
fnc_canload = compile preprocessFile "medicine\fnc_canload.sqf";
fnc_load = compile preprocessFile "medicine\fnc_load.sqf";
fnc_cancarry = compile preprocessFile "medicine\fnc_cancarry.sqf";
fnc_carry = compile preprocessFile "medicine\fnc_carry.sqf";
fnc_canbandage= compile preprocessFile "medicine\fnc_canbandage.sqf";
fnc_bandage= compile preprocessFile "medicine\fnc_bandage.sqf";
block_key = compile preprocessFile "medicine\fnc_blockkey.sqf";
fnc_rearm = compile preprocessFile "medicine\fnc_rearm.sqf";
fnc_canrearm = compile preprocessFile "medicine\fnc_canrearm.sqf";
fnc_300w = compile preprocessFile "medicine\fnc_300w.sqf";

unc_work = false;
icw_work = false;

player setCaptive 0;
(findDisplay 46) displayRemoveAllEventHandlers "keyDown";
inGameUISetEventHandler ["Action",""];
player removeAllEventHandlers "HandleDamage";
player setVariable ["isUnconscious", false, true];
player setVariable ["isBleeding", false, true];
player setVariable ["Blood", 1000, true];
player setVariable ["isDragged", false, true];
player setVariable ["isCarryed", false, true];
player setVariable ["isHostage",false,true];
player setVariable ["isDrag",false,true];
player setVariable ["KillHitPoint", 1000, true];




player enableAI "ALL";
id_down = "none";
id_up = "none";
player addEventHandler["HandleDamage",
{
	_this call fnc_handledamage;
}];

[player, "<t color='#ff0000'>Первая помощь</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", "[cursorTarget] call fnc_canrevive", "(items player) find 'Medikit' != -1", {}, {hint "Лечение"}, {[player,cursorTarget] spawn fnc_revive;}, { hint "Вам нужна аптечка" }, [], 10, nil, false, false] call BIS_fnc_holdActionAdd;//remoteExec ["BIS_fnc_holdActionAdd", 0, player];
[player, "<t color='#ff0000'>Первая помощь</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", "[cursorTarget] call fnc_canreviveveh", "true", {}, {hint "Лечение"}, {[player,cursorTarget] spawn fnc_revive;}, { hint "" }, [], 10, nil, false, false] call BIS_fnc_holdActionAdd;
[player, "<t color='#ff0000'>Обезоружить</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa", "[cursorTarget] call fnc_canrearm", "true", {}, {hint "Отбираю оружие"}, {[cursorTarget] spawn fnc_rearm;}, { hint "" }, [], 5, nil, false, false] call BIS_fnc_holdActionAdd;
[player, "<t color='#ff0000'>Остановить кровотечение</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa", "[cursorTarget] call fnc_canbandage", "(items player) find 'FirstAidKit' != -1", {}, {hint "Перевязка"}, {[player,cursorTarget] spawn fnc_bandage;}, { hint "Вам нужен перевязочный пакет" }, [], 5, nil, false, false] call BIS_fnc_holdActionAdd;//remoteExec ["BIS_fnc_holdActionAdd", 0, player];
player addAction [ "<t color='#ff0000'>Тащить</t>",{[player,cursorTarget] spawn fnc_drag;}, nil, 1, false, true, "", "[cursorTarget] call fnc_candrag"];
player addAction [ "<t color='#ff0000'>Нести</t>",{[player,cursorTarget] spawn fnc_carry;}, nil, 1, false, true, "", "[cursorTarget] call fnc_cancarry"];
player addAction [ "<t color='#ff0000'>Выгрузить</t>",{[cursorTarget] spawn fnc_unload;}, nil, 1, false, true, "", "[cursorTarget] call fnc_canunload"];
player addAction [ "<t color='#ff0000'>Загрузить</t>",{[cursorTarget] spawn fnc_load;}, nil, 1, false, true, "", "[cursorTarget] call fnc_canload"];

//------------------Установки НШ--------------------
missionNamespace getVariable ["stamina", []];
missionNamespace getVariable ["traska", []];
missionNamespace getVariable ["3pw", []];
[] remoteExec ["srv_fnc_stamina"];

addMissionEventHandler ["Draw3D",
{
	_3d_distance    = 200;
	_3d_icon_size   = 1;
	_3d_icon_color_bleed  = [1,0,0,1];
	_3d_icon_color  = [1,0.4,0,1];
	{
		if (((_x distance player) < _3d_distance) && _x getVariable "isUnconscious" && _x getVariable "isBleeding" && (side (group _x) == playerSide)) then
		{
			drawIcon3D["\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",_3d_icon_color_bleed,_x,_3d_icon_size,_3d_icon_size,0,format["%1 (%2м)", name _x, floor (player distance _x)],1,0.04];
		};
		if (((_x distance player) < _3d_distance) && _x getVariable "isUnconscious" && !(_x getVariable "isBleeding") && (side (group _x) == playerSide)) then
		{
			drawIcon3D["\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",_3d_icon_color,_x,_3d_icon_size,_3d_icon_size,0,format["%1 (%2м)", name _x, floor (player distance _x)],1,0.04];
		};
	}foreach playableUnits;
}];

player addEventHandler ["Respawn",
{
	unc_work = false;
	icw_work = false;
	player setCaptive 0;
	player setVariable ["isUnconscious", false, true];
	player setVariable ["isBleeding", false, true];
	player setVariable ["isDragged", false, true];
	player setVariable ["isCarryed", false, true];
	player setVariable ["Blood", 1000, true];
	player setVariable ["isHostage", false, true];
	player setVariable ["isDrag",false,true];
	player setVariable ["KillHitPoint", 1000, true];
	player setvariable ["UCW", false, true];

//синии настройки
if (side player == west) then {

    player enableFatigue true;
    player enableStamina true; 
    player setCustomAimCoef 1;
    player addRating -9900;
    [] spawn blu_fnc_dzoneil;
};

	
	(findDisplay 46) displayRemoveAllEventHandlers "keyDown";

	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call bt_fnc_deh_keDown"];
	
	if (!(id_up isEqualTo "none")) then
	{	
		(findDisplay 46) displayRemoveEventHandler ["keyUp",id_up];
	};
	
	id_up = "none";
	player addEventHandler["HandleDamage",
	{
		_this call fnc_handledamage;
	}];

	inGameUISetEventHandler ["Action",""];
	[player, "<t color='#ff0000'>Первая помощь</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", "[cursorTarget] call fnc_canrevive", "(items player) find 'Medikit' != -1", {}, {hint "Лечение"}, {[player,cursorTarget] spawn fnc_revive;}, { hint "Вам нужна аптечка" }, [], 10, nil, false, false] call BIS_fnc_holdActionAdd;
	[player, "<t color='#ff0000'>Первая помощь</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", "[cursorTarget] call fnc_canreviveveh", "true", {}, {hint "Лечение"}, {[player,cursorTarget] spawn fnc_revive;}, { hint "" }, [], 10, nil, false, false] call BIS_fnc_holdActionAdd;
	[player, "<t color='#ff0000'>Обезоружить</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa", "[cursorTarget] call fnc_canrearm", "true", {}, {hint "Отбираю оружие"}, {[cursorTarget] spawn fnc_rearm;}, { hint "" }, [], 5, nil, false, false] call BIS_fnc_holdActionAdd;
	[player, "<t color='#ff0000'>Остановить кровотечение</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa", "[cursorTarget] call fnc_canbandage", "(items player) find 'FirstAidKit' != -1", {}, {hint "Перевязка"}, {[player,cursorTarget] spawn fnc_bandage;}, { hint "Вам нужен перевязочный пакет" }, [], 5, nil, false, false] call BIS_fnc_holdActionAdd;
	player addAction [ "<t color='#ff0000'>Тащить</t>",{[player,cursorTarget] spawn fnc_drag;}, nil, 1, false, true, "", "[cursorTarget] call fnc_candrag"];
	player addAction [ "<t color='#ff0000'>Нести</t>",{[player,cursorTarget] spawn fnc_carry;}, nil, 1, false, true, "", "[cursorTarget] call fnc_cancarry"];
	player addAction [ "<t color='#ff0000'>Выгрузить</t>",{[cursorTarget] spawn fnc_unload;}, nil, 1, false, true, "", "[cursorTarget] call fnc_canunload"];
	player addAction [ "<t color='#ff0000'>Загрузить</t>",{[cursorTarget] spawn fnc_load;}, nil, 1, false, true, "", "[cursorTarget] call fnc_canload"];
	
	//------------------Установки НШ--------------------
	missionNamespace getVariable ["stamina", []];
	missionNamespace getVariable ["traska", []];
	missionNamespace getVariable ["3pw", []];
	[] remoteExec ["srv_fnc_stamina"];
}];