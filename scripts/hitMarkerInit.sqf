while {true} do {

	{
		if (side _x == west) then {
			_x execVM "scripts\initHitMarkerEH.sqf";
		};
	} forEach allUnits;
	sleep 2;
};