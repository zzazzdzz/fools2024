if (pause) {
	pause -= 1;
	exit; 
}

if (state == 0) {
	pause = 50;
	state = 100;
} else if (state == 1) {
	global.battleToastBox = spawnStandardTextbox("Which team member would you like to address?\\f00");
	state = 2;
} else if (state == 2) {
	if (global.battleToastBox.hang) {
		var st = "@3" + global.teamMembers[0].name;
		for (var i=1; i<array_length(global.teamMembers); i++) {
			st += "#@6" + global.teamMembers[i].name;
		}
		spawnChoiceTextbox(st, 10, 10);
		state = 3;
	}
} else if (state == 3) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			with (TextboxController) instance_destroy();
			state = 200;
		} else {
			global.gp1 = global.lastResult;
			if (global.gp1 == 0) nameDecorator = "3";
			else nameDecorator = "6";
			state = 10;
		}
	}
} else if (state == 10) {
	with (TextboxController) instance_destroy();
	global.battleToastBox = spawnStandardTextbox("\\f00");
	state = 11;
} else if (state == 11) {
	global.battleToastBox.textContent = helpTexts[0];
	global.gp0 = spawnChoiceTextbox("View details page#Learn or recall combat moves#Learn or recall specialist moves#Change specialization#Change name", 10, 10);
	state = 12;
} else if (state == 12) {
	if (global.lastResult != RESULT_NONE) {
		with (TextboxController) instance_destroy();
		if (global.lastResult == RESULT_QUIT) state = 1;
		else {
			state = 20 + global.lastResult * 10;
			if (state == 30) state = 29;
		}
	} else {
		global.battleToastBox.textContent = helpTexts[global.gp0.cursorPos];
	}
} else if (state == 20) {
	// stats page
	global.battleToastBox = spawnCustomTextbox("memberstats");
	state = 21;
} else if (state == 21) {
	if (!instance_exists(global.battleToastBox)) state = 10;
} else if (state == 60) {
	// name change
	global.battleToastBox = spawnNamingTextbox("Rename this character:", 10);
	state = 61;
} else if (state == 61) {
	if (!instance_exists(global.battleToastBox)) {
		state = 62;
	}
} else if (state == 62) {
	if (global.namingResult == "") state = 10;
	else {
		global.battleToastBox = spawnStandardTextbox(formatTextboxString(@"
Should this team member be renamed to \c3" + nameDecorator + global.namingResult + @"\c30?\f00
		"));
		state = 63;
	}
} else if (state == 63) {
	if (global.battleToastBox.hang) {
		spawnChoiceTextbox("Yes#No");
		state = 64;
	}
} else if (state == 64) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == 0) {
			draw_set_font(TextboxFont);
			global.gp3 = string_width(global.namingResult);
		
			if (global.gp3 > NAME_MAX_WIDTH) {
				with (TextboxController) instance_destroy();
				global.battleToastBox = spawnStandardTextbox(formatTextboxString(@"
This name is too long. Try choosing a shorter name.<@
				"));				
			} else {
				with (TextboxController) instance_destroy();
				global.teamMembers[global.gp1].name = global.namingResult;
				if (global.gp1 == 1) global.partnerName = global.namingResult;
				if (global.gp1 == 2) global.partnerNameSecondary = global.namingResult;
				global.battleToastBox = spawnStandardTextbox(formatTextboxString(@"
This team member has been renamed.<@
				"));
			}
			state = 65;
		} else {
			state = 10;	
		}
	}
} else if (state == 65) {
	if (!instance_exists(global.battleToastBox)) state = 10;
} else if (state == 50) {
	global.battleToastBox = spawnStandardTextbox(formatTextboxString(@"
Choose a specialization for \c3" + nameDecorator + global.teamMembers[global.gp1].name + @"\c30.\f00
	"));
	state = 51;
} else if (state == 51) {
	if (global.battleToastBox.hang) {
		spawnChoiceTextbox("Offensive#Defensive#Support");
		state = 52;
	}
} else if (state == 52) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) state = 10;
		else state = 53;
	}
} else if (state == 53) {
	with (TextboxController) instance_destroy();
	global.gp2 = global.lastResult;
	specDecorator = string(7 + global.gp2);
	global.battleToastBox = spawnStandardTextbox(formatTextboxString(@"
Do you wish to change \c3" + nameDecorator + global.teamMembers[global.gp1].name + @"\c30's specialization to \c3" + specDecorator + specNames[global.gp2] + @"\c30?
This will change stat distribution and available moves.\f00
	"));
	state = 54;
} else if (state == 54) {
	if (global.battleToastBox.hang) {
		spawnChoiceTextbox("Yes#No");
		state = 55;
	}
} else if (state == 55) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == 0) state = 56;
		else state = 10;
	}
} else if (state == 56) {
	with (TextboxController) instance_destroy();
	global.battleToastBox = spawnStandardTextbox(formatTextboxString(@"
\m02\c3" + nameDecorator + global.teamMembers[global.gp1].name + @"\c30's specialization was changed to \c3" + specDecorator + specNames[global.gp2] + @"\c30.<@
	"));
	// undo current stance
	var stinfo = global.stanceDb[global.teamMembers[global.gp1].stance];
	if (stinfo[1] != 0) global.teamMembers[global.gp1].att -= global.teamMembers[global.gp1].lv div stinfo[1];
	if (stinfo[2] != 0) global.teamMembers[global.gp1].def -= global.teamMembers[global.gp1].lv div stinfo[2];
	if (stinfo[3] != 0) global.teamMembers[global.gp1].sp_att -= global.teamMembers[global.gp1].lv div stinfo[3];
	if (stinfo[4] != 0) global.teamMembers[global.gp1].sp_def -= global.teamMembers[global.gp1].lv div stinfo[4];
	if (stinfo[5] != 0) global.teamMembers[global.gp1].maxHP -= global.teamMembers[global.gp1].lv div stinfo[5];
	if (stinfo[6] != 0) global.teamMembers[global.gp1].maxPP -= global.teamMembers[global.gp1].lv div stinfo[6];
	global.teamMembers[global.gp1].stance = global.gp2;
	// apply new stance
	stinfo = global.stanceDb[global.teamMembers[global.gp1].stance];
	if (stinfo[1] != 0) global.teamMembers[global.gp1].att += global.teamMembers[global.gp1].lv div stinfo[1];
	if (stinfo[2] != 0) global.teamMembers[global.gp1].def += global.teamMembers[global.gp1].lv div stinfo[2];
	if (stinfo[3] != 0) global.teamMembers[global.gp1].sp_att += global.teamMembers[global.gp1].lv div stinfo[3];
	if (stinfo[4] != 0) global.teamMembers[global.gp1].sp_def += global.teamMembers[global.gp1].lv div stinfo[4];
	if (stinfo[5] != 0) global.teamMembers[global.gp1].maxHP += global.teamMembers[global.gp1].lv div stinfo[5];
	if (stinfo[6] != 0) global.teamMembers[global.gp1].maxPP += global.teamMembers[global.gp1].lv div stinfo[6];
	state = 57;
} else if (state == 57) {
	if (!instance_exists(global.battleToastBox)) state = 10;
}
else if (state == 29) {
	var specId = "m" + global.teamMembers[global.gp1].species;
	curLearnList = global.speciesLearnList[$specId];
	state = 30;
}
else if (state == 40) {
	var specId = "m" + string(global.teamMembers[global.gp1].stance);
	curLearnList = global.specialistLearnList[$specId];
	state = 30;
}
else if (state == 30) {
	var movesStringified = "";
	for (var i=0; i<array_length(curLearnList); i++) {
		var moveId = curLearnList[i][0];
		var move = global.movesDb[moveId];
		var attr = global.teamMembers[global.gp1].lv >= curLearnList[i][1] ? "2" : "5";
		if (array_contains(global.teamMembers[global.gp1].moves, moveId)) attr = "0";
		movesStringified += "#@" + attr + move[0] + " @TD@" + attr + "Lv. " + string(curLearnList[i][1]);
	}
	movesStringified = string_delete(movesStringified, 1, 1);
	with (TextboxController) instance_destroy();
	global.battleToastBox = spawnStandardTextbox("\\f00");
	global.gp0 = spawnChoiceTextbox(movesStringified, 10, 10, 360);
	state = 31;
}
else if (state == 31) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) state = 10;
		else state = 32;
	} else {
		var specId = "m" + global.teamMembers[global.gp1].species;
		global.battleToastBox.textContent = global.movesDb[curLearnList[global.gp0.cursorPos][0]][5];
	}
}
else if (state == 32) {
	var specId = "m" + global.teamMembers[global.gp1].species;
	var moveId = curLearnList[global.lastResult][0];
	if (array_contains(global.teamMembers[global.gp1].moves, moveId)) {
		with (TextboxController) instance_destroy();
		global.battleToastBox = spawnStandardTextbox(formatTextboxString(@"
\m03This move has already been learned by this party member.<@
		"));
		state = 33;
	} else {
		if (global.teamMembers[global.gp1].lv < curLearnList[global.lastResult][1]) {
			with (TextboxController) instance_destroy();
			global.battleToastBox = spawnStandardTextbox(formatTextboxString(@"
\m03This member's level is not high enough to learn this technique.<@
			"));
			state = 33;
		} else {
			// do we need to forget a move?
			if (array_length(global.teamMembers[global.gp1].moves) >= 6) {
				with (TextboxController) instance_destroy();
				global.gp2 = moveId;
				global.battleToastBox = spawnStandardTextbox(formatTextboxString(@"
This member already knows 6 different techniques.
Which move shall be forgotten?\f00
				"));
				state = 34;
			} else {
				with (TextboxController) instance_destroy();
				array_push(global.teamMembers[global.gp1].moves, moveId);
				global.battleToastBox = spawnStandardTextbox(formatTextboxString(@"
\m01\c3" + nameDecorator + global.teamMembers[global.gp1].name + @"\c30 learned \c31" + global.movesDb[moveId][0] + @"\c30!<@
				"));
				state = 33;
			}
		}
	}
}
else if (state == 33) {	
	if (!instance_exists(global.battleToastBox)) state = 30;
}
else if (state == 34) {	
	if (global.battleToastBox.hang) {
		var movesStringified = "";
		for (var i=0; i<6; i++) {
			var moveId = global.teamMembers[global.gp1].moves[i];
			var move = global.movesDb[moveId];
			var attr = "0";
			movesStringified += "#@" + attr + move[0] + " @TD@4" + move[6];
		}
		movesStringified = string_delete(movesStringified, 1, 1);
		spawnChoiceTextbox(movesStringified, 10, 10, 480);
		state = 35;
	}
}
else if (state == 35) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) state = 30;
		else {
			// actually replace move
			var prevMove = global.teamMembers[global.gp1].moves[global.lastResult];
			var newMove = global.gp2;
			global.teamMembers[global.gp1].moves[global.lastResult] = newMove;
			with (TextboxController) instance_destroy();
			global.battleToastBox = spawnStandardTextbox(formatTextboxString(@"
\m01\c3" + nameDecorator + global.teamMembers[global.gp1].name + @"\c30 forgot \c31" + global.movesDb[prevMove][0] + @"\c30 and learned
\c31" + global.movesDb[newMove][0] + @"\c30 instead!<@
			"));
			state = 33;
		}
	}
}

else if (state == 100) {
	global.musicIndex = 3;
	global.musicControl = MUS_PLAY;
	state = 1;
}

else if (state == 200) {
	pause = 30;
	state = 201;
}
else if (state == 201) {
	transitionObj = instance_create(ScreenTransitionController, 0, 0);
	transitionObj.transition_type = TRANSITION_FADETOBLACK;
	global.musicControl = MUS_FADEOUT;
	pause = 80;
	state = 202;
}
else if (state == 202) {
	global.active = true;
	room_goto(OverworldRoom);
}