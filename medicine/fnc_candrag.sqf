private ["_target","_return"];
_target = _this select 0;
_return = false;
if ((!(player getVariable "isDrag")) && (_target isKindOf "Man") && (alive _target) && (_target getVariable "isUnconscious") && !(_target getVariable "isCarryed") && !(_target getVariable "isDragged") && (_target distance player < 2)) then 
{
	_return = true;
};
_return;