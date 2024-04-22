depth = depthOffset - y;

if (fade) {
	sprA -= 0.03;
	if (sprA <= 0) instance_destroy();
}

var wasLastFrame = false;

if (animFrameCounter > 0) animFrameCounter -= 1;
if (animFrameCounter == 0) {
	// advance to next frame
	animCurIndex += 1;
	if (animCurIndex >= animLen) {
		wasLastFrame = true;
		if (animIsLooping) animCurIndex = 0;
		else animCurIndex -= 1;
	}
	// load new duration timer
	animFrameCounter = max(1, round(animData[animDurOffs + animCurIndex] * animSpeed));
	// unless it's the last non-loop frame
	if (!animIsLooping && wasLastFrame) {
		animFrameCounter = -1;
		if (animIdleAfterEndFrame) {
			animIndex = "Idle";
			event_user(0);
		}
	}
}

var sprInd = animStartIndex + animCurIndex*8 + facing;
var sprMax = sprite_get_number(spriteSet);
if (sprInd >= sprMax) {
	show_debug_message("trying to access missing subimg " + string(sprInd) + " of set " + string(animData[0]) + " [has " + string(sprMax) + " images]"); 
}

if (!hidden) draw_sprite_ext(spriteSet, sprInd, x, y, 2, 2, 0, c_white, sprA);
