removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_I_CombatUniform";
player addItemToUniform "NVGoggles_INDEP";
player addItemToUniform "MineDetector";
player addVest "V_PlateCarrierIAGL_dgtl";
for "_i" from 1 to 9 do {player addItemToVest "30Rnd_65x39_caseless_green";};
player addBackpack "B_Kitbag_rgr";
for "_i" from 1 to 7 do {player addItemToBackpack "FirstAidKit";};
player addItemToBackpack "Medikit";
for "_i" from 1 to 15 do {player addItemToBackpack "SmokeShell";};
player addHeadgear "H_HelmetIA";

player addWeapon "arifle_Katiba_F";
player addPrimaryWeaponItem "optic_Aco";
player addWeapon "Binocular";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";