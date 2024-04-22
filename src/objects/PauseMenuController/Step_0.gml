if (state == 0) {
	global.active = false;
	state = 1;
}
else if (state == 1) {
	// spawnCustomTextbox("basic_center", 420, 10, 200, 60, "Money: 27000 G");
	global.backTextbox = spawnStandardTextbox(" \f00");
	global.battleToastBox = spawnChoiceTextbox("Team#Items#Save#Compendium", 10, 10);
	global.battleToastBox.closeOnConfirm = false;
	state = 2;
}
else if (state == 2) {
	if (instance_exists(global.backTextbox)) global.backTextbox.textContent = storyHints[global.curStoryHint];
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) state = 999;
		else state = 10 + 10 * global.lastResult;
	}
}

else if (state == 10) {
	var st = "@3" + global.teamMembers[0].name;
	for (var i=1; i<array_length(global.teamMembers); i++) {
		st += "#@6" + global.teamMembers[i].name;
	}
	spawnChoiceTextbox(st, 205, 10);
	state = 11;
}
else if (state == 11) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			global.lastResult = RESULT_NONE;
			state = 2;
		} else {
			global.gp1 = global.lastResult;
			with (TextboxController) instance_destroy();
			global.battleToastBox = spawnCustomTextbox("memberstats");
			state = 12;
		}
	}
} else if (state == 12) {
	if (!instance_exists(global.battleToastBox)) state = 1;
}

else if (state == 20) {
	global.gp1 = 0;
	if (array_length(global.teamMembers[global.gp1].items) > 0) {
		var ct = "";
		for (var i=0; i<array_length(global.teamMembers[global.gp1].items); i++) {
			ct += "#" + global.itemDb[global.teamMembers[global.gp1].items[i]][0];
		}
		ct = string_delete(ct, 1, 1);
		global.gp0 = spawnChoiceTextbox(ct, 205, 42, 250);
	} else {
		global.gp0 = spawnChoiceTextbox("@4No items", 205, 42, 250);
		global.gp0.choiceWithoutChoice = true;	
	}
	global.gp0.t_header = global.teamMembers[global.gp1].name;
	global.gp0.headerSubimg = (array_length(global.teamMembers) > 1) ? 1 : 0;
	global.gp0.closeOnConfirm = false;
	state = 21;
}
else if (state == 21) {
	var reload = false;
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			global.lastResult = RESULT_NONE;
			state = 2;
		} else {
			global.gp2 = global.lastResult;
			spawnChoiceTextbox("Use#Give#Trash", 465, 42);
			state = 100;
		}
	} else {
		if (array_length(global.teamMembers) > 1) {
			if (keyboard_check_pressed(vk_left)) {
				global.gp1 -= 1;
				if (global.gp1 < 0) global.gp1 = array_length(global.teamMembers) - 1;
				reload = true;
				audio_play_sound(UISwitch, 1, 0);
			}
			if (keyboard_check_pressed(vk_right)) {
				global.gp1 += 1;
				if (global.gp1 >= array_length(global.teamMembers)) global.gp1 = 0;
				reload = true;
				audio_play_sound(UISwitch, 1, 0);
			}
		}
		if (reload) {
			instance_destroy(global.gp0);
			if (array_length(global.teamMembers[global.gp1].items) > 0) {
				var ct = "";
				for (var i=0; i<array_length(global.teamMembers[global.gp1].items); i++) {
					ct += "#" + global.itemDb[global.teamMembers[global.gp1].items[i]][0];
				}
				ct = string_delete(ct, 1, 1);
				global.gp0 = spawnChoiceTextbox(ct, 205, 42, 250);
			} else {
				global.gp0 = spawnChoiceTextbox("@4No items", 205, 42, 250);
				global.gp0.choiceWithoutChoice = true;	
			}
			global.gp0.t_header = global.teamMembers[global.gp1].name;
			global.gp0.headerSubimg = (array_length(global.teamMembers) > 1) ? 1 : 0;
			global.gp0.closeOnConfirm = false;
		}
		if (array_length(global.teamMembers[global.gp1].items) > 0) {
			global.backTextbox.textContent = global.itemDb[global.teamMembers[global.gp1].items[global.gp0.cursorPos]][4];
		} else {
			global.backTextbox.textContent = txNoItems;
		}
	}
}
else if (state == 22) {
	instance_destroy(global.gp0);
	if (array_length(global.teamMembers[global.gp1].items) > 0) {
		var ct = "";
		for (var i=0; i<array_length(global.teamMembers[global.gp1].items); i++) {
			ct += "#" + global.itemDb[global.teamMembers[global.gp1].items[i]][0];
		}
		ct = string_delete(ct, 1, 1);
		global.gp0 = spawnChoiceTextbox(ct, 205, 42, 250);
	} else {
		global.gp0 = spawnChoiceTextbox("@4No items", 205, 42, 250);
		global.gp0.choiceWithoutChoice = true;	
	}
	global.gp0.t_header = global.teamMembers[global.gp1].name;
	global.gp0.headerSubimg = (array_length(global.teamMembers) > 1) ? 1 : 0;
	global.gp0.closeOnConfirm = false;
	state = 21;
}

