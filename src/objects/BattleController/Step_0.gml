if (pause > 0) {
	pause -= 1;
	exit;
}

if (animating) {
	queuePeakSize = max(ds_queue_size(animations), queuePeakSize);
	if (queuePeakSize > 6) ffwdPermit = true;
	// can be fast forwarded
	if (keyboard_check(vk_space)) {
		if (ffwdPermit) {
			ffwd = true;	
		} else {
			ffwd = false;	
		}
	} else {
		ffwd = false;	
	}
} else {
	queuePeakSize = 0;
	ffwd = false;	
	ffwdPermit = false;
}

if (turnState == 12 || turnState == 13 || turnState == 14 || turnState == 15) {
	if (keyboard_check(vk_space)) {
		ffwd = true;
	} else {
		ffwd = false;
	}
}

if (ffwd != ffwdPrevious) {
	if (ffwd) {
		// start ffwd	
		game_set_speed(180, gamespeed_fps);
		sound_play(UIFastForward);
		room_speed = 180;
	} else {
		// stop ffwd
		game_set_speed(60, gamespeed_fps);
		room_speed = 60;
	}
}
ffwdPrevious = ffwd;

if (animating) {
	if (ds_queue_size(animations)) {
		var anim_info = ds_queue_head(animations);
		var deq = true;
		if (anim_info[0] == "msg") {
			global.battleToastBox = spawnToastTextbox(anim_info[1]);
			array_push(global.battleLog, anim_info[1]);
		}
		if (anim_info[0] == "snd") {
			audio_play_sound(anim_info[1], 0, 0);
		}
		if (anim_info[0] == "fadetowhite") {
			with (ScreenTransitionController) instance_destroy();
			var oo  = instance_create(ScreenTransitionController, 0, 0);
			oo.transition_type = TRANSITION_FADETOWHITE;
		}
		if (anim_info[0] == "fadefromwhite") {
			with (ScreenTransitionController) instance_destroy();
			var oo  = instance_create(ScreenTransitionController, 0, 0);
			oo.transition_type = TRANSITION_FADEFROMWHITE;
		}
		if (anim_info[0] == "call") {
			script_execute(anim_info[1]);
		}
		if (anim_info[0] == "callarg") {
			script_execute(anim_info[1], anim_info[2]);
		}
		if (anim_info[0] == "sndstop") {
			audio_stop_all();
		}
		if (anim_info[0] == "nomsg") {
			with (global.battleToastBox) instance_destroy();
		}
		if (anim_info[0] == "wait") {
			pause = anim_info[1];
		}
		if (anim_info[0] == "spawn") {
			instance_create(anim_info[1], anim_info[2], anim_info[3]);
		}
		if (anim_info[0] == "anim") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.animIndex = anim_info[2];
			obj.animIsLooping = anim_info[3];
			with (obj) event_user(0);
		}
		if (anim_info[0] == "animpart_member") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			var ii = instance_create(BattleAnimationPart, obj.x, obj.y);
			ii.animAsset = anim_info[2];
			ii.animSpeed = anim_info[3];
			if (array_length(anim_info) > 4) ii.animRenderColor = anim_info[4];
		}
		if (anim_info[0] == "animpart_coord") {
			var ii = instance_create(BattleAnimationPart, anim_info[1][0], anim_info[1][1]);
			ii.animAsset = anim_info[2];
			ii.animSpeed = anim_info[3];
			if (array_length(anim_info) > 4) ii.animRenderColor = anim_info[4];
		}
		if (anim_info[0] == "hide") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.hidden = true;
			obj.x = -999;
			obj.y = -999;
		}
		if (anim_info[0] == "show") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.hidden = false;
		}
		if (anim_info[0] == "blink") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.blink = true;
		}
		if (anim_info[0] == "unblink") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.blink = true;
		}
		if (anim_info[0] == "rmmarkers") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			if (obj == BattleObject) {
				with (BattleObject) markersClear = true;
			} else {
				obj.markersClear = true;
			}
		}
		if (anim_info[0] == "rmmarkers_all") {
			with (BattleObject) markersClear = true;
		}
		if (anim_info[0] == "anim_movetarget") {
			var obj = anim_info[1];
			var dist = anim_info[2];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			global.battleCurrentObjX = obj.x;
			global.battleCurrentObjY = obj.y;
			var target = global.battleTargetObj;
			obj.animTargetX = target.x;
			obj.animTargetY = target.y;
			if (obj.facing == 0) {
				obj.animTargetY -= anim_info[2];
			}
			if (obj.facing == 2) {
				obj.animTargetX -= anim_info[2];
			}
			if (obj.facing == 4) {
				obj.animTargetY += anim_info[2];
			}
			if (obj.facing == 6) {
				obj.animTargetX += anim_info[2];
			}
			if (obj.facing == 1) {
				obj.animTargetX -= anim_info[2] / sqrt(2);
				obj.animTargetY -= anim_info[2] / sqrt(2);
			}
			if (obj.facing == 3) {
				obj.animTargetX -= anim_info[2] / sqrt(2);
				obj.animTargetY += anim_info[2] / sqrt(2);
			}
			if (obj.facing == 5) {
				obj.animTargetX += anim_info[2] / sqrt(2);
				obj.animTargetY += anim_info[2] / sqrt(2);
			}
			if (obj.facing == 7) {
				obj.animTargetX += anim_info[2] / sqrt(2);
				obj.animTargetY -= anim_info[2] / sqrt(2);
			}
			obj.animTargetSteps = 10;
			with (obj) event_user(2);
			pause = 10;
		}
		if (anim_info[0] == "anim_moverestore") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.animTargetX = global.battleCurrentObjX;
			obj.animTargetY = global.battleCurrentObjY;
			obj.animTargetSteps = 10;
			with (obj) event_user(2);
			pause = 10;
		}
		if (anim_info[0] == "anim_movepoint") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.animTargetX = anim_info[2];
			obj.animTargetY = anim_info[3];
			obj.animTargetSteps = anim_info[4];
			with (obj) event_user(2);
			pause = anim_info[4];
		}
		if (anim_info[0] == "anim_noidle") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.animIdleAfterEndFrame = 0;
		}
		if (anim_info[0] == "anim_enableidle") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.animIdleAfterEndFrame = 1;
		}
		if (anim_info[0] == "anim_faceenemy") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.facing = (floor((point_direction(obj.x, obj.y, global.battleTargetObj.x, global.battleTargetObj.y) + 22.5) / 45) + 2) % 8;
		}
		if (anim_info[0] == "anim_facerandom") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.facing = irandom(64) % 8;
		}
		if (anim_info[0] == "anim_setfacing") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.facing = anim_info[2];
		}
		if (anim_info[0] == "anim_facepoint") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.facing = (floor((point_direction(obj.x, obj.y, anim_info[2], anim_info[3]) + 22.5) / 45) + 2) % 8;
		}
		if (anim_info[0] == "anim_savefacing") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			savedFacing = obj.facing;
		}
		if (anim_info[0] == "anim_restorefacing") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.facing = savedFacing;
		}
		if (anim_info[0] == "anim_spin") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.spinAnim = 8;
		}
		if (anim_info[0] == "anim_facenearestenemy") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			var en = nearestEnemy();
			obj.facing = (floor((point_direction(obj.x, obj.y, en.x, en.y) + 22.5) / 45) + 2) % 8;
		}
		if (anim_info[0] == "anim_facing") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.facing = anim_info[2];
		}
		if (anim_info[0] == "revive") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			obj.curHP = obj.maxHP div 2;
		}
		if (anim_info[0] == "cleanse") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			var newEffs = [];
			for (var i=0; i<array_length(obj.effects); i++) {
				var entry = global.statusDb[$ obj.effects[i][0]];
				if (entry[5]) array_push(newEffs, obj.effects[i]);
			}
			obj.effects = newEffs;
		}
		if (anim_info[0] == "dmg_nostat") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			
			if (obj.curHP <= 0) {
				ds_queue_enqueue(animations, ["wait", 20]);
				ds_queue_enqueue(animations, ["snd", choose(FightSFXMiss1, FightSFXMiss2)]);
				ds_queue_enqueue(animations, ["msg", "The target is unconscious..."]);
				ds_queue_enqueue(animations, ["wait", 60]);
				ds_queue_enqueue(animations, ["nomsg"]);
				ds_queue_enqueue(animations, ["wait", 20]);
			} else {
				// log msg {
				array_push(global.battleLog, obj.combatantNameDecorated + " took " + string(anim_info[2]) + " damage.");
				// }
				obj.curHP -= anim_info[2];
				if (obj.curHP < 0) obj.curHP = 0;
				var decal = instance_create(BattleHPDecal, obj.x, obj.y);
				decal.amount = anim_info[2];
			}
		}
		if (anim_info[0] == "dmg") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			
			if (obj.curHP <= 0) {
				ds_queue_enqueue(animations, ["wait", 20]);
				ds_queue_enqueue(animations, ["snd", choose(FightSFXMiss1, FightSFXMiss2)]);
				ds_queue_enqueue(animations, ["msg", "The target is unconscious..."]);
				ds_queue_enqueue(animations, ["wait", 60]);
				ds_queue_enqueue(animations, ["nomsg"]);
				ds_queue_enqueue(animations, ["wait", 20]);
			} else {
				// dmg taken stat {
				if (obj.combatantIndex >= 0) global.battleStats[obj.combatantIndex][1] += anim_info[2];
				// }
				// dmg dealt stat {
				if (global.battleCurrentObj != obj) {
					if (global.battleCurrentObj.combatantIndex >= 0) global.battleStats[global.battleCurrentObj.combatantIndex][0] += anim_info[2];
				}
				// }
				// log msg {
				array_push(global.battleLog, obj.combatantNameDecorated + " took " + string(anim_info[2]) + " damage.");
				// }
				obj.curHP -= anim_info[2];
				if (obj.curHP < 0) obj.curHP = 0;
				var decal = instance_create(BattleHPDecal, obj.x, obj.y);
				decal.amount = anim_info[2];
			}
		}
		if (anim_info[0] == "heal") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			
			var amount = anim_info[2];
			if (hasStatus(obj, "Infirmity")) amount *= 0.1;
			if (hasStatus(obj, "HealBlock")) amount *= 0.1;
			amount = int64(amount);
			if (amount < 0) amount = 1;
			
			if (obj.curHP <= 0) {
				ds_queue_enqueue(animations, ["wait", 20]);
				ds_queue_enqueue(animations, ["msg", "The target is unconscious..."]);
				ds_queue_enqueue(animations, ["wait", 60]);
				ds_queue_enqueue(animations, ["nomsg"]);
				ds_queue_enqueue(animations, ["wait", 20]);
			} else {
				// dmg healed stat {
				if (global.battleCurrentObj.combatantIndex >= 0) global.battleStats[global.battleCurrentObj.combatantIndex][2] += amount;
				// }
				// log msg {
				array_push(global.battleLog, obj.combatantNameDecorated + " recovered " + string(amount) + " HP.");
				// }
				if (obj.curHP <= obj.maxHP) {
					obj.curHP += amount;
					if (obj.curHP > obj.maxHP) obj.curHP = obj.maxHP;
				}
				var decal = instance_create(BattleHPDecal, obj.x, obj.y);
				decal.amount = -amount;
			}
		}
		if (anim_info[0] == "apply_effect") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			var eff = anim_info[2];
			var previousEffIndex = -1;
			var previousEffDuration = -1;
			for (var i=0; i<array_length(obj.effects); i++) {
				if (obj.effects[i][0] == eff[0]) {
					previousEffIndex = i;
					previousEffDuration = obj.effects[i][1];
				}
			}
			if (previousEffIndex == -1) {
				// if there is no previous effect, add a new one
				array_push(obj.effects, variable_clone(eff));	
			}
			else if (previousEffDuration > eff[1]) {
				// if previous effect has longer duration, keep it
			} 
			else {
				// if new effect has longer duration, replace it
				obj.effects[previousEffIndex] = variable_clone(eff);
			}
		}
		if (anim_info[0] == "apply_effect_queue") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			var effData = [obj, variable_clone(anim_info[2])];
			array_push(global.battleEffectQueue, effData);	
		}
		if (anim_info[0] == "mktelegraph") {
			var tl = telegraphCreate();
			var tllist = anim_info[1];
			for (var i=0; i<array_length(tllist); i++) {
				telegraphPush(tl, tllist[i][0], tllist[i][1], tllist[i][2], tllist[i][3], tllist[i][4], tllist[i][5], tllist[i][6], tllist[i][7]);
			}
			global.battleCurrentObj.telegraph = tl;
		}
		if (anim_info[0] == "rmtelegraph") {
			if (instance_exists(global.battleCurrentObj.telegraph)) {
				with (global.battleCurrentObj.telegraph) destruct = 1;
			} else show_debug_message("executing rmtelegraph with no telegraph stocked?");
		}
		if (anim_info[0] == "snapshot") {
			global.snapshot = [];
			if (instance_exists(global.battleCurrentObj.telegraph)) {
				global.battleCurrentObj.telegraph.includeObjs = false;
				with (global.battleCurrentObj.telegraph) event_user(1);
			} else show_debug_message("executing snapshot with no telegraph stocked?");
		}
		if (anim_info[0] == "mktelegraphq") {
			var tl = telegraphCreate();
			var tllist = anim_info[1];
			for (var i=0; i<array_length(tllist); i++) {
				telegraphPush(tl, tllist[i][0], tllist[i][1], tllist[i][2], tllist[i][3], tllist[i][4], tllist[i][5], tllist[i][6], tllist[i][7]);
			}
			global.battleCurrentObj.telegraph2 = tl;
		}
		if (anim_info[0] == "rmtelegraphq") {
			if (instance_exists(global.battleCurrentObj.telegraph2)) {
				with (global.battleCurrentObj.telegraph2) destruct = 1;
			} else show_debug_message("executing rmtelegraph with no telegraph stocked?");
		}
		if (anim_info[0] == "snapshotq") {
			global.snapshot = [];
			if (instance_exists(global.battleCurrentObj.telegraph2)) {
				global.battleCurrentObj.telegraph2.includeObjs = false;
				with (global.battleCurrentObj.telegraph2) event_user(1);
			} else show_debug_message("executing snapshot with no telegraph stocked?");
		}
		if (anim_info[0] == "rmproperties_target") {
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			if (obj.telegraph > 0) {
				with (obj.telegraph) destruct = 1;	
			}
			with (BattleObject) {
				if (markerOwner == obj.id) markersClear = true;
			}
		}
		if (anim_info[0] == "snapshot2") {
			global.snapshot = [];
			if (instance_exists(global.battleCurrentObj.telegraph)) {
				global.battleCurrentObj.telegraph.includeObjs = true;
				with (global.battleCurrentObj.telegraph) event_user(1);
			} else show_debug_message("executing snapshot2 with no telegraph stocked?");
		}
		if (anim_info[0] == "snapshot_all") {
			global.snapshot = [];
			var numCombatants = array_length(global.battleQueue);
			for (var i=0; i<numCombatants; i++) {
				var obj = getBattleObjectByCombatantId(global.battleQueue[i]);
				if (obj < 0) continue;
				if (!obj.alliance) continue;
				if (obj.curHP <= 0) continue;
				array_push(global.snapshot, obj);
			}
		}
		if (anim_info[0] == "dmgmulti") {
			deq = false;
			ds_queue_dequeue(animations);
			ds_queue_enqueue(animations, ["!"]);
			for (var i=0; i<array_length(global.snapshot); i++) {
				dealDamage(global.snapshot[i], anim_info[1], anim_info[2], anim_info[3]);
			}
			while (true) {
				var r = ds_queue_dequeue(animations);
				if (r[0] == "!") break;
				ds_queue_enqueue(animations, r);
			}
		}
		if (anim_info[0] == "dmgmulti_nobuffs") {
			deq = false;
			ds_queue_dequeue(animations);
			ds_queue_enqueue(animations, ["!"]);
			for (var i=0; i<array_length(global.snapshot); i++) {
				dealDamage(global.snapshot[i], anim_info[1], anim_info[2], anim_info[3], false);
			}
			while (true) {
				var r = ds_queue_dequeue(animations);
				if (r[0] == "!") break;
				ds_queue_enqueue(animations, r);
			}
		}
		if (anim_info[0] == "dmgmultishared") {
			deq = false;
			ds_queue_dequeue(animations);
			ds_queue_enqueue(animations, ["!"]);
			var potency = 1;
			if (array_length(global.snapshot) > 0) potency = anim_info[2] div array_length(global.snapshot);
			for (var i=0; i<array_length(global.snapshot); i++) {
				dealDamage(global.snapshot[i], anim_info[1], potency, anim_info[3]);
			}
			while (true) {
				var r = ds_queue_dequeue(animations);
				if (r[0] == "!") break;
				ds_queue_enqueue(animations, r);
			}
		}
		if (anim_info[0] == "dmgsingle") {
			deq = false;
			ds_queue_dequeue(animations);
			ds_queue_enqueue(animations, ["!"]);
			dealDamage(global.battleTargetObj, anim_info[1], anim_info[2], anim_info[3]);
			while (true) {
				var r = ds_queue_dequeue(animations);
				if (r[0] == "!") break;
				ds_queue_enqueue(animations, r);
			}
		}
		if (anim_info[0] == "dmgsingle_to") {
			deq = false;
			ds_queue_dequeue(animations);
			ds_queue_enqueue(animations, ["!"]);
			dealDamage(anim_info[4], anim_info[1], anim_info[2], anim_info[3]);
			while (true) {
				var r = ds_queue_dequeue(animations);
				if (r[0] == "!") break;
				ds_queue_enqueue(animations, r);
			}
		}
		if (anim_info[0] == "dmgsingle_nobuffs") {
			deq = false;
			ds_queue_dequeue(animations);
			ds_queue_enqueue(animations, ["!"]);
			dealDamage(global.battleTargetObj, anim_info[1], anim_info[2], anim_info[3], false, false, false);
			while (true) {
				var r = ds_queue_dequeue(animations);
				if (r[0] == "!") break;
				ds_queue_enqueue(animations, r);
			}
		}
		if (anim_info[0] == "healsingle") {
			deq = false;
			ds_queue_dequeue(animations);
			ds_queue_enqueue(animations, ["!"]);
			//dealDamage(global.battleTargetObj, anim_info[1], anim_info[2], anim_info[3]);
			var obj = anim_info[1];
			if (anim_info[1] == -1) obj = global.battleCurrentObj;
			if (anim_info[1] == -2) obj = global.battleTargetObj;
			var amount = anim_info[2];
			if (hasStatus(obj, "Infirmity")) amount *= 0.1;
			if (hasStatus(obj, "HealBlock")) amount *= 0.1;
			amount = int64(amount);
			if (amount < 0) amount = 1;
			ds_queue_enqueue(animations, ["msg", obj.combatantNameDecorated + " recovered " + string(amount) + " HP!@0"]);
			ds_queue_enqueue(animations, ["heal", anim_info[1], anim_info[2]]); // not a copy paste error. healing will be reduced again
			ds_queue_enqueue(animations, ["snd", FightSFXHeal]);
			ds_queue_enqueue(animations, ["wait", 30]);
			while (true) {
				var r = ds_queue_dequeue(animations);
				if (r[0] == "!") break;
				ds_queue_enqueue(animations, r);
			}
		}
		if (anim_info[0] == "lastblow") {
			setLastBlow(anim_info[1]);
		}
		if (anim_info[0] == "lore_msg") {
			global.battleToastBox = spawnStandardTextbox(anim_info[1], anim_info[2]);
		}
		if (anim_info[0] == "help_msg") {
			global.battleToastBox = spawnBasicHeaderedTextboxMid(anim_info[1], anim_info[2], anim_info[3]);
		}
		if (anim_info[0] == "wait_msg") {
			if (instance_exists(global.battleToastBox)) {
				deq = false;
			}
		}
		if (anim_info[0] == "halt") {
			pause = 999;
			deq = false;
		}
		if (deq) ds_queue_dequeue(animations);
	} else {
		animating = false;
	}
	exit;
}

