_grp = groupID (group player);
	
switch (_grp) do {
	case "Command":
		{
			[player,"cmdPatch"] call BIS_fnc_setUnitInsignia;
		};
	case "Alpha":
		{
			[player,"aPatch"] call BIS_fnc_setUnitInsignia;
		};
	case "Bravo":
		{
			[player,"bPatch"] call BIS_fnc_setUnitInsignia;
		};
	case "Charlie":
		{
			[player,"cPatch"] call BIS_fnc_setUnitInsignia;
		};
	case "Delta":
		{
			[player,"dPatch"] call BIS_fnc_setUnitInsignia;
		};
	case "Echo":
		{
			[player,"ePatch"] call BIS_fnc_setUnitInsignia;
		};
	case "Foxtrot":
		{
			[player,"fPatch"] call BIS_fnc_setUnitInsignia;
		};
	case "MMG":
		{
			[player,"mmgPatch"] call BIS_fnc_setUnitInsignia;
		};
	case "MAT":
		{
			[player,"matPatch"] call BIS_fnc_setUnitInsignia;
		};
	case "HAT":
		{
			[player,"hatPatch"] call BIS_fnc_setUnitInsignia;
		};
};