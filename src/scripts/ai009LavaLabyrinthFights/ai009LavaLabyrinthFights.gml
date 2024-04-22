// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ai009LavaLabyrinthFights(){

}

function aiLavaLabyrinth1() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var tc = global.turnCounter % 3;
	if (tc == 0) {
		var allies = randomListOfAllies();
		for (var i=0; i<3; i++) {
			removeEffect(allies[i % array_length(allies)], "InfernalClose");
			removeEffect(allies[i % array_length(allies)], "InfernalFar");
			removeEffect(allies[i % array_length(allies)], "InfernalTarget");
		}
		applyEffectSilent(allies[0 % array_length(allies)], ["InfernalClose", 999]);
		applyEffectSilent(allies[1 % array_length(allies)], ["InfernalFar", 999]);
		applyEffectSilent(allies[2 % array_length(allies)], ["InfernalTarget", 999]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Infernal Chains@0!"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snd", FightSFXMultiEff]);
		ds_queue_enqueue(animations, ["msg", "@1Infernal Chains@0 went into effect!"]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);	
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Heat Wave@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (tc == 1) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Heat Wave@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Heat Wave"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["spawn", BattlePartHeatWave, 0, 0]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["snd", FightSFXHeatWave]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["snapshot_all"]);
		ds_queue_enqueue(animations, ["dmgmulti", "fire", 25, noone]);
		ds_queue_enqueue(animations, ["wait", 20]);	
		
		global.battleTargetObj2 = randomAllyAlive();
		global.battleTargetObj = global.battleTargetObj2;
		var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y-20, global.battleTargetObj.x, global.battleTargetObj.y);
			
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Hyper Beam@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["mktelegraph", [
			["line", global.battleCurrentObj.x, global.battleCurrentObj.y-20, 0, 0, 500, 50, dr]
		]]);
		ds_queue_enqueue(animations, ["call", aiMysticHighland1Callback1]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (tc == 2) {
		global.battleTargetObj = global.battleTargetObj2;
		var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y-20, global.battleTargetObj.x, global.battleTargetObj.y);
			
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Hyper Beam@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Hyper Beam"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["spawn", BattlePartHyperBeam, global.battleCurrentObj.x, global.battleCurrentObj.y]);
		ds_queue_enqueue(animations, ["wait", 110]);
		ds_queue_enqueue(animations, ["mktelegraph", [
			["line", global.battleCurrentObj.x, global.battleCurrentObj.y-20, 0, 0, 500, 35, dr]
		]]);
		ds_queue_enqueue(animations, ["rmmarkers", BattleObject]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["dmgmultishared", "normal", 150, noone]);
		ds_queue_enqueue(animations, ["wait", 15]);
		
		with (BattleObject) removeEffect(self, "Prey");	
	}
}

