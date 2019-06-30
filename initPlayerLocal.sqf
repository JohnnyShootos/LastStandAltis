waitUntil { sleep 1; time > 1 };

STARTING_CASH = "StartCash" call BIS_fnc_getParamValue;

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

AWARD = [STARTING_CASH, player];
publicVariableServer "AWARD";