if (tick == 0) {
	rp += 28;
	if (rp >= 0) {
		rp = 0;
		pause = 10;
		tick = 1;
	}
}
else if (tick == 1) {
	pause -= 1;
	if (pause <= 0) tick = 2;
}
else if (tick == 2) {
	a1 += 0.03;
	if (a1 >= 1) {
		a1 = 1;
		tick = 3;
	}
}
else if (tick == 3) {
	a2 += 0.03;
	if (a2 >= 1) {
		a2 = 1;
		pause = 120;
		tick = 4;
	}
}
else if (tick == 4) {
	pause -= 1;
	if (pause <= 0) tick = 5;
}
else if (tick == 5) {
	a1 -= 0.06;
	a2 -= 0.06;
	if (a1 <= 0) {
		a1 = 0;
		a2 = 0;
		tick = 6;
	}
}
else if (tick == 6) {
	rp += 48;
	if (rp >= 640) {
		rp = 999;
		tick = 7;
		pause = 10;
	}
}
else if (tick == 7) {
	instance_destroy();
}