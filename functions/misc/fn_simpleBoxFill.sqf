/*=============================================================================
Simple Box filler - by JohnnyShootos

Params:
0: OBJECT - the object that will be used as the ammobox. Must be an ammobox object or vehicle with cargo space
1: SCALAR - how often, in seconds, that the box is emptied and refilled. (Default 60)
2: SCALAR - amount of each item that is added to the box (weapons, bags, items) (Default 10)
3: SCALAR - amount of each magazine that is added to the box (Default 30)
4: SCALAR - radius from the ammobox that the cleanup script will remove all rubbish (Default 20).

example:
_nul = [this, 120, 10, 20, 20] spawn TFD_fnc_simpleBoxFill 	<- In init field of ammobox.

[<box>, 120, 10, 20, 20] spawn TFD_fnc_simpleBoxFill 		<- From within a script where <box>
                                                               is the name of the box object.
==============================================================================*/



//Only run on server
if !(isServer||isDedicated) exitWith {};

//Parse variables
_box = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_freq = [_this, 1, 60,[0]] call BIS_fnc_param;
_itemAmt = [_this, 2, 10,[0]] call BIS_fnc_param;
_magAmt = [_this, 3, 30,[0]] call BIS_fnc_param;
_cleanRadius = [_this, 4, 20, [0]] call BIS_fnc_param;


//======================SET BOX CONTENTS HERE=================================
_boxWeps = 
[
	"hgun_Pistol_heavy_01_MRD_F",
	"SMG_02_ACO_F",
	"SMG_01_Holo_pointer_snds_F",
	"arifle_TRG20_F",
	"arifle_TRG21_GL_ACO_pointer_F",
	"arifle_MXC_Holo_F",
	"arifle_MX_Hamr_pointer_F",
	"arifle_MX_GL_F",
	"srifle_DMR_01_ARCO_F",
	"srifle_EBR_DMS_F",
	"LMG_Mk200_pointer_F",
	"LMG_Zafir_F",
	"srifle_GM6_camo_SOS_F",
	"launch_RPG32_F"
];
_boxMags = 
[
	"16Rnd_9x21_Mag",
	"11Rnd_45ACP_Mag",
	"30Rnd_9x21_Mag",
	"30Rnd_45ACP_Mag_SMG_01",
	"30Rnd_556x45_Stanag",
	"30Rnd_65x39_caseless_mag",
	"100Rnd_65x39_caseless_mag_Tracer",
	"10Rnd_762x51_Mag",
	"20Rnd_762x51_Mag",
	"200Rnd_65x39_cased_Box_Tracer",
	"150Rnd_762x51_Box_Tracer",
	"3Rnd_HE_Grenade_Shell",
	"3Rnd_Smoke_Grenade_Shell",
	"3Rnd_UGL_FlareWhite_F",
	"5Rnd_127x108_APDS_Mag",
	"RPG32_F",
	"Titan_AT"
];
_boxItems = 
[
	"NVGoggles"
];
_boxPacks = 
[	
	"B_assaultpack_rgr"
];
//========================END OF BOX CONTENTS SETTING=====================================

clearWeaponCargo _box;
clearMagazineCargo _box;
clearItemCargo _box;
clearBackpackCargo _box;


//{ _box addWeaponCargo [_x, _itemAmt] } forEach _boxWeps;
//{ _box addItemCargo [_x, _itemAmt] } forEach _boxItems;
{ _box addMagazineCargo [_x, _magAmt] } forEach _boxMags;
//{ _box addBackpackCargo [_x, _itemAmt] } forEach _boxPacks;


//Sleep for a while before cleanup
sleep _freq;
//clean up the mess around the crate
if (alive _box) then {
	{ deleteVehicle _x } foreach (nearestObjects[_box,["GroundWeaponHolder"],_cleanRadius]);
};
//rerun the script
[_box,_freq,_itemAmt,_magAmt, _cleanRadius] call TFD_fnc_simpleBoxFill;
if (true) exitWith {};