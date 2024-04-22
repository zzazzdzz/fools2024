// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function interactMission8(){

}

function interactScriptExplainMission8(tick) {
	if (tick == 0) {
		global.musicIndex = 6;
		global.musicControl = MUS_PLAY;
	}
	if (tick == 1) {
		return scriptingDelay(40);
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: So, any progress?
Were you able to reach the end of \c51Lava Labyrinth\c30?<@
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
{PARTNER}: Yes. We arrived at the end.
The only thing left is to use the \c31Coin Case\c30.

We will be fighting a legendary Pok%mon there, so make sure
everyone in our team is ready for a tough fight!

Like usual, I'll be waiting for you!
Go to the eastern exit once you feel you're prepared.<@
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
		array_push(global.unlockedDungeonLists[0], 9);
		array_push(global.roamingShopData, [10, 1000]);
		global.curStoryHint = 8;
		global.eventFlags[EVENT_LAB_EXPLAINED_MISSION8] = 1;
		global.active = true;
		return SCRIPT_STOP;	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labSandslashMission8Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Huh? Shouldn't you be checking out \c51Lava Labyrinth\c30's
\c51Glitch Dimension\c30 by now?<@
		"), [Portrait0028, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;	
}