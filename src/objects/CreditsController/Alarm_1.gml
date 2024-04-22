
if (state == 0) {
	global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Oh wow, you really went through all of the credits?
I am legit surprised!

Thank you for helping me out. I really did well with those
arbitrary code execution payloads, did I not?

And I think I did pretty good with all of those fancy philosophical
speeches as well. Trust me, I tried very hard!

In case you couldn't tell, I'm \c32TheZZAZZGlitch\c30.
I figured you might want to know a bit more about me.

You can stay here and chat with me for a bit.
If you stop feeling like it, just reset the simulation client!<@
	"));
	state = 1;
	alarm[1] = 1;
}
else if (state == 1) {
	if (!instance_exists(global.gp0)) state = 2;
	alarm[1] = 1;
}
else if (state == 2) {
	state = 3;
	alarm[1] = 60*5;
}
else if (state == 3) {
	global.gp0 = spawnStandardTextbox(formatTextboxString(topics[curTopic]));
	curTopic += 1;
	state = 4;
	alarm[1] = 1;
}
else if (state == 4) {
	if (!instance_exists(global.gp0)) state = 5;
	alarm[1] = 1;
}
else if (state == 5) {
	state = 3;
	if (curTopic >= array_length(topics)) {
		state = 6;
	}
	alarm[1] = 60*5;
}
else if (state == 6) {
	global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Anyways, I think I've talked for long enough.
Thank you for playing, and hopefully see you in 2025.<@
	"));
	state = 7;
	alarm[1] = 1;
}
else if (state == 7) {
	if (!instance_exists(global.gp0)) state = 8;
	alarm[1] = 1;
}
else if (state == 8) {
	state = 9;
	alarm[1] = 60*2;
}
else if (state == 9) {
	game_restart();
}