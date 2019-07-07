NEXTWAVE = "StartWave" call BIS_fnc_getParamValue; publicVariable "NEXTWAVE";

//Add Money award system to players
"AWARD" addPublicVariableEventHandler {

	_data = _this select 1;

	_amt = _data select 0;
	
	_ply = _data select 1;
	

	
	CHANGEMONEY = _amt;
	(owner _ply) publicVariableClient "CHANGEMONEY";
	
};

//Hide Terrain Upgrades
[[ul_0,ul_1,ul_2,ul_3,ul_4,ul_5,ul_6,ul_7,ul_8,ul_9,ul_10,ul_11,ul_12,ul_13,ul_14,ul_15,ul_16,ul_17,ul_18,ul_19,ul_20,ul_21,ul_22,ul_23,ul_24,ul_25,ul_26,ul_27,ul_28,ul_29,ul_30,ul_31,ul_32,ul_33,ul_34,ul_35,ul_36,ul_37,ul_38,ul_39,ul_40,ul_41,ul_42,ul_43,ul_44], true] call TFD_fnc_hideUpgrade;

//Initialise Admin Panel
nul = [] execVM "adminpanelmk2\init.sqf";

waitUntil { time > 10 };
[] execVM "scripts\mission\mainLoop.sqf";

setObjectViewDistance 1000;
setViewDistance 1000;
setTerrainGrid 50;