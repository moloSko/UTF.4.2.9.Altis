params ["_killed","_killer1","_instigator","_score"];

diag_log format["ADDSCORE %1",_killer1];

if (!(isPlayer _killer1) && !(isPlayer _instigator)) exitWith {};

//Синие превенцыя ТК
if (side player == west) then {
    if (side group _killed == side _instigator) exitwith {
        [_killed, _instigator] spawn blu_fnc_preventTK;
    };
};

private _slot = _killer1 getVariable ["slot","null"];
private _killer = objNull;
if (_slot == "null") then {
    _slot = _instigator getVariable ["slot","null"];
    _killer = _instigator;
} else {
    _killer = _killer1;
};
diag_log format["ADDSCORE %1",_killer];
private _isMan = _killed isKindOf "Man";
private _isHeli = _killed isKindOf "Helicopter";
private _isPlain = _killed isKindOf "Plain";
private _isCar = _killed isKindOf "Car";
private _isTank = _killed isKindOf "Tank";
private _isShip = _killed isKindOf "Ship";
private _leader = leader (group _killer);
private _isLeader = if (_leader == _killer) then {true} else {false};
private _nsh = NASH;
private _isnsh = if (_nsh == _killer) then {true} else {false};
private _distance = 0;
private _crew = objNull;
private _role = "";

_score = 0;

switch (true) do {
    case _isShip: {
        _score = 6;
        switch (_slot) do {
            case "pilot": {
                _score = 3;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            case "tankman": {
                _score = 4.5;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            case "antitank": {
                _score = 4.5;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            default {
                [_killer,_score] spawn bt_fnc_addExp;
            };
        };
        
        if !(_isLeader) then {
            [_leader,_score * 0.2] spawn bt_fnc_addExp;
        }; 

        if !(_isnsh) then {
            [_nsh,_score * 0.2] spawn bt_fnc_addExp;
        };
    };
    case _isCar: {
        _score = 6;
        switch (_slot) do {
            case "pilot": {
                _score = 3;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            case "tankman": {
                _score = 3;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            case "antitank": {
                _score = 4.5;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            default {
                [_killer,_score] spawn bt_fnc_addExp;
            };
        };

        if !(_isLeader) then {
            [_killer,_score * 0.2] spawn bt_fnc_addExp;
        }; 

        if !(_isnsh) then {
            [_nsh,_score * 0.2] spawn bt_fnc_addExp;
        };
    };
    case _isTank: {
        _score = 9;
        switch (_slot) do {
            case "pilot": {
                _score = 3;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            case "tankman": {
                _score = 3;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            case "antitank": {
                _score = 6;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            default {
                [_killer,_score] spawn bt_fnc_addExp;
            };
        };

        if !(_isLeader) then {
            [_leader,_score * 0.2] spawn bt_fnc_addExp;
        }; 
        if !(_isnsh) then {
            [_nsh,_score * 0.2] spawn bt_fnc_addExp;
        };
    };
    case _isHeli: {
        _score = 6;
        switch (_slot) do {
            case "pilot": {
                _score = 3;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            case "tankman": {
                _score = 6;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            case "antitank": {
                _score = 4.5;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            default {
                [_killer,_score] spawn bt_fnc_addExp;
            };
        };

        if !(_isLeader) then {
            [_killer,_score * 0.2] spawn bt_fnc_addExp;
        }; 

        if !(_isnsh) then {
            [_nsh,_score * 0.2] spawn bt_fnc_addExp;
        };
    };
    case _isPlain: {
        _score = 9;
        switch (_slot) do {
            case "pilot": {
                _score = 3;
                [_killer, _score] spawn bt_fnc_addExp;
            };
            case "tankman": {
                _score = 6;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            case "antitank": {
                _score = 6;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            default {
                [_killer,_score] spawn bt_fnc_addExp;
            };
        };
        
        if !(_isLeader) then {
            [_leader,_score * 0.2] spawn bt_fnc_addExp;
        }; 
        
        if !(_isnsh) then {
            [_nsh,_score * 0.2] spawn bt_fnc_addExp;
        };
    };
    case _isMan: {
        diag_log format["ADDSCORE %1 isMan",name _killer];
        _score = 4.5;
        switch (_slot) do {
            case "pilot": {
                diag_log format["ADDSCORE %1 slot %2",name _killer,_slot];
                _score = 0.6;
                [_killer, _score] spawn bt_fnc_addExp;
            };
            case "tankman": {
                _score = 0.8;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            case "sniper": {
                diag_log format["ADDSCORE %1 slot %2",name _killer,_slot];
                _score = 0.6;
                _distance = _killer distance _killed;
                if (_distance <= 1000) then {
                    _score = 0.6;
                    [_killer,_score] spawn bt_fnc_addExp;
                    diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
                } else {
                    _score = _score * _distance / 1000;
                    [_killer,_score] spawn bt_fnc_addExp;
                    diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
                };
            };
            case "antitank": {
                diag_log format["ADDSCORE %1 slot %2",name _killer,_slot];
                _score = 3;
                [_killer,_score] spawn bt_fnc_addExp;
                diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
            };
            case "medic": {
                diag_log format["ADDSCORE %1 slot %2",name _killer,_slot];
                _score = 3;
                [_killer,_score] spawn bt_fnc_addExp;
                diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
            };
            default {
                diag_log format["ADDSCORE %1 slot %2",name _killer,_slot];
                _score = 4.5;
                [_killer,_score] spawn bt_fnc_addExp;
                diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
            };
        };

        if !(_isLeader) then {
            [_leader,_score * 0.2] spawn bt_fnc_addExp;
            diag_log format["ADDSCORE %1 addScore %2",name _leader,_score];
        }; 
        if !(_isnsh) then{
            [_nsh,_score * 0.2] spawn bt_fnc_addExp;
        };
    };
};