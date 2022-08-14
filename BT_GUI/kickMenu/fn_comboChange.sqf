private _display = findDisplay 55000;
private _ctrlList = _display displayCtrl 55004;

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
};