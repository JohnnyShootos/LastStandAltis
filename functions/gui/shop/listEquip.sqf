#define SHOPLIST 1500
#define SHOPDISP 6666

disableSerialization;

_ctrl = (findDisplay 6666) displayCtrl SHOPLIST;
lbClear _ctrl;
{
	
	_ctrl lbAdd gettext (_x >> "displayName");
	_ctrl lbSetPicture [_foreachindex, gettext (configFile >> "CfgWeapons" >> configName _x >> "picture")];
	if (getText (_x >> "itemType") == "backpack") then {
		_ctrl lbSetPicture [_foreachindex, gettext (configFile >> "CfgVehicles" >> configName _x >> "picture")];
	};
	_ctrl lbSetPictureColor [_foreachindex, [1, 1, 1, 1]];
	_ctrl lbSetTooltip [_foreachindex, format ["$%1", getNumber (_x >> "cost")]];
	_ctrl lbSetData [_foreachindex, getText (_x >> "string")];

} foreach ("isclass _x" configClasses (missionconfigfile >> "ShopList" >> "EquipList"));

_ctrl lbsetcursel 0;
