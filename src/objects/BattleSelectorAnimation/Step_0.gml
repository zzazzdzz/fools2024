var max_accel = 6;
var inc_accel = 0.12;
var min_accel = 0.5;

if (type == 1) {
	var was_moved = false;
	if (keyboard_check(vk_left)) {
		x -= accel;
		accel += inc_accel;
		if (accel > max_accel) accel = max_accel;
		if (accel < min_accel) accel = min_accel;
		was_moved = true;
	}
	if (keyboard_check(vk_right)) {
		x += accel;
		accel += inc_accel;
		if (accel > max_accel) accel = max_accel;
		if (accel < min_accel) accel = min_accel;
		was_moved = true;
	}
	if (keyboard_check(vk_up)) {
		y -= accel;
		accel += inc_accel;
		if (accel > max_accel) accel = max_accel;
		if (accel < min_accel) accel = min_accel;
		was_moved = true;
	}
	if (keyboard_check(vk_down)) {
		y += accel;
		accel += inc_accel;
		if (accel > max_accel) accel = max_accel;
		if (accel < min_accel) accel = min_accel;
		was_moved = true;
	}
	if (!was_moved) {
		accel = 0;
	}
	if (x < 30) x = 30;
	if (x > room_width-30) x = room_width-30;
	if (y < 30) y = 30;
	if (y > room_height-30) y = room_height-30;
	global.gp0 = x;
	global.gp1 = y;
}

if (type == 0 || type == 2) {
	if (keyboard_check_pressed(global.keybinds[1])) {
		with (global.gp2) instance_destroy();
		global.lastResult = RESULT_QUIT;
		audio_play_sound(TextboxBack, 0, 0);
		instance_destroy();
	}
	if (keyboard_check_pressed(global.keybinds[0])) {
		if (!locked) {
			with (global.gp2) instance_destroy();
			global.lastResult = targetListIdx;
			audio_play_sound(TextboxAdvance, 0, 0);
			instance_destroy();
		}
	}
	if (keyboard_check_pressed(vk_left)) {
		if (!locked) {
			targetListIdx -= 1;
			if (targetListIdx < 0) {
				targetListIdx = array_length(global.potentialTargetList) - 1;	
			}
			with (global.gp2) instance_destroy();
			global.gp2 = spawnToastTextbox("To " + keyword + ": " + global.potentialTargetList[targetListIdx].combatantNameDecorated);
			x = global.potentialTargetList[targetListIdx].x;
			y = global.potentialTargetList[targetListIdx].y;
			audio_play_sound(TextboxChoose, 0, 0);
		}
	}
	if (keyboard_check_pressed(vk_right)) {
		if (!locked) {
			targetListIdx += 1;
			if (targetListIdx >= array_length(global.potentialTargetList)) {
				targetListIdx = 0;	
			}
			with (global.gp2) instance_destroy();
			global.gp2 = spawnToastTextbox("To " + keyword + ": " + global.potentialTargetList[targetListIdx].combatantNameDecorated);
			x = global.potentialTargetList[targetListIdx].x;
			y = global.potentialTargetList[targetListIdx].y;
			audio_play_sound(TextboxChoose, 0, 0);
		}
	}
}