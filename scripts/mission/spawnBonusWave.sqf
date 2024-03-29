if (!isServer) exitWith {};

//wave number
_w = floor ((_this select 0) / 5);

//Zone marker array

_v = ["v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v13","v14","v15","v16"];
_heliSpawnMarker = [getMarkerPos "target", 500, 750, 15, 0, 0.5, 0] call BIS_fnc_findSafePos;

//Init Variables
_difficulty = "GameDifficulty" call BIS_fnc_getParamValue;

//Enemy Difficulty Variables
_aimAccuracy = (0.1 * _difficulty);
_aimShake = (0.1 * _difficulty);
_aimSpeed = (0.25 * _difficulty);

_choppers = [
	"",
	"B_Heli_Light_01_armed_F",
	"B_Heli_Transport_01_camo_F",
	"B_Heli_Attack_01_F"
];

//Choose a heli type based on player progression
_type = "";

if (_w > 2) then { 
	
	if (_w > 4) then { 
	
		_type = _choppers select 3;
	
	} else { _type = _choppers select 2 }; 
	
} else { _type = _choppers select 1; };

systemChat _type;

_grp = grpNull;

//Spawn Helicopters
for "_n" from 1 to 1 do { 

	_grp = createGroup west;
	_vehArray = [_heliSpawnMarker, ([_heliSpawnMarker, getMarkerpos "target"] call BIS_fnc_dirTo), _type, _grp] call bis_fnc_spawnvehicle;
	_grp allowFleeing 0;
	
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
	} forEach (_vehArray # 1);

	(_vehArray # 0) call TFD_fnc_addKilledEH;
	
	_nul = _vehArray spawn { 
		_u = _this select 0; 
		while { alive _u } do { 
			sleep 1; 
			_u setVehicleAmmoDef 1; 
			if ((getPosATL _u) select 2 < 1) then { 
				_u setDamage 1; 
			}; 
		}; 
	};
	
	
	_order = [_grp, getMarkerPos "target"] call BIS_fnc_taskAttack;
	_grp setBehaviourStrong "COMBAT";
	systemChat format ["New Group: %1, is attacking: %2", _grp, _order];
	
	
	
	sleep 1;
};



//Increment the wavenumber
NEXTWAVE = NEXTWAVE + 1;
