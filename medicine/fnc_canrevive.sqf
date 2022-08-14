_target = _this select 0;
_return = false;
if (_target isKindOf "Man" && (alive _target) && _target getVariable "isUnconscious" &&  !(_target getVariable "isBleeding") &&  !(_target getVariable "isDragged") &&  !(_target getVariable "isCarryed") && _target distance player < 2) then 
{
	if (player call fnc_isMedic) then
	{
		if ((items player) find "Medikit" != -1) then
		{
			_return = true;
		};
	};
};
_return;