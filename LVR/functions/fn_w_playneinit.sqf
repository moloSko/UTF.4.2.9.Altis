_this addEventHandler ["GETIN", {if ((_this select 1 == "driver" || _this select 1 == "gunner") && typeOf (_this select 2) !="O_Pilot_F") then {_this select 2 action ["GETOUT",_this select 0];}}];