if (global.battleQueueBox == noone) {
	global.battleQueueBox = spawnBattleQueueTextbox();
}

if (turnState == 0) {
	global.battleCurrentObj = getBattleObjectByCombatantId(global.battleQueue[global.battleTurn]);
	if (global.battleCurrentObj < 0) {
		bugcheck("BL.NoCombatant");
		exit;
	}
	global.battleCurrentObjX = global.battleCurrentObj.x;
	global.battleCurrentObjY = global.battleCurrentObj.y;
	
	// failsafe target picking - find someone from opposite alliance
	var oppoAlliance = !global.battleCurrentObj.alliance;
	for (var i=0; ; i++) {
		global.battleTargetObj = getBattleObjectByCombatantId(global.battleQueue[i]);
		if (oppoAlliance == global.battleTargetObj.alliance) break;
	}
	
	if (global.battleCurrentObj.alliance) {
		if (global.battleCurrentObj.curHP <= 0) {
			afterDecr = false;
			global.battleQueueBox.xPosAnimation = 3;
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " has no will to fight!"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["wait", 10]); // split so it's fast forwardable
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			animating = true;
			turnState = 3;
		} else {
			if (afterDecr) {
				sound_play(TextboxAdvance);
				afterDecr = false;
			}
			global.battleQueueBox.xPosAnimation = 1;
			var choiceStr = "Attack#Items#Move#Status#Wait";
			if (hasStatus(global.battleCurrentObj, "GoodBoy")) {
				choiceStr = "Pet#Items#Move#Status#Wait";
			}
			global.battleChoiceBox = spawnCondensedChoiceTextbox(choiceStr, 10, global.battleQueueBox.y + global.battleQueueBox.t_h + 10);
			global.battleChoiceBox.noClose = true;
			turnState = 1;
		}
	} else {
		turnState = 20;	
	}
}

