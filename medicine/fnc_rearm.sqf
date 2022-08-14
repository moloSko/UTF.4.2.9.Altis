_patient = _this select 0;

sleep 0.5;
_patient remoteExec ["removeAllWeapons"];
_patient remoteExec ["removeAllItems"];
_patient remoteExec ["removeVest"];
_patient remoteExec ["removeBackpack"];
_patient remoteExec ["removeHeadgear"];
_patient remoteExec ["removeGoggles"];
[_patient] joinSilent (group player);