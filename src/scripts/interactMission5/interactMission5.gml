// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function interactMission5(){

}

function interactScriptExplainMission5(tick) {
	if (tick == 0) {
		global.musicIndex = 6;
		global.musicControl = MUS_PLAY;
	}
	if (tick == 1) {
		return scriptingDelay(40);
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: You found a \c32Machamp\c30 instead of a \c32Machop\c30?
But everything should still work, right?

The only real way to find out would be to try it.
You should go back to \c51Crystal Glacier\c30 and use the \c31Coin Case\c30.<@
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
{PARTNER}: Let's go then!
It's \c51Glitch Dimension\c30 time!

And if you happen to have any spare time, you could also use it
to revisit some previous dungeons.

This way, we might get some items we missed on our first tries,
get a bit stronger, as well as get some \c32Compendium\c30 entries.

Whatever choice you make, I'll be waiting for you.
See you later!<@
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
		array_push(global.unlockedDungeonLists[0], 5);
		array_push(global.roamingShopData, [9, 400]);
		global.curStoryHint = 5;
		global.eventFlags[EVENT_LAB_EXPLAINED_MISSION5] = 1;
		global.active = true;
		return SCRIPT_STOP;	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labSandslashMission5Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Go back to \c51Crystal Glacier\c30 and use the \c31Coin Case\c30.
{PARTNER} should be waiting for you.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;	
}