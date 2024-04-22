// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function interactMission9(){

}

function interactScriptExplainMission9(tick) {
	if (tick == 0) {
		global.musicIndex = 6;
		global.musicControl = MUS_PLAY;
	}
	if (tick == 1) {
		return scriptingDelay(40);
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Good job on dealing with \c32Moltres\c30. It appears that 
calamities around \c51Lava Labyrinth\c30 have calmed down.

The next step would be trying to encounter \c32Zapdos\c30 That would 
take care of all of the legendary Pok%mon in the area.

\p04But there's a bit of an issue...
We don't know its exact location.

\p00It is rumored to be related to the \c51Evolution Chamber\c30 in some
way. That's the best lead we currently have.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 3) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 4) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: You call that an issue?
You literally told us where to go!

\p01How about we go to the \c51Evolution Chamber\c30 and use the \c31Coin Case\c30
there? We only need to distract this light-voice-thing.

\p0aI'm sure there's some potential in this idea!
Haha, get it? Potential? Cuz \c32Zapdos\c30 is electric-type!\d23 \c30

\p00... ... ... ... ...
... ... ... ... ...\d23 \c30

See you there!<@
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 5) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 6) {
		return scriptingDelay(20);	
	}
	if (tick == 7) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 174*2, 190*2, 25);
	}
	if (tick == 8) {
		return scriptingDelay(25);	
	}
	if (tick == 9) {
		sound_play(SFXGeneral12);
		with (scriptingSelectObj(global.partnerSpecies)) {
			x = -1000; y = -1000;
		}	
	}
	if (tick == 10) {
		return scriptingDelay(30);	
	}
	if (tick == 11) {
		global.curStoryHint = 9;
		global.eventFlags[EVENT_LAB_EXPLAINED_MISSION9] = 1;
		global.active = true;
		return SCRIPT_STOP;	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labSandslashMission9Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Go to the \c51Evolution Chamber\c30.
Please try to avoid any horrible puns on the way.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;	
}