//This starts the spectator cam upon player death.  Look up BIwiki entry for further info if you wish to restrict the camera views - eg: PvP mission


["Initialize", [player, [independent], false]] call BIS_fnc_EGSpectator;

["SetCameraTransform",[[11132.8,12184.6,51.7617], [0,0,0], [0,0,0], [0, false]]] call BIS_fnc_EGSpectatorCamera;