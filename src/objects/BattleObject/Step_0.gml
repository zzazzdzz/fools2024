/// @description bepis

//if (displayHP < curHP) displayHP += 1;
//if (displayHP > curHP) displayHP -= 1;
displayHP = curHP;

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

if (spinAnim > 0 && spinAnimDelay <= 0) {
	facing -= 1;
	if (facing < 0) facing = 7;
	spinAnim -= 1;	
	spinAnimDelay = 3;
}
if (spinAnimDelay > 0) {
	spinAnimDelay -= 1;
}
