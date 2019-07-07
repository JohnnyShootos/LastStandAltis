#define ROLL(value) (random 1 < value)

if (hasInterface && !isServer) exitWith {};

//wave number
_w = _this select 0;

//Zone marker array
//_m = ["m1","m2","m3","m4","m5","m6","m7","m8","m9","m10","m11","m12","m13","m14","m15","m16"];
//_v = ["v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v13","v14","v15","v16"];

//Init Variables
_players = count playableUnits;
_difficulty = "GameDifficulty" call BIS_fnc_getParamValue;
_vehicleProbabilityScore = ("VehiclePresent" call BIS_fnc_getParamValue) / 100;
_armoredVehicleProbabilityScore = ("IFVPresent" call BIS_fnc_getParamValue) / 100;
_tankProbabilityScore = ("TankPresent" call BIS_fnc_getParamValue) / 100;
_forwardObserverProbabilityScore = ("SniperPresent" call BIS_fnc_getParamValue) / 100;

//Enemy Count Variables
_infTotal = (_players*_difficulty) + (2*_w);
_infGroups =  ceil (_infTotal / 4);
_vehicles = (floor ( _w / 4 ));
_armedVehicles = (floor ( _w / 6));
_tankVehicles = (floor ( _w / 15 ));
_forwardObservers = ceil (_w / 10);

//Enemy Difficulty Variables
_aimAccuracy = (0.20 * _difficulty);
_aimShake = (0.20 * _difficulty);
_aimSpeed = (0.20 * _difficulty);

//Enemy Infantry Group Types
_infTypes = ["BUS_ReconTeam", "BUS_InfTeam", "BUS_InfSquad", "BUS_SniperTeam"];

//Enemy Vehicle Types
_vehTypes = ["B_G_Offroad_01_armed_F", "B_LSV_01_armed_F", "B_MRAP_01_hmg_F"];

//Enemy Armored Vehicle Types
_armorVehTypes = ["B_MRAP_01_hmg_F","B_T_APC_Tracked_01_rcws_F","B_T_APC_Wheeled_01_cannon_F"];

//Enemy Tank Types
_tankTypes = ["B_MBT_01_TUSK_F","B_MBT_01_TUSK_F","B_MBT_01_TUSK_F"];


