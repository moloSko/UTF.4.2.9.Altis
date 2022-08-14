private _display = findDisplay 52000;
private _ctrlList = _display displayCtrl 52004;
private _ctrlKick = _display displayCtrl 52006;
private _ctrlLevel = _display displayCtrl 52008;
private _ctrlAvia = _display displayCtrl 52010;
private _ctrlTank = _display displayCtrl 52012;
private _ctrlGreen = _display displayCtrl 52014;
private _pilots = [];

{
    _x cbSetChecked false;
} forEach [_ctrlLevel,_ctrlKick,_ctrlAvia,_ctrlTank,_ctrlGreen];

private _index = _this # 1;

lbClear _ctrlList;

switch (_index) do {
    case 0: {
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach allPlayers;
    };
    case 1: {
        ["tank_1"] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_TANK_1",[]])) > 1
        };
        _pilots = player getVariable ["MENU_TANK_1",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
    case 2: {
        ["tank_2"] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_TANK_2",[]])) > 1
        };
        _pilots = player getVariable ["MENU_TANK_2",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
    case 3: {
        ["tank_3"] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_TANK_3",[]])) > 1
        };
        _pilots = player getVariable ["MENU_TANK_3",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
};