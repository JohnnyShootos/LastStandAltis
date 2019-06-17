// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_HITZONES         17
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_ITEMSLOT         103
#define CT_CHECKBOX         77

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0
#define ST_UPPERCASE      0xC0
#define ST_LOWERCASE      0xD0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar 
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4
#define MB_ERROR_DIALOG   8

// Xbox buttons
#define KEY_XINPUT                0x00050000
#define KEY_XBOX_A                KEY_XINPUT + 0
#define KEY_XBOX_B                KEY_XINPUT + 1
#define KEY_XBOX_X                KEY_XINPUT + 2
#define KEY_XBOX_Y                KEY_XINPUT + 3
#define KEY_XBOX_Up               KEY_XINPUT + 4
#define KEY_XBOX_Down             KEY_XINPUT + 5
#define KEY_XBOX_Left             KEY_XINPUT + 6
#define KEY_XBOX_Right            KEY_XINPUT + 7
#define KEY_XBOX_Start            KEY_XINPUT + 8
#define KEY_XBOX_Back             KEY_XINPUT + 9
#define KEY_XBOX_LeftBumper       KEY_XINPUT + 10
#define KEY_XBOX_RightBumper      KEY_XINPUT + 11
#define KEY_XBOX_LeftTrigger      KEY_XINPUT + 12
#define KEY_XBOX_RightTrigger     KEY_XINPUT + 13
#define KEY_XBOX_LeftThumb        KEY_XINPUT + 14
#define KEY_XBOX_RightThumb       KEY_XINPUT + 15
#define KEY_XBOX_LeftThumbXRight  KEY_XINPUT + 16
#define KEY_XBOX_LeftThumbYUp     KEY_XINPUT + 17
#define KEY_XBOX_RightThumbXRight KEY_XINPUT + 18
#define KEY_XBOX_RightThumbYUp    KEY_XINPUT + 19
#define KEY_XBOX_LeftThumbXLeft   KEY_XINPUT + 20
#define KEY_XBOX_LeftThumbYDown   KEY_XINPUT + 21
#define KEY_XBOX_RightThumbXLeft  KEY_XINPUT + 22
#define KEY_XBOX_RightThumbYDown  KEY_XINPUT + 23

// Fonts
#define GUI_FONT_NORMAL			PuristaMedium
#define GUI_FONT_BOLD			PuristaSemibold
#define GUI_FONT_THIN			PuristaLight
#define GUI_FONT_MONO			EtelkaMonospacePro
#define GUI_FONT_NARROW			EtelkaNarrowMediumPro
#define GUI_FONT_CODE			LucidaConsoleB
#define GUI_FONT_SYSTEM			TahomaB

// Grids
#define GUI_GRID_CENTER_WAbs		((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_CENTER_HAbs		(GUI_GRID_CENTER_WAbs / 1.2)
#define GUI_GRID_CENTER_W		(GUI_GRID_CENTER_WAbs / 40)
#define GUI_GRID_CENTER_H		(GUI_GRID_CENTER_HAbs / 25)
#define GUI_GRID_CENTER_X		(safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y		(safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)


class l_RscText
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_CENTER;
    linespacing = 1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    text = "";
    shadow = 2;
    font = GUI_FONT_NORMAL;
    SizeEx = 0.02100;
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;
   
};

class l_RscButton
{
    
    access = 0;
    idc = -1;
    type = CT_BUTTON;
    text = "";
    colorText[] = {1,1,1,1};
    colorDisabled[] = {0.6,0.1,0.3,0};
    colorBackground[] = {0.35,0.55,0.15,0.9};
    colorBackgroundDisabled[] = {0,0.0,0};
    colorBackgroundActive[] = {0.15,0.35,0.55,0.7};
    colorFocused[] = {0.75,0.75,0.75,.5};
    colorShadow[] = {0.023529,0,0.0313725,1};
    colorBorder[] = {0.023529,0,0.0313725,1};
    soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
    soundPush[] = {"\ca\ui\data\sound\new1",0,0};
    soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
    soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = GUI_FONT_NORMAL;
    sizeEx = 0.05;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};

class l_RscListBox
{
	access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
	idc = -1; // Control identification (without it, the control won't be displayed)
	type = CT_LISTBOX; // Type
	style = ST_LEFT + LB_TEXTURES; // Style
	default = 0; // Control selected by default (only one within a display can be used)
	blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

	colorBackground[] = {0.2,0.2,0.2,1}; // Fill color
	colorSelectBackground[] = {1,0.5,0,1}; // Selected item fill color
	colorSelectBackground2[] = {0,0,0,1}; // Selected item fill color (oscillates between this and colorSelectBackground)

	sizeEx = GUI_GRID_CENTER_H * 0.85; // Text size
	font = GUI_FONT_NORMAL; // Font from CfgFontFamilies
	shadow = 0; // Shadow (0 - none, 1 - directional, color affected by colorShadow, 2 - black outline)
	colorText[] = {1,1,1,1}; // Text and frame color
	colorDisabled[] = {1,1,1,0.5}; // Disabled text color
	colorSelect[] = {1,1,1,1}; // Text selection color
	colorSelect2[] = {1,1,1,1}; // Text selection color (oscillates between this and colorSelect)
	colorShadow[] = {0,0,0,0.5}; // Text shadow color (used only when shadow is 1)
	period = 1; // Oscillation time between colorSelect/colorSelectBackground2 and colorSelect2/colorSelectBackground when selected

	rowHeight = GUI_GRID_CENTER_H * 1.25; // Row height
	itemSpacing = 0; // Height of empty space between items
	maxHistoryDelay = 1; // Time since last keyboard type search to reset it
	canDrag = 1; // 1 (true) to allow item dragging

	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected

	// Scrollbar configuration (applied only when LB_TEXTURES style is used)
	class ListScrollBar
	{
		width = 0; // Unknown?
		height = 0; // Unknown?
		scrollSpeed = 0.01; // Unknown?

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

		color[] = {1,1,1,1}; // Scrollbar color
	};

	onLBSelChanged = "[] execVM ""functions\gui\shop\displayGunPrice.sqf"" ";
	onLBDblClick = "_this call TFD_fnc_buyEquip";
};