if (creditsMode == 0) {
	creditsIdx += 1;
	if (creditsIdx < array_length(creditsData)) {
		tick = 0;
		creditsMode = creditsData[creditsIdx][0];
	}
}

if (!skipped && (keyboard_check(global.keybinds[0]) || keyboard_check(global.keybinds[1]))) {
	skipped = true;
	global.musicControl = MUS_FADEOUT;
	alarm[0] = 140;
	var oo = instance_create(ScreenTransitionController, 0, 0);
	oo.transition_type = TRANSITION_FADETOBLACK;
}