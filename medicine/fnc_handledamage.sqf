#define MAX_SAFE_DAMAGE	0.9
_unit       = _this select 0;
_damage     = _this select 2;
_instigator = _this select 6;

if ((vehicle _unit) != _unit) then {
	_damage = _damage * 0.5;
};

_totalDamage = _damage + (damage _unit);
if (!(_unit getVariable ["isUnconscious", false])) then {
	if (_totalDamage >= MAX_SAFE_DAMAGE) then {
		_damage = MAX_SAFE_DAMAGE;
      	[_unit, _instigator] spawn fnc_setunconscious;
		[_unit] spawn fnc_300w;
	};	
} else {
	if (_totalDamage >= MAX_SAFE_DAMAGE) then {
		_damage = 0;
	};
};
_damage;