else if (turnState == 1) {
	if (global.isCorrupted && global.lastResult != -1) {
		global.eventFlags[EVENT_ACHIEVEMENT_TMTRAINER] = 1;
		turnState = 3337;
		exit;
	}
	if (global.lastResult != -1 && instance_number(TextboxController) <= 2) {
		if (global.lastResult == 0) {
			if (hasStatus(global.battleCurrentObj, "GoodBoy")) {
				turnState = 50;
			} else if (hasStatus(global.battleCurrentObj, "Pausing")) {
				with (global.battleChoiceBox) instance_destroy();
				global.battleQueueBox.xPosAnimation = 3;
				animating = true;
				ds_queue_enqueue(animations, ["wait", 20]);
				ds_queue_enqueue(animations, ["msg", "Cannot attack due to @7Pausing@0!"]);
				ds_queue_enqueue(animations, ["wait", 60]);
				ds_queue_enqueue(animations, ["nomsg"]);
				ds_queue_enqueue(animations, ["wait", 15]);
				turnState = 0;
			} else {
				var serializedMoves = "";
				var serializedMoveDescs = [];
				var serializedMoveCols = "3";
				for (var i=0; i<array_length(global.battleCurrentObj.moves); i++) {
					var effEntry = global.movesDb[global.battleCurrentObj.moves[i]];
					serializedMoves += "#" + effEntry[0];
					var moveCol = "0";
					if (effEntry[7] > global.battleCurrentObj.curPP) moveCol = "5";
					var n = effEntry[2];
					if (effEntry[7] > 0) {
						var nD = "9";
						if (effEntry[7] > global.battleCurrentObj.curPP) nD = "7";
						n += " @" + nD + "[" + string(effEntry[7]) + " PP]@0";
					}
				
					if (effEntry[8] != STANCE_NONE) {
						if (effEntry[8] != global.battleCurrentObj.stance) {
							moveCol = "1";
							n = "@7Cannot be used by current specialization.@0";
						}
					}
				
					serializedMoveCols += moveCol;
					array_push(serializedMoveDescs, textToAttributed(n));
				}
				serializedMoves = string_delete(serializedMoves, 1, 1);
				global.battleSelectBox = spawnGridChoiceHeaderedTextbox(
					serializedMoves,
					global.battleCurrentObj.combatantName + "'s moveset [" + string(global.battleCurrentObj.curPP) + "/" + string(global.battleCurrentObj.maxPP) + " PP]",
					serializedMoveCols
				);
				global.battleSelectBox.descData = serializedMoveDescs;
				global.battleSelectBox.noClose = true;
				turnState = 50;
			}
		}
		if (global.lastResult == 1) {
			// items
			turnState = 60;
		}
		if (global.lastResult == 2) {
			// move
			with (global.battleChoiceBox) instance_destroy();
			global.battleQueueBox.xPosAnimation = 3;
			turnState = 70;
		}
		if (global.lastResult == 3) {
			// status
			var serializedEffects = "";
			var serializedCols = "3";
			for (var i=0; i<array_length(global.battleCurrentObj.effects); i++) {
				var effEntry = global.statusDb[$ global.battleCurrentObj.effects[i][0]];
				serializedEffects += "#" + effEntry[0];
				serializedCols += effEntry[1];
			}
			serializedEffects = string_delete(serializedEffects, 1, 1);
			serializedCols += "0000000000";
			if (array_length(global.battleCurrentObj.effects) == 0) {
				global.battleSelectBox = spawnBasicHeaderedTextbox(
					"No status effects",
					global.battleCurrentObj.combatantName + "'s status effects",
					serializedCols
				);
			} else {
				global.battleSelectBox = spawnGridChoiceHeaderedTextbox(
					serializedEffects,
					global.battleCurrentObj.combatantName + "'s status effects",
					serializedCols
				);
			}
			global.battleSelectBox.noClose = true;
			turnState = 40;
		}
		if (global.lastResult == 4) {
			// wait	
			with (global.battleChoiceBox) instance_destroy();
			global.battleQueueBox.xPosAnimation = 3;
			turnState = 30;
		}
	}
}

