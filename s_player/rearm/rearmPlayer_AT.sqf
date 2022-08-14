removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player addWeapon "arifle_Katiba_F";
player addPrimaryWeaponItem "optic_Aco";
player addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
player addWeapon "launch_MRAWS_olive_F";
player addSecondaryWeaponItem "MRAWS_HEAT_F";
player addWeapon "hgun_Rook40_F";
player addHandgunItem "16Rnd_9x21_Mag";

player forceAddUniform "U_I_CombatUniform";
player addVest "V_PlateCarrierIA1_dgtl";
player addBackpack "B_Kitbag_rgr";

player addWeapon "Binocular";

player addItemToUniform "NVGoggles_INDEP";
for "_i" from 1 to 2 do {player addItemToUniform "16Rnd_9x21_Mag";};
player addItemToVest "MineDetector";
for "_i" from 1 to 8 do {player addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 5 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 7 do {player addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 3 do {player addItemToBackpack "MRAWS_HEAT_F";};
player addHeadgear "H_HelmetIA";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";