if !(isNil "JSH_FAK_ACTION") then { player removeAction JSH_FAK_ACTION};
JSH_FAK_ACTION = player addAction ["<t color='#dd0000'>Heal Yourself</t>", 
	{
		_unit = _this select 0;
		_unitHealth = _unit getVariable 'jsh_health';
		if !('Medikit' in items _unit) then {_unit removeItem "FirstAidKit"};
		_unit setVariable ['player_healing', true, true];
		_unit action ["HealSoldierSelf", _unit];
		sleep 3;
		_unit setVariable ['player_healing', false, true];
	}, 
	[], 
	1, 
	false, 
	true, 
	"", 
	"(_this getVariable 'jsh_health' > 0.25) && !(_this getVariable ['placing_charge',false]) && ('FirstAidKit' in items _this || 'Medikit' in items _this) && !(_this getVariable ['player_healing',false])", 
	-1, 
	false
];
/**
if !(isNil "JSH_FAK_OTHER_ACTION") then { player removeAction JSH_FAK_OTHER_ACTION};
JSH_FAK_OTHER_ACTION = player addAction ["<t color='#dd0000'>Give First Aid</t>", 
	{
		_unit = _this select 0;
		_injured = _this select 3 select 0;
		_unitHealth = _injured getVariable 'jsh_health';
		_unit removeItem "FirstAidKit";
		_unit setVariable ['player_healing', true, true];
		_injured setVariable ['player_healing', true, true];
		_unit action ["HealSoldier", _injured];
		sleep 3;
		_unit setVariable ['player_healing', false, true];
		_injured setVariable ['player_healing', false, true];
	}, 
	[cursorTarget], 
	999, 
	false, 
	true, 
	"", 
	"(cursorTarget getVariable 'jsh_health' > 0.25) && !(_this getVariable ['placing_charge',false]) && ('FirstAidKit' in items _this || 'Medikit' in items _this) && !(_this getVariable ['player_healing',false])", 
	3, 
	false
];
 */


if !(isNil "JSH_MEDCASE_DEPLOY_ACTION") then { player removeAction JSH_MEDCASE_DEPLOY_ACTION};
JSH_MEDCASE_DEPLOY_ACTION = player addAction ["<t color='#dd0000'>Deploy Med Supplies</t>",
	{
		_unit = _this select 0;
		_caseType = _this select 3 select 0;
		_pos = _unit getPos [1,(direction _unit)];
		_posFixed = [(_pos # 0), (_pos # 1), ((getPosATL _unit) # 2)];
		_case = createVehicle [_caseType, _posFixed, [], 0, "CAN_COLLIDE"];
		//_case setPosATL getPosWorld _unit;
		//_case setVehiclePosition [_position, [], 0, "CAN_COLLIDE"];
		_unit removeItem "Medikit";
		
		//Cleanup the case after 5 mins if still deployed
		[_case] spawn {
			private _case = _this select 0;
			sleep 300; 
			if !(isNull _case) then {deleteVehicle _case}
		};
		
		//Add Heal Action to case
		[ 
			_case, 
			"Get Medical Treatment","\A3\ui_f\data\igui\cfg\simpleTasks\types\interact_ca.paa","\A3\ui_f\data\igui\cfg\simpleTasks\types\heal_ca.paa", 
			"(_this distance _target < 2) && ((_this getVariable ['jsh_health',0]) > 0)", 
			"_caller distance _target < 2", 
			{}, 
			{_cur = player getVariable 'jsh_health'; _new = _cur - 0.05; player setVariable ['jsh_health', (_new max 0),true]}, 
			{}, 
			{}, 
			[], 
			6, 
			999, 
			false 
		] remoteExec ["bis_fnc_holdActionAdd", 0, true];
		
		//Add Packup action to case
		[ 
			_case, 
			"PackUp Medical Supplies","\A3\ui_f\data\igui\cfg\simpleTasks\types\interact_ca.paa","\A3\ui_f\data\igui\cfg\simpleTasks\types\repair_ca.paa", 
			"(_this distance _target < 2) && (_this canAddItemToBackpack 'Medikit')", 
			"_caller distance _target < 2", 
			{}, 
			{}, 
			{
				_case = _this select 3 select 0; 
				_caller = _this select 1;

				if (_caller canAddItemToBackpack 'Medikit') then {
					deleteVehicle _case;
					_caller addItemToBackpack 'Medikit';
				} else { hint "Not Enough Space in Backpack!!"};
			}, 
			{}, 
			[_case], 
			2, 
			999, 
			false 
		] remoteExec ["bis_fnc_holdActionAdd", 0, true];
	},
	["Land_PlasticCase_01_small_F"],
	-998,
	false,
	true,
	"",
	"('Medikit' in items _this)",
	-1,
	false
];
