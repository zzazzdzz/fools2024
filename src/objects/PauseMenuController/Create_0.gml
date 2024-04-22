state = 0;

txNoItems = textToAttributed("This party member has no items.");
execCtr = 0;
execRet = 0;

storyHints = [
	textToAttributed("You qualified for the Field Exploration Program.\nPrepare for your first task tomorrow!"),
	textToAttributed("Explore @QSerene Forest@0. Your exploration partner is waiting for\nyou at the town's eastern exit."),
	textToAttributed("Attempt to use the @1Coin Case@0 at the @QSerene Forest@0 clearing.\nMake sure to prepare yourself adequately!"),
	textToAttributed("Go to @QCrystal Glacier@0 and attempt to find its @QGlitch Dimension@0.\nMake sure to prepare yourself adequately!"),
	textToAttributed("You need to find a way to access that @QGlitch Dimension@0.\nFind a @2Machop@0 at @QMystic Highlands@0."),
	textToAttributed("Go back to @QCrystal Glacier@0 and attempt to use the @1Coin Case@0.\nMaybe you will be able to access this area's @QGlitch Dimension@0?"),
	textToAttributed("Are the rumors about @2evolution@0 really true?\nHead on to @QFogbound Keep@0 to find out."),
	textToAttributed("Go to @QLava Labyrinth@0 and attempt to find its @QGlitch Dimension@0.\nMake sure to prepare yourself adequately!"),
	textToAttributed("Try to enter @QLava Labyrinth@0's @QGlitch Dimension@0.\nMake sure to prepare yourself adequately!"),
	textToAttributed("Does the @QEvolution Chamber@0 have a @QGlitch Dimension@0?\nThere's only one way to find out!"),
	textToAttributed("q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F"),
	textToAttributed("The Glitch Lord has fallen, and his reign is no more.\nPeace is paved with Glitchtopia saved. Conglaturation!"),
];

audio_play_sound(SFXGeneral9, 1, 0);

drawCompendium = false;

depth = -9999999;
hw = sprite_get_width(CompendiumHeader);

bepis = 0;

loadingSound = noone;
htResult = "";
htError = true;
htReady = false;
