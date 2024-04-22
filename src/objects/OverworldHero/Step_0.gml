// control
if (!global.active) {	
	if (global.emulatedInput <= 0) {
		delta = 3;
		animSpeed = 1.3;
		walking = false;

		if (walking != prevWalking) {
			if (walking) {
				animIndex = "Walk";
				event_user(0);
			} else {
				animIndex = "Idle";
				event_user(0);
			}
		}
		prevWalking = walking;
		exit;
	}
}

function inputTest(k) {
	if (global.emulatedInput > 0) return k == global.emulatedInput;
	else return keyboard_check(k);
}

var prev_x = x;
var prev_y = y;
var delta = 3;
if (inputTest(global.keybinds[1])) {
	delta = 7;
	animSpeed = 0.6;
} else {
	delta = 3;
	animSpeed = 1.3;
}
	
var changed = false;
if (inputTest(vk_left)) {
	x -= delta;	changed = true;
}
if (inputTest(vk_right)) {
	x += delta;	changed = true;
}
if (inputTest(vk_up)) {
	y -= delta;	changed = true;
}
if (inputTest(vk_down)) {
	y += delta;	changed = true;
}

if (changed) walking = true;
else walking = false;

if (walking != prevWalking) {
	if (walking) {
		animIndex = "Walk";
		event_user(0);
	} else {
		animIndex = "Idle";
		event_user(0);
	}
}
prevWalking = walking;

if (changed || firstCalc) {
	if (firstCalc) {
		direction = facingToDir(facing);
		firstCalc = false;
	} else {
		direction = point_direction(prev_x, prev_y, x, y);
		facing = (floor((direction + 22.5) / 45) + 2) % 8;
	}
	
	// check for collisions. first make a mask surface
	surf = surface_create(room_width, room_height);
	surface_set_target(surf);
	draw_sprite_ext(OverworldController.maskAsset, 0, 0, 0, 2, 2, 0, c_white, 1);
	surface_reset_target();
	
	function _coll(vx, vy) {
		return surface_getpixel(surf, vx, vy) == 0;
	}
	function coll(vx, vy) {
		return _coll(vx-20, vy-20) || _coll(vx+20, vy-20) ||
			   _coll(vx-20, vy+20) || _coll(vx+20, vy+20) ||
			   place_meeting(vx, vy, OverworldObject);	
	}

	// check if collision is real
	if (coll(x, y)) {
		dx = delta * -cos((2*pi*direction)/360);
		dy = delta * sin((2*pi*direction)/360);
		// undo movement
		x = prev_x;
		y = prev_y;

		// snap to a safe spot
		if (!coll(x-dx, y)) x -= dx;
		else if (!coll(x, y-dy)) y -= dy;
		else if (!coll(x+dx, y)) x += dx;
		else if (!coll(x, y+dy)) y += dy;
		else if (!coll(x+dx, y+dy)) {
			x += dx; y += dy;
		}else if (!coll(x-dx, y-dy)) {
			x -= dx; y -= dy;
		}else if (!coll(x+dx, y-dy)) {
			x += dx; y -= dy;
		}else if (!coll(x-dx, y+dy)) {
			x -= dx; y += dy;
		}
	}

	// get rid of the surface
	surface_free(surf);
}