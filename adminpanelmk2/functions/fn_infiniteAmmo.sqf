_check = player getVariable ["jsh_adminAmmo", false];
if !(_check) then {
	JSH_ADMIN_INFINITEAMMO_EH = player addEventHandler["FiredMan", { 
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

		//systemChat str [_unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_vehicle]; //Debug usage only

		_cursorType = getText(configFile >> "CfgWeapons" >> _weapon >> "cursor");
		switch _muzzle do {
			case "EGLM";
			case "GL_3GL_F": {_unit addMagazine _magazine; reload _unit}; 
			case _weapon: {
					if (_cursorType in ["rocket","missile"]) then { 
						_unit addMagazine _magazine; reload _unit; 
					} else {
						_unit setVehicleAmmoDef 1; 
					};
				};
			default {_unit setVehicleAmmoDef 1};
		};
		
		
		
	}];
	player setVariable ["jsh_adminAmmo", true, true];
	systemChat "Unlimited Ammo On";
} else {
	player removeEventHandler ["Fired", JSH_ADMIN_INFINITEAMMO_EH];
	JSH_ADMIN_INFINITEAMMO_EH = nil;
	player setVariable ["jsh_adminAmmo", false, true];
	systemChat "Unlimited Ammo Off";
};