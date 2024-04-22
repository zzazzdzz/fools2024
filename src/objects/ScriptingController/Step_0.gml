globalCounter += 1;

if (sched) {
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
		instance_destroy();
	}
}

if (flag == -1) {
	sched = true;
	ticking = script_execute(payload, tick);
} else {
	if (global.eventFlags[flag] == false) {
		sched = true;
		ticking = script_execute(payload, tick);
	}
}