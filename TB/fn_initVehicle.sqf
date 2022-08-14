/*
Author: ToxaBes
Description: init cargo in vehicle
*/ 

_veh      = _this select 0;
_item     = _this select 1; 
_weapon   = _this select 2;
_magazine = _this select 3;
_backpack = _this select 4;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearItemCargoGlobal _veh;
_type = typeOf _veh;
switch (_type) do { 
	case "O_MBT_04_cannon_F";
    case "O_T_APC_Tracked_02_AA_ghex_F";
    case "O_MBT_02_cannon_F";
    case "I_MBT_03_cannon_F" : {        
        _veh addItemCargoGlobal ["Medikit",1];
        _veh addItemCargoGlobal ["ToolKit",1];
        _veh addItemCargoGlobal ["NVGoggles_INDEP",3];
        _veh addItemCargoGlobal ["FirstAidKit",10];
        _veh addItemCargoGlobal ["SmokeShellGreen",2];
        _veh addItemCargoGlobal ["SmokeShellOrange",2];
        _veh addItemCargoGlobal ["SmokeShellBlue",2];
        _veh addItemCargoGlobal ["O_IR_Grenade",2];
        _veh addItemCargoGlobal ["ItemGPS",1];
        _veh addBackpackCargoGlobal ["B_AssaultPack_dgtl",2];
        _veh addItemCargoGlobal ["ATMine_Range_Mag",4];
    }; 
	case "O_MBT_02_arty_F";
    case "B_T_AFV_Wheeled_01_up_cannon_F" : { 
        _veh addItemCargoGlobal ["Medikit",1];
        _veh addItemCargoGlobal ["ToolKit",1];
        _veh addItemCargoGlobal ["NVGoggles_INDEP",3];
        _veh addItemCargoGlobal ["FirstAidKit",10];
        _veh addItemCargoGlobal ["SmokeShellGreen",2];
        _veh addItemCargoGlobal ["SmokeShellOrange",2];
        _veh addItemCargoGlobal ["SmokeShellBlue",2];
        _veh addItemCargoGlobal ["O_IR_Grenade",2];
        _veh addItemCargoGlobal ["ItemGPS",1];
        _veh addBackpackCargoGlobal ["B_AssaultPack_dgtl",2];
        _veh addBackpackCargoGlobal ["O_UAV_01_backpack_F",1];
        _veh addItemCargoGlobal ["ATMine_Range_Mag",4];
    }; 
    case "O_T_APC_Tracked_02_cannon_ghex_F";
    case "O_T_UGV_01_rcws_ghex_F";
    case "I_APC_Wheeled_03_cannon_F";
    case "O_T_APC_Wheeled_02_rcws_v2_ghex_F" : { 
        _veh addItemCargoGlobal ["Medikit",1];
        _veh addItemCargoGlobal ["ToolKit",1];
        _veh addItemCargoGlobal ["MineDetector",1];
        _veh addItemCargoGlobal ["NVGoggles_INDEP",5];
        _veh addItemCargoGlobal ["FirstAidKit",20];
        _veh addItemCargoGlobal ["SmokeShellGreen",2];
        _veh addItemCargoGlobal ["SmokeShellOrange",2];
        _veh addItemCargoGlobal ["SmokeShellBlue",2];
        _veh addItemCargoGlobal ["O_IR_Grenade",2];
        _veh addItemCargoGlobal ["ItemGPS",2];
        _veh addBackpackCargoGlobal ["B_AssaultPack_dgtl",2];
        _veh addItemCargoGlobal ["H_HelmetIA",1];
        _veh addItemCargoGlobal ["V_PlateCarrierIA1_dgtl",1];
        _veh addBackpackCargoGlobal ["B_kitbag_rgr",2];
        _veh addItemCargoGlobal ["arifle_Katiba_F",2];
        _veh addItemCargoGlobal ["arifle_AK12_F",2];
        _veh addItemCargoGlobal ["arifle_AKM_F",2];
        _veh addItemCargoGlobal ["arifle_AKS_F",2];
        _veh addItemCargoGlobal ["arifle_AK12U_F",2];
        _veh addItemCargoGlobal ["launch_RPG7_F",2];
        _veh addItemCargoGlobal ["RPG7_F",5];
        _veh addItemCargoGlobal ["RPG32_F",5];
        _veh addItemCargoGlobal ["MRAWS_HEAT_F",10];
        _veh addItemCargoGlobal ["Titan_AA",10];
        _veh addItemCargoGlobal ["SatchelCharge_Remote_Mag",5];
        _veh addItemCargoGlobal ["DemoCharge_Remote_Mag",5];
        _veh addItemCargoGlobal ["SLAMDirectionalMine_Wire_Mag",10];
        _veh addItemCargoGlobal ["ATMine_Range_Mag",4];
        _veh addItemCargoGlobal ["SmokeShell",30];
        _veh addItemCargoGlobal ["HandGrenade",5];
        _veh addItemCargoGlobal ["MiniGrenade",5];
        _veh addItemCargoGlobal ["1Rnd_Smoke_Grenade_shell",10];
        _veh addItemCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",10];
        _veh addItemCargoGlobal ["UGL_FlareWhite_F",10];
        _veh addItemCargoGlobal ["1Rnd_HE_Grenade_shell",20];
        _veh addItemCargoGlobal ["UGL_FlareCIR_F",10];
        _veh addItemCargoGlobal ["30Rnd_65x39_caseless_green",20];
        _veh addItemCargoGlobal ["30Rnd_762x39_Mag_F",20];
        _veh addItemCargoGlobal ["30Rnd_545x39_Mag_F",30];
        _veh addItemCargoGlobal ["30Rnd_556x45_Stanag",30];
        _veh addItemCargoGlobal ["30Rnd_580x42_Mag_F",20];
        _veh addItemCargoGlobal ["30Rnd_65x39_caseless_black_mag",20];
        _veh addItemCargoGlobal ["30Rnd_65x39_caseless_msbs_mag",20];
        _veh addItemCargoGlobal ["20Rnd_650x39_Cased_Mag_F",20],;
        _veh addItemCargoGlobal ["20Rnd_762x51_Mag",20];
        _veh addItemCargoGlobal ["10Rnd_762x54_Mag",20];
        _veh addItemCargoGlobal ["150Rnd_556x45_Drum_Mag_F",5];
        _veh addItemCargoGlobal ["150Rnd_762x54_Box",5];
        _veh addItemCargoGlobal ["200Rnd_65x39_cased_Box",5];
        _veh addItemCargoGlobal ["130Rnd_338_Mag",5],;
        _veh addItemCargoGlobal ["150Rnd_93x64_Mag",5];
        _veh addItemCargoGlobal ["200Rnd_556x45_Box_F",5];
        _veh addItemCargoGlobal ["75rnd_762x39_AK12_Mag_F",5];
        _veh addItemCargoGlobal ["100Rnd_580x42_Mag_F",5];
        _veh addItemCargoGlobal ["100Rnd_65x39_caseless_black_mag",5];
        _veh addItemCargoGlobal ["10Rnd_50BW_Mag_F",10];
        _veh addItemCargoGlobal ["6Rnd_12Gauge_Pellets",10];
        _veh addItemCargoGlobal ["6Rnd_12Gauge_Slug",10];
        _veh addItemCargoGlobal ["Weapon_launch_MRAWS_green_F",1]; 
    }; 
    case "O_MRAP_02_F" : { 
        _veh addItemCargoGlobal ["Medikit",1];
        _veh addItemCargoGlobal ["ToolKit",1];
        _veh addItemCargoGlobal ["MineDetector",1];
        _veh addItemCargoGlobal ["NVGoggles_INDEP",2];
        _veh addItemCargoGlobal ["FirstAidKit",5];
        _veh addItemCargoGlobal ["SmokeShell",10];
        _veh addItemCargoGlobal ["DemoCharge_Remote_Mag",2];
    }; 
    case "O_LSV_02_unarmed_F" : { 
        _veh addItemCargoGlobal ["FirstAidKit",10];
    };
    case "O_Truck_03_covered_F";
    case "O_Truck_03_medical_F" : { 
        _veh addItemCargoGlobal ["Medikit",1];
        _veh addItemCargoGlobal ["ToolKit",1];
        _veh addItemCargoGlobal ["FirstAidKit",15];
    };
    case "I_CargoNet_01_ammo_F" : { 
        _veh addItemCargoGlobal ["Medikit",1];
        _veh addItemCargoGlobal ["ToolKit",1];
        _veh addItemCargoGlobal ["MineDetector",1];
        _veh addItemCargoGlobal ["NVGoggles_INDEP",5];
        _veh addItemCargoGlobal ["FirstAidKit",20];
        _veh addItemCargoGlobal ["ItemGPS",2];
        _veh addItemCargoGlobal ["H_HelmetIA",1];
        _veh addItemCargoGlobal ["V_PlateCarrierIA1_dgtl",1];
        _veh addBackpackCargoGlobal ["B_kitbag_rgr",2];
        _veh addItemCargoGlobal ["arifle_Katiba_F",2];
        _veh addItemCargoGlobal ["arifle_AK12_F",2];
        _veh addItemCargoGlobal ["arifle_AKM_F",2];
        _veh addItemCargoGlobal ["arifle_AKS_F",2];
        _veh addItemCargoGlobal ["arifle_AK12U_F",2];
        _veh addItemCargoGlobal ["launch_RPG7_F",2];
        _veh addItemCargoGlobal ["RPG7_F",10];
        _veh addItemCargoGlobal ["RPG32_F",10];
        _veh addItemCargoGlobal ["MRAWS_HEAT_F",10];
        _veh addItemCargoGlobal ["Titan_AA",10];
        _veh addItemCargoGlobal ["SatchelCharge_Remote_Mag",5];
        _veh addItemCargoGlobal ["DemoCharge_Remote_Mag",5];
        _veh addItemCargoGlobal ["SLAMDirectionalMine_Wire_Mag",10];
        _veh addItemCargoGlobal ["ATMine_Range_Mag",5];
        _veh addItemCargoGlobal ["SmokeShell",30];
        _veh addItemCargoGlobal ["HandGrenade",5];
        _veh addItemCargoGlobal ["MiniGrenade",5];
        _veh addItemCargoGlobal ["1Rnd_Smoke_Grenade_shell",10];
        _veh addItemCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",10];
        _veh addItemCargoGlobal ["UGL_FlareWhite_F",10];
        _veh addItemCargoGlobal ["1Rnd_HE_Grenade_shell",20];
        _veh addItemCargoGlobal ["UGL_FlareCIR_F",10];
        _veh addItemCargoGlobal ["30Rnd_65x39_caseless_green",20];
        _veh addItemCargoGlobal ["30Rnd_762x39_Mag_F",20];
        _veh addItemCargoGlobal ["30Rnd_545x39_Mag_F",30];
        _veh addItemCargoGlobal ["30Rnd_556x45_Stanag",30];
        _veh addItemCargoGlobal ["30Rnd_580x42_Mag_F",20];
        _veh addItemCargoGlobal ["30Rnd_65x39_caseless_black_mag",20];
        _veh addItemCargoGlobal ["30Rnd_65x39_caseless_msbs_mag",20];
        _veh addItemCargoGlobal ["20Rnd_650x39_Cased_Mag_F",20],;
        _veh addItemCargoGlobal ["20Rnd_762x51_Mag",20];
        _veh addItemCargoGlobal ["10Rnd_762x54_Mag",20];
        _veh addItemCargoGlobal ["150Rnd_556x45_Drum_Mag_F",5];
        _veh addItemCargoGlobal ["150Rnd_762x54_Box",5];
        _veh addItemCargoGlobal ["200Rnd_65x39_cased_Box",5];
        _veh addItemCargoGlobal ["130Rnd_338_Mag",5],;
        _veh addItemCargoGlobal ["150Rnd_93x64_Mag",5];
        _veh addItemCargoGlobal ["200Rnd_556x45_Box_F",5];
        _veh addItemCargoGlobal ["75rnd_762x39_AK12_Mag_F",5];
        _veh addItemCargoGlobal ["100Rnd_580x42_Mag_F",5];
        _veh addItemCargoGlobal ["100Rnd_65x39_caseless_black_mag",5];
        _veh addItemCargoGlobal ["10Rnd_50BW_Mag_F",10];
        _veh addItemCargoGlobal ["6Rnd_12Gauge_Pellets",10];
        _veh addItemCargoGlobal ["6Rnd_12Gauge_Slug",10];
    };
    case "O_T_VTOL_02_infantry_dynamicLoadout_F";
    case "O_Heli_Transport_04_covered_F";
    case "I_Heli_Transport_02_F" : { 
        _veh addItemCargoGlobal ["Medikit",1];
        _veh addItemCargoGlobal ["ToolKit",1];
        _veh addItemCargoGlobal ["NVGoggles_OPFOR",5];
        _veh addItemCargoGlobal ["FirstAidKit",10];
        _veh addBackpackCargoGlobal ["B_Parachute",16];
        _veh addItemCargoGlobal ["H_PilotHelmetFighter_O",2];
    };
    case "B_T_VTOL_01_infantry_F" : { 
        _veh addItemCargoGlobal ["Medikit",1];
        _veh addItemCargoGlobal ["ToolKit",1];
        _veh addItemCargoGlobal ["NVGoggles_OPFOR",5];
        _veh addItemCargoGlobal ["FirstAidKit",10];
        _veh addBackpackCargoGlobal ["B_Parachute",32];
        _veh addItemCargoGlobal ["H_PilotHelmetFighter_O",2];
    };
    case "B_T_VTOL_01_vehicle_F" : { 
        _veh addItemCargoGlobal ["Medikit",1];
        _veh addItemCargoGlobal ["ToolKit",1];
        _veh addItemCargoGlobal ["NVGoggles_OPFOR",5];
        _veh addItemCargoGlobal ["FirstAidKit",10];
        _veh addItemCargoGlobal ["H_PilotHelmetFighter_O",2];
    };
    case "B_Heli_Light_01_F" : { 
        _veh addItemCargoGlobal ["Medikit",1];
        _veh addItemCargoGlobal ["ToolKit",1];
        _veh addItemCargoGlobal ["NVGoggles_OPFOR",2];
        _veh addItemCargoGlobal ["FirstAidKit",10];
        _veh addBackpackCargoGlobal ["B_Parachute",6];
        _veh addItemCargoGlobal ["H_PilotHelmetFighter_O",2];
    };
    case "O_Heli_Transport_04_medevac_F" : { 
        _veh addItemCargoGlobal ["Medikit",1];
        _veh addItemCargoGlobal ["ToolKit",1];
        _veh addItemCargoGlobal ["FirstAidKit",10];
        _veh addItemCargoGlobal ["H_PilotHelmetFighter_O",2];
    };
    case "O_Heli_Attack_02_dynamicLoadout_F" : { 
        _veh addItemCargoGlobal ["Medikit",1];
        _veh addItemCargoGlobal ["ToolKit",1];
        _veh addItemCargoGlobal ["NVGoggles_OPFOR",2];
        _veh addItemCargoGlobal ["FirstAidKit",10];
        _veh addBackpackCargoGlobal ["B_Parachute",8];
    };
	default {
	    {
			_veh addItemCargoGlobal [_x,(_item # 1) # _forEachIndex];
		} forEach (_item # 0);
		{
			_veh addWeaponCargoGlobal [_x,(_weapon # 1) # _forEachIndex];
		} forEach (_weapon # 0);
		{
			_veh addMagazineCargoGlobal [_x,(_magazine # 1) # _forEachIndex];
		} forEach (_magazine # 0);
		{
			_veh addBackpackCargoGlobal [_x,(_backpack # 1) # _forEachIndex];
		} forEach (_backpack # 0);
    }; 
};