waitUntil {alive player};
removeAllPrimaryWeaponItems player;
removeAllHandgunItems player;
removeAllWeapons player;
removeGoggles player;
removeHeadgear player;
removeAllAssignedItems player;
removeAllItems player;
{ player removeMagazine _x } forEach magazines player;
clearAllItemsFromBackpack player;
removeBackpack player;
removeUniform player;
removeVest player;
[player] call srv_fnc_variableDefaultLoadOutrp;
