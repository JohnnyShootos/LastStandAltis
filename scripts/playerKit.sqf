removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeVest player;
removeBackpack player;
removeGoggles player;

for "_i" from 1 to 5 do { player addItemToUniform "10Rnd_9x21_Mag";};
for "_i" from 1 to 2 do { player addItemToUniform "SmokeShell";};

player addWeapon "hgun_Pistol_01_F";

player linkItem "Binocular";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemRadio";
