_test = _this getVariable ["hitMarkerInit",false];
if !(_test) then {
	_this addEventHandler ["HitPart", {
		_arr = _this select 0;
		_target = _arr select 0;
		_shooter = _arr select 1;
		_direct = _arr select 10;
		_part = _arr select 5 select 0;

		if (_target isKindOf "Man") then {
			if (_part == "head") then {
				["hitmarker",["cod_hitmarkerRed", "PLAIN", 0, false]] remoteExec ["cutRsc", _shooter];
				"headdink" remoteExec ["playSound", _shooter];
			} else {
				["hitmarker",["cod_hitmarker", "PLAIN", 0, false]] remoteExec ["cutRsc", _shooter];
				"hitmarker" remoteExec ["playSound", _shooter];
			};
			
		};
		if !(alive _target) then {_target removeAllEventHandlers "HitPart"};
	}];
	_this setVariable ["hitMarkerInit", true];
};
