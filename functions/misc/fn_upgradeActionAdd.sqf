params ["_box", "_logic", "_description"];
_costBase = (_box getVariable ['cost', 999999]);
_modifier = (("BuildCostModifier" call BIS_fnc_getParamValue)/2);
_cost = _costBase*_modifier;

[
	_box, 
	format ["<t color='#FFAA00'>Purchase %1 $%2</t>", _description, _cost], 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa", 
	"_this distance _target < 5", 
	"_caller distance _target < 5", 
	{}, 
	{}, 
	{_this call TFD_fnc_purchaseUpgrade}, 
	{}, 
	[_logic], 
	1, 
	999, 
	false, 
	false
] call BIS_fnc_holdActionAdd;