_target = _this select 0;
_return = false;
{
if ((player distance _target < 2) && (side _target != playerSide) && (alive _target) && (side (group _target) != playerSide) && (isPlayer _target)) then 
{
	_return = true;
};
} forEach playableUnits;
_return;