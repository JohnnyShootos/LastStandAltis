NEXTWAVE = "StartWave" call BIS_fnc_getParamValue; publicVariable "NEXTWAVE";

//Add Money award system to players
"AWARD" addPublicVariableEventHandler {

	_data = _this select 1;
	//systemChat format ["_data is: %1", _data];
	_amt = _data select 0;
	//systemChat format ["_data select 0: %1", _amt];
	_ply = _data select 1;
	//systemChat format ["_data select 1: %1", _ply];

	
	CHANGEMONEY = _amt;
	(owner _ply) publicVariableClient "CHANGEMONEY";
	//systemChat format ["AWARD sent to %1: %2", _ply, _amt];
	
};

//Hide Terrain Upgrades
[[ul_0,ul_1,ul_2,ul_3,ul_4], true] call TFD_fnc_hideUpgrade;

//Initialise Admin Panel
nul = [] execVM "adminpanelmk2\init.sqf";

waitUntil { time > 10 };
[] execVM "scripts\mission\mainLoop.sqf";