else if (turnState == 2) {
	afterDecr = false;
	if (global.battleCurrentObj.alliance) {
		script_execute(global.movesDb[global.battleMoveIndex][1]);
	} else {
		script_execute(global.battleAdversaryScript[0]);
	}
	animating = true;
	turnState = 3;
}

else if (turnState == 3) {
	// advance turn?
	
	/*
	// recalc battle queue
	var new_queue = [];
	var new_turn = 0;
	for (var i=0; i<array_length(global.battleQueue); i++) {
		var obj = getBattleObjectByCombatantId(global.battleQueue[i]);
		if (obj.alliance == false && obj.curHP <= 0) {} else {
			array_push(new_queue, global.battleQueue[i]);
			if (i <= global.battleTurn) new_turn += 1;
		}
	}
	array_copy(global.battleQueue, 0, new_queue, 0, array_length(new_queue));
	global.battleTurn = new_turn;
	// handle base queue as well
	*/
	
	if (!areAlliesAlive()) {
		animating = true;
		turnState = 2000;
	} else {
		if (!areEnemiesAlive()) {
			script_execute(global.battleAdversaryScript[1]);
			animating = true;
			turnState = 1000;
		} else {
			global.battleTurn += 1;
			if (global.battleTurn >= array_length(global.battleQueue)) {
				turnState = 10;
				global.battleTurn = 0;	
				global.turnCounter += 1;
				global.battleStats[3][0] += 1; // stat turn counter
			} else {
				turnState = 0;
			}
		}
	}
}

