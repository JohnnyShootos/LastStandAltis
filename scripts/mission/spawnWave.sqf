if (!isServer) exitWith {};

//wave number
_w = _this select 0;

//Zone marker array
_m = ["m1","m2","m3","m4","m5","m6","m7","m8","m9","m10","m11","m12","m13","m14","m15","m16"];
_v = ["v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v13","v14","v15","v16"];

//Init Variables
_difficulty = "GameDifficulty" call BIS_fnc_getParamValue;
_players = count playableUnits;

//Enemy Count Variables
_infTotal = (_players + _w + 2) * _difficulty;
_infGroups =  round (_infTotal / 4);
_vehicles = floor ( _w / 4 );
_armedVehicles = floor ( _w / 10 );
_tankVehicles = floor ( _w / 15 );

//Enemy Difficulty Variables
_aimAccuracy = (0.1 * _difficulty);
_aimShake = (0.1 * _difficulty);
_aimSpeed = (0.25 * _difficulty);

//Spawn infantry groups
for "_n" from 1 to _infGroups do {
	_z = _m call BIS_fnc_selectRandom;
	systemChat format ["Selected Zone: %1", _z];
	
	_group = createGroup west;
	if (_w > 20) then {
		_group = [getMarkerPos _z, west, (configfile >> "CfgGroups" >> "West" >> "BLU_CTRG_F" >> "Infantry" >> "CTRG_InfSquad"), [], [], [0.2,0.3], [], [], ([getMarkerpos "target", getMarkerPos _z] call BIS_fnc_dirTo)] call BIS_fnc_spawnGroup;	
	} else {
		if (_w > 10) then {
			_group = [getMarkerPos _z, west, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam"), [], [], [0.2,0.3], [], [], ([getMarkerpos "target", getMarkerPos _z] call BIS_fnc_dirTo)] call BIS_fnc_spawnGroup;	
		} else {
			_group = [getMarkerPos _z, west, (configfile >> "CfgGroups" >> "West" >> "Guerilla" >> "Infantry" >> "IRG_InfTeam"), [], [], [0.2,0.3], [], [], ([getMarkerpos "target", getMarkerPos _z] call BIS_fnc_dirTo)] call BIS_fnc_spawnGroup;
		};
	};
	
	_group allowFleeing 0;
	
	{
		_x setSkill ["aimingAccuracy", _aimAccuracy]; 
		_x setSkill ["aimingShake", _aimShake];
		_x setSkill ["aimingSpeed", _aimSpeed];
	
	} forEach units _group;
		
	_order = [_group, getMarkerPos "target"] call BIS_fnc_taskAttack;
	systemChat format ["New Group: %1, is attacking: %2", _group, _order];
	
	sleep 1;
};	

//Spawn Vehicles 
for "_n" from 1 to _vehicles do { 

	_z = _v call BIS_fnc_selectRandom;
	systemChat format ["Selected Zone: %1", _z];
	
	_group = createGroup west;
	if (_w > 20) then {
		[getMarkerPos _z, ([getMarkerPos _z, getMarkerpos "target"] call BIS_fnc_dirTo), "B_LSV_01_AT_F", _group] call bis_fnc_spawnvehicle;	
	} else {
		if (_w > 10) then {
			[getMarkerPos _z, ([getMarkerPos _z, getMarkerpos "target"] call BIS_fnc_dirTo), "B_LSV_01_armed_F", _group] call bis_fnc_spawnvehicle;	
		} else {
			[getMarkerPos _z, ([getMarkerPos _z, getMarkerpos "target"] call BIS_fnc_dirTo), "B_G_Offroad_01_armed_F", _group] call bis_fnc_spawnvehicle;
		};
	};
	
	_group allowFleeing 0;
	
	{
		_x setSkill ["aimingAccuracy", _aimAccuracy]; 
		_x setSkill ["aimingShake", _aimShake];
		_x setSkill ["aimingSpeed", _aimSpeed];
	} forEach units _group;
	
	_order = [_group, getMarkerPos "target"] call BIS_fnc_taskAttack;
	systemChat format ["New Group: %1, is attacking: %2", _group, _order];
	
	
	
	sleep 1;
};

//Spawn Enclosed Fighting Vehicles
for "_n" from 1 to _armedVehicles do { 

	_z = _v call BIS_fnc_selectRandom;
	systemChat format ["Selected Zone: %1", _z];
	
	_group = createGroup west;
	if (_w > 20) then {
		[getMarkerPos _z, ([getMarkerPos _z, getMarkerpos "target"] call BIS_fnc_dirTo), "B_T_APC_Tracked_01_rcws_F", _group] call bis_fnc_spawnvehicle;	
	} else {
		if (_w > 10) then {
			[getMarkerPos _z, ([getMarkerPos _z, getMarkerpos "target"] call BIS_fnc_dirTo), "B_T_APC_Wheeled_01_cannon_F", _group] call bis_fnc_spawnvehicle;	
		} else {
			[getMarkerPos _z, ([getMarkerPos _z, getMarkerpos "target"] call BIS_fnc_dirTo), "B_MRAP_01_hmg_F", _group] call bis_fnc_spawnvehicle;
		};
	};
	_group allowFleeing 0;
	
	{
		_x setSkill ["aimingAccuracy", _aimAccuracy]; 
		_x setSkill ["aimingShake", _aimShake];
		_x setSkill ["aimingSpeed", _aimSpeed];
	} forEach units _group;
	
	_order = [_group, getMarkerPos "target"] call BIS_fnc_taskAttack;
	systemChat format ["New Group: %1, is attacking: %2", _group, _order];
	
	sleep 1;
};

//Spawn Armor
for "_n" from 1 to _tankVehicles do { 

	_z = _v call BIS_fnc_selectRandom;
	systemChat format ["Selected Zone: %1", _z];
	
	_group = createGroup west;

	[getMarkerPos _z, ([getMarkerPos _z, getMarkerpos "target"]  call BIS_fnc_dirTo), "B_MBT_01_TUSK_F", _group] call bis_fnc_spawnvehicle;
	
	_group allowFleeing 0;
	
	{
		_x setSkill ["aimingAccuracy", _aimAccuracy]; 
		_x setSkill ["aimingShake", _aimShake];
		_x setSkill ["aimingSpeed", _aimSpeed];	
	} forEach units _group;
	
	_order = [_group, getMarkerPos "target"] call BIS_fnc_taskAttack;
	systemChat format ["New Group: %1, is attacking: %2", _group, _order];
	
	sleep 1;
};

//Increment the wavenumber
NEXTWAVE = _w + 1;