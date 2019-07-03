#include "common.hpp"

#define hud_status_idc 3600
#define hud_vehicle_idc 3601
#define hud_activity_icon_idc 3602
#define hud_activity_textbox_idc 3603

#define IDC_JSH_HUD_BACKGROUND		11613
#define IDC_JSH_HUD_TITLETEXT		11614
#define IDC_JSH_HUD_XP_PROGRESSBAR	11713
#define IDC_JSH_HUD_HEALTH_PROGRESSBAR	11714
#define IDC_JSH_HUD_XP_PROGRESSBAR_TEXT	11715
#define IDC_JSH_HUD_HEALTH_PROGRESSBAR_TEXT	11716
#define IDC_JSH_HUD_CURRENT_RANK_ICON	11813
#define IDC_JSH_HUD_HEALTH_ICON		11815
#define IDC_JSH_HUD_NEXT_RANK_ICON	11816
#define IDC_JSH_HUD_FRAME		12413

class WastelandHud {
	idd = -1;
	fadeout=0;
	fadein=0;
	duration = 20;
	name= "WastelandHud";
	onLoad = "uiNamespace setVariable ['WastelandHud', _this select 0]";

	class controlsBackground {
		class WastelandHud_Vehicle:w_RscText
		{
			idc = hud_vehicle_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
			y = safeZoneY + (safeZoneH * (1 - (0.33 / SafeZoneH)));
			w = 0.4; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		class WastelandHud_Status:w_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.24 / SafeZoneW)));
			y = safeZoneY + (safeZoneH * (1 - (0.22 / SafeZoneH)));
			w = 0.22; h = 0.22;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		class WastelandHud_ActivityIcon:w_RscText
		{
			idc = hud_activity_icon_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.03;
			x = safeZoneX + (safeZoneW * 0.007);
			y = safeZoneY + (safeZoneH * 0.011);
			w = (0.06 * 3/4) * safezoneW;
			h = 0.05 * safezoneH;
			colorText[] = {1,1,1,1};
			lineSpacing = 2;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "center";
				valign = "middle";
			};
		};
		class WastelandHud_ActivityTextBox:w_RscText
		{
			idc = hud_activity_textbox_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.03;
			x = safeZoneX + (safeZoneW * 0.055);
			y = safeZoneY + (safeZoneH * 0.011);
			w = 0.18 * safezoneW;
			h = 0.05 * safezoneH;
			colorText[] = {1,1,1,1};
			lineSpacing = 2;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 1;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
	};
};

class OperatorsHUD {
		idd = -1;
		fadeout=0;
		fadein=0;
		duration = 20;
		name= "OperatorsHUD";
		onLoad = "uiNamespace setVariable ['OperatorsHUD', _this select 0]";

	class controls {

	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by JohnnyShootos, v1.063, #Biroci)
	////////////////////////////////////////////////////////

		class jsh_hud_frame: RscFrame
		{
			idc = IDC_JSH_HUD_FRAME;
			x = 0.0064056 * safezoneW + safezoneX;
			y = 0.904369 * safezoneH + safezoneY;
			w = 0.118992 * safezoneW;
			h = 0.0846353 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class jsh_hud_background: RscText
		{
			idc = IDC_JSH_HUD_BACKGROUND;
			x = 0.0064056 * safezoneW + safezoneX;
			y = 0.904369 * safezoneH + safezoneY;
			w = 0.118992 * safezoneW;
			h = 0.0846353 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class jsh_hud_xp_progressbar
		{
			idc = IDC_JSH_HUD_XP_PROGRESSBAR;
			type = 8;
			style = 0;
			x = 0.0284411 * safezoneW + safezoneX;
			y = 0.960792 * safezoneH + safezoneY;
			w = 0.0749206 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorBar[] = {0.66,0.66,0,1};
			colorFrame[] = {0.66,0.66,0,0.5};
			texture = "#(argb,8,8,3)color(1,1,1,1)";
		};
		class jsh_hud_xp_progressbar_text: RscStructuredText
		{
			idc = IDC_JSH_HUD_XP_PROGRESSBAR_TEXT;
			text = ""; //--- ToDo: Localize;
			x = 0.0284411 * safezoneW + safezoneX;
			y = 0.960792 * safezoneH + safezoneY;
			w = 0.0749206 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0,0,0,0};
			class Attributes {
				align = "center";
				valign = "middle";
			};
		};
		class jsh_hud_health_progressbar
		{
			idc = IDC_JSH_HUD_HEALTH_PROGRESSBAR;
			type = 8;
			style = 0;
			x = 0.0284411 * safezoneW + safezoneX;
			y = 0.932581 * safezoneH + safezoneY;
			w = 0.092549 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorBar[] = {0.8,0,0,1};
			colorFrame[] = {0.66,0,0,0.5};
			texture = "#(argb,8,8,3)color(1,1,1,1)";
		};
		class jsh_hud_health_progressbar_text: RscStructuredText
		{
			idc = IDC_JSH_HUD_HEALTH_PROGRESSBAR_TEXT;
			text = ""; //--- ToDo: Localize;
			x = 0.0284411 * safezoneW + safezoneX;
			y = 0.932581 * safezoneH + safezoneY;
			w = 0.092549 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0,0,0,0};
			class Attributes {
				align = "center";
				valign = "middle";
			};
		};
		class jsh_hud_current_rank_icon: RscPicture
		{
			idc = IDC_JSH_HUD_CURRENT_RANK_ICON;
			text = "";
			x = 0.0108127 * safezoneW + safezoneX;
			y = 0.960792 * safezoneH + safezoneY;
			w = 0.0132213 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {-1,-1,-1,0};
		};
		class jsh_hud_health_icon: RscPicture
		{
			idc = IDC_JSH_HUD_HEALTH_ICON;
			text = "\A3\Ui_f\data\IGUI\RscIngameUI\RscUnitInfo\icon_cross_ca.paa";
			x = 0.0108127 * safezoneW + safezoneX;
			y = 0.932581 * safezoneH + safezoneY;
			w = 0.0122213 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class jsh_hud_next_rank_icon: RscPicture
		{
			idc = IDC_JSH_HUD_NEXT_RANK_ICON;
			text = "";
			x = 0.107769 * safezoneW + safezoneX;
			y = 0.960792 * safezoneH + safezoneY;
			w = 0.0132213 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {-1,-1,-1,0};
		};
		class jsh_hud_titletext: RscText
		{
			idc = IDC_JSH_HUD_TITLETEXT;
			text = "Operators: Tanoa"; //--- ToDo: Localize;
			x = 0.0284411 * safezoneW + safezoneX;
			y = 0.904369 * safezoneH + safezoneY;
			w = 0.0749206 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {-1,-1,-1,0};
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.25)";
		};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
	};
};