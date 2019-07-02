#define SHOPLIST 1500
#define SHOPDISP 6666

disableSerialization;

_ctrl = (findDisplay 6666) displayCtrl SHOPLIST;


_shopConfigList = ("isclass _x" configClasses (missionconfigfile >> "ShopList" >> "EquipList"));


//Collect compatible weaponItems
_compatWeapAcc = [];
{
	
	_acc = [_x] call CBA_fnc_compatibleItems;
	if (count _acc > 0) then {
		{
			_compatWeapAcc pushBackUnique _x;
		} forEach _acc;
	};
} forEach weapons player;

//remove any blank strings
_compatWeapAccFixed = _compatWeapAcc - [""];

//Filter shop config List
_shopConfigListFixed = [];
{
	if (getText (_x >> "itemtype") in ["optic","weapacc"]) then { 
		if (configName _x in _compatWeapAccFixed) then {_shopConfigListFixed pushBackUnique _x};
	} else {
		_shopConfigListFixed pushBackUnique _x;
	};
} forEach _shopConfigList;

//Populate ShopList
lbClear _ctrl;
{
	
	switch (getText (_x >> "itemtype")) do {
		case "hidden": {};
		case "backpack": {
			_ctrl lbAdd gettext (configFile >> "CfgVehicles" >> configName _x >> "displayName");
			_ctrl lbSetPicture [_foreachindex, gettext (configFile >> "CfgVehicles" >> configName _x >> "picture")];
			_ctrl lbSetPictureColor [_foreachindex, [1, 1, 1, 1]];
			_ctrl lbSetPictureColorSelected [_foreachindex, [1, 1, 1, 1]];
			_ctrl lbSetTooltip [_foreachindex, format ["$%1", getNumber (_x >> "cost")]];
			_ctrl lbSetData [_foreachindex, configName _x];
		};
		default {
			_ctrl lbAdd gettext (configFile >> "CfgWeapons" >> configName _x >> "displayName");
			_ctrl lbSetPicture [_foreachindex, gettext (configFile >> "CfgWeapons" >> configName _x >> "picture")];
			_ctrl lbSetPictureColor [_foreachindex, [1, 1, 1, 1]];
			_ctrl lbSetPictureColorSelected [_foreachindex, [1, 1, 1, 1]];
			_ctrl lbSetTooltip [_foreachindex, format ["$%1", getNumber (_x >> "cost")]];
			_ctrl lbSetData [_foreachindex, configName _x];
		};
	};
} foreach _shopConfigListFixed;



_ctrl lbsetcursel 0;