else if (turnState == 10) {
	script_execute(global.battleAdversaryScript[2]);
	animating = true;
	turnState = 18;
}

else if (turnState == 11) {
	var new_queue = [];
	for (var i=0; i<array_length(global.initBattleQueue); i++) {
		var obj = getBattleObjectByCombatantId(global.initBattleQueue[i]);
		if (obj <= 0) continue;
		if (obj.alliance == false && obj.curHP <= 0) continue;
		array_push(new_queue, global.initBattleQueue[i]);
	}
	with (BattleObject) {
		if (hidden) instance_destroy();	
	}
	global.initBattleQueue = new_queue;
	global.battleQueue = [];
	array_copy(global.battleQueue, 0, global.initBattleQueue, 0, array_length(global.initBattleQueue));
	global.battleQueueBox.xPosAnimation = 1;
	whichEffectTick = 0;
	pause = 20;
	turnState = 12;
}

else if (turnState == 12) {
	global.battleQueueBox.shakiesWhich = whichEffectTick;
	global.battleQueueBox.shakiesDuration = 20;
	pause = 10;
	turnState = 13;
}

else if (turnState == 13) {
	var numCombatants = array_length(global.battleQueue);
	var curEffect = 0;
	var found = false;
	for (var i=0; i<numCombatants; i++) {
		var obj = getBattleObjectByCombatantId(global.battleQueue[i]);
		if (obj < 0) continue;
		for (var j=0; j<array_length(obj.effects); j++) {
			if (j >= 9) {
				global.eventFlags[EVENT_ACHIEVEMENT_10STAT] = 1;	
			}
			if (curEffect == whichEffectTick) {
				obj.effects[j][1] -= 1;
				whichEffectName = obj.effects[j][0];
				whichEffectDurationLeft = obj.effects[j][1];
				global.battleTargetObj = obj;
				found = true;
			}
			curEffect += 1;
		}
	}
	if (found) {
		audio_play_sound(BattleEffectTick, 1, 0);
		turnState = 14;
	} else {
		pause = 10;
		turnState = 16;
	}
}

else if (turnState == 14) {
	pause = 10;
	animating = true;
	if (global.statusDb[$ whichEffectName][3] != noone) {
		if (global.battleTargetObj.curHP > 0 || global.statusDb[$ whichEffectName][4]) { 
			setLastBlowEffect(global.statusDb[$ whichEffectName][0]);
			global.battleNumEffectsBefore = array_length(global.battleTargetObj.effects);
			script_execute(global.statusDb[$ whichEffectName][3], whichEffectDurationLeft);
		}
	}
	turnState = 15;
}

else if (turnState == 15) {
	global.battleQueueBox.xPosAnimation = 1;
	whichEffectTick += 1;
	turnState = 12;
}

else if (turnState == 16) {
	global.battleQueueBox.shakiesDuration = 0;
	with (BattleObject) movedDist = 0;
	
	var numCombatants = array_length(global.battleQueue);
	for (var i=0; i<numCombatants; i++) {
		var obj = getBattleObjectByCombatantId(global.battleQueue[i]);
		if (obj < 0) continue;
		var newEffects = [];
		for (var j=0; j<array_length(obj.effects); j++) {
			if (obj.effects[j][1] != 0) {
				array_push(newEffects, [obj.effects[j][0], obj.effects[j][1]]);
			}
		}
		obj.effects = newEffects;
	}
	
	for (var i=0; i<array_length(global.battleEffectQueue); i++) {
		var target = global.battleEffectQueue[i][0];
		if (instance_exists(target)) {
			removeEffect(target, global.battleEffectQueue[i][1][0]);
			array_push(target.effects, variable_clone(global.battleEffectQueue[i][1]));	
		}
	}
	
	global.battleEffectQueue = [];
	afterDecr = true;
	turnState = 17;
}

else if (turnState == 1733) {
	
}

else if (turnState == 17) {
	if (!areAlliesAlive()) {
		animating = true;
		turnState = 2000;
	} else {
		if (!areEnemiesAlive()) {
			script_execute(global.battleAdversaryScript[1]);
			animating = true;
			turnState = 1000;
		} else {
			turnState = 0;
		}
	}
}

else if (turnState == 18) {
	animating = true;
	ds_queue_enqueue(animations, ["msg", "The next round begins!"]);
	ds_queue_enqueue(animations, ["wait", 40]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 10]);
	turnState = 11;
}

else if (turnState == 20) {
	global.battleQueueBox.xPosAnimation = 3;
	turnState = 2;
	//pause = 30;
}

else if (turnState == 30) {
	var allEnemiesDone = true;
	for (var i=global.battleTurn; i<array_length(global.battleQueue); i++) {
		var obj = getBattleObjectByCombatantId(global.battleQueue[i]);
		if (!obj.alliance) allEnemiesDone = false;
	}
	
	if (allEnemiesDone) {
		animating = true;
		ds_queue_enqueue(animations, ["wait", 15]);
		turnState = 31;
	} else {
		turnState = 35;
	}
}

else if (turnState == 31) {
	global.battleExtraBox = spawnStandardTextbox("All enemies have performed their actions.\nDo you wish to pass the turn?\\f00");	
	turnState = 32;
}

else if (turnState == 32) {
	if (global.battleExtraBox.hang) {
		spawnChoiceTextbox("Pass the turn#Wait#Cancel");
		turnState = 33;
	}
}

