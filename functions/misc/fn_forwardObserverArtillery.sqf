#define ALIVECHECK(grp) {alive _x} count units grp > 0

params ["_group"];

systemChat "Sniper Team Spawned";

//Notify Players
sleep 5;
{ NOTIFY_PLAYER = ["TaskAssigned",["","Enemy Forward Observers are in the area!"]]; (owner _x) publicVariableClient "NOTIFY_PLAYER"; } forEach playableUnits;

while {ALIVECHECK(_group)} do {
	_rofMin = 20;
	_rofMax = 60;
	sleep random [_rofMin, (_rofMax - _rofMin), _rofMax];
	//gethered intel variable
	_intel = 0;
	_target = objNull;
	//waituntil observers know about players and target the highest threat
	waitUntil {
		{	
			_intelCheck = _group knowsAbout _x;
			if ( _intelCheck > _intel) then {
				_intel = _intelCheck;
				_target = _x;
			};
		} foreach playableUnits;
		_intel > 1
	};

	//start raining down mortar shells on players
	if !(ALIVECHECK(_group)) exitWith {};
	_roundType = "Sh_82mm_AMOS";
	_strikeTarget = getPosATL _target;
	_dispersion = 20;
	_mortarPos = [(_strikeTarget select 0) - _dispersion*sin(random 360),(_strikeTarget select 1) - _dispersion*cos(random 360),500];

	_bomb = _roundType createVehicle _mortarPos;
	[_bomb, -90, 0] call BIS_fnc_setPitchBank;
   	_bomb setVelocity [0,0,-50];

	//systemChat "Mortar Fired";
   	

};

//Notify Players
{ NOTIFY_PLAYER = ["TaskSucceeded",["","Enemy Forward Observers eliminated"]]; (owner _x) publicVariableClient "NOTIFY_PLAYER"; } forEach playableUnits;
systemChat "Sniper Team Eliminated";