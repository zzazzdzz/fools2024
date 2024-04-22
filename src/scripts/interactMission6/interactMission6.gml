// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function interactMission6(){

}

function interactScriptExplainMission6(tick) {
	if (tick == 0) {
		global.musicIndex = 6;
		global.musicControl = MUS_PLAY;
	}
	if (tick == 1) {
		return scriptingDelay(40);
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Congratulations on your success! I heard the
calamities around \c51Crystal Glacier\c30 have calmed down.

Our plan is working, so it stands to reason that we should try
fighting the legendary Pok%mon images of other areas.

I'm still trying to figure out the details, so in the meantime
there is a certain rumor I want you to confirm.

You see, the \c51Fogbound Keep\c30, or rather what remains of it,
is rumored to be tied to the process of evolution.

Evolution is a process which brings about changes in appearance
and abilities of certain Pok%mon species.

Needless to say, undergoing this process would certainly make
you stronger, and better prepared for future challenges.<@
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
{PARTNER}: Evolution? I heard about that!
If we could figure it out, it would help us greatly.

We should check out \c51Fogbound Keep\c30, to see if there's any
truth to these rumors about evolution.

The \c51Fogbound Keep\c30 is located to the north.
We will all meet up once you're ready!<@
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
		array_push(global.unlockedDungeonLists[1], 6);
		array_push(global.roamingShopData, [7, 600]);
		global.curStoryHint = 6;
		global.eventFlags[EVENT_LAB_EXPLAINED_MISSION6] = 1;
		global.active = true;
		return SCRIPT_STOP;	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labSandslashMission6Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Go to \c51Fogbound Keep\c30 and check out the evolution
rumors. The \c51Fogbound Keep\c30 is located to the north.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;	
}