else if (turnState == 33) {
	if (global.lastResult != RESULT_NONE) {
		if (instance_exists(global.battleExtraBox)) instance_destroy(global.battleExtraBox);
		if (global.lastResult == RESULT_QUIT) {
			turnState = 0;	
		} else {
			if (global.lastResult == 0) turnState = 34;
			else if (global.lastResult == 1) turnState = 35;
			else if (global.lastResult == 2) turnState = 0;
			else turnState = 0;
		}
	}
}

else if (turnState == 34) {
	// pass turn
	animating = true;
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " waits for a better opportunity to act."]);
	ds_queue_enqueue(animations, ["wait", 60]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 15]);
	turnState = 3;
}

else if (turnState == 35) {
	// wait turn
	animating = true;
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is watching carefully."]);
	ds_queue_enqueue(animations, ["wait", 60]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 15]);
	var curCombatant = global.battleQueue[global.battleTurn];
	array_delete(global.battleQueue, global.battleTurn, 1);
	array_push(global.battleQueue, curCombatant);
	global.battleTurn -= 1;
	turnState = 3;
}

else if (turnState == 40) {
	global.battleExtraBox = noone;
	turnState = 41;
}

else if (turnState == 41) {
	if (instance_number(TextboxController) < 3) turnState = 1;
	if (!instance_exists(global.battleExtraBox)) {
		if (instance_exists(global.battleSelectBox)) global.battleSelectBox.hidden = false;
	}
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			with (global.battleSelectBox) instance_destroy();
			turnState = 1;
		} else {
			global.battleSelectBox.hidden = true;
			var effEntry = global.statusDb[$ global.battleCurrentObj.effects[global.lastResult][0]];
			global.battleExtraBox = spawnBasicHeaderedTextbox(effEntry[2], effEntry[0], effEntry[1]);
		}
		global.lastResult = RESULT_NONE;
	}
}

else if (turnState == 50) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			if (instance_exists(global.battleSelectBox)) {
				with (global.battleSelectBox) instance_destroy();
			}
			turnState = 1;
		} else {
			var selectedMove = global.battleCurrentObj.moves[global.lastResult];
			if (hasStatus(global.battleCurrentObj, "GoodBoy")) selectedMove = 17;
			global.battleMoveIndex = selectedMove;
			var selMoveData = global.movesDb[selectedMove];
			
			if (selMoveData[7] > global.battleCurrentObj.curPP) {
				global.lastResult = RESULT_NONE;
				ratelimitedUIWrongSound();
				turnState = 50;
			} else if (selMoveData[8] != STANCE_NONE && selMoveData[8] != global.battleCurrentObj.stance && !instance_exists(DebugController)) {
				global.lastResult = RESULT_NONE;
				ratelimitedUIWrongSound();
				turnState = 50;
			} else {
				global.potentialTargetList = [];
				
				var numBattleObjs = instance_number(BattleObject);
				for (var i=0; i<numBattleObjs; i++) {
					var obj = instance_find(BattleObject, i);
					var inRange = true;
					if (selMoveData[3] != -1) {
						var dist = point_distance(global.battleCurrentObj.x, global.battleCurrentObj.y, obj.x, obj.y);
						if (dist > selMoveData[3]) inRange = false;
					}
					if (obj.alliance && selMoveData[4] == TARGETS_FRIENDLY && inRange) {
						array_push(global.potentialTargetList, obj);
					}
					if (!obj.alliance && selMoveData[4] == TARGETS_ENEMIES && inRange) {
						if (!obj.hidden) array_push(global.potentialTargetList, obj);
					}
				}
			
				global.lastResult = RESULT_NONE;
				if (instance_exists(global.battleChoiceBox)) {
					with (global.battleChoiceBox) instance_destroy();
				}
				if (instance_exists(global.battleSelectBox)) {
					with (global.battleSelectBox) instance_destroy();
				}
				global.battleQueueBox.xPosAnimation = 3;
			
				ds_queue_enqueue(animations, ["wait", 8]);
				animating = true;
				if (selMoveData[4] == TARGETS_NONE) {
					global.battleTargetObj = noone;
					turnState = 2;
					pause = 10;
				} else {
					turnState = 52;
				}
			}
		}
	}
}

else if (turnState == 51) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			turnState = 0;	
		} else {
			BattleController.isPetting = true; // just for that mightyena event
			global.battleTargetObj = global.potentialTargetList[global.lastResult];
			turnState = 2;	
		}
	}
	// turnState = 52;
	// ratelimitedUIWrongSound();
}

else if (turnState == 52) {
	global.battleExtraBox = instance_create(BattleSelectorAnimation, 0, 0);
	global.battleExtraBox.type = 0;
	with (global.battleExtraBox) event_user(0);
	turnState = 51;
}

else if (turnState == 60) {
	if (global.battleItemsUsable) {
		var serializedItems = "";
		var serializedItemDescs = [];
		var serializedItemCols = "3";
		var items = global.teamMembers[global.battleCurrentObj.combatantIndex].items;
		if (array_length(items) > 0) {
			for (var i=0; i<array_length(items); i++) {
				var effEntry = global.itemDb[items[i]];
				serializedItems += "#" + effEntry[0];
				serializedItemCols += "0";
				array_push(serializedItemDescs, textToAttributed(effEntry[1]));
			}
			serializedItems = string_delete(serializedItems, 1, 1);
			global.battleSelectBox = spawnGridChoiceHeaderedTextbox(
				serializedItems,
				global.battleCurrentObj.combatantName + "'s items",
				serializedItemCols
			);
			global.battleSelectBox.descData = serializedItemDescs;
			global.battleSelectBox.noClose = true;
		} else {
			global.battleSelectBox = spawnBasicHeaderedTextbox(
				"No items",
				global.battleCurrentObj.combatantName + "'s items",
				"300000000000000"
			);
			global.battleSelectBox.noClose = true;
		}
		turnState = 61;
	} else {
		with (global.battleChoiceBox) instance_destroy();
		global.battleQueueBox.xPosAnimation = 3;
		animating = true;
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "A mysterious aura prevents usage of items!"]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		turnState = 0;
	}
}

