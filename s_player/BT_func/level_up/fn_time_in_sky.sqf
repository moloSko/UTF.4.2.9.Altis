params ["_player","_vehicle"];
private _exp = 1;

waitUntil {
	(((getPos _player) # 2) > 10)
};

while {!(isTouchingGround _vehicle) && (alive _vehicle) && (alive _player) && (player in _vehicle)} do {
	uiSleep 120;
	[_player,_exp] spawn bt_fnc_addExp;
	_leader = leader (group _player);
	if (_leader != _player) then {
		[_leader,0.1] spawn bt_fnc_addExp;
	};
};