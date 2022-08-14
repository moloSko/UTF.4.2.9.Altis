_player = _this;

while {true} do {
	//список тепловизоров
	_teplak1 = ["NVGogglesB_grn_F","NVGogglesB_blk_F","NVGogglesB_gry_F"];

	//список прицелов с тепловизором
	_pricel1 = ["optic_Nightstalker","rhsusf_acc_anpas13gv1","optic_tws","optic_tws_mg"];

	//список шлемов
	_headgear1 = ["H_HelmetO_ViperSP_hex_F","H_HelmetO_ViperSP_ghex_F"];

	_hg = headgear _player;
	_items = assignedItems _player;
	_pricel = (primaryWeaponItems _player) select 2;

	//проверка тепловизора
	if ((count _items) > 0) then {
		{
			if (_x in _items) then {
				[_player,_x] remoteExec ["unlinkItem"];
			};
		} forEach _teplak1;
	};

	//проверка прицела с тепловизором
	if (_pricel != "") then {
		{
			if (_x == _pricel) then {
				[_player,_pricel] remoteExec ["removePrimaryWeaponItem"];
			};
		} forEach _pricel1;
	};

	//проверка шлема с тепловизором
	if (_hg != "") then {
		{
			if (_x == _hg) then {
				[_player,_hg] remoteExec ["unlinkItem"];
				sleep 0.5;
				_player  linkItem "H_HelmetIA";
			};
		} forEach _headgear1;
	};
	uiSleep 10;
};
