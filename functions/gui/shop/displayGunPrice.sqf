disableSerialization;



_ctrl = (findDisplay 6666) displayCtrl 1500;

_data = _ctrl lbData (lbCurSel _ctrl);

_cost = ([_data] call TFD_fnc_getPrice) select 2;

_ctrl = (findDisplay 6666) displayCtrl 1001;

_ctrl ctrlSetText format ["$%1", _cost];

if (player getVariable "Cash" >= _cost) then { _ctrl ctrlSetTextColor [0,1,0,1] } else { _ctrl ctrlSetTextColor [1,0,0,1] };