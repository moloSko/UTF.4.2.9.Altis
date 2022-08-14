removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "U_I_CombatUniform";
player addItemToUniform "NVGoggles_INDEP";
player addVest "V_PlateCarrierIA2_dgtl";
for "_i" from 1 to 2 do {player addItemToVest "200Rnd_65x39_cased_Box";};
for "_i" from 1 to 4 do {player addItemToVest "16Rnd_9x21_Mag";};
player addBackpack "B_Kitbag_rgr";
for "_i" from 1 to 1 do {player addItemToBackpack "200Rnd_65x39_cased_Box";};
for "_i" from 1 to 7 do {player addItemToBackpack "FirstAidKit";};
player addHeadgear "H_HelmetIA";

player addWeapon "LMG_Mk200_F";
player addPrimaryWeaponItem "optic_Holosight";
player addPrimaryWeaponItem "bipod_02_F_blk";
player addWeapon "hgun_Rook40_F";
player addWeapon "Binocular";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";