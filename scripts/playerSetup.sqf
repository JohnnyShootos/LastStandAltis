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