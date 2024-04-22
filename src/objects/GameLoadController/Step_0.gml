if (pause) {
	pause -= 1;
	exit; 
}

if (state == 0) {
	if (instance_exists(DebugController)) state = 1337;
	else {
		pause = 50; state = 1;
	}
}
else if (state == 1) {
	global.musicIndex = 3;
	global.musicControl = MUS_PLAY;
	if (loadGame()) state = 2;
	else state = 100;
}
else if (state == 2) {
	global.backTextbox = spawnStandardTextbox("\\f00");
	spawnSaveDetailsTextbox(640-420+10,10);
	global.gp0 = spawnChoiceTextbox("Continue#New Game#Leaderboard", 10, 10, 640-420-10);
	global.gp0.closeOnConfirm = false;
	global.gp0.quitStatusAllowed = false;
	state = 3;
}
else if (state == 3) {
	global.backTextbox.textContent = helpTexts[global.gp0.cursorPos];
	if (global.lastResult != RESULT_NONE) {
		state = 10 + 10 * global.lastResult;
	}
}

else if (state == 10) {
	with (TextboxController) instance_destroy();
	pause = 30;
	state = 11;
}
else if (state == 11) {
	global.musicControl = MUS_FADEOUT;
	var o = instance_create(ScreenTransitionController, 0, 0);
	o.transition_type = TRANSITION_FADETOBLACK;
	pause = 80;
	state = 12;
}
else if (state == 12) {
	room_goto(OverworldRoom);
}


else if (state == 20) {
	with (TextboxController) instance_destroy();
	pause = 30;
	state = 21;
}
else if (state == 21) {
	global.musicControl = MUS_FADEOUT;
	var o = instance_create(ScreenTransitionController, 0, 0);
	o.transition_type = TRANSITION_FADETOBLACK;
	pause = 80;
	state = 22;
}
else if (state == 22) {
	loadGameDefaultVars();
	room_goto(PersonalityTest);
}

else if (state == 30) {
	with (TextboxController) instance_destroy();
	state = 31;
}
else if (state == 31) {
	var bound = true;
	if (array_length(global.onlineLeaderboardBind) == 0) bound = false;
	else if (!global.onlineLeaderboardBind[0]) bound = false;
	if (bound) {
		global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
This client instance is bound to a leaderboard account.
Do you wish to remove the current account binding?\f00
		"));
	} else {
		global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
Binding a leaderboard account to this client instance will allow
you to participate in the global ranking.

Once this process is complete, your data will be automatically
synced to the leaderboard server each time you save.

You can opt out from submission of your data at any time, by
selecting the \c32Leaderboard\c30 option in the top menu.

Do you wish to pair this client instance to a leaderboard account
in order to participate in the ranking?\f00
		"));
	}
	state = 32;
}
else if (state == 32) {
	if (global.backTextbox.hang) {
		spawnChoiceTextbox("Yes.#No.");	
		state = 33;
	}
}
else if (state == 33) {
	if (global.lastResult != RESULT_NONE) {
		scriptingCloseAllText();
		if (global.lastResult == 0) {
			var bound = true;
			if (array_length(global.onlineLeaderboardBind) == 0) bound = false;
			else if (!global.onlineLeaderboardBind[0]) bound = false;
			if (bound) state = 50;
			else state = 34;
		} else state = 1;
	}
}
else if (state == 34) {
	if (string_length(global.onlineAuto2) > 10) {
		global.namingResult = global.onlineAuto1;
		state = 38;
	} else {
		global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
Please provide your account pairing code. It should be visible on
the top of your \c32Settings\c30 page.<@
	"));
		state = 35;
	}
}
else if (state == 35) {
	if (!instance_exists(global.backTextbox)) {
		state = 36;
	}	
}
else if (state == 36) {
	global.gp0 = spawnNamingTextbox("Enter the words of god:", 8);	
	state = 37;
}
else if (state == 37) {
	if (!instance_exists(global.gp0)) {
		if (global.namingResult == "") state = 1;
		else state = 38;
	}
}
else if (state == 38) {
	global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
Your account data will be verified now.
Please wait...\f00
	"));
	state = 39;
}
else if (state == 39) {
	if (global.backTextbox.hang) {
		state = 40;
	}	
}
else if (state == 40) {
	loadingSound = audio_play_sound(UILoader, 1, 1);
	htReady = false;
	var hdr = ds_map_create();
	ds_map_add(hdr, "User-Agent", "fools2024 " + string(GM_version) + "/" + string(GM_runtime_version) + " " + string(os_browser));
	ds_map_add(hdr, "Content-Type", "text/plain");
	ds_map_add(hdr, "X-ZZAZZ-Key", global.onlineAuthKey);
	ds_map_add(hdr, "X-ZZAZZ-Bind", global.namingResult);
	http_request(
		API_URL + "/bind/?r=" + string(irandom_range(100000, 999999)) + string(irandom_range(100000, 999999)),
		"POST", hdr, ""
	);
	ds_map_destroy(hdr);
	state = 41;
}
else if (state == 41) {
	if (htReady) state = 42;	
}
else if (state == 42) {
	audio_stop_sound(loadingSound);	
	scriptingCloseAllText();
	if (htError) {
		ratelimitedUIWrongSound();
		if (htResult == "BIND_INVALID") {
			global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
It appears that the provided account pairing code is incorrect.
Please provide a valid account pairing code.<@
			"));
		}
		else if (htResult == "CONN_FAILED") {
			global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
Could not contact the leaderboard server.
Check your connection and try again later.<@
			"));
		}
		else if (htResult == "RANKING_DOWN") {
			global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
The event period has ended.
New account pairings are no longer allowed.<@
			"));
		}
		else {
			global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
An unknown processing error has occured.
Please retry the pairing operation later.<@
			"));
		}
	} else {
		global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
\m0aYour leaderboard account was successfully connected.
Rankings will be updated each time you save your progress.<@
		"));
		global.onlineLeaderboardBind = [true, global.namingResult, htResult];
		saveGame();
	}
	state = 43;
}
else if (state == 43) {
	if (!instance_exists(global.backTextbox)) {
		state = 1;
	}	
}

else if (state == 50) {
	global.onlineLeaderboardBind = [false];
	saveGame();
	global.backTextbox = spawnStandardTextbox(formatTextboxString(@"
\m08The connected account was removed.<@
	"));
	state = 43;
}

else if (state == 100) {
	global.backTextbox = spawnStandardTextbox("The save data is corrupted and cannot be loaded.\nA new game will be started.<@");
	state = 101;
}
else if (state == 101) {
	if (!instance_exists(global.backTextbox)) {
		state = 102;
	}	
}
else if (state == 102) {
	pause = 50;
	state = 103;
}
else if (state == 103) {
	global.musicControl = MUS_FADEOUT;
	var o = instance_create(ScreenTransitionController, 0, 0);
	o.transition_type = TRANSITION_FADETOBLACK;
	pause = 80;
	state = 104;
}
else if (state == 104) {
	loadGameDefaultVars();
	room_goto(PersonalityTest);	
}

else if (state == 1337) {
	global.musicIndex = 3;
	global.musicControl = MUS_PLAY;
	if (!loadGame()) loadGameDefaultVars();
	DebugController.goto = 1;
	state = 1338;
}
else if (state == 1338) {
}