//Spawn infantry groups
for "_n" from 1 to _infGroups do {
	_safePos = [getMarkerPos "target", 100, 200, 4, 0, 0.5, 0] call BIS_fnc_findSafePos;
	//_safePos = getMarkerPos (_m call BIS_fnc_selectRandom);
	//systemChat format ["Selected Zone: %1", _z];
	
	_group = createGroup west;
	if (_w > 20) then {
		_group = [_safePos, west, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> (_infTypes # 2)), [], [], [0.2,0.3], [], [], ([_safePos, getMarkerPos "target"] call BIS_fnc_dirTo)] call BIS_fnc_spawnGroup;	
	} else {
		if (_w > 10) then {
			_group = [_safePos, west, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> (_infTypes # 1)), [], [], [0.2,0.3], [], [], ([_safePos, getMarkerPos "target"] call BIS_fnc_dirTo)] call BIS_fnc_spawnGroup;	
		} else {
			_group = [_safePos, west, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> (_infTypes # 0)), [], [], [0.2,0.3], [], [], ([_safePos, getMarkerPos "target"] call BIS_fnc_dirTo)] call BIS_fnc_spawnGroup;
		};
	};
	
	_group allowFleeing 0;
	
	{
		_x call TFD_fnc_addKilledEH;
		_x setSkill ["aimingAccuracy", (_aimAccuracy)]; 
		_x setSkill ["aimingShake", (_aimShake)];
		_x setSkill ["aimingSpeed", (_aimSpeed)];
		_x setSkill ["endurance", 1];
		_x setSkill ["reloadSpeed", 1];
		_x setSkill ["commanding", 1];
		_x setSkill ["spotDistance", 0.66];
		_x setSkill ["spotTime", 0.66];
		removeAllPrimaryWeaponItems _x;
		removeAllHandgunItems _x;
		_x spawn { while {alive _this} do { sleep 5; _this setVehicleAmmoDef 1;}};
	} forEach units _group;
		
	_order = [_group, "target" call BIS_fnc_randomPosTrigger] call BIS_fnc_taskAttack;
	_group setBehaviourStrong "COMBAT";
	//systemChat format ["New Group: %1, is attacking: %2", _group, _order];
	
	sleep 1;
};	

//Spawn Vehicles

for "_n" from 1 to _vehicles do { 
	if (ROLL(_vehicleProbabilityScore)) then {
		_safePos = [getMarkerPos "target", 300, 500, 10, 0, 0.5, 0] call BIS_fnc_findSafePos;
		
		_group = createGroup west;
		_vehGrp = [];
		if (_w > 20) then {
			_vehGrp = [_safePos, ([_safePos, getMarkerpos "target"] call BIS_fnc_dirTo), (_vehTypes # 2), _group] call bis_fnc_spawnvehicle;	
		} else {
			if (_w > 10) then {
				_vehGrp = [_safePos, ([_safePos, getMarkerpos "target"] call BIS_fnc_dirTo), (_vehTypes # 1), _group] call bis_fnc_spawnvehicle;	
			} else {
				_vehGrp = [_safePos, ([_safePos, getMarkerpos "target"] call BIS_fnc_dirTo), (_vehTypes # 0), _group] call bis_fnc_spawnvehicle;
			};
		};
		
		_group allowFleeing 0;
		
		{
			_x call TFD_fnc_addKilledEH;
			_x setSkill ["aimingAccuracy", _aimAccuracy]; 
			_x setSkill ["aimingShake", _aimShake];
			_x setSkill ["aimingSpeed", _aimSpeed];
			_x setSkill ["endurance", 1];
			_x setSkill ["reloadSpeed", 1];
			_x setSkill ["commanding", 1];
			removeAllPrimaryWeaponItems _x;
			removeAllHandgunItems _x;
			_x spawn { while {alive _this} do { sleep 5; _this setVehicleAmmoDef 1;}};
		} forEach (_vehGrp # 1);

		(_vehGrp # 0) call TFD_fnc_addKilledEH;
		(_vehGrp # 0) spawn { while {alive _this} do { sleep 5; _this setVehicleAmmoDef 1;}};
		
		_order = [_group, "target" call BIS_fnc_randomPosTrigger] call BIS_fnc_taskAttack;
		_group setBehaviourStrong "COMBAT";
		//systemChat format ["New Group: %1, is attacking: %2", _group, _order];
		
		
		
		sleep 1;
	};
};

//Spawn Enclosed Fighting Vehicles

for "_n" from 1 to _armedVehicles do { 
	if (ROLL(_armoredVehicleProbabilityScore)) then {
		_safePos = [getMarkerPos "target", 300, 500, 10, 0, 0.5, 0] call BIS_fnc_findSafePos;
		
		_group = createGroup west;
		_vehGrp = [];
		if (_w > 20) then {
			_vehGrp = [_safePos, ([_safePos, getMarkerpos "target"] call BIS_fnc_dirTo), (_armorVehTypes # 2), _group] call bis_fnc_spawnvehicle;	
		} else {
			if (_w > 10) then {
				_vehGrp = [_safePos, ([_safePos, getMarkerpos "target"] call BIS_fnc_dirTo), (_armorVehTypes # 1), _group] call bis_fnc_spawnvehicle;	
			} else {
				_vehGrp = [_safePos, ([_safePos, getMarkerpos "target"] call BIS_fnc_dirTo), (_armorVehTypes # 0), _group] call bis_fnc_spawnvehicle;
			};
		};
		
		_group allowFleeing 0;
		
		{
			_x call TFD_fnc_addKilledEH;
			_x setSkill ["aimingAccuracy", _aimAccuracy]; 
			_x setSkill ["aimingShake", _aimShake];
			_x setSkill ["aimingSpeed", _aimSpeed];
			_x setSkill ["endurance", 1];
			_x setSkill ["reloadSpeed", 1];
			_x setSkill ["commanding", 1];
			removeAllPrimaryWeaponItems _x;
			removeAllHandgunItems _x;
			_x spawn { while {alive _this} do { sleep 5; _this setVehicleAmmoDef 1;}};
		} forEach (_vehGrp # 1);

		(_vehGrp # 0) call TFD_fnc_addKilledEH;
		(_vehGrp # 0) spawn { while {alive _this} do { sleep 5; _this setVehicleAmmoDef 1;}};
		
		_order = [_group, "target" call BIS_fnc_randomPosTrigger] call BIS_fnc_taskAttack;
		_group setBehaviourStrong "COMBAT";
		//systemChat format ["New Group: %1, is attacking: %2", _group, _order];
		
		
		
		sleep 1;
	};
};

//Spawn Armor

for "_n" from 1 to _tankVehicles do { 
	if (ROLL(_tankProbabilityScore)) then {
		_safePos = [getMarkerPos "target", 300, 500, 10, 0, 0.5, 0] call BIS_fnc_findSafePos;
		
		_group = createGroup west;
		_vehGrp = [];
		if (_w > 20) then {
			_vehGrp = [_safePos, ([_safePos, getMarkerpos "target"] call BIS_fnc_dirTo), (_tankTypes # 2), _group] call bis_fnc_spawnvehicle;	
		} else {
			if (_w > 10) then {
				_vehGrp = [_safePos, ([_safePos, getMarkerpos "target"] call BIS_fnc_dirTo), (_tankTypes # 1), _group] call bis_fnc_spawnvehicle;	
			} else {
				_vehGrp = [_safePos, ([_safePos, getMarkerpos "target"] call BIS_fnc_dirTo), (_tankTypes # 0), _group] call bis_fnc_spawnvehicle;
			};
		};
		
		_group allowFleeing 0;
		
		{
			_x call TFD_fnc_addKilledEH;
			_x setSkill ["aimingAccuracy", _aimAccuracy]; 
			_x setSkill ["aimingShake", _aimShake];
			_x setSkill ["aimingSpeed", _aimSpeed];
			_x setSkill ["endurance", 1];
			_x setSkill ["reloadSpeed", 1];
			_x setSkill ["commanding", 1];
			removeAllPrimaryWeaponItems _x;
			removeAllHandgunItems _x;
			_x spawn { while {alive _this} do { sleep 5; _this setVehicleAmmoDef 1;}};
		} forEach (_vehGrp # 1);

		(_vehGrp # 0) call TFD_fnc_addKilledEH;
		(_vehGrp # 0) spawn { while {alive _this} do { sleep 5; _this setVehicleAmmoDef 1;}};
		
		_order = [_group, "target" call BIS_fnc_randomPosTrigger] call BIS_fnc_taskAttack;
		_group setBehaviourStrong "COMBAT";
		//systemChat format ["New Group: %1, is attacking: %2", _group, _order];
		
		
		
		sleep 1;
	};
};

//Spawn forward observer / sniper group

for "_n" from 1 to _forwardObservers do {

	if (ROLL(_forwardObserverProbabilityScore)) then {

		_safePos = [getMarkerPos "target", 200, 300, 4, 0, 0.5, 0] call BIS_fnc_findSafePos;
		//_z = _m call BIS_fnc_selectRandom;
		//systemChat format ["Selected Zone: %1", _z];
		
		_group = createGroup west;
		
		_group = [_safePos, west, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> (_infTypes # 3)), [], [], [0.2,0.3], [], [], ([_safePos, getMarkerpos "target"] call BIS_fnc_dirTo)] call BIS_fnc_spawnGroup;	
				
		_group allowFleeing 0;
		
		{
			_x call TFD_fnc_addKilledEH;
			_x setSkill ["aimingAccuracy", ((_aimAccuracy*4) min 1)]; 
			_x setSkill ["aimingShake", ((_aimShake*4) min 1)];
			_x setSkill ["aimingSpeed", ((_aimSpeed*4) min 1)];
			_x setSkill ["endurance", 1];
			_x setSkill ["reloadSpeed", 1];
			_x setSkill ["commanding", 1];
			_x setSkill ["spotDistance", 1];
			_x setSkill ["spotTime", 1];
			_x spawn { while {alive _this} do { sleep 5; _this setVehicleAmmoDef 1;}};
		
		} forEach units _group;
		

		_order = [_group, "target" call BIS_fnc_randomPosTrigger] call BIS_fnc_taskAttack;
		//systemChat format ["New Group: %1, is attacking: %2", _group, _order];
		_group setBehaviourStrong "COMBAT";
		
		_group spawn TFD_fnc_forwardObserverArtillery;

		sleep 1;
	};	
};


//Increment the wavenumber
NEXTWAVE = _w + 1;