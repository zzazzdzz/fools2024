if (storyState == 0) {
	audio_stop_all();
	BattlePartMissingno.gscrollspeed = 30;
	BattlePartMissingno.gscrollspeedthreshold = 30;
	sound_play(SoundFin1);
	storyState = 1;
	alarm[2] = 1;
	var oo = instance_create(BattlePartQuake, 0, 0);
	oo.ctrlim = 1000;
}
else if (storyState == 1) {
	var part = instance_create(BattleAnimationPart, irandom_range(40, 640-40), irandom_range(60, 480-60));
	part.animAsset = AnimFlamethrower;
	part.animSpeed = 1;
	numExps += 1;
	storyState = 2;
	alarm[2] = 20;
	if (numExps > 5) alarm[2] = 10;
	if (numExps > 10) alarm[2] = 3;
	if (numExps == 35) {
		var oo = instance_create(ScreenTransitionController, 0, 0);
		oo.transition_type = TRANSITION_FADETOWHITE;
	}
}
else if (storyState == 2) {
	if (numExps < 50) storyState = 1;
	else {
		storyState = 3;	
	}
	alarm[2] = 1;
}
else if (storyState == 3) {
	var oo = instance_create(ScreenTransitionController, 0, 0);
	oo.transition_type = TRANSITION_FADETOBLACK;
	oo.depth = oo.depth - 1;
	storyState = 4;
	alarm[2] = 150;
}
else if (storyState == 4) {
	global.overworldCurMap = global.battleWarpMap;
	global.overworldCurVariant = global.battleWarpVariant;
	global.overworldSpawnFacing = FACING_D;
	room_goto(OverworldRoom);
}