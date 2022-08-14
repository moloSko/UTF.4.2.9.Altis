if(!isServer) exitWith {};
missionNameSpace setVariable ["Bash222",0,true];
params ["_type","_marker","_index","_radius"];
private ["_markerPos","_radioBashnya","_DirBash","_veh","_mine","_spawnpos","_next"];
_spawnpos = [];
_next = false;
_markerPos = getmarkerpos _marker;
if(isNil {missionNameSpace getVariable "DirBash"}) then { missionNameSpace setVariable ["DirBash",[0,0,0],true]};
_DirBash = missionNameSpace getVariable "DirBash";

if(!nachinaem_zonovo && {!DatabasePointRead}) then {
    private _dbposbash = "";
 	switch (_type) do {
		case "Land_Cargo_HQ_V1_F":{_dbposbash = "PosBash1"};
		case "Land_TTowerBig_2_F":{_dbposbash = "PosBash2"};
		case "Land_TBox_F":{_dbposbash = "PosBash3"};
	};
	_spawnpos = ["read", ["Bash",_dbposbash]];
    if!(_spawnpos IsEqualTo []) then {_next = true};
};

if(nachinaem_zonovo) then { 
    
    if(isNil {missionNameSpace getVariable "clearDeadBash"}) then {
        missionNameSpace setVariable ["clearDeadBash",true,true];
    };
    if(missionNameSpace getVariable "clearDeadBash") then {
        missionNameSpace setVariable ["clearDeadBash",false,true];
        _obj = nearestObjects [_markerPos,["Land_Cargo_Tower_V1_ruins_F"],700];
        if!(_obj isEqualTo []) then {{deletevehicle _x} forEach _obj};
    };
 
    
	scopeName "EPRST";
    
    while {true} do
    {
        _testpos = [_markerPos,0,300,5,5,_type] call Srv_fnc_findEmptyPos;
        _dir_TP = [_markerPos,_testpos] call BIS_fnc_dirTo;
	    _I = _DirBash select 0;
	    _II = _DirBash select 1;
	    _III = _DirBash select 2;
	    switch _index do {
		    case 0:{
		        _spawnpos = [_markerPos,0,300,5,5,_type] call Srv_fnc_findEmptyPos;
				_next = true;
		        breakTo "EPRST";
		    };
		    case 1:{
			    if((_dir_TP > _I && {(_dir_TP - _I) > 45}) || {(_I > _dir_TP && {(_I - _dir_TP) > 45})}) then {
			        _spawnpos = _testpos;
					_next = true;
			        breakTo "EPRST";
			    };
		    };
		    case 2:{
			    if(((_dir_TP > _I && {(_dir_TP - _I) > 45}) || {(_I > _dir_TP && {(_I - _dir_TP) > 45})})
			        &&
			        {((_dir_TP > _II && {(_dir_TP - _II) > 45}) || {(_II > _dir_TP && {(_II - _dir_TP) > 45})})}) then {
			        _spawnpos = _testpos;
					_next = true;
			        breakTo "EPRST";
                };
		    };			
	    };
    };
    
};

