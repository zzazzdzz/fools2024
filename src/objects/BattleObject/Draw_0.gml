depth = -10 - y;

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

/*
if (keyboard_check(vk_f12)) {
	// to.do debugging functionality
	draw_text(510, 10, string(animFrameCounter) + "\n" + string(animDurOffs + animCurIndex) + "\n" + string(animStartIndex + animCurIndex*8 + facing) + "\n" + string(instance_number(TextboxController)));
}
*/

var sprInd = animStartIndex + animCurIndex*8 + facing;
var sprMax = sprite_get_number(spriteSet);
if (sprInd >= sprMax) {
	show_debug_message("trying to access missing subimg " + string(sprInd) + " of set " + string(animData[0]) + " [has " + string(sprMax) + " images]"); 
}

ctr += 1;
ctr %= 65536;

var should_draw = true;
if (ctr % 4 == 0 && blink) should_draw = false;
if (hidden) should_draw = false;

if (should_draw) {
	if (vfx != noone) draw_sprite_ext(vfx, (ctr div 16) % sprite_get_number(vfx), x, y, 2, 2, 0, c_white, 1);
	draw_sprite_ext(spriteSet, sprInd, x, y, 2, 2, 0, c_white, 1);
}

var a = markerAlpha * markerAlphaExcess;
if (personalMarker == MARKER_LC1) {
	draw_sprite_ext(SprLimitCut, 0, x+2, y+2 - 52, 3, 3, 0, c_blue, 0.9*a);
	draw_sprite_ext(SprLimitCut, 0, x, y - 52, 3, 3, 0, c_white, 0.9*a);
}
if (personalMarker == MARKER_LC2) {
	draw_sprite_ext(SprLimitCut, 1, x+2, y+2 - 52, 3, 3, 0, c_blue, 0.9*a);
	draw_sprite_ext(SprLimitCut, 1, x, y - 52, 3, 3, 0, c_white, 0.9*a);
}
if (personalMarker == MARKER_LC3) {
	draw_sprite_ext(SprLimitCut, 2, x+2, y+2 - 52, 3, 3, 0, c_blue, 0.9*a);
	draw_sprite_ext(SprLimitCut, 2, x, y - 52, 3, 3, 0, c_white, 0.9*a);
}