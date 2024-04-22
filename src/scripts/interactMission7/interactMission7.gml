// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function interactMission7(){

}

function interactScriptExplainMission7(tick) {
	if (tick == 0) {
		global.musicIndex = 6;
		global.musicControl = MUS_PLAY;
	}
	if (tick == 1) {
		return scriptingDelay(40);
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Oh, so the evolution rumors were true.
It's quite surprising. I always thought this was just a legend.

\p01With your newfound power, you should have no issues taking on
another legendary Pok%mon - \c32Moltres\c30.

\p00According to legends, \c32Moltres\c30 is residing deep inside the fiery
expanses of \c51Lava Labyrinth\c30.

And just like with \c32Articuno\c30, there probably is a \c51Glitch Dimension\c30
for you to explore at that location.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 3) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 4) {
		return scriptingDelay(40);
	}
	if (tick == 5) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p0a{PARTNER}: You got it chief!
Next stop - \c51Lava Labyrinth\c30!

\p00As usual, we will all meet up once you're ready.
The \c51Lava Labyrinth\c30 should be located to the east.<@
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 6) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 7) {
		return scriptingDelay(20);	
	}
	if (tick == 8) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 174*2, 190*2, 25);
	}
	if (tick == 9) {
		return scriptingDelay(25);	
	}
	if (tick == 10) {
		sound_play(SFXGeneral12);
		with (scriptingSelectObj(global.partnerSpecies)) {
			x = -1000; y = -1000;
		}	
	}
	if (tick == 11) {
		return scriptingDelay(30);	
	}
	if (tick == 12) {
		array_push(global.unlockedDungeonLists[1], 7);
		array_push(global.unlockedDungeonLists[0], 8);
		global.curStoryHint = 7;
		global.eventFlags[EVENT_LAB_EXPLAINED_MISSION7] = 1;
		global.active = true;
		return SCRIPT_STOP;	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labSandslashMission7Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Moltres\c30 is said to reside inside \c51Lava Labyrinth\c30.
You should go there and investigate.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;	
}