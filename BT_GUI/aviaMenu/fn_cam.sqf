closeDialog 51000;

private _pos = [14528.5,16155.8,26];
private _dir = 288;
private _camera = "CamCurator" camcreate _pos;

_camera cameraeffect ["internal", "back"];
_camera camPreparePos _pos;
_camera camCommitPrepared 0;
_camera setPosATL _pos;
_camera setDir _dir;

player setVariable ["CAMERA",_camera];

camKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
    private _key = _this # 1;
    private _camera = player getVariable "CAMERA";
    private _return = false;

    if (_key == 1) then {
        _camera cameraEffect ["terminate", "back"];
        camDestroy _camera;
        _return = true;
    };

    _return
}];

while {!isNull _camera} do {
    uiSleep 0.1;
    if !((getPos _camera) inArea [[14759,16397,0],2000,2000,0,false]) then {
        _camera setPosATL _pos;
        _camera setDir _dir;
    };
};

(findDisplay 46) displayRemoveEventHandler ["keyDown",camKeyDown];
