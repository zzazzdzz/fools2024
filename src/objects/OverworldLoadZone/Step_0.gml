if (collision_rectangle(x, y, x2, y2, OverworldHero, false, true) != noone) {
	if (global.active) {
		global.active = false;
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		audio_play_sound(SFXGeneral12, 1, 0);
		waitForTransition = true;
	}
}

if (waitForTransition) {
	if (transitionObj.done) {
		// warp
		global.overworldCurMap = sendToN;
		global.overworldCurVariant = sendToSN;
		global.overworldSpawnX = sendToX;
		global.overworldSpawnY = sendToY;
		global.overworldSpawnFacing = sendToF;
		room_goto(OverworldRoom);
		global.active = true;
	}
}