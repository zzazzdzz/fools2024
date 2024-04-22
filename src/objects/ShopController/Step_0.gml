if (pause) {
	pause -= 1;
	exit; 
}

if (state == 0) {
	pause = 50;
	state = 1;
}
else if (state == 1) {
	global.musicIndex = 4;
	global.musicControl = MUS_PLAY;
	state = 2;	
}
else if (state == 2) {
	moneyTextbox = spawnCustomTextbox("basic_center", 420, 10, 200, 60, "");
	moneyTextbox.t_text = "Money: " + string(global.money) + "@Px@0";
	with (moneyTextbox) event_user(0);
	global.backTextbox = spawnStandardTextbox("Welcome to my humble item shop!\nPlease take a look at my merchandise!<@\\f00", [Portrait0352, 0]);
	state = 3;
}
else if (state == 3) {
	if (global.backTextbox.hang) {
		global.backTextbox.t_portrait = noone;
		var tx = "";
		for (var i=0; i<array_length(global.roamingShopData); i++) {
			var attr = "2";
			if (global.roamingShopData[i][1] > global.money) attr = "7";
			tx += "#@0" + global.itemDb[global.roamingShopData[i][0]][0] + "@TD@" + attr + string(global.roamingShopData[i][1]) + "@Px@0";
		}
		tx = string_delete(tx, 1, 1);
		global.gp0 = spawnChoiceTextbox(tx, 10, 10, 380);
		global.gp0.closeOnConfirm = false;
		state = 4;
	}
}
else if (state == 4) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			state = 200;
		} else {
			boughtItemID = global.roamingShopData[global.lastResult][0];
			boughtItemPrice = global.roamingShopData[global.lastResult][1];
			global.backTextbox.hidden = true;
			if (global.roamingShopData[global.lastResult][1] <= global.money) {
				global.gp1 = spawnStandardTextbox(formatTextboxString(@"
The \c31" + global.itemDb[boughtItemID][0] + @"\c30? Certainly.
Who should be holding this item?\f00
				"));
				state = 5;
			} else {
				global.gp1 = spawnStandardTextbox(formatTextboxString(@"
Oops!
You don't have enough money!<@
				"));
				state = 100;
			}
		}
	} else {
		global.backTextbox.textContent = global.itemDb[global.roamingShopData[global.gp0.cursorPos][0]][4];
	}
}
else if (state == 5) {
	if (global.gp1.hang) {
		var attr = "3";
		if (array_length(global.teamMembers[0].items) >= INV_NUM_MAX) attr = "4";
		var st = "@" + attr + global.teamMembers[0].name;
		for (var i=1; i<array_length(global.teamMembers); i++) {
			attr = "6";
			if (array_length(global.teamMembers[i].items) >= INV_NUM_MAX) attr = "4";
			st += "#@" + attr + global.teamMembers[i].name;
		}
		holderChoiceTextbox = spawnChoiceTextbox(st);
		holderChoiceTextbox.closeOnConfirm = false;
		holderChoiceTextbox.muteChoiceSound = true;
		state = 6;
	}
}
else if (state == 6) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			global.lastResult = RESULT_NONE;
			if (instance_exists(global.gp1)) {
				with (global.gp1) instance_destroy();
			}
			global.backTextbox.hidden = false;
			state = 4;
		} else {
			if (array_length(global.teamMembers[global.lastResult].items) >= INV_NUM_MAX) {
				ratelimitedUIWrongSound();
				global.lastResult = RESULT_NONE;
			} else {
				audio_play_sound(SFXGeneral5, 1, 0);
				if (instance_exists(global.gp1)) {
					with (global.gp1) instance_destroy();
				}
				if (instance_exists(holderChoiceTextbox)) {
					with (holderChoiceTextbox) instance_destroy();	
				}
				global.money -= boughtItemPrice;
				array_push(global.teamMembers[global.lastResult].items, boughtItemID);
				
				// refresh money
				moneyTextbox.t_text = "Money: " + string(global.money) + "@Px@0";
				with (moneyTextbox) event_user(0);
				
				// refresh shop list
				var tx = "";
				for (var i=0; i<array_length(global.roamingShopData); i++) {
					var attr = "2";
					if (global.roamingShopData[i][1] > global.money) attr = "7";
					tx += "#@0" + global.itemDb[global.roamingShopData[i][0]][0] + "@TD@" + attr + string(global.roamingShopData[i][1]) + "@Px@0";
				}
				tx = string_delete(tx, 1, 1);
				global.gp0.textContent = textToAttributed(tx);
		
				global.gp1 = spawnStandardTextbox(formatTextboxString(@"
You bought a \c31" + global.itemDb[boughtItemID][0] + @"\c30.
{TEAM" + string(global.lastResult) + @"} took it.<@
				"));
				state = 100;
			}
		}
	}
}

else if (state == 100) {
	if (!instance_exists(global.gp1)) {
		global.lastResult = RESULT_NONE;
		global.backTextbox.hidden = false;
		state = 4;
	}
}

else if (state == 200) {
	with (TextboxController) instance_destroy();
	global.gp1 = spawnStandardTextbox(formatTextboxString(@"
Hope I see you another time!<@
	"), [Portrait0352, 0]);
	state = 201;
}
else if (state == 201) {
	if (!instance_exists(global.gp1)) {
		state = 202;
		pause = 30;
	}
}
else if (state == 202) {
	transitionObj = instance_create(ScreenTransitionController, 0, 0);
	transitionObj.transition_type = TRANSITION_FADETOBLACK;
	global.musicControl = MUS_FADEOUT;
	pause = 80;
	state = 203;
}
else if (state == 203) {
	if (global.overworldCurVariant == "Bepis" || global.overworldCurVariant == "Returnable") {
		global.overworldCurMap = "AbyssPost";
		// keep variant
		global.overworldSpawnX = 89*2;
		global.overworldSpawnY = 68*2;
		global.overworldSpawnFacing = FACING_D;
	} else {
		global.overworldCurMap = "Town";
		// keep variant
		global.overworldSpawnX = 525*2;
		global.overworldSpawnY = 384*2;
		global.overworldSpawnFacing = FACING_U;
	}
	global.active = true;
	room_goto(OverworldRoom);
}