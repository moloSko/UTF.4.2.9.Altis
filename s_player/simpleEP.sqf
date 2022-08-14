if (soundVolume == 1) then {
	1 fadeSound 0.1;
	player setVariable ["EARS",true];
} else {
	1 fadeSound 1;
	player setVariable ["EARS",false];
};
