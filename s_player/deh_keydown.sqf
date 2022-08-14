private _key = _this # 1;
private _keys = [59,60,61];
private _return = false;

if !(_key in _keys) exitWith {_return};

_return = true;

switch (_key) do {
    case 59: {
        [] spawn fnc_sepa;
    };
    case 60: {
        player action ["SWITCHWEAPON",player,player,-1];
    };
    case 61: {
        if (player getVariable ["circleMenuOpen",false]) exitWith {_return};
        [] spawn bt_gui_fnc_circleMenuOpen;
    };
};

_return