else if (state == 30) {
	with (TextboxController) instance_destroy();
	pause = 5;
	state = 31;
}

else if (state == 31) {	
	spawnSaveDetailsTextbox(10, 10);
	global.backTextbox = spawnStandardTextbox("Would you like to save your progress?\\f00");
	state = 32;
}

else if (state == 32) {
	if (global.backTextbox.hang) {
		spawnChoiceTextbox("Yes#No");
		state = 33;	
	}
}

else if (state == 33) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == 0) {
			saveGame();
			state = 34;
		} else {
			with (TextboxController) instance_destroy();
			state = 1;
		}
	}
}

else if (state == 34) {
	if (instance_exists(global.backTextbox)) instance_destroy(global.backTextbox);
	var bound = true;
	if (array_length(global.onlineLeaderboardBind) == 0) bound = false;
	else if (!global.onlineLeaderboardBind[0]) bound = false;
	if (bound) {
		global.backTextbox = spawnStandardTextbox("\\m0aSave completed successfully.\nSynchronizing your progress with the leaderboard...\\f00");
		state = 70;
	} else {
		global.backTextbox = spawnStandardTextbox("\\m0aSave completed successfully.<@");
		state = 35;
	}
}

else if (state == 70) {
	if (global.backTextbox.hang) {
		state = 71;
	}	
}
else if (state == 71) {
	loadingSound = audio_play_sound(UILoader, 1, 1);
	htReady = false;
	
	var file = file_text_open_read(working_directory + "savefile");
	var out = file_text_readln(file);
	out += file_text_readln(file);
	out += file_text_readln(file);
	out += file_text_readln(file);
	out += file_text_readln(file);
	out += file_text_readln(file);
	file_text_close(file);
		
	var hdr = ds_map_create();
	ds_map_add(hdr, "User-Agent", "fools2024 " + string(GM_version) + "/" + string(GM_runtime_version) + " " + string(os_browser));
	ds_map_add(hdr, "Content-Type", "text/plain");
	if (string_length(global.onlineAuto2) > 10) {
		ds_map_add(hdr, "X-ZZAZZ-Key", global.onlineAuto2);
		ds_map_add(hdr, "X-ZZAZZ-Bind", global.onlineAuto1);
	} else {
		ds_map_add(hdr, "X-ZZAZZ-Key", global.onlineLeaderboardBind[2]);
		ds_map_add(hdr, "X-ZZAZZ-Bind", global.onlineLeaderboardBind[1]);
	}
	http_request(
		API_URL + "/upload/?r=" + string(irandom_range(100000, 999999)) + string(irandom_range(100000, 999999)),
		"POST", hdr, out
	);
	ds_map_destroy(hdr);
	state = 72;
}
else if (state == 72) {
	if (htReady) state = 73;
}
else if (state == 73) {
	audio_stop_sound(loadingSound);	
	if (instance_exists(global.backTextbox)) {
		instance_destroy(global.backTextbox);
	}
	if (htError) {
		if (htResult == "BIND_INVALID") {
			global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
Leaderboard synchronization failed.
Your account pairing was revoked and needs to be updated.

Reset the game, then select the \c32Leaderboard\c30 option in the top
menu to add a new account binding.
<@
			"));
		}
		else if (htResult == "CONN_FAILED") {
			global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
Leaderboard synchronization failed.
Could not contact the leaderboard server.

This is usually the result of a connection error.
Check your connection, then retry the synchronization process.<@
			"));
		}
		else if (htResult == "RANKING_DOWN") {
			global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
Leaderboard synchronization failed.
The event period has ended.

The game can be played, but leaderboard data can no longer
be updated. Please remove your account binding.<@
			"));
		}
		else {
			global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
Leaderboard synchronization failed.
An unknown processing error has occured. Try again later.<@
			"));
		}
	} else {
		global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
\m0aYour leaderboard information was succesfully updated.<@
		"));
	}
	state = 74;
}
else if (state == 74) {
	state = 35;	
}

