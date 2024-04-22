if (ct > 200) {
	if (!fwd) {
		fwd = true;
		var oo = instance_create(ScreenTransitionController, 0, 0);
		oo.transition_type = TRANSITION_FADETOBLACK;
		alarm[0] = 100;
	}
}