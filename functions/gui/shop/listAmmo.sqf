#define SHOPLIST 1500
#define SHOPDISP 6666

disableSerialization;

_ctrl = (findDisplay 6666) displayCtrl SHOPLIST;
lbClear _ctrl;

_compatHgunMags = [""];
_compatPrimaryMags = [""];
_compatLauncherMags = [""];

_shopConfigList = ("isclass _x" configClasses (missionconfigfile >> "ShopList" >> "AmmoList"));



//Filter usable magazines
_usableMags = [];
{
	_test = configName _x;

	//Collect all weapon mags
	_compatMags = [];
	{
		_mags = [_x,true] call CBA_fnc_compatibleMagazines;
		{_compatMags pushBackUnique _x} forEach _mags;
	} forEach weapons player;
	if (_test in _compatMags) then {_usableMags pushBackUnique _test};

	//Collect compatible throwables
	_compatThrowables = ["Throw",true] call CBA_fnc_compatibleMagazines;
	if (_test in _compatThrowables) then {_usableMags pushBackUnique _test};
	
	//collect put-ables
	_compatPutables = ["Put",true] call CBA_fnc_compatibleMagazines;
	if (_test in _compatPutables) then {_usableMags pushBackUnique _test};
} forEach _shopConfigList;

//Populate the shop list
{
		
	_ctrl lbAdd gettext (configFile >> "CfgMagazines" >> _x >> "displayName");
	_ctrl lbSetPicture [_foreachindex, gettext (configFile >> "CfgMagazines" >> _x >> "picture")];
	_ctrl lbSetPictureColor [_foreachindex, [1, 1, 1, 1]];
	_ctrl lbSetPictureColorSelected [_foreachindex, [1, 1, 1, 1]];
	_ctrl lbSetTooltip [_foreachindex, format ["$%1", getNumber (missionconfigfile >> "ShopList" >> "AmmoList" >> _x >> "cost")]];
	_ctrl lbSetData [_foreachindex, _x];
	

} foreach _usableMags;

_ctrl lbsetcursel 0;
