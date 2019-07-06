#include "ls_hud_defines.hpp"


//--- LastStandHud
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

#define YFLIP(value) (1 - value)

class LastStandHUD {
		idd = -1;
		fadeout=0;
		fadein=0;
		duration = 20;
		name= "LastStandHUD";
		onLoad = "uiNamespace setVariable ['LastStandHUD', _this select 0]";

	class controls {

		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by JohnnyShootos, v1.063, #Susavy)
		////////////////////////////////////////////////////////
		class LS_hudFrame: RscText
		{
			idc = IDC_LASTSTANDHUD_LS_HUDFRAME;
			style = 64;
			shadow = 2;
			font = "TahomaB";
			text = "";
			x = 0.262017 * safezoneW + safezoneX;
			y = 0.885561 * safezoneH + safezoneY;
			w = 0.202726 * safezoneW;
			h = 0.112847 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,1};
		};
		class LS_hudBack: RscText
		{
			idc = IDC_LASTSTANDHUD_LS_HUDBACK;

			x = 0.262017 * safezoneW + safezoneX;
			y = 0.885561 * safezoneH + safezoneY;
			w = 0.202726 * safezoneW;
			h = 0.112847 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class LS_hudHealthIcon: RscPicture
		{
			idc = IDC_LASTSTANDHUD_LS_HUDHEALTHICON;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.266424 * safezoneW + safezoneX;
			y = 0.923177 * safezoneH + safezoneY;
			w = 0.0352567 * safezoneW;
			h = 0.0658275 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class LS_hudHealthBar: RscText
		{
			idc = IDC_LASTSTANDHUD_LS_HUDHEALTHBAR;
			type = 8;
			colorBar[] = {0.8,0,0,0.8};
			colorFrame[] = {0,0,0,0.75};
			texture = "#(argb,8,8,3)color(1,1,1,1)";

			x = 0.301681 * safezoneW + safezoneX;
			y = 0.923177 * safezoneH + safezoneY;
			w = 0.154248 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		class LS_healthBarText: RscStructuredText
		{
			idc = IDC_LASTSTANDHUD_LS_HEALTHBARTEXT;

			text = "AI : #"; //--- ToDo: Localize;
			x = 0.301681 * safezoneW + safezoneX;
			y = 0.923177 * safezoneH + safezoneY;
			w = 0.154248 * safezoneW;
			h = 0.0282118 * safezoneH;
			class Attributes {
				align = "center";
			};
		};
		class LS_cashText: RscStructuredText
		{
			idc = IDC_LASTSTANDHUD_LS_CASHTEXT;

			text = "Cash : $100000"; //--- ToDo: Localize;
			x = 0.398637 * safezoneW + safezoneX;
			y = 0.958000 * safezoneH + safezoneY;
			w = 0.0616993 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		class LS_waveText: RscStructuredText
		{
			idc = IDC_LASTSTANDHUD_LS_WAVETEXT;

			text = "Wave: #"; //--- ToDo: Localize;
			x = 0.301681 * safezoneW + safezoneX;
			y = 0.960792 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		class LS_aliveAiText: RscStructuredText
		{
			idc = IDC_LASTSTANDHUD_LS_ALIVEAITEXT;

			text = "AI : #"; //--- ToDo: Localize;
			x = 0.350159 * safezoneW + safezoneX;
			y = 0.960792 * safezoneH + safezoneY;
			w = 0.048478 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		class LS_titleText: RscText
		{
			idc = IDC_LASTSTANDHUD_LS_TITLETEXT;
			font = "PuristaSemibold";

			text = "Last Stand : Altis"; //--- ToDo: Localize;
			x = 0.28846 * safezoneW + safezoneX;
			y = 0.894965 * safezoneH + safezoneY;
			w = 0.149841 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			class Attributes {
				align = "center";
			};
		};
		
		
		
		
		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////





    };
};