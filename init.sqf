// Briefing
//nul = [] execVM "briefing.sqf";

// Saving disabled without autosave.
enableSaving [false,false];

//Disable AI radio calls
enableSentences false;

// View Distance Script Vars
CHVD_allowNoGrass = true; // Set 'false' if you want to disable "Low" option for terrain (default: true)
CHVD_maxView = 5000; // Set maximum view distance (default: 12000)
CHVD_maxObj = 5000; // Set maximimum object view distance (default: 12000)

//Initialise Hitmarker
[] execVM "scripts\hitMarkerInit.sqf";