if(_next) then {
    _spawnpos = [_spawnpos select 0,_spawnpos select 1,0]; 
 
    _radioBashnya = _type createVehicle _spawnpos;
    _radioBashnya setPos _spawnpos;
    _radioBashnya setVectorUp [0,0,1];
    if(MiningBash == 3) then {_radioBashnya addEventHandler ["HandleDamage", {
	_it = _this select 0; 
	if !(alive _it) then {diag_log _this;diag_log _this select 3;diag_log _this select 3};
	_bombs = _it nearEntities ["", 20];
	_bomb = "DemoCharge_Remote_Mag";
	if (_this select 4 == "") then
	{
		if (_bomb in _bombs) then 
			{
				_it setDamage 1;
			} 
			else 
			{
				_it setDamage 0;
			};
	}
	else
	{
		_it setDamage 0;
	};
}];};
    _radioBashnya setDir (random 360);
    _dir_bash = getDir _radioBashnya;
    _DirBash set [_index,([_markerPos,_spawnpos] call BIS_fnc_dirTo)];
    missionNameSpace setVariable ["DirBash",_DirBash,true];

    _radioBashnya setVariable ["gunmam",[],true];
    _radioBashnya setVariable ["Mine",[],true];
    _radioBashnya setVariable ["killed",true,true]; 
	_radioBashnya addEventHandler ["HandleDamage",
	{
		_this spawn {
		private _it = _this # 0;
		private _bomb = _this # 4;
		private _instigator = _this # 6;
		if (_bomb == "SatchelCharge_Remote_Ammo") then
		{
			_it removeAllEventHandlers "HandleDamage";
			_it setDamage [1,true];
			[_instigator,9] spawn bt_fnc_addExp;
			_leader = leader (group _instigator);
            if (_leader != _instigator) then {
                [_leader,0.3] spawn bt_fnc_addExp;
            };
			[] remoteexeccall ["srv_fnc_TaskDone2"];
			_this spawn {
	        private _radioBashnya = _this select 0;
	        if!(_radioBashnya getVariable "killed") exitWith {};
		    _radioBashnya setVariable ["killed",false,true];
            private _RTST = missionNameSpace getVariable "RTST";
            _RTST = _RTST - 1;
			missionNameSpace setVariable ["RTST",_RTST,true];
			
            _radioBashnya removeAllMPEventHandlers "mpkilled";
		    //уничтожена

			_near = nearestObjects [_radioBashnya, [], 5];
            private _n = "";
	        switch (typeof _radioBashnya) do {
                case "Land_Cargo_HQ_V1_F":{_n = "Штаб"};
                case "Land_TTowerBig_2_F":{_n = "Радиовышка"};
                case "Land_TBox_F":{_n = "Передатчик"};
	        };
            [_n] spawn {
		        params ["_n"];
		        private _text = format [localize "STR_CONF_BASH1",_n];
            };
			missionNameSpace setVariable ["Bash111",1,true];
			
		    private _dbbash = "";
		    switch (_n) do {
			    case 1:{_dbbash = "PosBash1"};
				case 2:{_dbbash = "PosBash2"};
				case 3:{_dbbash = "PosBash3"};
			};		

            switch (true) do {			
		        case (_RTST == 2 || {_RTST == 1}):{
                    if(HardReinfor != 1) then {
                        private _datapoint = Gamer getVariable ["datapoint",[]];
                        _datapoint params ["_marker",""];
						private _posPoint = getMarkerPos _marker;
						private _list = _posPoint nearEntities [["Man","Car","Tank"],400];
						if((WEST countSide _list) < (numberOfArmy/2)) then {
		                   [_marker] spawn srv_fnc_ReinforPointBash;
						};
			        };
		        };
		        case (_RTST == 0):{
                    missionNameSpace setVariable ["DirBash",nil];
		            missionNameSpace setVariable ["clearDeadBash",nil];
		            missionNameSpace setVariable ["StaticWeap",nil];
		            [] spawn {
			            sleep 3;
		                private _text = localize "STR_CONF_BASH2";
		                _text  remoteExec ["hint",[0,-2] select isDedicated];
                        [[east,"HQ"],_text] remoteExec ["sideChat",[0,-2] select isDedicated];	
                    };
			        if(HardReinfor == 1) then {
			            missionNameSpace setVariable ["Stage",4,true];					
			        };			
			        missionNameSpace setVariable ["PerehodPoint",true,true];						
                };
			};
	    };
		}
		else
		{
			if (_bomb == "DemoCharge_Remote_Ammo") then
			{
				_bombcheck = missionNameSpace getVariable ["demoChargesUsed",1];
				if (_bombcheck < 2) then 
				{
					missionNameSpace setVariable ["demoChargesUsed", _bombcheck + 1, true];
				} 
				else 
				{
					_it removeAllEventHandlers "HandleDamage";
					_it setDamage [1,true];
					[_instigator,9] spawn bt_fnc_addExp;
					_leader = leader (group _instigator);
            if (_leader != _instigator) then {
                [_leader,0.3] spawn bt_fnc_addExp;
            };
					[] remoteexeccall ["srv_fnc_TaskDone2"];
					_this spawn {
	        private _radioBashnya = _this select 0;
	        if!(_radioBashnya getVariable "killed") exitWith {};
		    _radioBashnya setVariable ["killed",false,true];
            private _RTST = missionNameSpace getVariable "RTST";
            _RTST = _RTST - 1;
			missionNameSpace setVariable ["RTST",_RTST,true];
            _radioBashnya removeAllMPEventHandlers "mpkilled";
		    //уничтожена

			_near = nearestObjects [_radioBashnya, [], 5];
            private _n = "";
	        switch (typeof _radioBashnya) do {
                case "Land_Cargo_HQ_V1_F":{_n = "Штаб"};
                case "Land_TTowerBig_2_F":{_n = "Радиовышка"};
                case "Land_TBox_F":{_n = "Передатчик"};
	        };
            [_n] spawn {
		        params ["_n"];
		        private _text = format [localize "STR_CONF_BASH1",_n];
            };
			missionNameSpace setVariable ["Bash111",1,true];
			
		    private _dbbash = "";
		    switch (_n) do {
			    case 1:{_dbbash = "PosBash1"};
				case 2:{_dbbash = "PosBash2"};
				case 3:{_dbbash = "PosBash3"};
			};	

            switch (true) do {			
		        case (_RTST == 2 || {_RTST == 1}):{
                    if(HardReinfor != 1) then {
                        private _datapoint = Gamer getVariable ["datapoint",[]];
                        _datapoint params ["_marker",""];
						private _posPoint = getMarkerPos _marker;
						private _list = _posPoint nearEntities [["Man","Car","Tank"],400];
						if((WEST countSide _list) < (numberOfArmy/2)) then {
		                   [_marker] spawn srv_fnc_ReinforPointBash;
						};
			        };
		        };
		        case (_RTST == 0):{
                    missionNameSpace setVariable ["DirBash",nil];
		            missionNameSpace setVariable ["clearDeadBash",nil];
		            missionNameSpace setVariable ["StaticWeap",nil];
		            [] spawn {
			            sleep 3;
		                private _text = localize "STR_CONF_BASH2";
		                _text  remoteExec ["hint",[0,-2] select isDedicated];
                        [[east,"HQ"],_text] remoteExec ["sideChat",[0,-2] select isDedicated];	
                    };
			        if(HardReinfor == 1) then {
			            missionNameSpace setVariable ["Stage",4,true];						
			        };			
			        missionNameSpace setVariable ["PerehodPoint",true,true];						
                };
			};
	    };
				};
			}
			else
			{
				_it setDamage 0;
			};
		};
	};}];

	_localb = getPosATL _radioBashnya;
	missionNamespace setVariable ["LocalB2", _localb, true];
	
    //--------------------------------укреп от БРАТА--------------------
/*_grp = createGroup west;  
  
_BRO_fnc_placing = { 
 params ["_class","_X","_Y","_angle","_offset"]; 
 if (isNil "_offset") then {_offset = 0}; 
 _az = getDir _radioBashnya; 
 _obj = _class createVehicle getPosWorld _radioBashnya; 
 _obj setDir _az+_angle; 
 _obj setPos (_radioBashnya modelToWorld [_X,_Y]); 
 _obj setVehiclePosition [[getPosATL _obj select 0, getPosATL _obj select 1, _offset], [], 0, "CAN_COLLIDE"];
}; 
 
_BRO_fnc_placing_turret = { 
 params ["_class","_X","_Y","_angle","_offset"]; 
 if (isNil "_offset") then {_offset = 0}; 
 _az = getDir _radioBashnya; 
 _obj = _class createVehicle getPosWorld _radioBashnya; 
 _obj setDir _az+_angle; 
 _obj setPos (_radioBashnya modelToWorld [_X,_Y]); 
 _obj setVehiclePosition [[getPosATL _obj select 0, getPosATL _obj select 1, _offset], [], 0, "CAN_COLLIDE"]; 
 _man = _grp createUnit ["B_soldier_M_F", position _obj,[],10,"FORM"]; 
 _man setSkill 1; 
 _man allowFleeing 0; 
 [_man] join _grp; 
 _man moveInGunner _obj;    
}; 
 
_BRO_fnc_placing_trooper = { 
 params ["_class","_X","_Y","_angle","_offset"]; 
 if (isNil "_offset") then {_offset = 0}; 
 _az = getDir _radioBashnya; 
 _man = _grp createUnit [_class, getPosWorld _radioBashnya,[],0,"NONE"]; 
 _man setDir _az+_angle; 
 _man setPos (_radioBashnya modelToWorld [_X,_Y]); 
 _man setVehiclePosition [[getPosATL _man select 0, getPosATL _man select 1, _offset], [], 0, "CAN_COLLIDE"]; 
 _man setSkill 0.6; 
 _man allowFleeing 0; 
 [_man] join _grp; 
 doStop _man;    
}; 
 
_BRO_fnc_placingoff = { 
 params ["_class","_X","_Y","_angle","_offset"]; 
 if (isNil "_offset") then {_offset = 0}; 
 _az = getDir _radioBashnya; 
 _man = _grp createUnit [_class, getPosWorld _radioBashnya,[],0,"NONE"]; 
 _man setDir _az+_angle; 
 _man setPos (_radioBashnya modelToWorld [_X,_Y]); 
 _man setVehiclePosition [[getPosATL _man select 0, getPosATL _man select 1, _offset], [], 0, "CAN_COLLIDE"]; 
 _man setSkill 0.6; 
 _man allowFleeing 0; 
 [_man] join _grp; 
 doStop _man; 
 missionNamespace setVariable ["Officer",_man]; 
};*/
/*
["Land_Cargo_Patrol_V1_F" , 12 ,  20 ,  180  ] call _BRO_fnc_placing; 
 
["B_HMG_01_high_F" , 13 ,  19 ,  0 ,5 ] call _BRO_fnc_placing_turret;  
 
["Land_HBarrier_Big_F" , 13 ,  22 ,  180 ] call _BRO_fnc_placing;  
 
["Land_HBarrier_Big_F" , 8 ,  18.6 ,  90 ] call _BRO_fnc_placing;  
 
["Land_HBarrier_Big_F" , 16 ,  18.6 ,  90 ] call _BRO_fnc_placing;  
 
["Land_HBarrier_Big_F" , 16 ,  10 ,  90 ] call _BRO_fnc_placing;  
 
["Land_HBarrier_Big_F" , 16 , 2 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , 16 ,  -6 ,  90 ] call _BRO_fnc_placing;  
 
["Land_HBarrier_Big_F" , 16 ,  -14 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -0.4 ,  -16 ,  90 ] call _BRO_fnc_placing; 
 
["Land_Cargo_Patrol_V1_F" , 11 ,  -13 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , 11 ,  -16.8 ,  180 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_5_F" , 2.4 ,  -20.6 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_5_F" , -3.2 ,  -20.6 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_5_F" , 7.2 , -8.6 ,  90 ] call _BRO_fnc_placing; 
 
["Land_BagBunker_Large_F" , -6 , -18 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -15 , -13 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -18.6 , -8 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -18.6 , 0 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -18.6 , 8 ,  90 ] call _BRO_fnc_placing; 
 
["Land_BagBunker_Tower_F" , -15 , 14 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -13.6 , 18 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -5 , 18 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrierWall_corner_F" , 6 , 10 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrierWall6_F" , 9 , 5 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrierWall6_F" , 9 , -3 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrierWall_corner_F" , 6 , -5.2 ,  90 ] call _BRO_fnc_placing; 
 
["Land_CzechHedgehog_01_new_F" , 6 , 23 ,  180 ] call _BRO_fnc_placing;

["Land_CzechHedgehog_01_new_F" , 3 , 23 ,  180 ] call _BRO_fnc_placing;

["Land_CzechHedgehog_01_new_F" , 0 , 23 ,  180 ] call _BRO_fnc_placing;

["Land_CzechHedgehog_01_new_F" , -3 , 23 ,  180 ] call _BRO_fnc_placing;

["Land_CzechHedgehog_01_new_F" , -6 , 23 ,  180 ] call _BRO_fnc_placing;

//["Box_NATO_AmmoOrd_F" , 10 ,  -14 ,  90,2 ] call _BRO_fnc_placing;

//["Box_NATO_Grenades_F" , 12 ,  -14 ,  90,2 ] call _BRO_fnc_placing;
*/

/*["Land_HBarrier_5_F" , -11 ,  -23 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -11 ,  23 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -5.6 ,  -23 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -5.6 ,  23 ,  0  ] call _BRO_fnc_placing; 
 
["Land_HBarrier_5_F" , 0 ,  -23 ,  0  ] call _BRO_fnc_placing; 

["Land_HBarrier_5_F" , 0 ,  23 ,  0  ] call _BRO_fnc_placing; 

["Land_HBarrier_5_F" , 5.6 ,  -23 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , 5.6 ,  23 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  -15 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  24 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  18.4 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  13 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  7.4 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  2 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  -3.6 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  -9.2 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9,  -15 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9 ,  24 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9 ,  18.4 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9,  13 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9 ,  7.4 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9 ,  -3.6 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9 ,  -9.2 ,  90  ] call _BRO_fnc_placing;

["Land_Cargo_House_V1_F" ,-5 ,  -19 ,  180  ] call _BRO_fnc_placing;

["Land_Cargo_Patrol_V1_F" ,6 ,  -20 ,  0  ] call _BRO_fnc_placing;

["Land_Cargo_Tower_V1_F" ,10 ,  16 ,  90  ] call _BRO_fnc_placing;

["B_HMG_01_high_F" ,6 ,  12 ,  180 ,40 ] call _BRO_fnc_placing_turret;

["B_static_AA_F" ,3 ,  18 ,  -70 ,40 ] call _BRO_fnc_placing_turret;

["Land_BagBunker_Tower_F" ,-4 ,  19 ,  90  ] call _BRO_fnc_placing;

["B_GMG_01_high_F"  ,-5 ,  19 ,  270 ,3 ] call _BRO_fnc_placing_turret;

["Land_BagBunker_Large_F" ,-16 ,  -3 ,  90  ] call _BRO_fnc_placing;

["B_HMG_01_high_F" ,-18 ,  -3 ,  180,1  ] call _BRO_fnc_placing_turret;

["B_HMG_01_high_F" ,-16 ,  -5 ,  270,1  ] call _BRO_fnc_placing_turret;*/


    //----------------------------------------------------------------------------
    [_radioBashnya] spawn srv_fnc_defenceBash;
	private _RTST = missionNameSpace getVariable "RTST";
	_RTST = _RTST + 1;
	missionNameSpace setVariable ["RTST",_RTST,true];
	//---------------------------------------------------------------
};
	
if(_index == 2) then {
    //----------------------спавн охрана города----------------------------------------
    [_marker,_radius] spawn srv_fnc_DefencePoint;
};