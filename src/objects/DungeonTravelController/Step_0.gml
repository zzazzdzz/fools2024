function tileFromChunkType(t) {
	if (t == CORRIDOR_X_LR) return 2;
	if (t == CORRIDOR_Y_DU) return 4;
	if (t == TURN_LU) return 3;
	if (t == NULL_CHUNK) return 10;
	if (t == INTERSECT_LUD) return 12;
	if (t == CORRIDOR_Y_UD) return 4;
	if (t == CORRIDOR_Y_DR) return 5;
	if (t == CORRIDOR_Y_UR) return 6;
	if (t == CORRIDOR_Y_LD) return 7;
	if (t == CORRIDOR_Y_LU) return 8;
	if (t == INTERSECT_RUD) return 9;
	if (t == CORRIDOR_KEY) return 11;
	if (t == CORRIDOR_KEY_USED) return 13;
	return 0;
}

if (global.battleResult == BATTLERESULT_LOSE) {
	room_persistent = false;
	var mapData = global.dungeonDb[global.curDungeonId][7];
	if (global.battleKnockOutMap != noone) {
		mapData = global.battleKnockOutMap;	
	}
	global.overworldCurMap = mapData[0];
	global.overworldCurVariant = mapData[1];
	global.overworldSpawnX = mapData[2];
	global.overworldSpawnY = mapData[3];
	global.overworldSpawnFacing = mapData[4];
	global.battleResult = BATTLERESULT_NONE;
	room_goto(OverworldRoom);
	exit;
}

if (!loadScriptExecuted) {
	if (!instance_exists(dutyTitleInst)) {
		var ii = instance_create(ScriptingController, 0, 0);
		ii.payload = global.dungeonData[3];
		loadScriptExecuted = true;
	}
}

function updateWalkAnimations() {
	if (fast_scroll) {
		if (travel) {
			with (OverworldObject) {
				animIndex = "Walk";
				animSpeed = 0.45;
				event_user(0);
			
			}
		} else {
			with (OverworldObject) {
				animIndex = "Idle";
				animSpeed = 1.3;
				event_user(0);
			}
		}	
	} else {
		if (travel) {
			with (OverworldObject) {
				animIndex = "Walk";
				animSpeed = 1;
				event_user(0);
			
			}
		} else {
			with (OverworldObject) {
				animIndex = "Idle";
				animSpeed = 1.3;
				event_user(0);
			}
		}
	}
}

if (!locked) {
	if (keyboard_check(global.keybinds[1])) fast_scroll = true;
	else fast_scroll = false;
	if (!travel) fast_scroll = false;
} else {
	fast_scroll = false;
}

if (fast_scroll != fast_scroll_toggle) {
	if (fast_scroll) {
		//audio_sound_pitch(bgMusicAsset, 1.25);
	} else {
		//audio_sound_pitch(bgMusicAsset, 1);
	}
	updateWalkAnimations();
	fast_scroll_toggle = fast_scroll;
}

var scroll_adv = 3;
if (fast_scroll) scroll_adv = 9;
	
if (chunk_script != noone) script_execute(chunk_script);
	
