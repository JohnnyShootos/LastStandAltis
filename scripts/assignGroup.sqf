// Put the player object names in the  groups you have assigned them to in your mission. They must be a string value. The first string of the group determines the group name. Any changes to the group name mus tbe carried to the setPatch.sqf to apply a unit patch to the unit.

TFD_ORBAT = [
	["Command", "s1", "s2", "s3"],
	[ "Alpha", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11"],
	[ "Bravo", "s12", "s13", "s14", "s15", "s16", "s17", "s18", "s19"],
	[ "Charlie", "s29", "s30", "s31", "s32", "s33", "s34", "s35", "s36"],
	[ "Delta", "s37", "s38", "s39", "s40", "s41", "s42", "s43", "s44"],
	[ "Echo", "s20", "s21", "s22"],
	[ "Foxtrot", "s23", "s24", "s25"],
	[ "MAT", "s26", "s27", "s28"],
	[ "HAT", "s29", "s30", "s31"]

];

{
	_n = format ["%1", _x];
	_p = _x;
	{
		
		if (_n in _x) then {
			(group _p) setGroupId [(_x select 0)];
		};

	} forEach TFD_ORBAT;

} forEach playableUnits;