else if (turnState == 61) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			with (global.battleSelectBox) instance_destroy();
			turnState = 1;
		} else {
			var items = global.teamMembers[global.battleCurrentObj.combatantIndex].items;
			if (array_length(items) > 0) {
				var itemId = items[global.lastResult];
				global.battleWhichId = itemId;
				global.battleCurrentItemName = global.itemDb[itemId][0];
				global.whichItemSlot = global.lastResult;
				global.lastResult = RESULT_NONE;
				with (global.battleChoiceBox) instance_destroy();
				with (global.battleSelectBox) instance_destroy();
				global.battleQueueBox.xPosAnimation = 3;
				if (global.itemDb[itemId][5] == TARGETS_NONE) {
					if (script_execute(global.itemDb[itemId][3])) {
						array_delete(global.teamMembers[global.battleCurrentObj.combatantIndex].items, global.whichItemSlot, 1);
					}
					animating = true;
					turnState = 3;
				} else {
					global.potentialTargetList = [];
					var numBattleObjs = instance_number(BattleObject);
					for (var i=0; i<numBattleObjs; i++) {
						var obj = instance_find(BattleObject, i);
						if (obj.alliance && global.itemDb[itemId][5] == TARGETS_FRIENDLY) {
							array_push(global.potentialTargetList, obj);
						}
						if (!obj.alliance && global.itemDb[itemId][5] == TARGETS_ENEMIES) {
							if (!obj.hidden) array_push(global.potentialTargetList, obj);
						}
					}			
					ds_queue_enqueue(animations, ["wait", 8]);
					animating = true;					
					turnState = 62;	
				}
			} else {
				with (global.battleSelectBox) instance_destroy();
				turnState = 1;
			}
		}
	}
}

else if (turnState == 62) {
	global.battleExtraBox = instance_create(BattleSelectorAnimation, 0, 0);
	global.battleExtraBox.type = 2;
	with (global.battleExtraBox) event_user(0);
	turnState = 63;
}

else if (turnState == 63) {
	if (global.lastResult != RESULT_NONE) {
		if (global.lastResult == RESULT_QUIT) {
			turnState = 0;	
		} else {
			global.battleTargetObj = global.potentialTargetList[global.lastResult];
			if (script_execute(global.itemDb[global.battleWhichId][3])) {
				array_delete(global.teamMembers[global.battleCurrentObj.combatantIndex].items, global.whichItemSlot, 1);
			}
			animating = true;
			turnState = 3;	
		}
	}	
}


else if (turnState == 70) {
	if (hasStatus(global.battleCurrentObj, "Bind")) {
		animating = true;
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "You are bound and unable to move!"]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		turnState = 0;
	} else if (hasStatus(global.battleCurrentObj, "GoodBoy")) {
		animating = true;
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "Cannot move due to dog-type magic!"]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		turnState = 0;
	} else {
		global.battleExtraBox = instance_create(BattleSelectorAnimation, global.battleCurrentObj.x, global.battleCurrentObj.y);
		global.battleExtraBox.type = 1;
		turnState = 71;
	}
}

else if (turnState == 71) {
	animating = true;
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 8]);
	ds_queue_enqueue(animations, ["msg", "Where to move?"]);
	ds_queue_enqueue(animations, ["wait", 15]);
	turnState = 72;
}

else if (turnState == 72) {
	if (keyboard_check_pressed(global.keybinds[0])) {
		if (global.battleExtraBox.obstructed) {
			turnState = 73;
		} else {
			turnState = 74;	
		}
	}
	if (keyboard_check_pressed(global.keybinds[1])) {
		ds_queue_enqueue(animations, ["nomsg"]);
		animating = true;
		instance_destroy(BattleSelectorAnimation);
		turnState = 0;
	}
}

else if (turnState == 73) {
	animating = true;
	ratelimitedUIWrongSound();
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["msg", "Position obstructed!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	turnState = 71;
}

else if (turnState == 74) {
	global.battleCurrentObj.movedDist += point_distance(global.battleCurrentObj.x, global.battleCurrentObj.y, BattleSelectorAnimation.x, BattleSelectorAnimation.y);
	global.battleCurrentObj.animTargetX = BattleSelectorAnimation.x;
	global.battleCurrentObj.animTargetY = BattleSelectorAnimation.y;
	global.battleCurrentObj.animTargetSteps = 25;
	with (global.battleCurrentObj) event_user(2);
	instance_destroy(BattleSelectorAnimation);
	
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 30]);
	ds_queue_enqueue(animations, ["anim_facenearestenemy", -1]);
	animating = true;
	turnState = 0;
}

else if (turnState == 100) {
	script_execute(global.battleAdversaryScript[2]);
	animating = true;
	turnState = 0;
}

else if (turnState == 1000) {
	// win
	global.gp0 = 0;
	for (var i=0; i<array_length(global.battleInitData); i++) {
		global.gp0 += int64(global.battleInitData[i].expRate * global.battleInitData[i].lv * 1.2);
	}
	if (array_length(global.teamMembers) > 2) {
		global.battleExtraBox = spawnStandardTextbox("\\c33" + global.teamMembers[0].name + "\\c30 and friends gained " + string(global.gp0) + " Exp. Points each.< ");	
	} else if (array_length(global.teamMembers) == 2) {
		global.battleExtraBox = spawnStandardTextbox("\\c33" + global.teamMembers[0].name + "\\c30 and \\c36" + global.teamMembers[1].name + "\\c30 gained " + string(global.gp0) + " Exp. Points each.< ");	
	} else {
		global.battleExtraBox = spawnStandardTextbox("\\c33" + global.teamMembers[0].name + "\\c30 gained " + string(global.gp0) + " Exp. Points!< ");	
	}
	turnState = 1001;
}

else if (turnState == 1001) {
	if (!instance_exists(global.battleExtraBox)) {
		animating = true;
		pause = 5;
		turnState = 1002;
		global.gp1 = 0;
	}
}

