#define IDC_LASTSTANDHUD_LS_HUDFRAME 8457
#define IDC_LASTSTANDHUD_LS_HUDBACK	7657
#define IDC_LASTSTANDHUD_LS_CASHTEXT 7658
#define IDC_LASTSTANDHUD_LS_WAVETEXT 7659
#define IDC_LASTSTANDHUD_LS_ALIVEAITEXT 7660
#define IDC_LASTSTANDHUD_LS_TITLETEXT 7661
#define IDC_LASTSTANDHUD_LS_HEALTHBARTEXT 7662
#define IDC_LASTSTANDHUD_LS_HUDHEALTHICON 7857
#define IDC_LASTSTANDHUD_LS_HUDHEALTHBAR 7858
#define IDC_LASTSTANDHUD_LS_HUDARMORBAR	7859
#define IDC_LASTSTANDHUD_LS_HUDARMORICON 7860

#define GET_HEALTH(unit) (unit getVariable ['jsh_health',0])
#define GET_CASH(unit) (unit getVariable ['Cash',0])
#define CASH_ICON   "\a3\modules_f_curator\data\portraitcuratoraddpoints_ca.paa"
#define WAVE_ICON   "\a3\ui_f\data\gui\rsc\rscdisplayarcademap\icon_toolbox_groups_ca.paa"
#define AI_ICON     "\a3\ui_f\data\igui\cfg\mptable\infantry_ca.paa"
#define HEALTH_ICON "\a3\ui_f\data\igui\cfg\actions\bandage_ca.paa"

scriptName "playerHud";
disableSerialization;

waitUntil {alive player};
while {alive player} do
{

	private ["_ui","_hud_health","_hud_armor","_health","_armor"];
	
	//Setup variables for controls
	10002 cutRsc ["LastStandHUD","PLAIN"];
	_ui = uiNameSpace getVariable "LastStandHUD";
	_hud_health_bar = _ui displayCtrl IDC_LASTSTANDHUD_LS_HUDHEALTHBAR;
	_hud_health_bar_text = _ui displayCtrl IDC_LASTSTANDHUD_LS_HEALTHBARTEXT;
	_hud_health_icon = _ui displayCtrl IDC_LASTSTANDHUD_LS_HUDHEALTHICON;
	_hud_wave_text = _ui displayCtrl IDC_LASTSTANDHUD_LS_WAVETEXT;
	_hud_aliveAI_text = _ui displayCtrl IDC_LASTSTANDHUD_LS_ALIVEAITEXT;
	_hud_cash_text = _ui displayCtrl IDC_LASTSTANDHUD_LS_CASHTEXT;
	_hud_title_bar_text = _ui displayCtrl IDC_LASTSTANDHUD_LS_TITLETEXT;

	//Calculate Health 0 - 100
	_health = (1 - GET_HEALTH(player));

	//Find the Wave we are on
	_curr_wave = NEXTWAVE - 1;
	
	//Fin total amount of AI units alive
	_aliveAIcount = ({side _x == west && ((typeOf _x) isKindOf "Man")} count allUnits);

	//Update the display
	_hud_title_bar_text ctrlSetText format ["Last Stand: %1 - %2",worldName,name player];
	_hud_health_icon ctrlSetText HEALTH_ICON; _hud_health_icon ctrlSetTextColor [0.8, 0, 0, 0.8];
	_hud_health_bar progressSetPosition _health; _hud_health_bar ctrlCommit 1;
	_hud_health_bar_text ctrlSetStructuredText parsetext format ["%1%2",round (_health*100),'%'];
	_hud_wave_text ctrlSetStructuredText parseText format ["<img size='1.25' image='\a3\missions_f_curator\data\img\portraitmptypesectorcontrol_ca.paa'/> : %1", _curr_wave];
	_hud_aliveAI_text ctrlSetStructuredText parseText format ["<img size='1.25' image='\a3\ui_f\data\igui\cfg\mptable\infantry_ca.paa'/> : %1", _aliveAIcount];
	_hud_cash_text ctrlSetStructuredText parseText format ["<img size='1.5' image='\a3\modules_f_curator\data\portraitcuratoraddpoints_ca.paa'/>%1", GET_CASH(player)];


	uiSleep 0.5;
};

