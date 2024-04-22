globalStepTimer += 1;

if (xPosAnimation == 1) {
	if (!xPosAnimIndicated) {
		audio_play_sound(UIStartTurn, 0, 0);	
		xPosAnimIndicated = true;
	}
	x += max(abs(x-10)/6, 3);
	if (x >= 10) {
		x = 10;
		xPosAnimation = 2;
	}
}
if (xPosAnimation == 3) {
	xPosAnimIndicated = false;
	x -= max(abs(x+300+t_w)/6, 3);
	if (x < -800) {
		x = -800;
		xPosAnimation = 0;
	}
}

if (!active) exit;
if (global.textStackWait) exit;

stepTimer += 1;

if (t_type == "intermission") {
	if (typeIndex > 0) {
	    if (typeIndex <= textContentLen) {
	        if (waitInput) {
	            if (keyboard_check_pressed(global.keybinds[0])) {
	                waitInput = 0;
	                if (soundEnabled) audio_play_sound(TextboxAdvance, 1, 0);
	            }
	        } else {
	            textboxContinueProcessing = 1;
	            textCommandProcessor();
	            if (textboxContinueProcessing) {
	                textContent += currentModifier + string_char_at(t_text, typeIndex);
	                typeIndex += 1;
	            }
	        }
	    }
	    if (typeIndex > textContentLen) {
			if (!hang) instance_destroy();
	    }
	}
}

if (t_type == "textbox") {
	if (typeIndex > 0) {
	    if (typeIndex <= textContentLen) {
	        if (waitInput) {
	            if ((keyboard_check_pressed(global.keybinds[0]) || keyboard_check_pressed(global.keybinds[1])) && (!preventDefault)) {
	                waitInput = 0;
	                if (soundEnabled) audio_play_sound(TextboxAdvance, 1, 0);
	            }
	        } else {
				if (delay > 0) {
					delay -= 1;
				} else {
		            textboxContinueProcessing = 1;
		            textCommandProcessor();
		            if (textboxContinueProcessing) {
		                textContent += currentModifier + string_char_at(t_text, typeIndex);
		                typeIndex += 1;
		                if (stepTimer mod 3 == 0 && typeIndex < textContentLen && soundEnabled) {
		                    audio_play_sound(TextboxSoundDef, 1, 0);
		                }
		            }
				}
	        }
	    }
	    if (typeIndex > textContentLen) {
			if (!hang) instance_destroy();
	    }
	}
}

if (t_type == "choice"){
    if (keyboard_check_pressed(vk_up) && cursorPos > 0){
        cursorPos -= 1;
		if (soundEnabled) audio_play_sound(TextboxChoose, 1, 0);
    }
    if (keyboard_check_pressed(vk_down) && cursorPos < optionCount-1){
        cursorPos += 1;
		if (soundEnabled) audio_play_sound(TextboxChoose, 1, 0);
    }
    if (keyboard_check_pressed(global.keybinds[0]) && (!preventDefault)){
		if (!choiceWithoutChoice) {
	        global.lastResult = cursorPos;
			if (soundEnabled && !muteChoiceSound) audio_play_sound(TextboxAdvance, 1, 0);
			if (closeOnConfirm) instance_destroy();
		}
    }
    if (keyboard_check_pressed(global.keybinds[1]) && (!preventDefault)){
		if (quitStatusAllowed) {
	        global.lastResult = RESULT_QUIT;
			if (soundEnabled) audio_play_sound(TextboxBack, 1, 0);
			instance_destroy();
		}
    }
}

if (t_type == "condensedchoice"){
    if (keyboard_check_pressed(vk_up) && cursorPos > 0){
        cursorPos -= 1;
		if (soundEnabled) audio_play_sound(TextboxChoose, 1, 0);
    }
    if (keyboard_check_pressed(vk_down) && cursorPos < optionCount-1){
        cursorPos += 1;
		if (soundEnabled) audio_play_sound(TextboxChoose, 1, 0);
    }
    if (keyboard_check_pressed(global.keybinds[0]) && (!preventDefault)){
        global.lastResult = cursorPos;
		if (soundEnabled) audio_play_sound(TextboxAdvance, 1, 0);
		if (!noClose) instance_destroy();
    }
}

