private _display = findDisplay 57000;
private _ctrlList = _display displayCtrl 57004;
private _ctrlKick = _display displayCtrl 57006;
private _ctrlLevel = _display displayCtrl 57008;
private _ctrlAvia = _display displayCtrl 57010;
private _ctrlTank = _display displayCtrl 57012;
private _ctrlGreen = _display displayCtrl 57014;

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
        //callToBD на наличие кик панели
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (allPlayers select {(_x getVariable ["KICK",0]) > 0});
    };
    case 2: {
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (allPlayers select {(_x getVariable ["LEVEL_A",0]) > 0});
    };
    case 3: {
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (allPlayers select {(_x getVariable ["AVIA",0]) > 0});
    };
    case 4: {
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (allPlayers select {(_x getVariable ["TANK",0]) > 0});
    };
    case 5: {
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (allPlayers select {(_x getVariable ["GREEN_A",0]) > 0});
    };
};