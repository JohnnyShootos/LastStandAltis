params ["_logicArray", "_hide"];

{
	_objs = synchronizedObjects _x;
	{
		_x hideObjectGlobal _hide;
	} forEach _objs;
} forEach _logicArray;