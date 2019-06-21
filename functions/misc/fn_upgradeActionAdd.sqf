params ["_box", "_logic"];
_cost = (_box getVariable ['cost', 999999]);

[
	_box, 
	format ["<t color='#FFAA00'>Fortify Building $%1</t>", _cost], 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa", 
	"_this distance _target < 2", 
	"_caller distance _target < 2", 
	{}, 
	{}, 
	{_this call TFD_fnc_purchaseUpgrade}, 
	{}, 
	[_logic], 
	1, 
	0, 
	false, 
	false
] call BIS_fnc_holdActionAdd;