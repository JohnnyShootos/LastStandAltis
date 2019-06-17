
_test = _this select 0;

_array = [];

{
	_listType = configName _x;
	{
		
		_cost = getNumber (_x >> "cost");
		_name = configName _x;
		_type = getText (_x >> "itemType");
		
		_array pushback _type;
		_array pushback _name;
		_array pushback _cost;
		
	} foreach ("configName _x == _test" configClasses (missionconfigfile >> "ShopList" >> _listType));

} foreach ("isClass _x" configClasses (missionconfigfile >> "ShopList"));

_array;