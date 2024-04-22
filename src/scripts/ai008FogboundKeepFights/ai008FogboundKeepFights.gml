// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ai008FogboundKeepFights(){

}

function aiFogboundKeep1() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var move = choose(1, 2, 3);
	if (move == 1) {
		global.battleTargetObj = randomAllyAliveProvokable();
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Acid Spray@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Acid Spray"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimAcid, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXBubble]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgsingle", "poison", 35, ["Poisoned", 3]]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
	if (move == 2) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Cross Poison@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Cross Poison"]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		var tele = [];
		array_push(tele, ["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 600, 35, 45]);
		array_push(tele, ["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 600, 35, 45+90]);
		array_push(tele, ["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 600, 35, 45+90+90]);
		array_push(tele, ["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 600, 35, 45+90+90+90]);
		ds_queue_enqueue(animations, ["mktelegraph", tele]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "poison", 20, ["Poisoned", 3]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (move == 3) {
		global.battleTargetObj = randomAllyAliveProvokable();
		var potency = 20;
		if (hasStatus(global.battleTargetObj, "Poisoned")) potency = 40;
		
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Venoshock@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Venoshock"]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXGeneric1]);
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimCloud, 1]);
		ds_queue_enqueue(animations, ["wait", 35]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["dmgsingle", "poison", potency, noone]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}

function aiFogboundKeep2() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var tc = global.turnCounter % 2;
	
	if (global.battleCurrentObj.species == "0371") {
		if (tc == 0) {
			global.battleTargetObj = randomAllyAliveProvokable();
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Bite@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Bite"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimBite, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXBite]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["dmgsingle", "dark", 40, noone]);
			ds_queue_enqueue(animations, ["wait", 45]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			global.battleTargetObj2 = randomAllyAlive();
			var dir = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y, global.battleTargetObj2.x, global.battleTargetObj2.y);
			global.battleStoredDirection = getFacingByteFromAngle(dir);
			
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Dragon Breath@0."]);
			ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleStoredDirection]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (tc == 1) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Dragon Breath@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Dragon Breath"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["mktelegraph", [
				["cone", global.battleCurrentObjX, global.battleCurrentObjY, 0, 0, 600, 800, facingToDir(global.battleStoredDirection)]
			]]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["dmgmulti", "dragon", 40, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 8]);
		}
	}
	if (global.battleCurrentObj.species == "0447") {
		if (tc == 0) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Vacuum Wave@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Vacuum Wave"]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimVacuumWave, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXIcyWind]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["snapshot_all"]);
			ds_queue_enqueue(animations, ["dmgmulti", "fighting", 25, noone]);
			ds_queue_enqueue(animations, ["wait", 20]);	
		}
		if (tc == 1) {
			attack010Concentrate();	
		}
	}
}

function aiFogboundKeep3() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var tc = (global.battleCurrentObj.aiID + global.turnCounter) % 2;
	
	if (tc == 0) {
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Bone Rush@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Bone Rush"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		for (var i=0; i<5; i++) {
			var tgt = randomAllyAlive();
			ds_queue_enqueue(animations, ["animpart_member", tgt, AnimBone, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXKick]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["dmgsingle_to", "ground", 15, noone, tgt]);
			ds_queue_enqueue(animations, ["wait", 15]);
		}
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (tc == 1) {
		var o1 = byAiID(1);
		var o2 = byAiID(2);
		var potency = 100;
		if (o1 == noone) potency = 100;
		else if (o2 == noone) potency = 100;
		else potency = abs(o1.curHP-o2.curHP) / 3;
		if (potency == 100) {
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["msg", "Seeing its ally fall, " + global.battleCurrentObj.combatantNameDecorated + " spirals into rage!"]);
			ds_queue_enqueue(animations, ["wait", 100]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		} else if (potency > 12) {
			potency *= 3;
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["msg", "Seeing its ally weakened, " + global.battleCurrentObj.combatantNameDecorated + " grows stronger!"]);
			ds_queue_enqueue(animations, ["wait", 100]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Resentment@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Resentment"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		
		var everyone = allAliveAllies();
		for (var i=0; i<array_length(everyone); i++) {
			ds_queue_enqueue(animations, ["animpart_member", everyone[i], AnimEat, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXStatus]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["dmgsingle_to", "none", potency, noone, everyone[i]]);
			ds_queue_enqueue(animations, ["wait", 10]);	
		}
	}
}

function aiFogboundKeep4() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var tc = (global.turnCounter) % 3;
	
	if (tc == 0) {
		var allies = randomListOfThreeAllies();
		for (var i=0; i<3; i++) {
			if (allies[i] != noone) {
				removeEffect(allies[i], "MisdirectionL"); removeEffect(allies[i], "MisdirectionR");
				removeEffect(allies[i], "MisdirectionU"); removeEffect(allies[i], "MisdirectionD");
				applyEffectSilent(allies[i], ["Misdirection" + choose("L", "R", "U", "D"), 999]);
			}
		}
	
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Misdirection@0!"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snd", FightSFXMultiEff]);
		ds_queue_enqueue(animations, ["msg", "@1Misdirection@0 was applied!"]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Triple Threat@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["call", aiFogboundKeep4Callback1]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (tc == 1) {
		setLastBlow("Triple Threat");
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Triple Threat@0!"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["rmmarkers_all"]);
		
		var everyone = allAllies();
		for (var i=0; i<array_length(everyone); i++) {
			var offsx = 0;
			var offsy = 0;
			if (hasStatus(everyone[i], "MisdirectionL")) offsx += -140;
			if (hasStatus(everyone[i], "MisdirectionR")) offsx += 140;
			if (hasStatus(everyone[i], "MisdirectionU")) offsy += -140;
			if (hasStatus(everyone[i], "MisdirectionD")) offsy += 140;
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", everyone[i].x + offsx, everyone[i].y + offsy, 0, 0, 170, 0, 0]
			]]);
			ds_queue_enqueue(animations, ["rmmarkers", everyone[i]]);
			ds_queue_enqueue(animations, ["snd", FightSFX5Hit]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgmulti", "normal", 30, ["VulnerabilityUp", 1]]);
			ds_queue_enqueue(animations, ["wait", 15]);
		}
			
		ds_queue_enqueue(animations, ["wait", 20]);
			
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Triple Cross@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		var allies = allAllies();
		for (var i=0; i<array_length(allies); i++) {
			var tele = [];
			var xx = allies[i].x;
			var yy = allies[i].y;
			array_push(tele, ["line", xx, yy, 0, 0, 600, 40, 45+0]);
			array_push(tele, ["line", xx, yy, 0, 0, 600, 40, 45+90]);
			array_push(tele, ["line", xx, yy, 0, 0, 600, 40, 45+90+90]);
			array_push(tele, ["line", xx, yy, 0, 0, 600, 40, 45+90+90+90]);
			ds_queue_enqueue(animations, ["mktelegraph", tele]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["rmtelegraph", tele]);
			ds_queue_enqueue(animations, ["wait", 10]);
		}
		ds_queue_enqueue(animations, ["wait", 85]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (tc == 2) {
		setLastBlow("Triple Cross");
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Triple Cross@0!"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["rmmarkers_all"]);
		
		var everyone = allAllies();
		for (var i=0; i<array_length(everyone); i++) {
			var offsx = 0;
			var offsy = 0;
			if (hasStatus(everyone[i], "MisdirectionL")) offsx += -140;
			if (hasStatus(everyone[i], "MisdirectionR")) offsx += 140;
			if (hasStatus(everyone[i], "MisdirectionU")) offsy += -140;
			if (hasStatus(everyone[i], "MisdirectionD")) offsy += 140;
			var tele = [];
			array_push(tele, ["line", everyone[i].x + offsx, everyone[i].y + offsy, 0, 0, 600, 40, 45+0]);
			array_push(tele, ["line", everyone[i].x + offsx, everyone[i].y + offsy, 0, 0, 600, 40, 45+90]);
			array_push(tele, ["line", everyone[i].x + offsx, everyone[i].y + offsy, 0, 0, 600, 40, 45+90+90]);
			array_push(tele, ["line", everyone[i].x + offsx, everyone[i].y + offsy, 0, 0, 600, 40, 45+90+90+90]);
			ds_queue_enqueue(animations, ["mktelegraph", tele]);
			ds_queue_enqueue(animations, ["snd", FightSFX5Hit]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgmulti", "normal", 50, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 15]);
		}
	}
}

function aiFogboundKeep4Callback1() {
	with (BattleObject) {
		if (alliance) {
			markerAlpha = 0;
			markerAlphaExcess = 2;
			radiusMarker = 170;
			personalMarker = MARKER_SPREAD;
			markerOwner = global.battleCurrentObj.id;
		}
	}
}