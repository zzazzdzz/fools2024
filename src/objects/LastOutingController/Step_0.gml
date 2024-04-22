delay -= 1;

if (delay < 0 && !fin) {
	if (keyboard_check_pressed(global.keybinds[0])){
		audio_play_sound(TextboxAdvance, 1, 0);
		fin = true;
		alarm[0] = 70;
    }
    if (keyboard_check_pressed(global.keybinds[1])){
		logView = !logView;
		logPaging = 0;
		audio_play_sound(TextboxAdvance, 1, 0);
		/*audio_play_sound(TextboxAdvance, 1, 0);
		fin = true;
		alarm[0] = 70;*/
    }
	if (buttonCd > 0) {
		buttonCd -= 1;
	} else {
		if (keyboard_check(vk_up)) {
			if (logPaging < (logLength-LOG_ENTS_PER_SCREEN-1)) {
				audio_play_sound(TextboxChoose, 1, 0);
				logPaging += 1;
				buttonCd = 8;
			}
		}
		if (keyboard_check(vk_down)) {
			if (logPaging > 0) {
				audio_play_sound(TextboxChoose, 1, 0);
				logPaging -= 1;
				buttonCd = 8;
			}
		}
	}
}
