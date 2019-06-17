disableSerialization;

_plyr = player;

_ctrl = (findDisplay 6666) displayCtrl 1500;

_item = (_ctrl lbData (lbCurSel _ctrl));

_cash = _plyr getVariable ["Cash", 0];
_data = [_item] call TFD_fnc_getPrice;

_itemType = _data select 0;
_itemName = _data select 1; 
_itemCost = _data select 2;

if (_cash < _itemCost) exitWith {};

switch (_itemType) do {

	case "weapon": 
	{
		if !(_itemName in (weapons player)) then {
			
			_primaryWeapon = primaryWeapon player;
			
			if (_primaryWeapon != "") then {
				
				_sellPrice = floor ((([_primaryWeapon] call TFD_fnc_getPrice) select 2) * 0.80);
				
				//Check for attachments and sell them

				_attachments = primaryWeaponItems player;
				{
					if (_x != "") then {
						_sellPrice = _sellPrice + floor (([_x] call TFD_fnc_getPrice) select 2);
					};
				} forEach _attachments;


				AWARD = [_sellPrice, _plyr];
				publicVariableServer "AWARD";
				
				player removeWeapon _primaryWeapon;
			};
			player addMagazine getText(missionConfigFile >> "ShopList" >> "GunsList" >> _itemName >> "magazine");
			player addWeapon _itemName;
			AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
		};
	};
	case "handgun": 
	{
		if !(_itemName in (weapons player)) then {
		
			_handgunWeapon = handgunWeapon player;
			
			if (_handgunWeapon != "") then {
				
				_sellPrice = floor ((([_handgunWeapon] call TFD_fnc_getPrice) select 2) * 0.66);
				
				AWARD = [_sellPrice, _plyr];
				publicVariableServer "AWARD";
				player removeWeapon _handgunWeapon;
			};
			player addMagazine getText(missionConfigFile >> "ShopList" >> "GunsList" >> _itemName >> "magazine");
			player addWeapon _itemName;
			AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
		};
	};
	case "launcher": 
	{
		if !(_itemName in (weapons player)) then {
		
			_secondaryWeapon = secondaryWeapon player;
			
			if (_secondaryWeapon != "") then {
				
				_sellPrice = floor ((([_secondaryWeapon] call TFD_fnc_getPrice) select 2) * 0.66);
				
				AWARD = [_sellPrice, _plyr];
				publicVariableServer "AWARD";
				
				player removeWeapon _secondaryWeapon;
			};
			player addMagazine getText(missionConfigFile >> "ShopList" >> "GunsList" >> _itemName >> "magazine");
			player addWeapon _itemName;
			AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
		};
	};
	case "vest": 
	{
		if !(_itemName isEqualTo vest player) then {
			
			_items = vestItems player;
			
			player addVest _itemName;
			AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
			
			{ player addItemToVest _x } forEach _items;
			
		} else { [format["<t size='0.66' color='#ffff00'>VEST ALREADY EQUIPPED</t>", _amt], 0, 0, 1, 0, -0.25] spawn BIS_fnc_dynamicText;};
	};
	case "helmet": 
	{
		if !(_itemName isEqualTo headgear player) then {
		
			player addHeadgear _itemName;
			AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
		
		} else { [format["<t size='0.66' color='#ffff00'>HELMET ALREADY EQUIPPED</t>", _amt], 0, 0, 1, 0, -0.25] spawn BIS_fnc_dynamicText;};
	};
	case "backpack": 
	{
		if !(_itemName isEqualTo backpack player) then {
	
			_items = backpackItems player;
			
			removeBackpack player;
			player addBackpack _itemName;
			AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
			
			{ player addItemToBackpack _x } forEach _items;
		
		} else { [format["<t size='0.66' color='#ffff00'>BACKPACK ALREADY EQUIPPED</t>", _amt], 0, 0, 1, 0, -0.25] spawn BIS_fnc_dynamicText;};
	};
	case "optic": 
	{
		if !(_itemName in (items player)) then {
			
			_currentWeaponItems = primaryWeaponItems player;
			
			if (!(_itemName in _currentWeaponItems) && (primaryWeapon player != "")) then {
			
				player addPrimaryWeaponItem _itemName;
				AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
				_currentWeaponItems = primaryWeaponItems player;
			
			} else {
			
			player addItem _itemName;
			AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
			};
		} else { [format["<t size='0.66' color='#ffff00'>ALREADY OWNED</t>", _amt], 0, 0, 1, 0, -0.25] spawn BIS_fnc_dynamicText;};
	};
	case "weapacc": 
	{
		if !(_itemName in (items player)) then {
			
			_currentWeaponItems = primaryWeaponItems player;
			
			if (!(_itemName in _currentWeaponItems) && (primaryWeapon player != "")) then {
			
				player addPrimaryWeaponItem _itemName;
				AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
				_currentWeaponItems = primaryWeaponItems player;	
			} else {	
			
			player addItem _itemName;
			AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
			};
		} else { [format["<t size='0.66' color='#ffff00'>ALREADY OWNED</t>", _amt], 0, 0, 1, 0, -0.25] spawn BIS_fnc_dynamicText;};
	};
	case "linkitem": 
	{
		if !(_itemName in (assigneditems player)) then {
		
			player linkItem _itemName;
			AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
		
		} else { [format["<t size='0.66' color='#ffff00'>ALREADY EQUIPPED</t>", _amt], 0, 0, 1, 0, -0.25] spawn BIS_fnc_dynamicText;};
	};
	case "magazine": 
	{
		
		if (player canAddItemToUniform _itemName) then {
			player addMagazine _itemName;
			AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
		} else {
			if (player canAddItemToVest _itemName) then {
				player addMagazine _itemName;
				AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
			} else {
				if (player canAddItemToBackpack _itemName) then {
					player addMagazine _itemName;
					AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
				} else {
					[format["<t size='0.66' color='#ffff00'>INVENTORY FULL</t>", _amt], 0, 0, 1, 0, -0.25] spawn BIS_fnc_dynamicText;
				};
			};
		};
	};
	case "item": 
	{
		if (player canAddItemToUniform _itemName) then {
			player addMagazine _itemName;
			AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
		} else {
			if (player canAddItemToVest _itemName) then {
				player addMagazine _itemName;
				AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
			} else {
				if (player canAddItemToBackpack _itemName) then {
					player addMagazine _itemName;
					AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
				} else {
					[format["<t size='0.66' color='#ffff00'>INVENTORY FULL</t>", _amt], 0, 0, 1, 0, -0.25] spawn BIS_fnc_dynamicText;
				};
			};
		};
	};
	case "rangefinder":
	{
		if !(_itemName in (assigneditems player)) then {
		
			player addWeapon _itemName;
			AWARD = [(0 - _itemCost), _plyr]; publicVariableServer "AWARD";
		
		} else { [format["<t size='0.66' color='#ffff00'>ALREADY EQUIPPED</t>", _amt], 0, 0, 1, 0, -0.25] spawn BIS_fnc_dynamicText;};
	};
};