private _display = findDisplay 52000;
private _ctrlList = _display displayCtrl 52004;
private _index = lbCurSel _ctrlList;
private _valueData = _this # 1;
private _value = _this # 0 # 1;

private _uid = _ctrlList lbData _index;
private _player = _uid call BIS_fnc_getUnitByUid;

_player setVariable [toUpper _valueData,_value,true];

[_uid,_valueData,_value] remoteExecCall ["bt_db_fnc_changePlayer",2];