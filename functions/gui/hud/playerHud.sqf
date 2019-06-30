#define hud_status_idc 3600
#define hud_vehicle_idc 3601
#define hud_activity_icon_idc 3602
#define hud_activity_textbox_idc 3603


scriptName "playerHud";
disableSerialization;


while {true} do
{

	private ["_ui","_vitals","_hudVehicle","_health","_tempString","_yOffset","_vehicle"];
	
	_lastHealthReading = 100;
	thirstLevel = player getVariable ["fc_thirst", 0];
	hungerLevel = player getVariable ["fc_hunger", 0];
	
	
	1000 cutRsc ["WastelandHud","PLAIN"];
	_ui = uiNameSpace getVariable "WastelandHud";
	_vitals = _ui displayCtrl hud_status_idc;
	_hudVehicle = _ui displayCtrl hud_vehicle_idc;
	_hudActivityIcon = _ui displayCtrl hud_activity_icon_idc;
	_hudActivityTextbox = _ui displayCtrl hud_activity_textbox_idc;

	//Calculate Health 0 - 100
	_health = ((1 - (player getVariable ['jsh_health',0])) * 100) max 0;
	_health = if (_health > 1) then { floor _health } else { ceil _health };

	// Flash the health colour on the HUD according to it going up, down or the same
	_healthTextColor = "#FFFFFF";

	if (_health != _lastHealthReading) then
	{
		// Health change. Up or down?
		if (_health < _lastHealthReading) then
		{
			// Gone down. Red flash
			_healthTextColor = "#FF1717";
		}
		else
		{
			// Gone up. Green flash
			_healthTextColor = "#17FF17";
		};
	};

	// Make sure we keep a record of the health value from this iteration
	_lastHealthReading = _health;

	// Icons in bottom right
	_str = format ["<br/>%1 <img size='0.7' image='media\money.paa'/>", player getVariable ["Cash", 0]];
	_str = _str + format ["<br/>%1 <img size='0.7' image='media\water.paa'/>", (NEXTWAVE - 1)];
	_str = _str + format ["<br/>%1 <img size='0.7' image='media\food.paa'/>", {side _x == west && ((typeOf _x) isKindOf "Man")} count allUnits];
	_str = _str + format ["<br/><t color='%1'>%2</t> <img size='0.7' image='media\health.paa'/>", _healthTextColor, _health];

	_vitals ctrlShow alive player;
	_vitals ctrlSetStructuredText parseText _str;
	_vitals ctrlCommit 0;
	
	uiSleep 0.2;
};