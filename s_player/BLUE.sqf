uiSleep 10;

private _level = player getVariable ["LEVEL",1];
if (playerSide == west) then {
	if ( east countSide allPlayers < 20 ) then {
		hint "Игроков мало для деятельности синей стороны. Смените слот";
		sleep 2;
		"end1" call BIS_fnc_endMission;
	} else {
		if (_level < 1) then {
		hint "Синяя сторона доступна от звания Рядовой и выше! Смените слот!";
		"end1" call BIS_fnc_endMission;		
	} else {
		hint format["Приветствую %1! Защити район от UTF!", name player];	
	};
	};
};