// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ai006MysticHighlandFights(){

}

function aiMysticHighland1() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	if (global.battleCurrentObj.species == "0076") {
		if (global.turnCounter == 0) {
			global.battleTargetObj = randomAllyProvokablePrioritizeSpecies("0004");
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Rollout@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Rollout"]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["nomsg"]);
			var numRollouts = choose(2,3,4,5);
			for (var i=0; i<numRollouts; i++) {
				ds_queue_enqueue(animations, ["anim_spin", -1]);
				ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
				ds_queue_enqueue(animations, ["animpart_member", -2, AnimRollout, 1]);
				ds_queue_enqueue(animations, ["wait", 5]);
				ds_queue_enqueue(animations, ["snd", FightSFXRollout]);
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["dmgsingle", "rock", 5+i*5, noone]);
				ds_queue_enqueue(animations, ["wait", 10]);	
			}
			ds_queue_enqueue(animations, ["wait", 10]);	
		} else {
			global.battleTargetObj = randomAllyAliveProvokable();
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Rock Tomb@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Rock Tomb"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimRockTomb, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXRock2]);
			ds_queue_enqueue(animations, ["wait", 40]);
			ds_queue_enqueue(animations, ["dmgsingle", "rock", 35, noone]);
			ds_queue_enqueue(animations, ["wait", 20]);	
		}
	}
	
	if (global.battleCurrentObj.species == "0232") {
		if (global.turnCounter % 2 == 0) {
			global.battleTargetObj2 = randomAllyAlive();
			global.battleTargetObj = global.battleTargetObj2;
			var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y-20, global.battleTargetObj.x, global.battleTargetObj.y);
			
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Bulldoze@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["mktelegraph", [
				["line", global.battleCurrentObj.x, global.battleCurrentObj.y-20, 0, 0, 500, 35, dr]
			]]);
			ds_queue_enqueue(animations, ["call", aiMysticHighland1Callback1]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (global.turnCounter % 2 == 1) {
			global.battleTargetObj = global.battleTargetObj2;
			var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y-20, global.battleTargetObj.x, global.battleTargetObj.y);
			
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Bulldoze@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Bulldoze"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
		
			ds_queue_enqueue(animations, ["mktelegraph", [
				["line", global.battleCurrentObj.x, global.battleCurrentObj.y-20, 0, 0, 500, 35, dr]
			]]);
			ds_queue_enqueue(animations, ["rmmarkers", BattleObject]);
			ds_queue_enqueue(animations, ["snd", FightSFX5Hit]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgmultishared", "ground", 60, noone]);
			ds_queue_enqueue(animations, ["wait", 15]);
		
			with (BattleObject) removeEffect(self, "Prey");	
		}
	}
}
function aiMysticHighland1Callback1() {
	global.battleTargetObj.markerAlpha = 0;
	global.battleTargetObj.markerAlphaExcess = 2;
	global.battleTargetObj.personalMarker = MARKER_STACK;
	applyEffectSilent(global.battleTargetObj, ["Prey", 999]);
	global.battleTargetObj.markerOwner = global.battleCurrentObj.id;	
}

