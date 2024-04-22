// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function interactTest(tick){
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Hewwo, pwease intewact with me! UwU<@
		"));
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) return SCRIPT_STOP;
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function interactError(tick) {
	if (tick == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Dearest {PLAYER},
I hope this finds you well.

We seem to have encountered issues with this script.

Please consider restarting your game, as I do believe
continuing in this state might cause further instability.

Sincerely,
TheZZAZZGlitch.<@
		"));
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) return SCRIPT_STOP;
	return SCRIPT_CONTINUE_ADVANCETICK;
}