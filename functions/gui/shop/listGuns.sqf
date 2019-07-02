#define SHOPLIST 1500
#define SHOPDISP 6666

disableSerialization;

_ctrl = (findDisplay 6666) displayCtrl SHOPLIST;
lbClear _ctrl;
{
	if (getText (_x >> "itemtype") != "hidden") then {
		_ctrl lbAdd getText (configFile >> "CfgWeapons" >> configName _x >> "displayName");
		_ctrl lbSetPicture [_foreachindex, gettext (configFile >> "CfgWeapons" >> configName _x >> "picture")];
		_ctrl lbSetPictureColor [_foreachindex, [1, 1, 1, 1]];
		_ctrl lbSetPictureColorSelected [_foreachindex, [1, 1, 1, 1]];
		_ctrl lbSetTooltip [_foreachindex, format ["$%1", getNumber (_x >> "cost")]];
		_ctrl lbSetData [_foreachindex, configName _x];
	};

} foreach ("isclass _x" configClasses (missionconfigfile >> "ShopList" >> "GunsList"));

_ctrl lbsetcursel 0;
