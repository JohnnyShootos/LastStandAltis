//Kit out the players
_handle = [] execVM "scripts\playerKit.sqf";
waitUntil { scriptDone _handle };

//Execute Player Setup sqf
_handle = [] execVM "scripts\playerSetup.sqf";
waitUntil { scriptDone _handle };

player setDir ([player, sphere_target] call BIS_fnc_dirTo);

//Close the spectator if the player respawned during the mission
["Terminate"] call BIS_fnc_EGSpectator;

//Kill Stamina
if (isStaminaEnabled player) then {player enableStamina false;};

//Change weight coefficient
player setUnitTrait ["audibleCoef",1];
player setUnitTrait ["camouflageCoef",1];
player setUnitTrait ["explosiveSpecialist",1];
player setUnitTrait ["loadCoef ",0.01];
player setUnitTrait ["engineer",1];
player setUnitTrait ["explosiveSpecialist",1];