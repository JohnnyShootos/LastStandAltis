params ["_triggerObj", "_player", "_id", "_logicArray"];

_player = player;

_logic = _logicArray # 0;

_baseCost = (_triggerObj getVariable ["cost", 99999999]);
_modifier = (("BuildCostModifier" call BIS_fnc_getParamValue)/2);

_cost = _baseCost * _modifier;

_currentCash = _player getVariable ["Cash", 0];

if (_currentCash >= _cost) then {
	AWARD = [(0 - _cost), _player]; publicVariableServer "AWARD";
	[[_logic], false] remoteExec ["TFD_fnc_hideUpgrade", 2, false];
	[_triggerObj, true] remoteExec ["hideObjectGlobal", 2];
} else {
	[format["<t size='0.66' color='#ff0000'>INSUFFICIENT FUNDS</t>"], 0, 0, 1, 0, -0.25] spawn BIS_fnc_dynamicText;
};