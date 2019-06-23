_this addMPEventHandler [
	"MPKilled",
	{
		params ["_unit", "_killer", "_instigator", "_useEffects"];

		_reward = 0;

		if (_unit isKindOf "Man") then { _reward = 50 } else {
			if (_unit isKindOf "Car" && !(_unit isKindOf "Wheeled_APC_F")) then { _reward = 250 } else {
				if (_unit isKindOf "Wheeled_APC_F") then { _reward = 1500 } else {
					if (_unit isKindOf "Tank") then { _reward = 3000 } else {
						if (_unit isKindOf "Helicopter") then { _reward = 6000 } else {

						};
					};
				};
			};
		};

		AWARD = [floor ((_reward*("GameDifficulty" call BIS_fnc_getParamValue)) / 2), _instigator]; publicVariableServer "AWARD";
	}
];