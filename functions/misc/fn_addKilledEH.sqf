_this addEventHandler [
	"Killed",
	{
		params ["_unit", "_killer", "_instigator", "_useEffects"];
				_reward = 0;
		if (isPlayer _killer || isPlayer _instigator) then {
			if (_unit isKindOf "Man") then { _reward = "BaseRewardMan" call BIS_fnc_getParamValue; } else {
				if (_unit isKindOf "Car" && !(_unit isKindOf "Wheeled_APC_F")) then { _reward = "BaseRewardCar" call BIS_fnc_getParamValue; } else {
					if (_unit isKindOf "Wheeled_APC_F") then { _reward = "BaseRewardAPC" call BIS_fnc_getParamValue; } else {
						if (_unit isKindOf "Tank") then { _reward = "BaseRewardTank" call BIS_fnc_getParamValue; } else {
							if (_unit isKindOf "Helicopter") then { _reward = "BaseRewardHeli" call BIS_fnc_getParamValue; } else {

							};
						};
					};
				};
			};
		};

		AWARD = [_reward, _instigator]; publicVariableServer "AWARD";
	}
];