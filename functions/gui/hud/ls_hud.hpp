#include "ls_hud_defines.hpp"


//--- LastStandHud
#define IDC_LASTSTANDHUD_LS_HUDBACK	7657
#define IDC_LASTSTANDHUD_LS_CASHTEXT	7658
#define IDC_LASTSTANDHUD_LS_WAVETEXT	7659
#define IDC_LASTSTANDHUD_LS_ALIVEAITEXT	7660
#define IDC_LASTSTANDHUD_LS_TITLETEXT	7661
#define IDC_LASTSTANDHUD_LS_HUDHEALTHICON	7857
#define IDC_LASTSTANDHUD_LS_HUDHEALTHBAR	7858
#define IDC_LASTSTANDHUD_LS_HUDARMORBAR	7859
#define IDC_LASTSTANDHUD_LS_HUDARMORICON	7860
#define IDC_LASTSTANDHUD_LS_HUDFRAME	8457
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
		// GUI EDITOR OUTPUT START (by JohnnyShootos, v1.063, #Namyfe)
		////////////////////////////////////////////////////////

		class LS_hudFrame
		{
			idc = 8457;
			type = 0;
			deletable = 0;
			style = 64;
			shadow = 2;
			font = "TahomaB";
			text = "";
			x = 0.830532 * safezoneW + safezoneX;
			y = 0.838541 * safezoneH + safezoneY;
			w = 0.163062 * safezoneW;
			h = 0.150463 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,1};
			sizeEx = 1 * GUI_GRID_H * GUI_GRID_H;
		};
		class LS_hudBack: RscText
		{
			idc = 7657;

			x = 0.830532 * safezoneW + safezoneX;
			y = 0.838541 * safezoneH + safezoneY;
			w = 0.163062 * safezoneW;
			h = 0.150463 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class LS_hudHealthIcon: RscPicture
		{
			idc = 7857;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.839346 * safezoneW + safezoneX;
			y = 0.913773 * safezoneH + safezoneY;
			w = 0.0132213 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class LS_hudHealthBar: RscText
		{
			idc = 7858;
			type = 8;
			style = 0;
			colorBar[] = {0.8,0,0,1};
			colorFrame[] = {0.66,0,0,0.5};
			texture = "#(argb,8,8,3)color(1,1,1,1)";

			x = 0.856974 * safezoneW + safezoneX;
			y = 0.913773 * safezoneH + safezoneY;
			w = 0.127806 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		class LS_hudArmorBar: RscText
		{
			idc = 7859;
			type = 8;
			style = 0;
			colorBar[] = {0,0,0.8,1};
			colorFrame[] = {0,0,0.66,0.5};
			texture = "#(argb,8,8,3)color(1,1,1,1)";

			x = 0.856974 * safezoneW + safezoneX;
			y = 0.876157 * safezoneH + safezoneY;
			w = 0.127806 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		class LS_hudArmorIcon: RscPicture
		{
			idc = 7860;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.839346 * safezoneW + safezoneX;
			y = 0.876157 * safezoneH + safezoneY;
			w = 0.0132213 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class LS_cashText: RscStructuredText
		{
			idc = 7658;

			text = "Cash : $1000000"; //--- ToDo: Localize;
			x = 0.936302 * safezoneW + safezoneX;
			y = 0.946888 * safezoneH + safezoneY;
			w = 0.0528851 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		class LS_waveText: RscStructuredText
		{
			idc = 7659;

			text = "Wave: #"; //--- ToDo: Localize;
			x = 0.839346 * safezoneW + safezoneX;
			y = 0.951388 * safezoneH + safezoneY;
			w = 0.0352567 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		class LS_aliveAiText: RscStructuredText
		{
			idc = 7660;

			text = "AI : #"; //--- ToDo: Localize;
			x = 0.892231 * safezoneW + safezoneX;
			y = 0.951388 * safezoneH + safezoneY;
			w = 0.0352567 * safezoneW;
			h = 0.0282118 * safezoneH;
		};
		class LS_titleText: RscText
		{
			idc = 7661;
			font = "PuristaSemibold";
			text = "Last Stand : Altis"; //--- ToDo: Localize;
			x = 0.839346 * safezoneW + safezoneX;
			y = 0.847945 * safezoneH + safezoneY;
			w = 0.145434 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			class Attributes {
				align = "centre";
			};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
    };
};