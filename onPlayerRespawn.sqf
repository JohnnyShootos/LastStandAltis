//Kit out the players
_handle = [] execVM "scripts\playerKit.sqf";
waitUntil { scriptDone _handle };

//Execute Player Setup sqf
_handle = [] execVM "scripts\playerSetup.sqf";
waitUntil { scriptDone _handle };

//Close the spectator if the player respawned during the mission
["Terminate"] call BIS_fnc_EGSpectator;

//Kill Stamina
if (isStaminaEnabled player) then {player enableStamina false;};

//Change weight coefficient
player setUnitTrait ["loadCoef ",0.01];