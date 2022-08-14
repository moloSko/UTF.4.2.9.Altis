/*
Author: ToxaBes
Description: apply restrictions for player
*/
_player = _this select 0;
_uniform = [];
_vest = [];
_backpack = [];
_headgear = [];
_items = [];
_optics = [];
_handgunWeapon = [];
_secondaryWeapon = [];
_primaryWeapon = [];
_muzzles = [];
_pointers = []; 
_bipods = [];
_googles = [];
_skip = false;
_type = typeOf _player;
switch (_type) do { 
	case "O_engineer_F" : { //engineer
        #include "..\s_player\arsenal\engineer.sqf"
    }; 
    case "O_medic_F",
    case "O_G_medic_F" : {  //medic
        #include "..\s_player\arsenal\medic.sqf"    
    };
    case "O_soldier_M_F" : { //sniper
        #include "..\s_player\arsenal\sniper.sqf"
    };
    case "O_Soldier_F" : { //strelok
        #include "..\s_player\arsenal\rifleman.sqf"
    };
    case "O_Soldier_AR_F" : { //support
        #include "..\s_player\arsenal\support.sqf"
    };
    case "O_Sharpshooter_F" : { //marksman
        #include "..\s_player\arsenal\marksman.sqf"
    };
    case "O_T_Medic_F";  // dispetcher
    case "O_helipilot_F";  // heli pilot
    case "O_T_Pilot_F" : { //pilot
        #include "..\s_player\arsenal\pilot.sqf"
    };
    case "O_soldierU_medic_F"; // tank commander
    case "O_soldierU_repair_F" : { // tank crew
        #include "..\s_player\arsenal\tankman.sqf"
    };
    case "O_Soldier_AA_F";
    case "O_Soldier_LAT_F" : {  // AT
        #include "..\s_player\arsenal\antitank.sqf"
    };    
    case "I_soldier_F";
    case "I_medic_F";
    case "I_engineer_F" : { // green
        #include "..\s_player\arsenal\green.sqf"
    };
	default {
        _skip = true;
    }; 
};

if (_skip) exitWith {};

// uniform
_uni = format ["%1", toLower (uniform _player)];
if (_uni != "") then {
    _uniform = _uniform apply {toLower _x};
    if !(_uni in _uniform) then { 
        removeUniform _player;
        systemChat "Вы не можете использовать эту униформу!";
    };
};

// vest
_ve = format ["%1", toLower (vest _player)];
if (_ve != "") then {
    _vest = _vest apply {toLower _x};
    if !(_ve in _vest) then {
        removeVest _player;
        systemChat "Вы не можете использовать этот жилет!";
    };
};

// Backpacks
_back = format ["%1", toLower (backpack _player)];
if (_back != "" && _back != "b_parachute") then {
    _backpack = _backpack apply {toLower _x};
    if !(_back in _backpack) then {        
        removeBackpack _player;
        systemChat "Вы не можете использовать этот рюкзак!";
    };
};

// headgear
_head = format ["%1", toLower (headgear _player)];
if (_head != "") then {
    _headgear = _headgear apply {toLower _x};
    if !(_head in _headgear) then {
        removeHeadgear _player;
        systemChat "Вы не можете использовать этот головной убор!";
    };
};

// primary weapon
_pWeapon = format ["%1", toLower (primaryWeapon _player)];
if (_pWeapon != "") then {
    _primaryWeapon = _primaryWeapon apply {toLower _x};
    if !(_pWeapon in _primaryWeapon) then {
        _player removeWeapon (primaryWeapon _player);
        systemChat "Вы не можете исопльзовать это оружие!";
    };
};

// secondary weapon
_sWeapon = format ["%1", toLower (secondaryWeapon _player)];
if (_sWeapon != "") then {
    _secondaryWeapon = _secondaryWeapon apply {toLower _x};
    if !(_sWeapon in _secondaryWeapon) then {
        _player removeWeapon (secondaryWeapon _player);
        systemChat "Вы не можете использовать это оружие!";
    };
};

// handgun weapon
_hWeapon = format ["%1", toLower (handgunWeapon _player)];
if (_hWeapon != "") then {
    _handgunWeapon = _handgunWeapon apply {toLower _x};
    if !(_hWeapon in _handgunWeapon) then {
        _player removeWeapon (handgunWeapon _player);
        systemChat "Вы не можете использовать это оружие!";
    };
};

// attachments
// [silencer, laserpointer/flashlight, optics, bipod]
_attachments = primaryWeaponItems _player;

_silenser = format ["%1", toLower (_attachments select 0)];
if (_silenser != '') then {
    _muzzles = _muzzles apply {toLower _x};
    if !(_silenser in _muzzles) then {
        _player removePrimaryWeaponItem (_attachments select 0);
        systemChat "Вы не можете использовать глушитель!";
    };
};

_laserpointer = format ["%1", toLower (_attachments select 1)];
if (_laserpointer != '') then {
    _pointers = _pointers apply {toLower _x};
    if !(_laserpointer in _pointers) then {
        _player removePrimaryWeaponItem (_attachments select 1);
        systemChat "Вы не можете использовать целеуказатель!";
    };
};

_optic = format ["%1",  toLower (_attachments select 2)];
if (_optic != '') then {
    _optics = _optics apply {toLower _x};
    if !(_optic in _optics) then {
        _player removePrimaryWeaponItem (_attachments select 2);
        systemChat "Вы не можете использовать этот прицел!";
    };
};

_bipod = format ["%1", toLower (_attachments select 3)];
if (_bipod != '') then {
    _bipods = _bipods apply {toLower _x};
    if !(_bipod in _bipods) then {
        _player removePrimaryWeaponItem (_attachments select 3);
        systemChat "Вы не можете использовать сошки!";
    };
};

// goggles
_goggles = format ["%1", toLower (goggles _player)];
if (_goggles != "") then {
    _googles = _googles apply {toLower _x};
    if !(_goggles in _googles) then {
        removeGoggles _player;
        systemChat "Вы не можете использовать эти очки!";
    };
};

// items
_assignedItems = assignedItems _player;
_items = _items apply {toLower _x};
{
    _currentItem = _x;
    if !((toLower _currentItem) in _items) then {
        _player unassignItem _currentItem;
        _player unlinkItem _currentItem;
        _player removeItem _currentItem;
        systemChat "Вы не можете использовать этот предмет!";
        systemChat format ["%1", _currentItem];
    };
} forEach _assignedItems;