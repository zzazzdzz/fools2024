
if (animTargetSteps > 0) {
	animTargetSteps -= 1;
	x += animTargetDeltaX;
	y += animTargetDeltaY;
	if (animTargetSteps <= 0) {
		x = animTargetX;
		y = animTargetY;
		animIndex = "Idle";
		animSpeed = 1;
		event_user(0);
	}
}
