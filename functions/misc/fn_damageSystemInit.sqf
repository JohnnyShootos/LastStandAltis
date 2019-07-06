///////////////////////DAMAGE SYSTEM////////////////////////////////////////////ToDo: Make this a mission param.
#define GET_HEALTH(unit) (unit getVariable ['jsh_health',0])
#define SET_HEALTH(unit,value) (unit setVariable ['jsh_health',##value##,true])
////////////////////////////////////////////////////////////////////////////////

//Initialise our custom health value
SET_HEALTH(player,0);

//Nullify all incoming damage to the player as we will be handling that
systemChat "Initialising HandleDamage EH";
player removeAllEventHandlers "HandleDamage";
JSH_EH_handleDamage = player addeventhandler ["HandleDamage",{0}];

//Reduce the damage and store in our variable
if (isNil "JSH_EH_hit") then {
	systemChat "Initialising Hit EH";
	player removeAllEventHandlers "Hit";
	JSH_EH_hit = player addEventHandler ["Hit", {
		_unit = _this select 0;
		_cur = GET_HEALTH(_unit);
		_dmg = ((_this select 2) * (("GameDifficulty" call BIS_fnc_getParamValue) / 4));
		_fin = (_cur + _dmg);
		
		SET_HEALTH(_unit,_fin);
		_chk = GET_HEALTH(_unit);
		//systemChat format ["Health: %1 | Damage: %2 | Damage Final: %3 | Damage Set: %4",_cur,_dmg,_fin,_chk];

	}];
};

//Setup the healing process to work with our variable
if (isNil "JSH_EH_handleHeal") then {
	systemChat "Initialising HandleHeal EH";
	player removeAllEventHandlers "HandleHeal";
	JSH_EH_handleHeal = player addEventHandler ["HandleHeal", {
		_injured = _this select 0;
		_healer = _this select 1;
		_currentHP = GET_HEALTH(_injured);
		
		if ('Medikit' in items _healer) then {
			SET_HEALTH(_injured,0);
		} else {
			SET_HEALTH(_injured,((_currentHP - 0.25) max 0.25));
		};
	}];
};

//Setup per frame handler to update the players health level
["healthCheck", "onEachFrame", {
	_check = player getVariable ['jsh_health',0];
	if (_check >= 1) then {
		["",2,player] call bis_fnc_reviveOnState;
		player setVariable ["#rev", 2, true];
		player setVariable ['jsh_health', 0.99, true];
		//Launch small loop to detect when a player is revived and set health back to 75%
		[] spawn {
			waitUntil {lifeState player != "INCAPACITATED"};
			player setVariable ['jsh_health', 0.25, true];
		};
	}; 
}] call BIS_fnc_addStackedEventHandler;

//Start Passive Heal Loop
[] spawn { 
	
	_getHealth = {_this getVariable ["jsh_health", 0]};
	_setHealth = {player setVariable ["jsh_health", _this, true]};

	waitUntil{alive player};
	while { alive player } do {
		
		waitUntil { (player call _getHealth) <= 0.25 };
		sleep 4;
		_curHealth = player call _getHealth;

		while { (_curHealth > 0) && (_curHealth <= 0.25) } do {
			sleep 1;
			_newHealth = ((player call _getHealth) - 0.01) max 0;
			_newHealth call _setHealth;
			_curHealth = _newHealth;
			//revive the player if they were downed
			if (((player call _getHealth) == 0) && (lifeState player == "INCAPACITATED")) then {["#rev", 1, player] call BIS_fnc_reviveOnState};
		};
	};
};

if !(isNil "JSH_EH_handleDamage" && isNil "JSH_EH_hit" && isNil "JSH_EH_handleHeal") exitWith {systemChat "Damage System Fully Initialised";};

true