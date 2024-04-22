// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function interactMission3() {}

function interactScriptExplainMission3(){
	if (tick == 0) {
		return scriptingDelay(40);	
	}
	if (tick == 1) {
		global.musicIndex = 31;
		global.musicControl = MUS_PLAY;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Huh, so it seems like the reports were true.
It appears that the \c51Glitch Dimensions\c30 really exist.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 2) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 3) {
		return scriptingDelay(30);	
	}
	if (tick == 4) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: I'm sorry, you lost me at that previous part...
What's a \c51Glitch Dimension\c30? And why did we end up inside one?<@
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 5) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 6) {
		return scriptingDelay(30);	
	}
	if (tick == 7) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: \c51Glitch Dimensions\c30 are alternate universes, created by
excessive glitchification and corruption of areas around us.

\c37Missingno.\c30, the \c37Glitch Lord\c30, having failed to take over
Glitchland and Glitch Islands, started attacking Glitchtopia.

He used his power to corrupt legendary Pok%mon in surrounding
areas, causing them to behave erratically.

As the corruption started spreading further, we noticed the
appearance of more and more of these \c51Glitch Dimensions\c30.

While they could be accessed in many ways, we found that the
most consistent method was using the \c31Coin Case\c30.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 8) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 9) {
		return scriptingDelay(60);	
	}
	if (tick == 10) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: But now, we have made a key realization.
\c51Glitch Dimensions\c30 are corrupted reflections of the real world.

They all contain representations - shadow images, of the
Pok%mon affected by the \c37Glitch Lord\c30's corruption.

Defeating them seems to undo the harm caused by memory
corruption, bringing their behavior back to normal.

That being said, if we were to visit all Glitch Dimensions and
defeat all images of legendary Pok%mon within them...

Then maybe, probably, we could have a chance to fend off the
\c37Glitch Lord\c30's attack, and save our land from danger.
<@
		"), [Portrait0028, 0]);
	}
	if (tick == 11) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 12) {
		return scriptingDelay(30);	
	}
	if (tick == 13) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: So, if we were to visit all \c51Glitch Dimensions\c30
and defeat all of their guardians... the world would be saved?

I see one key problem in this plan though...
Where do we find more \c51Glitch Dimensions\c30?<@
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 14) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 15) {
		return scriptingDelay(30);	
	}
	if (tick == 16) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: \c51Glitch Dimensions\c30, created by glitchification of
strong Pok%mon, should be found in locations inhabited by them.

The \c51Crystal Glacier\c30 is said to be the home of a strong ice-type
legendary Pok%mon. We should start our search there.
<@
		"), [Portrait0028, 0]);
	}
	if (tick == 17) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 18) {
		return scriptingDelay(30);	
	}
	if (tick == 19) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: I see. Off to \c51Crystal Glacier\c30 we go!
Hopefully we can try to access the \c51Glitch Dimension\c30 there.

\p01Prepare yourself, then go to the eastern exit.
I'll be at our house if you want to talk about strategy!<@
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 20) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 21) {
		return scriptingDelay(30);	
	}
	if (tick == 22) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 174*2, 190*2, 25);
	}
	if (tick == 23) {
		global.musicControl = MUS_FADEOUT;
		return scriptingDelay(25);	
	}
	if (tick == 24) {
		sound_play(SFXGeneral12);
		with (scriptingSelectObj(global.partnerSpecies)) {
			x = -1000; y = -1000;
		}	
	}
	if (tick == 25) {
		return scriptingDelay(30);	
	}
	if (tick == 26) {
		array_push(global.unlockedDungeonLists[0], 3);
		array_push(global.roamingShopData, [6, 2000]);
		global.curStoryHint = 3;
		global.eventFlags[EVENT_LAB_EXPLAINED_MISSION3] = 1;
		global.active = true;
		global.musicIndex = 6;
		global.musicControl = MUS_PLAY;
		return SCRIPT_STOP;	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labSandslashMission3Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: You should head to \c51Crystal Glacier\c30.
Hopefully you'll be able to find a \c51Glitch Dimension\c30 there.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;	
}