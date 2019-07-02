
#include "defines.hpp"
class TFD_Shop_Guns
{
	idd = 6666;
	movingEnable = false;
	enableSimulation = 1;
	
	onLoad = "[] execVM ""functions\gui\shop\listGuns.sqf""";
	
	class controls
	{
		class LS_Back: l_RscText
		{
			idc = 1000;
			x = 0.407451 * safezoneW + safezoneX;
			y = 0.349537 * safezoneH + safezoneY;
			w = 0.193912 * safezoneW;
			h = 0.291522 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class LS_MenuButton_0: l_RscButton
		{
			idc = 1600;
			text = "Guns"; //--- ToDo: Localize;
			x = 0.416265 * safezoneW + safezoneX;
			y = 0.358941 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,1,0.75};
			onButtonClick = "[] execVM ""functions\gui\shop\listGuns.sqf"" "
		};
		class LS_MenuButton_1: l_RscButton
		{
			idc = 1601;
			text = "Ammo"; //--- ToDo: Localize;
			x = 0.477965 * safezoneW + safezoneX;
			y = 0.358941 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,1,0.75};
			onButtonClick = "[_this] execVM ""functions\gui\shop\listAmmo.sqf"" "
		};
		class LS_MenuButton_2: l_RscButton
		{
			idc = 1602;
			text = "Equip"; //--- ToDo: Localize;
			x = 0.539664 * safezoneW + safezoneX;
			y = 0.358941 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,1,0.75};
			onButtonClick = "[_this] execVM ""functions\gui\shop\listEquip.sqf"" "
		};
		class LS_ListBox: l_RscListbox
		{
			idc = 1500;
			x = 0.411858 * safezoneW + safezoneX;
			y = 0.405961 * safezoneH + safezoneY;
			w = 0.123399 * safezoneW;
			h = 0.225694 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
			
		};
		class LS_Thumb: l_RscText
		{
			idc = 1001;
			x = 0.539664 * safezoneW + safezoneX;
			y = 0.405961 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0470196 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
			colorText[] = {1,1,1,1};
			sizeEx = 0.05;
			text = ""
		};
		class LS_Button_Purchase: l_RscButton
		{
			idc = 1603;
			text = "Exit"; //--- ToDo: Localize;
			x = 0.539664 * safezoneW + safezoneX;
			y = 0.603443 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0282118 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0,0,0.75};
			action = "closeDialog 0;"
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};