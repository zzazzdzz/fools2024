function basicChunkScripts() {}

function chunkScriptCorridorNull() {}

function chunkScriptTestLore1(ii) {
	if (chunk_mem[0] == 0 && scrollX > 5*48) {
		ds_queue_enqueue(events, ["lock"]);
		ds_queue_enqueue(events, ["stop"]);
		ds_queue_enqueue(events, ["lore_msg", "Hey! I like bepis.< ", [Portrait1000, 0]]);
		ds_queue_enqueue(events, ["wait_msg"]);
		ds_queue_enqueue(events, ["wait", 30]);
		ds_queue_enqueue(events, ["go"]);
		ds_queue_enqueue(events, ["unlock"]);
		chunk_mem[0] = 1;
	}
}

function exampleLoreScript() {
	ds_queue_enqueue(events, ["lore_msg", "Hey guys I think it's time to bepis<@", [Portrait1000, 0]]);
	ds_queue_enqueue(events, ["wait_msg"]);
	ds_queue_enqueue(events, ["wait", 20]);
	chunk_mem[0] = 4;
}

function chunkScriptSharedPickup(type) {
	if (chunk_mem[0] == 3) {
		if (chunk_queue[0][1] < 0) {
			if (type == 0) instance_destroy(global.encounterSprites[0]);
			sound_play(FightSFXPickMoney);
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Picked up " + string(-chunk_queue[0][1]) + @"\c50x\c30.<@
			"), noone);
			global.money += -chunk_queue[0][1];
			global.eventFlags[chunk_queue[0][4]] = 1;
			chunk_mem[0] = 4;
		} else {
			// item
			if (type == 0) {
				global.gp0 = spawnStandardTextbox(formatTextboxString(@"
The \c31" + global.itemDb[chunk_queue[0][1]][0] + @"\c30 is laying on the ground.
Who should pick up the item?\f00
				"), noone);
			} else if (type == 1) {
				global.gp0 = spawnStandardTextbox(formatTextboxString(@"
The chest contained a \c31" + global.itemDb[chunk_queue[0][1]][0] + @"\c30!
Who should pick up the item?\f00
				"), noone);
			}
			chunk_mem[0] = 10;
		}
	}
	else if (chunk_mem[0] == 4) {
		if (!instance_exists(global.gp0)) {
			chunk_mem[0] = 5;
		}
	}
	else if (chunk_mem[0] == 5) {
		ds_queue_enqueue(events, ["wait", 60]);
		ds_queue_enqueue(events, ["go"]);
		ds_queue_enqueue(events, ["unlock"]);
		chunk_mem[0] = 8;
	}
	else if (chunk_mem[0] == 10) {
		if (global.gp0.hang) {
			var attr = "3";
			if (array_length(global.teamMembers[0].items) >= INV_NUM_MAX) attr = "4";
			var st = "@" + attr + global.teamMembers[0].name;
			for (var i=1; i<array_length(global.teamMembers); i++) {
				attr = "6";
				if (array_length(global.teamMembers[i].items) >= INV_NUM_MAX) attr = "4";
				st += "#@" + attr + global.teamMembers[i].name;
			}
			st += "#@0Abandon item";
			global.gp0 = spawnChoiceTextbox(st);
			global.gp0.closeOnConfirm = false;
			global.gp0.muteChoiceSound = true;
			global.gp0.quitStatusAllowed = false;
			chunk_mem[0] = 11;
		}
	}
	else if (chunk_mem[0] == 11) {
		if (global.lastResult != RESULT_NONE) {
			if (global.lastResult < array_length(global.teamMembers)) {
				if (array_length(global.teamMembers[global.lastResult].items) >= INV_NUM_MAX) {
					ratelimitedUIWrongSound();
					global.lastResult = RESULT_NONE;
				} else {
					scriptingCloseAllText();
					if (type == 0) instance_destroy(global.encounterSprites[0]);
					audio_play_sound(FightSFXPickItem, 1, 0);
					array_push(global.teamMembers[global.lastResult].items, chunk_queue[0][1]);
					global.gp0 = spawnStandardTextbox(formatTextboxString(@"
	{TEAM" + string(global.lastResult) + @"} picked up the \c31" + global.itemDb[chunk_queue[0][1]][0] + @"\c30.<@
					"));
					global.eventFlags[chunk_queue[0][4]] = 1;
					chunk_mem[0] = 4;
				}
			} else {
				scriptingCloseAllText();
				if (type == 0) instance_destroy(global.encounterSprites[0]);
				global.gp0 = spawnStandardTextbox(formatTextboxString(@"
The \c31" + global.itemDb[chunk_queue[0][1]][0] + @"\c30 was pushed aside and abandoned.<@
				"));
				chunk_mem[0] = 4;
			}
		}
	}
}

function chunkScriptPostTreasureChest() {
	for (var i=0; i<array_length(global.encounterSprites); i++) {
		if (instance_exists(global.encounterSprites[i])) {
			var n = 670+48-7-scrollX;
			if (n > global.encounterSprites[i].x) {
				global.encounterSprites[i].x -= fast_scroll ? 6 : 3;
			} else {
				global.encounterSprites[i].x = n;
			}
			if (global.encounterSprites[i].x < 60) instance_destroy(global.encounterSprites[i]);
		}
	}
}

function chunkScriptTreasureChest() {
	if (chunk_mem[0] == 8) {
		for (var i=0; i<array_length(global.encounterSprites); i++) {
			global.encounterSprites[i].x = 670+48-7-scrollX;
			//if (global.encounterSprites[i].animTargetSteps > 0) ok = false;
		}
	}
	else if (chunk_mem[0] == 0) {
		if (global.eventFlags[chunk_queue[0][4]]) {
			return;
		}
		global.encounterSprites = [];
		var ii = instance_create(OverworldStaticObject, 664+48-7, 155);
		ii.img = ItemSprites;
		ii.subimg = 2;
		array_push(global.encounterSprites, ii);
		chunk_mem[0] = 1;
	}
	else if (chunk_mem[0] == 233) {
		ds_queue_enqueue(events, ["wait", 20]);
		ds_queue_enqueue(events, ["go"]);
		ds_queue_enqueue(events, ["unlock"]);
		chunk_mem[0] = 8;
	}
	else if (chunk_mem[0] == 1) {
		for (var i=0; i<array_length(global.encounterSprites); i++) {
			global.encounterSprites[i].x = 664+48-7-scrollX;
			//if (global.encounterSprites[i].animTargetSteps > 0) ok = false;
		}
		if (scrollX > 6*48+56+24) locked = true;
		if (scrollX > 7*48+56) {
			ds_queue_enqueue(events, ["lock"]);
			ds_queue_enqueue(events, ["stop"]);
			ds_queue_enqueue(events, ["look_towards", 320, 0]);
			chunk_mem[0] = 2;
		}
	}
	else if (chunk_mem[0] == 2) {
		var r = script_execute(chunk_queue[0][2]);
		if (r > 0) chunk_mem[0] = 100;
	}
	else if (chunk_mem[0] == 100) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
You find a treasure chest.
Should you try your luck?\f00
		"), noone);
		chunk_mem[0] = 101;
	}
	else if (chunk_mem[0] == 101) {
		if (global.gp0.hang) {
			global.gp0 = spawnChoiceTextbox("Open the chest.#Leave it be.");
			global.gp0.quitStatusAllowed = false;
			chunk_mem[0] = 102;
		}
	}
	else if (chunk_mem[0] == 102) {
		if (global.lastResult != RESULT_NONE) {
			scriptingCloseAllText();
			if (global.lastResult == 1) {
				chunk_mem[0] = 233;
			} else {
				chunk_mem[2] = 15;
				chunk_mem[0] = 103;
			}
		}
	}
	else if (chunk_mem[0] == 103) {
		chunk_mem[2] -= 1;
		if (chunk_mem[2] <= 0) chunk_mem[0] = 104;
	}
	else if (chunk_mem[0] == 104) {
		sound_play(OpenChestSound);
		global.encounterSprites[0].subimg = 3;
		chunk_mem[2] = 40;
		chunk_mem[0] = 105;
	}
	else if (chunk_mem[0] == 105) {
		chunk_mem[2] -= 1;
		if (chunk_mem[2] <= 0) chunk_mem[0] = 3;
	}
	else {
		if (is_array(chunk_queue[0][3])) chunkScriptChestEncounter();
		else chunkScriptSharedPickup(1);
	}
}

function chunkScriptGenericTreasure() {
	if (chunk_mem[0] == 0) {
		if (global.eventFlags[chunk_queue[0][4]]) {
			return;
		}
		global.encounterSprites = [];
		var ii = instance_create(OverworldStaticObject, 700, 240);
		ii.img = ItemSprites;
		ii.subimg = chunk_queue[0][3];
		array_push(global.encounterSprites, ii);
		chunk_mem[0] = 1;
	}
	else if (chunk_mem[0] == 1) {
		for (var i=0; i<array_length(global.encounterSprites); i++) {
			global.encounterSprites[i].x = 700-scrollX;
			//if (global.encounterSprites[i].animTargetSteps > 0) ok = false;
		}
		if (scrollX > 5*48+35+24) locked = true;
		if (scrollX > 6*48+35) {
			ds_queue_enqueue(events, ["lock"]);
			ds_queue_enqueue(events, ["stop"]);
			chunk_mem[0] = 2;
		}
	}
	else if (chunk_mem[0] == 2) {
		var r = script_execute(chunk_queue[0][2]);
		if (r > 0) chunk_mem[0] = 3;
	}
	else chunkScriptSharedPickup(0);
}

function chunkScriptChestEncounter() {
	if (chunk_mem[0] == 3) {
		sound_play(SFXGeneral13);
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_FADETOWHITE;
		chunk_mem[0] = 300;
	}
	else if (chunk_mem[0] == 300) {
		if (global.gp0.done) chunk_mem[0] = 301;	
	}
	else if (chunk_mem[0] == 301) {
		instance_destroy(global.gp0);
		var newSprite = instance_create(OverworldObject, global.encounterSprites[0].x, global.encounterSprites[0].y);
		newSprite.facing = FACING_D;
		newSprite.animSpriteSetIndex = chunk_queue[0][3][0];
		if (is_array(newSprite.animSpriteSetIndex)) newSprite.animSpriteSetIndex = newSprite.animSpriteSetIndex[0];
		newSprite.onInteract = noone;
		with (newSprite) event_user(1);
		instance_destroy(global.encounterSprites[0]);
		global.encounterSprites[0] = newSprite;
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_FADEFROMWHITE;
		chunk_mem[0] = 302;
	}
	else if (chunk_mem[0] == 302) {
		chunk_mem[1] = 60;
		chunk_mem[0] = 303;
	}
	else if (chunk_mem[0] == 303) {
		chunk_mem[1] -= 1;
		if (chunk_mem[1] == 0) chunk_mem[0] = 304;
	}
	else if (chunk_mem[0] == 304) {
		var n = "Bepis";
		var nn = chunk_queue[0][3][0];
		if (is_array(nn)) nn = nn[0];
		if (struct_exists(global.speciesNames, "m"+nn)) {
			n = global.speciesNames[$ ("m"+nn)];
		}
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
It was a trap!
You are attacked by a wild \c32" + n + @"\c30!<@
		"), noone);
		chunk_mem[0] = 305;
	}
	else if (chunk_mem[0] == 305) {
		if (scriptingWaitForTextInGP0() == SCRIPT_CONTINUE_ADVANCETICK) {
			chunk_mem[1] = 30; chunk_mem[0] = 306;	
		}
	}
	else if (chunk_mem[0] == 306) {
		chunk_mem[1] -= 1;
		if (chunk_mem[1] == 0) chunk_mem[0] = 307;
	}
	else if (chunk_mem[0] == 307) {
		chunk_mem[1] = instance_create(ScreenTransitionController, 0, 0);
		chunk_mem[1].transition_type = TRANSITION_SQUARES_IN;
		audio_play_sound(GenericEncounterSound, 1, 0);
		ds_queue_enqueue(events, ["wait", 50]);
		ds_queue_enqueue(events, ["wait", 1]);
		chunk_mem[0] = 308;
	}
	else if (chunk_mem[0] == 308) {
		if (ds_queue_size(events) <= 0) {
			room_persistent = true;
			var opponentData = global.dungeonData[2][chunk_queue[0][3][1]];
			global.battleAdversaryScript = opponentData.scripts;
			global.battleInitData = opponentData.adversaries;
			global.tileMap = opponentData.tilemap;
			global.battleType = BATTLETYPE_DUNGEON;
			global.battleLog = [];
			room_goto(BattleRoom);
			chunk_mem[0] = 309;
		}
	}
	else if (chunk_mem[0] == 309) {
		if (global.battleResult == BATTLERESULT_LOSE) return;
		global.eventFlags[chunk_queue[0][4]] = 1;
		with (chunk_mem[1]) instance_destroy();
		for (var i=0; i<array_length(global.encounterSprites); i++) {
			with (global.encounterSprites[i]) hidden = true;
		}
		room_persistent = false;
		var o = instance_create(ScreenTransitionController, 0, 0);
		o.transition_type = TRANSITION_FADEFROMBLACK;
		ds_queue_enqueue(events, ["wait", 60]);
		ds_queue_enqueue(events, ["go"]);
		ds_queue_enqueue(events, ["unlock"]);
		chunk_mem[0] = 8;
	}
}

function chunkScriptEncounter() {
	if (chunk_mem[0] == 0) {
		var numMembers = array_length(chunk_queue[0][1]);
		var start = (50*(numMembers-1))/2;
		var step = 50;
		global.encounterSprites = [];
		for (var i=0; i<numMembers; i++) {
			var ii = instance_create(OverworldObject, 700, 240);
			ii.animSpriteSetIndex = chunk_queue[0][1][i];
			ii.facing = 6;
			ii.onInteract = noone;
			ii.y = 240-start+i*step;
			with (ii) event_user(1);
			array_push(global.encounterSprites, ii);
		}
		chunk_mem[0] = 1;
	}
	else if (chunk_mem[0] == 1) {
		for (var i=0; i<array_length(global.encounterSprites); i++) {
			global.encounterSprites[i].x = 700-scrollX;
			//if (global.encounterSprites[i].animTargetSteps > 0) ok = false;
		}
		if (scrollX > 5*48+24) locked = true;
		if (scrollX > 6*48) {
			ds_queue_enqueue(events, ["lock"]);
			ds_queue_enqueue(events, ["stop"]);
			chunk_mem[0] = 2;
		}
		/*
		ii.animTargetX = 400;
		ii.animTargetY = 240;
		ii.animTargetSteps = 100;
		with (ii) event_user(2);
		chunk_mem[0] = 2;
		global.encounterSprites = [ii];
		*/
	}
	else if (chunk_mem[0] == 2) {
		script_execute(chunk_queue[0][3]);
	}
	else if (chunk_mem[0] == 3) chunk_mem[0] = 4;
	else if (chunk_mem[0] == 4) {
		if (ds_queue_size(events) <= 0) chunk_mem[0] = 5;
	}
	else if (chunk_mem[0] == 5) {
		chunk_mem[1] = instance_create(ScreenTransitionController, 0, 0);
		chunk_mem[1].transition_type = TRANSITION_SQUARES_IN;
		audio_play_sound(GenericEncounterSound, 1, 0);
		ds_queue_enqueue(events, ["wait", 50]);
		ds_queue_enqueue(events, ["wait", 1]);
		chunk_mem[0] = 6;
	}
	else if (chunk_mem[0] == 6) {
		if (ds_queue_size(events) <= 0) {
			room_persistent = true;
			var opponentData = global.dungeonData[2][chunk_queue[0][2]];
			global.battleAdversaryScript = opponentData.scripts;
			global.battleInitData = opponentData.adversaries;
			global.tileMap = opponentData.tilemap;
			global.battleType = BATTLETYPE_DUNGEON;
			global.battleLog = [];
			room_goto(BattleRoom);
			chunk_mem[0] = 7;
		}
	}
	else if (chunk_mem[0] == 7) {
		if (global.battleResult == BATTLERESULT_LOSE) return;
		with (chunk_mem[1]) instance_destroy();
		for (var i=0; i<array_length(global.encounterSprites); i++) {
			with (global.encounterSprites[i]) instance_destroy();
		}
		room_persistent = false;
		var o = instance_create(ScreenTransitionController, 0, 0);
		o.transition_type = TRANSITION_FADEFROMBLACK;
		ds_queue_enqueue(events, ["wait", 60]);
		ds_queue_enqueue(events, ["go"]);
		ds_queue_enqueue(events, ["unlock"]);
		chunk_mem[0] = 8;
	}
}

function chunkScriptGenericIntersection() {
	if (chunk_mem[0] == 0) {
		global.battleToastBox = noone;
		ds_queue_enqueue(events, ["lock"]);
		ds_queue_enqueue(events, ["stop"]);
		ds_queue_enqueue(events, ["look_towards", 315, 235]);
		ds_queue_enqueue(events, ["wait", 20]);
		var lore = script_execute(chunk_queue[0][1]);
		ds_queue_enqueue(events, ["lore_msg", lore[0], lore[1]]);
		chunk_mem[0] += 1;
	} else if (chunk_mem[0] == 1) {
		if (instance_exists(global.battleToastBox)) {
			if (global.battleToastBox.hang) {
				global.lastResult = RESULT_NONE;
				var t = spawnChoiceTextbox("Go up.#Go down.");
				t.quitStatusAllowed = false;
				chunk_mem[0] += 1;
			}
		}
	} else if (chunk_mem[0] == 2) {
		if (global.lastResult != RESULT_NONE) {
			if (instance_exists(global.battleToastBox)) instance_destroy(global.battleToastBox);
			// check which path to take
			global.dungeonDataOffset = global.dungeonData[0][global.dungeonDataOffset*2 + 1][global.lastResult];
			chunk_queue = global.dungeonData[0][global.dungeonDataOffset*2];
			chunk_scripts = global.dungeonData[1][global.dungeonDataOffset];
			event_user(2);
			ds_queue_enqueue(events, ["wait", 30]);
			ds_queue_enqueue(events, ["go"]);
			ds_queue_enqueue(events, ["unlock"]);
			chunk_mem[1] = global.lastResult + 1;
			chunk_mem[0] += 1;
		}
	}
}

function chunkScriptCoalesce() {
	if (chunk_mem[0] == 0) {
		global.dungeonDataOffset = global.dungeonData[0][global.dungeonDataOffset*2 + 1][0];
		chunk_queue = global.dungeonData[0][global.dungeonDataOffset*2];
		chunk_scripts = global.dungeonData[1][global.dungeonDataOffset];
		event_user(2);
		chunk_mem[0] = 1;
	}
}

function chunkScriptEndWarpToArea() {
	if (chunk_mem[0] == 0) {
		ds_queue_enqueue(events, ["lock"]);
		ds_queue_enqueue(events, ["stop"]);
		var o = instance_create(ScreenTransitionController, 0, 0);
		o.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
		chunk_mem[0] = 1;
		chunk_mem[1] = 100;
	}
	if (chunk_mem[0] == 1) {
		chunk_mem[1] -= 1;
		if (chunk_mem[1] <= 0) chunk_mem[0] = 2;
	}
	if (chunk_mem[0] == 2) {
		room_goto(OverworldRoom);
	}
}

function chunkScriptEndLastOuting() {
	if (chunk_mem[0] == 0) {
		ds_queue_enqueue(events, ["lock"]);
		ds_queue_enqueue(events, ["stop"]);
		var o = instance_create(ScreenTransitionController, 0, 0);
		o.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
		chunk_mem[0] = 1;
		chunk_mem[1] = 70;
	}
	if (chunk_mem[0] == 1) {
		chunk_mem[1] -= 1;
		if (chunk_mem[1] <= 0) chunk_mem[0] = 2;
	}
	if (chunk_mem[0] == 2) {
		global.battleStats[3][2] = true;
		room_goto(LastOutingRoom);
	}
}

function chunkScriptDummyOnLoad() {
	if (tick == 0) {
		with (DungeonTravelController) {
			ds_queue_enqueue(events, ["go"]);
			ds_queue_enqueue(events, ["unlock"]);
		}
		return SCRIPT_CONTINUE_ADVANCETICK;
	}
	return SCRIPT_STOP;
}

function chunkScriptDummyLoreText() {
	return ["Bepis lore function\\f00", [ASSET_PARTNER_PORTRAIT, 0]];	
}

function chunkScriptBasicRandomEvent() {
	// to.do (this might get shelved if there isn't enough time)
	// update: it did
}

function chunkScriptKeyChamber() {
	if (chunk_mem[0] == 0) {
		global.battleToastBox = noone;
		ds_queue_enqueue(events, ["lock"]);
		ds_queue_enqueue(events, ["stop"]);
		ds_queue_enqueue(events, ["look_towards", 320, 0]);
		ds_queue_enqueue(events, ["wait", 20]);
		ds_queue_enqueue(events, ["lore_msg", "You come across a locked chamber!\\f00", noone]);
		chunk_mem[0] += 1;
	} else if (chunk_mem[0] == 1) {
		if (instance_exists(global.battleToastBox)) {
			if (global.battleToastBox.hang) {
				global.lastResult = RESULT_NONE;
				var unlockable = false;
				for (var i=0; i<array_length(global.teamMembers); i++) {
					if (array_contains(global.teamMembers[i].items, 6)) unlockable = true;
				}
				var t;
				if (unlockable) t = spawnChoiceTextbox("Try to unlock it.#Leave it be.");
				else t = spawnChoiceTextbox("@7Try to unlock it.@0#Leave it be.");
				t.quitStatusAllowed = false;
				t.closeOnConfirm = false;
				chunk_mem[0] += 1;
			}
		}
	} else if (chunk_mem[0] == 2) {
		if (global.lastResult != RESULT_NONE) {
			if (global.lastResult == 1) {
				scriptingCloseAllText();
				global.dungeonDataOffset = global.dungeonData[0][global.dungeonDataOffset*2 + 1][1];
				chunk_queue = global.dungeonData[0][global.dungeonDataOffset*2];
				chunk_scripts = global.dungeonData[1][global.dungeonDataOffset];
				event_user(2);
				ds_queue_enqueue(events, ["wait", 30]);
				ds_queue_enqueue(events, ["go"]);
				ds_queue_enqueue(events, ["unlock"]);
				chunk_mem[1] = 2;
				chunk_mem[0] = 100;
			} else {
				var unlockable = false;
				for (var i=0; i<array_length(global.teamMembers); i++) {
					for (var j=0; j<array_length(global.teamMembers[i].items); j++) {
						if (global.teamMembers[i].items[j] == 6) {
							unlockable = true;
							array_delete(global.teamMembers[i].items, j, 1);
						}
					}
					if (unlockable) break;
				}
				if (!unlockable) {
					ratelimitedUIWrongSound();
					global.lastResult = RESULT_NONE;
				} else {
					scriptingCloseAllText();
					global.keyDoorUnlocked = true;
					chunk_mem[2] = 40;
					chunk_mem[0] = 3;
				}
			}
		}
	} else if (chunk_mem[0] == 3) {
		chunk_mem[2] -= 1;
		if (chunk_mem[2] <= 0) chunk_mem[0] = 4;
	} else if (chunk_mem[0] == 4) {
		sound_play(KeyChamberUnlockSound);
		instance_create(DungeonPartOpeningKeyDoor, 7*48 - scrollX, 5*48 - scrollY);
		chunk_mem[0] = 5;
		chunk_mem[2] = 20;
	} else if (chunk_mem[0] == 5) {
		chunk_mem[2] -= 1;
		if (chunk_mem[2] <= 0) chunk_mem[0] = 6;
	} else if (chunk_mem[0] == 6) {
		event_user(2);
		sound_play(KeyChamberOpenSound);
		chunk_mem[0] = 7;
		chunk_mem[2] = 55;
	} else if (chunk_mem[0] == 7) {
		chunk_mem[2] -= 1;
		if (chunk_mem[2] <= 0) chunk_mem[0] = 8;
	} else if (chunk_mem[0] == 8) {
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_FADETOWHITE;
		chunk_mem[0] = 9;
	} else if (chunk_mem[0] == 9) {
		if (global.gp0.done) {
			global.dungeonDataOffset = global.dungeonData[0][global.dungeonDataOffset*2 + 1][0];
			chunk_queue = global.dungeonData[0][global.dungeonDataOffset*2];
			chunk_scripts = global.dungeonData[1][global.dungeonDataOffset];
			event_user(2);
			instance_destroy(global.gp0);
			global.gp0 = instance_create(ScreenTransitionController, 0, 0);
			global.gp0.transition_type = TRANSITION_FADEFROMWHITE;
			chunk_mem[0] = 10;
			chunk_mem[2] = 45;
		}
	} else if (chunk_mem[0] == 10) {
		chunk_mem[2] -= 1;
		if (chunk_mem[2] <= 0) chunk_mem[0] = 11;
	} else if (chunk_mem[0] == 11) {
		ds_queue_enqueue(events, ["lore_msg", "\\m0eThe closed corridor was opened!<@", noone]);
		ds_queue_enqueue(events, ["wait_msg"]);
		ds_queue_enqueue(events, ["wait", 30]);
		ds_queue_enqueue(events, ["go"]);
		ds_queue_enqueue(events, ["unlock"]);
		chunk_mem[1] = 1;
		chunk_mem[0] = 12;
	}
}