function aiLavaLabyrinth2() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var tc = global.turnCounter % 2;
	if (tc == 0) {
		var m1 = choose(0, 1);
		global.battleTargetObj = randomAllyAliveProvokable();
		if (m1 == 0) {
			attack020Flamethrower();
		}
		if (m1 == 1) {
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
			ds_queue_enqueue(animations, ["wait", 30]);	
		}
		global.battleCurrentObj.stock = choose(0, 1);
		if (global.battleCurrentObj.stock == 0) {
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Inner Fire@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 120, 0, 0]
			]]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		} else {
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Thrown Flames@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["mktelegraph", [
				["donut", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 130, 0]
			]]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
	if (tc == 1) {
		if (global.battleCurrentObj.stock == 0) {
			var tele = [["circle", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 130, 0, 0]];
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Inner Fire@0."]);
			ds_queue_enqueue(animations, ["lastblow", "Inner Fire"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["mktelegraph", tele]);
			ds_queue_enqueue(animations, ["snd", FightSFXBurn]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["dmgmulti", "fire", 50, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 20]);
		} else {
			var tele = [["donut", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 120, 0]];
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Thrown Flames@0."]);
			ds_queue_enqueue(animations, ["lastblow", "Thrown Flames"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["mktelegraph", tele]);
			ds_queue_enqueue(animations, ["snd", FightSFXBurn]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["dmgmulti", "fire", 50, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
}

function aiLavaLabyrinth3() {
	if (global.battleCurrentObj.curHP <= 0) return;
	var tc = global.turnCounter % 4;
	
	if (global.battleCurrentObj.species == "0136") {
		if (tc == 0) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Eruption@0."]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " takes aim!"]);
			global.battleTargetChoices = allAllies();
			var lcScripts = [aiLavaLabyrinth3LC1, aiLavaLabyrinth3LC2, aiLavaLabyrinth3LC3];
			for (var i=0; i<3; i++) {
				if (i >= array_length(global.battleTargetChoices)) continue;
				removeEffect(global.battleTargetChoices[i], "Line1");
				removeEffect(global.battleTargetChoices[i], "Line2");
				removeEffect(global.battleTargetChoices[i], "Line3");
				applyEffectSilent(global.battleTargetChoices[i], ["Line" + string(i+1), 999])
				ds_queue_enqueue(animations, ["snd", FightSFXLC]);
				ds_queue_enqueue(animations, ["callarg", lcScripts[i], global.battleTargetChoices[i]]);
				ds_queue_enqueue(animations, ["wait", 40]);
			}
			ds_queue_enqueue(animations, ["wait", 40]);
			ds_queue_enqueue(animations, ["rmmarkers_all"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);	
		} else {
			var which = allyWithEffect("Line" + string(tc));
			if (which == noone) which = randomAlly();
			if (which.curHP <= 0) which = randomAllyAlive();
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Eruption@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Eruption"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", which.x, which.y, 0, 0, 120, 0, 0]
			]]);
			ds_queue_enqueue(animations, ["snd", FightSFXEarth1]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgmulti", "fire", 50, ["VulnerabilityUp", 1]]);
			ds_queue_enqueue(animations, ["wait", 15]);
		}
	}
	
	if (global.battleCurrentObj.species == "0256") {
		if (tc == 0) {
			global.battleCurrentObj.stock = choose(0, 1);
			if (global.battleCurrentObj.stock == 0) {
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Nearsight@0!"]);
				ds_queue_enqueue(animations, ["wait", 30]);
				ds_queue_enqueue(animations, ["nomsg"]);
				ds_queue_enqueue(animations, ["anim_spin", -1]);
				ds_queue_enqueue(animations, ["snd", FightSFXUse]);
				ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
				ds_queue_enqueue(animations, ["wait", 20]);
				ds_queue_enqueue(animations, ["snd", FightSFXMultiEff]);
				ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is focusing on @2near targets@0!"]);
				ds_queue_enqueue(animations, ["wait", 130]);
				ds_queue_enqueue(animations, ["nomsg"]);	
				ds_queue_enqueue(animations, ["wait", 15]);
			} else {
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Farsight@0!"]);
				ds_queue_enqueue(animations, ["wait", 30]);
				ds_queue_enqueue(animations, ["nomsg"]);
				ds_queue_enqueue(animations, ["anim_spin", -1]);
				ds_queue_enqueue(animations, ["snd", FightSFXUse]);
				ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
				ds_queue_enqueue(animations, ["wait", 20]);
				ds_queue_enqueue(animations, ["snd", FightSFXMultiEff]);
				ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is focusing on @2far targets@0!"]);
				ds_queue_enqueue(animations, ["wait", 130]);
				ds_queue_enqueue(animations, ["nomsg"]);	
				ds_queue_enqueue(animations, ["wait", 15]);
			}
		} else {
			var which;
			if (global.battleCurrentObj.stock == 0) {
				which = allyNthNearestAlive(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
			} else {
				which = allyNthFurthestAlive(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
			}
			global.battleTargetObj = which;
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Blaze Kick@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Blaze Kick"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimBlazeKick, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXBlazeKick]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["dmgsingle", "fire", 50, ["VulnerabilityUp", 1]]);
			ds_queue_enqueue(animations, ["wait", 45]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
}
function aiLavaLabyrinth3LC1(oo) {
	oo.markerAlpha = 0;
	oo.markerAlphaExcess = 2;
	oo.personalMarker = MARKER_LC1;
	oo.markerOwner = global.battleCurrentObj.id;	
}
function aiLavaLabyrinth3LC2(oo) {
	oo.markerAlpha = 0;
	oo.markerAlphaExcess = 2;
	oo.personalMarker = MARKER_LC2;
	oo.markerOwner = global.battleCurrentObj.id;	
}
function aiLavaLabyrinth3LC3(oo) {
	oo.markerAlpha = 0;
	oo.markerAlphaExcess = 2;
	oo.personalMarker = MARKER_LC3;
	oo.markerOwner = global.battleCurrentObj.id;	
}