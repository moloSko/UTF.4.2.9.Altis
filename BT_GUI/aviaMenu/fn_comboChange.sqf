private _display = findDisplay 51000;
private _ctrlList = _display displayCtrl 51004;
private _ctrlKick = _display displayCtrl 51006;
private _ctrlLevel = _display displayCtrl 51008;
private _ctrlAvia = _display displayCtrl 51010;
private _ctrlTank = _display displayCtrl 51012;
private _ctrlGreen = _display displayCtrl 51014;

{
    _x cbSetChecked false;
} forEach [_ctrlLevel,_ctrlKick,_ctrlAvia,_ctrlTank,_ctrlGreen];

private _index = _this # 1;

lbClear _ctrlList;
private _pilots = [];

switch (_index) do {
    case 0: {
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach allPlayers;
    };
    case 1: {
        ["avia_t_h"] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_AVIA_T_H",[]])) > 1
        };
        _pilots = player getVariable ["MENU_AVIA_T_H",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
    case 2: {
        ["avia_t_p"] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_AVIA_T_P",[]])) > 1
        };
        _pilots = player getVariable ["MENU_AVIA_T_P",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
    case 3: {
        ["avia_b_h"] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_AVIA_B_H",[]])) > 1
        };
        _pilots = player getVariable ["MENU_AVIA_B_H",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
    case 4: {
        ["avia_b_p"] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_AVIA_B_P",[]])) > 1
        };
        _pilots = player getVariable ["MENU_AVIA_B_P",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
};