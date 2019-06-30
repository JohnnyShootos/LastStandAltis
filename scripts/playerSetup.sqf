player enableFatigue false;

[] execVM "functions\gui\hud\playerHud.sqf";

// Give Admins the Panel of Doom:
_admins = [
	"76561197987496729" 	//JohnnyShootos
];

if (getPlayerUID player in _admins) then {
	
	(findDisplay 46) displayAddEventHandler ["keyDown",{
		_ctrl = _this select 0; 
		_dikCode = _this select 1; 
		_shift = _this select 2; 
		_ctrlKey = _this select 3;
		_alt = _this select 4;
		_yourKey = 0x23; //https://community.bistudio.com/wiki/DIK_KeyCodes
		
		if (_dikCode == _yourKey) then {
			createDialog "TFD_AdminPanel";
			true
		};
	}]; 

};

//Add Holster Script
(findDisplay 46) displayAddEventHandler ["keyDown",{
		_ctrl = _this select 0; 
		_dikCode = _this select 1; 
		_shift = _this select 2; 
		_ctrlKey = _this select 3;
		_alt = _this select 4;
		_yourKey = 0x0B; //https://community.bistudio.com/wiki/DIK_KeyCodes
		
		if (_dikCode == _yourKey) then {
			[] call TFD_fnc_clientHolster;
			true
		};
}];

//Turn Chemlights into roadflares.
if !(isNil "JSH_ROADFLARE") then { player removeEventHandler ["Fired",JSH_ROADFLARE]};
JSH_ROADFLARE = player addEventHandler ["Fired", {
	if (_this select 4 isKindOf "Chemlight_Red") then {
		[_this select 6] spawn {
			_proj = _this select 0;
			waitUntil { vectorMagnitude velocity _proj == 0};
			_flareObj2 = "SmokeShellRed_Infinite" createVehicle position _proj;
			playSound3D ["A3\Sounds_F\weapons\Flare_Gun\flaregun_2.wss", objNull, false, position _proj, 1, 1, 0];
			_flareObj1 = "F_20mm_Red_Infinite" createVehicle position _proj;
			deleteVehicle _proj;
			sleep 90;
			deleteVehicle _flareObj1;
			deleteVehicle _flareObj2;
		};
	};
}];




/**
//Custom Health System Protoype
player setVariable ["currentDamage",0];
_handle = vehicle player addEventHandler ["HandleDamage",{
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
	
	_modifier = ("GameDifficulty" call BIS_fnc_getParamValue) / 4;
	_damageInit = player getVariable ["currentDamage",0];
	_damageTaken = (_damage - _damageInit) * _modifier;
	_damageFinal = _damageInit + _damageTaken;

	if (_selection == "") then {
		systemChat format[" Index = %1 || Initial Damage = %2 || Modified Damage = %3 || Total Damage = %4",_hitIndex, parseNumber (_damageInit toFixed 1), parseNumber (_damageTaken toFixed 1), parseNumber (_damageFinal toFixed 1)];
		_unit setDamage _damageFinal;
		player setVariable ["currentDamage", _damageFinal];
	};
	0
}];
*/

//Init Damage System
[] call TFD_fnc_damageSystemInit;

//Med System Init
[] call TFD_fnc_medSystemInit;
