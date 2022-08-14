private _display = findDisplay 54000;
private _ctrlList = _display displayCtrl 54004;

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
        [9] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_LEVEL",[]])) > 1
        };
        _pilots = player getVariable ["MENU_LEVEL",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
    case 2: {
        [10] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_LEVEL",[]])) > 1
        };
        _pilots = player getVariable ["MENU_LEVEL",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
    case 3: {
        [11] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_LEVEL",[]])) > 1
        };
        _pilots = player getVariable ["MENU_LEVEL",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
    case 4: {
        [12] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_LEVEL",[]])) > 1
        };
        _pilots = player getVariable ["MENU_LEVEL",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
    case 5: {
        [13] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_LEVEL",[]])) > 1
        };
        _pilots = player getVariable ["MENU_LEVEL",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
    case 6: {
        [14] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_LEVEL",[]])) > 1
        };
        _pilots = player getVariable ["MENU_LEVEL",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
    case 7: {
        [15] remoteExecCall ["bt_db_fnc_getDataForMenu",2];
        waitUntil {
            uiSleep 0.1;
            (count (player getVariable ["MENU_LEVEL",[]])) > 1
        };
        _pilots = player getVariable ["MENU_LEVEL",[]];
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (_x # 0);
            _ctrlList lbSetData [_forEachIndex,(_x # 1)];
        } forEach _pilots;
    };
};