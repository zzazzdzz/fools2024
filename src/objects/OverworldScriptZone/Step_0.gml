globalCounter += 1;

if (ticking != SCRIPT_STOP) {
	if (ticking == SCRIPT_CONTINUE_ADVANCETICK) tick += 1;
	ticking = script_execute(payload, tick);
	if (ticking > -9999) {
		tick += ticking;
		tick -= 1;
		ticking = SCRIPT_CONTINUE_ADVANCETICK;
	}
	exit;
} else {
	tick = 0;
}

if (collision_rectangle(x, y, x2, y2, OverworldHero, false, true) != noone) {
	if (flag == -1) {
		global.active = false;
		ticking = 0;
	} else {
		if (global.eventFlags[flag] == false) {
			global.active = false;
			ticking = 0;
		}
	}
}