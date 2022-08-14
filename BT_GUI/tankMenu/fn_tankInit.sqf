private _isAdmin = player getVariable ["TANK",0];;

if (_isAdmin == 0) exitWith {
    hint "У вас нет доступа к панели Командира танкистов";
};

createDialog "bt_tank_menu";

waitUntil {!(isNull (findDisplay 52000))};

private _display = findDisplay 52000;

private _ctrlCombo = _display displayCtrl 52003;
private _ctrlList = _display displayCtrl 52004;

private _index = 0;

private _comboText = ["Онлайн","Легкая бронетехника","Тяжелая бронетехника"];

for "_c" from 0 to ((count _comboText) - 1) do {
    _index = _ctrlCombo lbAdd (_comboText # _c);
};

_ctrlCombo lbSetCurSel 0;