if (t_type == "naming") {
    if (keyboard_check_pressed(global.keybinds[1]) && (!preventDefault)){
		if (namingResult == "") {
			if (!noClose) {
				global.lastResult = RESULT_QUIT;
				global.namingResult = namingResult;
				instance_destroy();
			}
		} else {
			keyboard_clear(global.keybinds[1]);
			namingResult = string_copy(namingResult, 1, string_length(namingResult)-1);
		}
		if (soundEnabled) audio_play_sound(TextboxBack, 1, 0);
    }
	if (keyboard_check_pressed(vk_enter)) {
		if (gridCursorX == 10 && gridCursorY == 5) {
			keyboard_key_press(global.keybinds[0]);
			keyboard_key_release(global.keybinds[0]);
		} else {
			gridCursorX = 10;
			gridCursorY = 5;
			audio_play_sound(TextboxAdvance, 1, 0);
		}
	}
    if (keyboard_check_pressed(global.keybinds[0]) && (!preventDefault)){
		if (gridCursorX == 10 && gridCursorY == 5) {
			global.lastResult = RESULT_QUIT;
			global.namingResult = namingResult;
			instance_destroy();
		} else {
			if (string_length(namingResult) < maxLen) {
				namingResult += string_char_at(charset, gridCursorY * 11 + gridCursorX + 1);
			} else {
				namingResult = string_copy(namingResult, 1, string_length(namingResult)-1) + string_char_at(charset, gridCursorY * 11 + gridCursorX + 1);
			}
		}
		audio_play_sound(TextboxAdvance, 1, 0);
		keyboard_clear(global.keybinds[0]);
    }
	if (keyboard_check_pressed(vk_up)){
        gridCursorY -= 1;
		if (gridCursorY < 0) gridCursorY = 5;
		if (soundEnabled) audio_play_sound(TextboxChoose, 1, 0);
    }
	if (keyboard_check_pressed(vk_down)){
        gridCursorY += 1;
		if (gridCursorY > 5) gridCursorY = 0;
		if (soundEnabled) audio_play_sound(TextboxChoose, 1, 0);
    }
	if (keyboard_check_pressed(vk_right)){
        gridCursorX += 1;
		if (gridCursorX > 10) gridCursorX = 0;
		if (soundEnabled) audio_play_sound(TextboxChoose, 1, 0);
    }
	if (keyboard_check_pressed(vk_left)){
        gridCursorX -= 1;
		if (gridCursorX < 0) gridCursorX = 10;
		if (soundEnabled) audio_play_sound(TextboxChoose, 1, 0);
    }
	// clamp, just in case
	if (gridCursorX < 0) gridCursorX = 0;
	if (gridCursorY < 0) gridCursorY = 0;
	if (gridCursorX > 10) gridCursorX = 10;
	if (gridCursorY > 5) gridCursorY = 5;
}

if (t_type == "gridchoiceheadered") {
    if (keyboard_check_pressed(global.keybinds[1]) && (!preventDefault)){
        global.lastResult = RESULT_QUIT;
		if (soundEnabled) audio_play_sound(TextboxBack, 1, 0);
		if (!noClose) instance_destroy();
		keyboard_clear(global.keybinds[1]);
    }
    if (keyboard_check_pressed(global.keybinds[0]) && (!preventDefault)){
        global.lastResult = gridCursorX + gridCursorY*2;
		if (soundEnabled) audio_play_sound(TextboxAdvance, 1, 0);
		if (!noClose) instance_destroy();
		keyboard_clear(global.keybinds[0]);
    }
	if (keyboard_check_pressed(vk_up) && gridCursorY > 0){
        gridCursorY -= 1;
		if (soundEnabled) audio_play_sound(TextboxChoose, 1, 0);
    }
	if (keyboard_check_pressed(vk_down) && gridCursorY < floor((optionCount-1)/2)){
        gridCursorY += 1;
		var optId = gridCursorX + gridCursorY*2;
		while (optId >= optionCount) {
			gridCursorX -= 1;
			if (gridCursorX < 0) {
				gridCursorX = 1;
				gridCursorY -= 1;
				if (gridCursorY < 0) gridCursorY = 0;
			}
			optId = gridCursorX + gridCursorY*2;
		}
		if (soundEnabled) audio_play_sound(TextboxChoose, 1, 0);
    }
	if (keyboard_check_pressed(vk_right) && gridCursorX < 1){
        gridCursorX += 1;
		var optId = gridCursorX + gridCursorY*2;
		if (optId >= optionCount) {
			gridCursorY -= 1;
			if (gridCursorY < 0) {
				gridCursorY = 0;
				gridCursorX = 0;
			}
		}
		if (soundEnabled) audio_play_sound(TextboxChoose, 1, 0);
    }
	if (keyboard_check_pressed(vk_left) && gridCursorX > 0){
        gridCursorX -= 1;
		if (soundEnabled) audio_play_sound(TextboxChoose, 1, 0);
    }
}

if (t_type == "basicheadered" || t_type == "memberstats") {
    if (keyboard_check_pressed(global.keybinds[0]) && (!preventDefault)){
		if (soundEnabled) audio_play_sound(TextboxAdvance, 1, 0);
		instance_destroy();
    }
    if (keyboard_check_pressed(global.keybinds[1]) && (!preventDefault)){
		if (soundEnabled) audio_play_sound(TextboxBack, 1, 0);
		instance_destroy();
    }	
}