if (travel) {
	if (travel != travel_toggle) {
		updateWalkAnimations();
		travel_toggle = travel;
	}
	
	if (chunk_queue[0][0] == CORRIDOR_X_LR || chunk_queue[0][0] == INTERSECT_RUD) {
		scrollX += scroll_adv;	
		with (OverworldObject) if (isHero) facing = 2;
	}
	if (chunk_queue[0][0] == TURN_LU) {
		scrollY -= scroll_adv;	
		with (OverworldObject) if (isHero) facing = 4;
	}
	if (chunk_queue[0][0] == CORRIDOR_Y_DU || chunk_queue[0][0] == CORRIDOR_Y_LU) {
		scrollY -= scroll_adv;	
		with (OverworldObject) if (isHero) facing = 4;
	}
	if (chunk_queue[0][0] == CORRIDOR_Y_UD || chunk_queue[0][0] == CORRIDOR_Y_LD) {
		scrollY += scroll_adv;	
		with (OverworldObject) if (isHero) facing = 0;
	}
	if (chunk_queue[0][0] == INTERSECT_LUD) {
		if (chunk_mem[1] == 1) {
			scrollY -= scroll_adv;	
			with (OverworldObject) if (isHero) facing = 4;
		} else if (chunk_mem[1] == 2) {
			scrollY += scroll_adv;	
			with (OverworldObject) if (isHero) facing = 0;
		}
	}
	if (chunk_queue[0][0] == CORRIDOR_KEY || chunk_queue[0][0] == CORRIDOR_KEY_USED) {
		if (chunk_mem[1] == 1) {
			scrollY -= scroll_adv;	
			with (OverworldObject) if (isHero) facing = 4;
		} else if (chunk_mem[1] == 2) {
			scrollX += scroll_adv;	
			with (OverworldObject) if (isHero) facing = 2;
		}
	}
	if (chunk_queue[0][0] == CORRIDOR_Y_DR) {
		scrollX += scroll_adv;	
		with (OverworldObject) if (isHero) facing = 2;
	}
	if (chunk_queue[0][0] == CORRIDOR_Y_UR) {
		scrollX += scroll_adv;	
		with (OverworldObject) if (isHero) facing = 2;
	}
	if (scrollX >= 15*48 || scrollY >= 17*48 || scrollX <= -11*48 || scrollY <= -11*48) {
		array_delete(chunk_queue, 0, 1);
		array_delete(chunk_scripts, 0, 1);
		chunk_index += 1;
		
		var oo = instance_find(OverworldObject, 0);
		if (oo.facing == FACING_U) {
			chunkMapY -= 1;	
		}
		if (oo.facing == FACING_D) {
			chunkMapY += 1;	
		}
		if (oo.facing == FACING_L) {
			chunkMapX -= 1;	
		}
		if (oo.facing == FACING_R) {
			chunkMapX += 1;	
		}
		array_push(global.dungeonCurrentDiscoveredTiles, [chunkMapX, chunkMapY, tileFromChunkType(chunk_queue[0][0])]);
		updateDiscoveredDungeonTiles();
		
		event_user(2);
	}
}

if (pause > 0) {
	pause -= 1;
	exit;
}

if (ds_queue_size(events)) {
	var evt_info = ds_queue_head(events);
	var deq = true;
	if (evt_info[0] == "msg") {
		global.battleToastBox = spawnToastTextbox(evt_info[1]);
	}
	if (evt_info[0] == "snd") {
		audio_play_sound(evt_info[1], 0, 0);
	}
	if (evt_info[0] == "sndstop") {
		audio_stop_all();
	}
	if (evt_info[0] == "nomsg") {
		with (global.battleToastBox) instance_destroy();
	}
	if (evt_info[0] == "wait") {
		pause = evt_info[1];
	}
	if (evt_info[0] == "lore_msg") {
		global.battleToastBox = spawnStandardTextbox(evt_info[1], evt_info[2]);
	}
	if (evt_info[0] == "wait_msg") {
		if (instance_exists(global.battleToastBox)) {
			deq = false;
		}
	}
	if (evt_info[0] == "lock") {
		locked = true;
	}
	if (evt_info[0] == "unlock") {
		locked = false;
	}
	if (evt_info[0] == "stop") {
		travel = false;
		updateWalkAnimations();
	}
	if (evt_info[0] == "look_towards") {
		with (OverworldObject) {
			facing = (floor((point_direction(x, y, evt_info[1], evt_info[2]) + 22.5) / 45) + 2) % 8;
		}
	}
	if (evt_info[0] == "go") {
		travel = true;
		updateWalkAnimations();
	}
	if (deq) ds_queue_dequeue(events);
}