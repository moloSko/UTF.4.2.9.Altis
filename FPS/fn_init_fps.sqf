if(!isServer) exitWith {};

for "_i" from 0 to 1 step 0 do
{
  sleep 1;
  [round diag_fps] remoteexeccall ["Srv_fnc_missionfps"];
};