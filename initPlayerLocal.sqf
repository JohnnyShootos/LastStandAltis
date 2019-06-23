waitUntil { sleep 1; time > 1 };

STARTING_CASH = ("StartCash" call BIS_fnc_getParamValue) / ("GameDifficulty" call BIS_fnc_getParamValue);

/** OLD REWARD EVENTHANDLER
player addEventHandler ["HandleRating",

	{
		_p = _this select 0;
		//systemChat format ["Unit is: %1", _p];
		
		_s = _this select 1;
		//systemChat format ["Rating was: %1", _s];
		
		if ( _s >= 0 ) then {
		
			AWARD = [floor ((_s*("GameDifficulty" call BIS_fnc_getParamValue)) / 2), _p]; 
			publicVariableServer "AWARD";
		
		} else { 
		
			AWARD = [floor ((_s*("GameDifficulty" call BIS_fnc_getParamValue)) / 2), _p];
			publicVariableServer "AWARD";
		
		};
		//systemChat format ["Transmitted Award to server is : %1", AWARD];
	}
];
 */

"CHANGEMONEY" addPublicVariableEventHandler {
	
	_amt = _this select 1;
	//systemChat format ["_amt is: %1", _amt];
	
	_balance = player getVariable ["Cash", 0];
	//systemChat format ["_balance is: %1", _balance];
	
	_total = (_balance + _amt);
	//systemChat format ["_total is: %1", _total];
	
	player setVariable ["Cash", _total, true];
	
	if (_amt > 0) then { [format["<t size='0.66' color='#ffff00'>+$%1</t>", _amt], 0, 0, 1, 0, -0.25] spawn BIS_fnc_dynamicText; };
	if (_amt < 0) then { [format["<t size='0.66' color='#ff0000'>-$%1</t>", abs _amt], 0, 0, 1, 0, -0.25] spawn BIS_fnc_dynamicText; };
};

"NOTIFY_PLAYER" addPublicVariableEventHandler {

	_data = _this select 1;
	
	_data call BIS_fnc_showNotification;

};

//Start Passive Heal Loop
[] spawn { 
	waitUntil{alive player};
	while { alive player } do {
		
		waitUntil { damage player > 0 };
		
		while { damage player > 0 } do {
			sleep 1;
			player setDamage (damage player - 0.01);
			
			//revive the player if they were downed
			if ((damage player == 0) && (lifeState player == "INCAPACITATED")) then {["#rev", 1, player] call BIS_fnc_reviveOnState};
		};
	};
};

AWARD = [STARTING_CASH, player];
publicVariableServer "AWARD";