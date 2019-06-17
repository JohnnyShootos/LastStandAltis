_type = typeOf player;

switch (_type) do {
	case "O_Soldier_unarmed_F":  //AAR
	{	
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;


		player forceAddUniform "U_O_CombatUniform_oucamo";
		for "_i" from 1 to 5 do { player addItemToUniform "16Rnd_9x21_Mag";};
		for "_i" from 1 to 2 do { player addItemToUniform "SmokeShell";};
		
		player addWeapon "hgun_Rook40_F";

		player linkItem "Binocular";

		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemRadio";
	};
};