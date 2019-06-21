while { true } do {
	
	
	_intermission = "TimeBetweenWave" call BIS_fnc_getParamValue;
	
	_currentWave = NEXTWAVE;

	//Mission Intermission
	{ NOTIFY_PLAYER = ["TaskAssigned",["",format ["Next Wave Begins in %1 seconds", _intermission]]]; (owner _x) publicVariableClient "NOTIFY_PLAYER"; } forEach playableUnits;
	
	sleep _intermission;
	
	
	//Start the next wave - or bonus wave
	if (_currentWave mod 5 == 0) then {
		
		
		_handle = [_currentWave] execVM "scripts\mission\spawnBonusWave.sqf";
		waitUntil { scriptDone _handle };

		_handle = [_currentWave] execVM "scripts\mission\spawnWave.sqf";
		waitUntil { scriptDone _handle };
	
	} else {
	
		_handle = [_currentWave] execVM "scripts\mission\spawnWave.sqf";
		waitUntil { scriptDone _handle };
	};
	
	//Respawn time to 10 min while wave up
	[9999999, "setPlayerRespawnTime"] call BIS_fnc_MP;
	
	//Create trigger to detect wave completion
	_trg = createTrigger ["EmptyDetector", getMarkerPos "target"];
	_trg setTriggerArea [400,400, 0, false];
	_trg setTriggerActivation ["WEST", "PRESENT", true];
	
	//Send Notification to all players of wave start
	_text = format ["Wave %1 Started. %2 enemies inbound", _currentWave, ({ side _x == west } count allunits) ];
	{ NOTIFY_PLAYER = ["TaskAssigned",["",_text]]; (owner _x) publicVariableClient "NOTIFY_PLAYER"; } forEach playableUnits;
	publicVariable "NEXTWAVE";
	
	//Give some time to make 100% sure the trigger is initialised and its list populated
	sleep 5;
	
	//Wait for enemies to be all dead or players to be all dead or incapacitated.
	waitUntil { { alive _x && !(_x in playableUnits)} count allUnits < 1 || { alive _x } count playableUnits == 0 || {lifeState _x == "INCAPACITATED"} count playableUnits == count playableUnits};
	
	_survivors = { alive _x } count playableUnits;
	//Successful wave (all enemies dead)
	if (_survivors > 0 && ({lifeState _x == "INCAPACITATED"} count playableUnits != count playableUnits)) then {
		
		{ 
			//Respawn time to 1 sec players if they are dead
			[1, "setPlayerRespawnTime"] call BIS_fnc_MP;
			sleep 1;
			
			
		} forEach playableUnits;
		
		waitUntil { sleep 2; { alive _x } count playableUnits == count playableUnits };	
		
		{
			//Braodcast a notification to players
			_txt = format ["Wave %1 Completed!", _currentWave];
			NOTIFY_PLAYER = ["TaskSucceeded", ["", _txt]];
			(owner _x) publicVariableClient "NOTIFY_PLAYER";
			
					
			
			//Reward the players for completing the wave
			CHANGEMONEY = (500 * ("GameDifficulty" call BIS_fnc_getParamValue)) +  (100 * _currentWave) + (50 * _survivors * ("GameDifficulty" call BIS_fnc_getParamValue));
			(owner _x) publicVariableClient "CHANGEMONEY";
		
		} forEach playableUnits;
		
		
		
	} else { 
		//If all players are dead fail the mission
		["everyonelost"] call BIS_fnc_endMissionServer; 
	};
	
	//remove the trigger object
	deleteVehicle _trg;
	
	//Delete Dead Units in enemy Groups
	{
		_g = _x;
		{
		if (side _x == west) then { deleteVehicle _x; };
		} forEach units _g;
	} forEach allGroups;
	
	//Delete Empty Groups
	{
		if (side _x == west && (count units _x == 0)) then {
			deleteGroup _x;
		};
	} forEach allGroups;
};