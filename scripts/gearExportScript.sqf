/**
	Group Item Compiler

	Basic script to copy all the relevant gear classes from Infantry group(s) to clipboard.

	PARAMS:
	0: Array - 	List of classes from CfgGroups that you wish to retrieve the gear from in the format [<sideString>,<factionClassname>,<classname>]
				
				Refer to Config Viewer for correct classnames for side, faction and group.

	
	Example:
		[["West", "BLU_F", "BUS_ReconPatrol"], ["West", "BLU_F", "BUS_InfTeam"], ["West", "BLU_F", "BUS_InfSquad"]] execVM "path\to\thisScript.sqf";

	Example output:
		[
			["arifle_MX_RCO_pointer_snds_F","hgun_P07_snds_F","Rangefinder","arifle_MXM_DMS_LP_BI_snds_F","arifle_MXC_ACO_pointer_snds_F","arifle_MX_ACO_pointer_snds_F","launch_NLAW_F","arifle_MX_GL_Holo_pointer_snds_F","Laserdesignator","arifle_MX_GL_Hamr_pointer_F","hgun_P07_F","Binocular","arifle_MX_SW_pointer_F","arifle_MX_GL_ACO_F","arifle_MX_ACO_pointer_F","arifle_MX_Hamr_pointer_F","arifle_MXM_Hamr_LP_BI_F","arifle_MX_pointer_F"],
			["30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer","16Rnd_9x21_Mag","MiniGrenade","SmokeShell","SmokeShellGreen","SmokeShellBlue","SmokeShellOrange","Chemlight_green","NLAW_F","B_IR_Grenade","1Rnd_HE_Grenade_shell","Laserbatteries","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","APERSMine_Range_Mag","100Rnd_65x39_caseless_mag","HandGrenade"],
			["V_Chestrig_rgr","H_MilCap_mcamo","G_Shades_Black","ItemGPS","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles","H_Booniehat_mcamo","H_HelmetB_light","H_HelmetB_plain_mcamo","H_Watchcap_camo","V_PlateCarrierGL_rgr","H_HelmetSpecB","V_PlateCarrier2_rgr","H_HelmetB_grass","H_HelmetSpecB_blk","H_HelmetB_sand","H_HelmetB_desert","V_PlateCarrier1_rgr","H_HelmetB","V_PlateCarrierSpec_rgr","H_HelmetB_light_desert"],
			["FirstAidKit"]
		]

*/

_this spawn {
	_groupsToScan = _this;
	_soldierArray = [];
	_weaponsArray = [];
	_linkedItemsArray = [];
	_itemsArray = [];
	_magazinesArray = [];

	//Collect Soldier Types
	{
		_path = (configfile >> "CfgGroups" >> (_x # 0) >> (_x # 1) >> "Infantry" >> (_x # 2));

		{
			_soldierArray pushBackUnique getText (_x >> "vehicle");
		} foreach ("isClass _x" configClasses _path);

	} forEach _groupsToScan;

	
	//Scan Each Soldier in each group and gather all their weapons, mags and items.
	{
		//Collect Weapons
		{
			if !(_x in ["Throw", "Put"]) then {
				_weaponsArray pushBackUnique _x;
			}
		} forEach (getArray (configfile >> "CfgVehicles" >> _x >> "respawnWeapons"));
		//Collect Magazines
		{
			_magazinesArray pushBackUnique _x;
		} forEach (getArray (configfile >> "CfgVehicles" >> _x >> "respawnMagazines"));
		//collect linked items
		{
			_linkedItemsArray pushBackUnique _x;
		} forEach (getArray (configfile >> "CfgVehicles" >> _x >> "respawnLinkedItems"));
		//collect items
		{
			_itemsArray pushBackUnique _x;
		} forEach (getArray (configfile >> "CfgVehicles" >> _x >> "RespawnItems"));


	} forEach _soldierArray;

	copyToClipboard str ([_weaponsArray,_magazinesArray,_linkedItemsArray,_itemsArray]);
};