else if (state == 35) {
	if (!instance_exists(global.backTextbox)) {
		with (TextboxController) instance_destroy();
		state = 1;
	}
}

else if (state == 40) {
	with (TextboxController) instance_destroy();
	// compendium
	drawCompendium = true;
	state = 41;
	bepis = 20;
}
else if (state == 41) {
	bepis -= 1;
	if (bepis < 0) state = 42;
}
else if (state == 42) {
	if (keyboard_check_pressed(global.keybinds[0]) || keyboard_check_pressed(global.keybinds[1])) {
		sound_play(TextboxAdvance);
		drawCompendium = false;
		state = 1;
	}
}

else if (state == 100) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			global.lastResult = RESULT_NONE;
			state = 21;
		} else {
			if (global.lastResult == 0) {
				with (TextboxController) instance_destroy();
				state = 200;
			} else if (global.lastResult == 2) {
				spawnChoiceTextbox("No#Yes", 465, 42);
				state = 101;
			} else if (global.lastResult == 1) {
				var attr = "3";
				if (array_length(global.teamMembers[0].items) >= INV_NUM_MAX || global.gp1 == 0) attr = "4";
				var st = "@" + attr + global.teamMembers[0].name;
				for (var i=1; i<array_length(global.teamMembers); i++) {
					attr = "6";
					if (array_length(global.teamMembers[i].items) >= INV_NUM_MAX || global.gp1 == i) attr = "4";
					st += "#@" + attr + global.teamMembers[i].name;
				}
				global.battleToastBox = spawnChoiceTextbox(st, 405, 42, 210);
				global.battleToastBox.t_header = "Give to whom?";
				global.battleToastBox.closeOnConfirm = false;
				global.battleToastBox.muteChoiceSound = true;
				state = 300;
			} else {
				bugcheck("PauseMenuUndefFunc");
				exit;
			}
		}
	}
}

else if (state == 300) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			global.lastResult = RESULT_NONE;
			state = 21;
		} else {
			if (array_length(global.teamMembers[global.lastResult].items) >= INV_NUM_MAX || global.lastResult == global.gp1) {
				ratelimitedUIWrongSound();
				global.lastResult = RESULT_NONE;
			} else {
				audio_play_sound(SFXGeneral4, 1, 0);
				var itId = global.teamMembers[global.gp1].items[global.gp2];
				array_delete(global.teamMembers[global.gp1].items, global.gp2, 1);
				array_push(global.teamMembers[global.lastResult].items, itId);
				with (global.battleToastBox) instance_destroy();
				global.lastResult = RESULT_NONE;
				state = 22;
			}
		}
	}
}

else if (state == 101) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			global.lastResult = RESULT_NONE;
			state = 21;
		} else {
			if (global.lastResult == 1) {
				array_delete(global.teamMembers[global.gp1].items, global.gp2, 1);
				global.lastResult = RESULT_NONE;
				state = 22;
			} else {
				global.lastResult = RESULT_NONE;
				state = 21;	
			}
		}
	}
}

else if (state == 200) {
	execRet = 0;
	execCtr = 0;
	state = 201;
}
else if (state == 201) {
	if (execRet != SCRIPT_STOP) {
		if (execRet == SCRIPT_CONTINUE_ADVANCETICK) execCtr += 1;
		execRet = script_execute(global.itemDb[global.teamMembers[global.gp1].items[global.gp2]][2], execCtr);
		if (execRet > -9999) {
			execCtr += execRet;
			execCtr -= 1;
			execRet = SCRIPT_CONTINUE_ADVANCETICK;
		}
	} else {
		execRet = 0;
		state = 999;
	}
}

else if (state == 999) {
	with (TextboxController) instance_destroy();
	global.active = true;
	instance_destroy();
}