else if (turnState == 1002) {
	var starting_lv = global.teamMembers[global.gp1].lv;
	// undo stance first
	var stinfo = global.stanceDb[global.teamMembers[global.gp1].stance];
	if (stinfo[1] != 0) global.teamMembers[global.gp1].att -= global.teamMembers[global.gp1].lv div stinfo[1];
	if (stinfo[2] != 0) global.teamMembers[global.gp1].def -= global.teamMembers[global.gp1].lv div stinfo[2];
	if (stinfo[3] != 0) global.teamMembers[global.gp1].sp_att -= global.teamMembers[global.gp1].lv div stinfo[3];
	if (stinfo[4] != 0) global.teamMembers[global.gp1].sp_def -= global.teamMembers[global.gp1].lv div stinfo[4];
	if (stinfo[5] != 0) global.teamMembers[global.gp1].maxHP -= global.teamMembers[global.gp1].lv div stinfo[5];
	if (stinfo[6] != 0) global.teamMembers[global.gp1].maxPP -= global.teamMembers[global.gp1].lv div stinfo[6];
	// apply stat changes
	var lv_gain = levelUpAddExp(global.teamMembers[global.gp1], global.gp0);
	var stat_gain = levelUpAddStats(global.teamMembers[global.gp1], starting_lv, lv_gain);
	// reapply stance
	stinfo = global.stanceDb[global.teamMembers[global.gp1].stance];
	if (stinfo[1] != 0) global.teamMembers[global.gp1].att += global.teamMembers[global.gp1].lv div stinfo[1];
	if (stinfo[2] != 0) global.teamMembers[global.gp1].def += global.teamMembers[global.gp1].lv div stinfo[2];
	if (stinfo[3] != 0) global.teamMembers[global.gp1].sp_att += global.teamMembers[global.gp1].lv div stinfo[3];
	if (stinfo[4] != 0) global.teamMembers[global.gp1].sp_def += global.teamMembers[global.gp1].lv div stinfo[4];
	if (stinfo[5] != 0) global.teamMembers[global.gp1].maxHP += global.teamMembers[global.gp1].lv div stinfo[5];
	if (stinfo[6] != 0) global.teamMembers[global.gp1].maxPP += global.teamMembers[global.gp1].lv div stinfo[6];
	// show stat changes
	var stat_increases = "Attack went up by " + string(stat_gain[0]) +"!\n";
	stat_increases += "Defense went up by " + string(stat_gain[1]) + "!<@";
	stat_increases += "Special Attack went up by " + string(stat_gain[2]) +"!\n";
	stat_increases += "Special Defense went up by " + string(stat_gain[3]) + "!<@";
	stat_increases += "Maximum HP went up by " + string(stat_gain[4]) +"!\n";
	stat_increases += "Maximum PP went up by " + string(stat_gain[5]) + "!<@";
		
	var decorator = "6";
	if (global.gp1 == 0) decorator = "3";
		
	var learnset = global.speciesLearnList[$ ("m"+global.teamMembers[global.gp1].species)];
	for (var i=0; i<array_length(learnset); i++) {
		if (learnset[i][1] == global.teamMembers[global.gp1].lv) {
			stat_increases += "\\m01\\c3" + decorator + global.teamMembers[global.gp1].name + "\\c30 is now able to learn \\c31" + global.movesDb[learnset[i][0]][0] + "\\c30!<@";
		}
	}
	if (lv_gain > 0) {
		if (global.battleType != BATTLETYPE_DUNGEON) {
			global.musicIndex = 2;
			global.musicControl = MUS_PLAY;
		} else {
			global.musicIndex = 2;
			global.musicControl = MUS_TEMPPLAY;	
		}
		global.battleExtraBox = spawnStandardTextbox("\\c3" + decorator + global.teamMembers[global.gp1].name + "\\c30's level is now " + string(global.teamMembers[global.gp1].lv) + "!<@" + stat_increases);	
	} else {
		global.battleExtraBox = noone;
	}
	turnState = 1003;
}

else if (turnState == 1003) {
	if (!instance_exists(global.battleExtraBox)) {
		animating = true;
		if (global.battleExtraBox != noone) pause = 5;
		turnState = 1004;
	}
}

else if (turnState == 1004) {
	global.gp1 += 1;
	if (global.gp1 >= array_length(global.teamMembers)) {
		if (global.battleType == BATTLETYPE_DUNGEON) turnState = 1105;
		else turnState = 1005;
	} else {
		animating = true;
		pause = 5;
		turnState = 1002;	
	}
}

else if (turnState == 1105) {
	global.gp0 = 0;
	for (var i=0; i<array_length(global.battleInitData); i++) {
		global.gp0 += int64(((global.battleInitData[i].expRate * 0.57) * global.battleInitData[i].lv * (irandom_range(8000,12000)/10000)) / array_length(global.battleInitData));
	}
	sound_play(FightSFXPickMoney);
	global.battleExtraBox = spawnStandardTextbox("The opponent dropped " + string(global.gp0) + "\\c50x\\c30in panic!< ");
	global.money += global.gp0;
	turnState = 1106;
}
else if (turnState == 1106) {
	if (!instance_exists(global.battleExtraBox)) {
		turnState = 1005;
	}
}

else if (turnState == 1005) {
	if (global.battleType != BATTLETYPE_DUNGEON) {
		global.musicControl |= MUS_FADEOUT;
	} else {
		global.musicControl = MUS_TEMPEND;
	}
	pause = 25;
	turnState = 1006;
}
else if (turnState == 1006) {
	global.gp0 = instance_create(ScreenTransitionController, 0, 0);
	global.gp0.transition_type = TRANSITION_FADETOBLACK;
	pause = 30;
	if (global.battleType == BATTLETYPE_TUTORIAL) pause = 70;
	turnState = 1007;
}
else if (turnState == 1007) {
	// update team member variables
	with (BattleObject) {
		if (combatantIndex >= 0) {
			if (curHP <= 0) curHP = 1;
			global.teamMembers[combatantIndex].curHP = curHP;
			global.teamMembers[combatantIndex].curPP = curPP;
		}
	}
	global.battleResult = BATTLERESULT_WIN;
	if (global.battleType == BATTLETYPE_TUTORIAL) {
		global.overworldCurMap = "Lab";
		global.overworldCurVariant = "FirstVisit";
		global.overworldSpawnX = 415;
		global.overworldSpawnY = 110;
		global.overworldSpawnFacing = 0;
		room_goto(OverworldRoom);
	} else if (global.battleType == BATTLETYPE_DUNGEON) {
		room_goto(DungeonRoom);
	} else if (global.battleType == BATTLETYPE_OVERWORLD) {
		global.overworldCurMap = global.battleWarpMap;
		global.overworldCurVariant = global.battleWarpVariant;
		room_goto(OverworldRoom);
	}
}
	

else if (turnState == 2000) {
	if (global.battleQueueBox.xPosAnimation != 0) {
		global.battleQueueBox.xPosAnimation = 3;
		ds_queue_enqueue(animations, ["wait", 15]);
	}
	ds_queue_enqueue(animations, ["wait", 30]);
	ds_queue_enqueue(animations, ["msg", "There's no one to fight!"]);
	ds_queue_enqueue(animations, ["wait", 70]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	animating = true;
	turnState = 2001;
}

else if (turnState == 2001) {
	global.battleStats[3][1] = "?";
	pause = 50;
	turnState = 2002;
}

else if (turnState == 2002) {
	global.musicControl |= MUS_FADEOUT;
	global.gp0 = instance_create(ScreenTransitionController, 0, 0);
	global.gp0.transition_type = TRANSITION_FADETOBLACK;
	pause = 80;
	turnState = 2003;
}

else if (turnState == 2003) {
	global.battleResult = BATTLERESULT_LOSE;
	room_goto(LastOutingRoom);	
}

else if (turnState == 3337) {
	var oo = instance_create(ScreenTransitionController, 0, 0);
	oo.transition_type = TRANSITION_RST38;
	global.battleLastBlow = "due to an unseen force";
	global.battleLastTarget = "@2TM@0";
	pause = 140;
	turnState = 2003;
}