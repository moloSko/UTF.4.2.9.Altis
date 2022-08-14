//ФПС
if(!local player) exitWith {};
if(!clientstart) exitWith {};
disableSerialization;

private _disp = uiNamespace getVariable "DisplayFps";
if (isNil "_disp" || {isNull _disp}) then {
 "DisplayFps" cutRsc ["DisplayFps", "PLAIN"];
 _disp = uiNamespace getVariable "DisplayFps";
};
//сервер
(_disp displayCtrl 50) ctrlSetText str (param  [0]);
//клиент
(_disp displayCtrl 51) ctrlSetText str (round (diag_fps));




 

