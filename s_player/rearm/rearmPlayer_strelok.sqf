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
for "_i" from 1 to 4 do {player addItemToUniform "16Rnd_9x21_Mag";};
player addVest "V_PlateCarrierIA1_dgtl";
for "_i" from 1 to 12 do {player addItemToVest "30Rnd_65x39_caseless_green";};
player addItemToUniform "16Rnd_9x21_Mag";
player addBackpack "B_Kitbag_rgr";
for "_i" from 1 to 7 do {player addItemToBackpack "FirstAidKit";};
player addHeadgear "H_HelmetIA";

player addWeapon "arifle_Katiba_F";
player addPrimaryWeaponItem "optic_Aco";
player addWeapon "hgun_Rook40_F";
player addWeapon "Binocular";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";