function aiMysticHighland2() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var tc = global.turnCounter % 2;
	
	if (tc == 0) global.battleAllTele = [];
	if (array_length(global.battleAllTele) > 0) {
		ds_queue_enqueue(animations, ["msg", "The air currents rise up!"]);
		ds_queue_enqueue(animations, ["snd", FightSFXTwister]);
		ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["dmgmulti", "dragon", 35, ["DamageDown", 3]]);
		ds_queue_enqueue(animations, ["wait", 20]);	
		global.battleAllTele = [];
	}
	
	if (tc == 0) {
		var members = allThreeAliveAllies();
		global.battleAllTele = [];
		if (members[0] != noone) array_push(global.battleAllTele, ["circle", members[0].x, members[0].y, 0, 0, 40, 0, 0]);
		if (members[1] != noone) array_push(global.battleAllTele, ["circle", members[1].x, members[1].y, 0, 0, 40, 0, 0]);
		if (members[2] != noone) array_push(global.battleAllTele, ["circle", members[2].x, members[2].y, 0, 0, 40, 0, 0]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Twister@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Twister"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		if (members[0] != noone) ds_queue_enqueue(animations, ["animpart_member", members[0], AnimTwister, 1]);
		if (members[1] != noone) ds_queue_enqueue(animations, ["animpart_member", members[1], AnimTwister, 1]);
		if (members[2] != noone) ds_queue_enqueue(animations, ["animpart_member", members[2], AnimTwister, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXTwister]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["snapshot_all"]);
		ds_queue_enqueue(animations, ["dmgmulti", "dragon", 25, noone]);
		ds_queue_enqueue(animations, ["wait", 20]);	
		ds_queue_enqueue(animations, ["msg", "Air currents are rising beneath everyone's feet!"]);
		ds_queue_enqueue(animations, ["wait", 90]);	
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
	
	if (tc == 1) {
		global.battleTargetObj = randomAllyAliveProvokable();
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Scorching Sands@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Scorching Sands"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgsingle", "ground", 35, ["ScorchMark", 2]]);
		ds_queue_enqueue(animations, ["call", aiMysticHighland2Callback1]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
}

function aiMysticHighland2Callback1(ii) {
	with (global.battleTargetObj) {
		if (alliance) {
			markerAlpha = 0;
			markerAlphaExcess = 2;
			radiusMarker = 180;
			personalMarker = MARKER_SPREAD;
			markerOwner = global.battleCurrentObj.id;
		}
	}
}

function effectSpreadMark(t) {
	if (t == 0) {
		BattleController.alarm[0] = 10;
		global.battleCurrentObj = randomEnemy();
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s @7Scorch Mark@0 takes effect!"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["mktelegraph", [
			["circle", global.battleTargetObj.x, global.battleTargetObj.y, 0, 0, 180, 0, 0]
		]]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["rmmarkers", -2]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 40, noone]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}

function aiMysticHighland3() {
	if (global.battleCurrentObj.curHP <= 0) return;
	var tc = global.turnCounter % 2;
	
	if (global.battleCurrentObj.lv == 14) { 
		// the "leader"
		if (tc == 0) {
			global.battleTargetObj = randomAllyAliveProvokable();
			applyEffectSilent(global.battleTargetObj, ["Prey", 2]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Rollcall@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Rollcall"]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric2, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXBlink]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["msg", "The enemies will focus on a single target!"]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		} else {
			global.battleTargetObj = preyAllyOrRandom();
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Cross Chop@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Cross Chop"]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimCrossChop, 1]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["snd", FightSFXChop]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgsingle", "fighting", 30, noone]);
			ds_queue_enqueue(animations, ["wait", 20]);	
		}
	} else {
		global.battleTargetObj = preyAllyOrRandom();
		var c = choose(1, 2, 3);
		if (c == 3 && hasStatus(global.battleCurrentObj, "Concentrate")) c = 2;
		if (c == 1) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Cross Chop@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Cross Chop"]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimCrossChop, 1]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["snd", FightSFXChop]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgsingle", "fighting", 30, noone]);
			ds_queue_enqueue(animations, ["wait", 20]);	
		}
		if (c == 2) {
			attack003Scratch();
		}
		if (c == 3) {
			attack010Concentrate();
		}
	}
}

function aiMysticHighlandMachamp() {
	if (global.battleCurrentObj.curHP <= 0) return;
	var tc = global.turnCounter % 2;
	if (tc == 0) {
		attack010Concentrate();
	}
	if (tc == 1) {
		global.battleTargetObj = randomAllyAliveProvokable();
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Cross Chop@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Cross Chop"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimCrossChop, 1]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["snd", FightSFXChop]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["dmgsingle", "fighting", 30, noone]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
}