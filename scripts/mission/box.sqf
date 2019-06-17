_box = _this;

clearWeaponCargoGlobal _box; 
clearItemCargoGlobal _box; 
clearMagazineCargoGlobal _box; 
clearBackpackCargoGlobal _box; 

_box allowDamage false;

_box addEventHandler [ "ContainerOpened", 
	{
	
	_cont = _this select 0;
	_player = _this select 1;
		
	_player addEventHandler ["Put", {
	
		_p = _this select 0;
		_b = _this select 1;
		_i = _this select 2;
		
		if (typeOf _b == "O_supplyCrate_F") then {
		_cost = floor ((([_i] call TFD_fnc_getPrice) select 2) * 0.80);
		
		AWARD = [_cost, _p];
		publicVariableServer "AWARD";
		
		clearWeaponCargoGlobal _b; 
		clearItemCargoGlobal _b; 
		clearMagazineCargoGlobal _b; 
		clearBackpackCargoGlobal _b;
		}; 
		}
	];
	}
];

_box addEventHandler ["ContainerClosed", 
	{
	_cont = _this select 0;
	_player = _this select 1;
	
	_player removeAllEventHandlers "Put";
	}
];