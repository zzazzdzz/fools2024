if (state == 0) {
	global.musicIndex = 30;
	global.musicControl = MUS_PLAY;
	state = 1;
	alarm[1] = 1;
	
	if (global.curStoryHint == 1 && global.curDungeonId == 1) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p04{PARTNER}: Ouch... who would have thought adventuring
would be so difficult?

\p09However, we should not be discouraged.
Let's make our next attempt count!

\p00And who knows - maybe stocking up on healing items at the
\c32Kecleon Shop\c30 could help us out?

Let's go in again and teach these bugs their lesson!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (global.curStoryHint == 2 && global.curDungeonId == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p04{PARTNER}: Ouch... who would have thought adventuring
would be so difficult?

\p00We could try to make some modifications to our strategy,
like changing our \c32specializations\c30 or stocking up on items.

I think having at least one support member would increase our
chances greatly, at least in my opinion.

\p09We should not be discouraged.
Let's make our next attempt count!
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	
	else {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p04{PARTNER}: Ouch... who would have thought adventuring
would be so difficult?

\p09However, we should not be discouraged.
Let's make our next attempt count!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
}
else if (state == 1) {
	if (!instance_exists(global.gp0)) state = 2;
	alarm[1] = 1;
}
else if (state == 2) {
	global.musicControl = MUS_FADEOUT;
	state = 3;
	alarm[1] = 110;
}
else if (state == 3) {
	room_goto(DungeonRoom);
}