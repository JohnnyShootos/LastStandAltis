params ["_group"];

systemChat "Sniper Team Spawned";

//Notify Players
sleep 5;
{ NOTIFY_PLAYER = ["TaskAssigned",["","Enemy Forward Observers are in the area!"]]; (owner _x) publicVariableClient "NOTIFY_PLAYER"; } forEach playableUnits;

while {{alive _x} count (units _group) > 0} do {
	sleep _rof;
	//gethered intel variable
	_intel = 0;
	_target = objNull;
	//waituntil observers know about players
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
	_rof = 15;
	_roundType = "Sh_82mm_AMOS";
	_strikeTarget = getPosATL _target;
	_dispersion = 50;
	_mortarPos = [(_target select 0) - _dispersion*sin(random 360),(_target select 1) - _dispersion*cos(random 360),500];

	_bomb = _roundType createVehicle _mortarPos;
	[_bomb, -90, 0] call BIS_fnc_setPitchBank;
   	_bomb setVelocity [0,0,-100];

	systemChat "Mortar Fired";
   	

};

//Notify Players
{ NOTIFY_PLAYER = ["TaskSucceeded",["","Enemy Forward Observers eliminated"]]; (owner _x) publicVariableClient "NOTIFY_PLAYER"; } forEach playableUnits;
systemChat "Sniper Team Eliminated";