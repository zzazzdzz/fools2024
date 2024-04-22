// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ai011KeepGDFights(){

}

function aiKeepGD1() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	if (global.battleCurrentObj.species == "0309") {
		global.battleTargetObj = randomAllyAliveProvokable();
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Thunderbolt@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Thunderbolt"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimEle1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXEle1]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgsingle", "electric", 40, noone]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.battleCurrentObj.species == "0310") {
		var tc = global.turnCounter % 2;
		if (tc == 0) {
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Charge@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["anim", -1, "Shock", 0]);
			ds_queue_enqueue(animations, ["snd", FightSFXEle4]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["snd", FightSFXIncrSpDef]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimHarden, 1]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["apply_effect", -1, ["Charged", 2]]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is charged!"]);
			ds_queue_enqueue(animations, ["wait", 80]);
			ds_queue_enqueue(animations, ["nomsg"]);
		}
		if (tc == 1) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Discharge@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Discharge"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			var everyone = allAliveAllies();
			for (var i=0; i<array_length(everyone); i++) {
				ds_queue_enqueue(animations, ["snd", FightSFXDischarge]);
				ds_queue_enqueue(animations, ["animpart_member", everyone[i], AnimEle2, 1]);
				ds_queue_enqueue(animations, ["wait", 15]);
				ds_queue_enqueue(animations, ["dmgsingle_to", "electric", 50, noone, everyone[i]]);
				ds_queue_enqueue(animations, ["wait", 10]);
			}
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
}

function aiKeepGD2() {
	if (global.battleCurrentObj.curHP <= 0) return;
	var tc = global.turnCounter % 2;
	
	if (global.battleCurrentObj.species == "0405") {
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
			
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Triple Shock Wave@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			var allies = allAllies();
			for (var i=0; i<array_length(allies); i++) {
				var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y, allies[i].x, allies[i].y);
				var tele = [];
				var xx = global.battleCurrentObj.x;
				var yy = global.battleCurrentObj.y;
				array_push(tele, ["cone", xx, yy, 0, 0, 600, 1000, dr]);
				ds_queue_enqueue(animations, ["mktelegraph", tele]);
				ds_queue_enqueue(animations, ["callarg", aiLabyrinthMoltresPlaceSpreadMarker2, allies[i]]);
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["rmtelegraph", tele]);
				ds_queue_enqueue(animations, ["wait", 10]);
			}
			ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (tc == 1) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Triple Shock Wave@0."]);
			ds_queue_enqueue(animations, ["lastblow", "Triple Shock Wave"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 20]);
			var allies = allAllies();
			for (var i=0; i<array_length(allies); i++) {
				var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y, allies[i].x, allies[i].y);
				var tele = [];
				var xx = global.battleCurrentObj.x;
				var yy = global.battleCurrentObj.y;
				ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
				array_push(tele, ["cone", xx, yy, 0, 0, 600, 1000, dr]);
				ds_queue_enqueue(animations, ["mktelegraph", tele]);
				ds_queue_enqueue(animations, ["snd", FightSFXEle2]);
				ds_queue_enqueue(animations, ["rmmarkers", allies[i]]);
				ds_queue_enqueue(animations, ["wait", 10])
				ds_queue_enqueue(animations, ["snapshot"]);
				ds_queue_enqueue(animations, ["rmtelegraph", tele]);
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["dmgmulti", "electric", 50, ["VulnerabilityUp", 1]]);
			}
			ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
	
	if (global.battleCurrentObj.species == "0125") {
		if (tc == 0) {
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Thunder@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Thunder"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["nomsg"]);
			for (var i=0; i<5; i++) {
				var rx = irandom_range(global.battleCurrentObj.x - 120, global.battleCurrentObj.x + 120);
				var ry = irandom_range(global.battleCurrentObj.x - 120, global.battleCurrentObj.x + 120);
				ds_queue_enqueue(animations, ["animpart_coord", [rx, ry], AnimEle3, 1]);
				ds_queue_enqueue(animations, ["snd", FightSFXEle3]);
				ds_queue_enqueue(animations, ["mktelegraph", [["circle", rx, ry, 0, 0, 80, 0, 0]]]);
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["snapshot"]);
				ds_queue_enqueue(animations, ["rmtelegraph"]);
				ds_queue_enqueue(animations, ["wait", 15]);
				ds_queue_enqueue(animations, ["dmgmulti", "electric", 35, noone]);
				ds_queue_enqueue(animations, ["wait", 15]);
			}
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			global.battleCurrentObj.stock = choose(0, 1);
			if (global.battleCurrentObj.stock == 0) {
				ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Small Charge@0."]);
				ds_queue_enqueue(animations, ["wait", 15]);
				ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
				ds_queue_enqueue(animations, ["mktelegraph", [
					["circle", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 150, 0, 0]
				]]);
				ds_queue_enqueue(animations, ["wait", 60]);
				ds_queue_enqueue(animations, ["nomsg"]);
				ds_queue_enqueue(animations, ["rmtelegraph"]);
				ds_queue_enqueue(animations, ["wait", 20]);
			} else {
				ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Large Charge@0."]);
				ds_queue_enqueue(animations, ["wait", 15]);
				ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
				ds_queue_enqueue(animations, ["mktelegraph", [
					["donut", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 160, 0]
				]]);
				ds_queue_enqueue(animations, ["wait", 60]);
				ds_queue_enqueue(animations, ["nomsg"]);
				ds_queue_enqueue(animations, ["rmtelegraph"]);
				ds_queue_enqueue(animations, ["wait", 20]);
			}
		}
		if (tc == 1) {
			if (global.battleCurrentObj.stock == 0) {
				var tele = [["circle", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 150, 0, 0]];
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Small Charge@0."]);
				ds_queue_enqueue(animations, ["lastblow", "Small Charge"]);
				ds_queue_enqueue(animations, ["wait", 15]);
				ds_queue_enqueue(animations, ["anim_spin", -1]);
				ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
				ds_queue_enqueue(animations, ["snd", FightSFXUse]);
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["nomsg"]);
				ds_queue_enqueue(animations, ["mktelegraph", tele]);
				ds_queue_enqueue(animations, ["snd", FightSFXEle1]);
				ds_queue_enqueue(animations, ["wait", 25]);
				ds_queue_enqueue(animations, ["snapshot"]);
				ds_queue_enqueue(animations, ["rmtelegraph"]);
				ds_queue_enqueue(animations, ["dmgmulti", "fire", 50, ["DamageDown", 3]]);
				ds_queue_enqueue(animations, ["wait", 20]);
			} else {
				var tele = [["donut", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 160, 0]];
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Large Charge@0."]);
				ds_queue_enqueue(animations, ["lastblow", "Large Charge"]);
				ds_queue_enqueue(animations, ["wait", 15]);
				ds_queue_enqueue(animations, ["anim_spin", -1]);
				ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
				ds_queue_enqueue(animations, ["snd", FightSFXUse]);
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["nomsg"]);
				ds_queue_enqueue(animations, ["mktelegraph", tele]);
				ds_queue_enqueue(animations, ["snd", FightSFXEle1]);
				ds_queue_enqueue(animations, ["wait", 25]);
				ds_queue_enqueue(animations, ["snapshot"]);
				ds_queue_enqueue(animations, ["rmtelegraph"]);
				ds_queue_enqueue(animations, ["dmgmulti", "fire", 50, ["DamageDown", 3]]);
				ds_queue_enqueue(animations, ["wait", 20]);
			}
		}
	}
}

function aiKeepGD3() {
	if (global.battleCurrentObj.curHP <= 0) return;
	var tc = global.turnCounter % 3;
	
	if (tc == 0) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Discharge@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Discharge"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		var everyone = allAliveAllies();
		for (var i=0; i<array_length(everyone); i++) {
			ds_queue_enqueue(animations, ["snd", FightSFXDischarge]);
			ds_queue_enqueue(animations, ["animpart_member", everyone[i], AnimEle2, 1]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgsingle_to", "electric", 50, noone, everyone[i]]);
			ds_queue_enqueue(animations, ["wait", 10]);
		}
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc == 1) {
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Thunder@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Thunder"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		for (var i=0; i<5; i++) {
			var rx = irandom_range(global.battleCurrentObj.x - 120, global.battleCurrentObj.x + 120);
			var ry = irandom_range(global.battleCurrentObj.x - 120, global.battleCurrentObj.x + 120);
			ds_queue_enqueue(animations, ["animpart_coord", [rx, ry], AnimEle3, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXEle3]);
			ds_queue_enqueue(animations, ["mktelegraph", [["circle", rx, ry, 0, 0, 80, 0, 0]]]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgmulti", "electric", 35, noone]);
			ds_queue_enqueue(animations, ["wait", 15]);
		}
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc == 2) {
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Body Slam@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Body Slam"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
		ds_queue_enqueue(animations, ["anim_movetarget", -1, 45]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snd", FightSFXTackle]);
		ds_queue_enqueue(animations, ["anim", -1, "Attack", 0]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["dmgsingle", "normal", 70, noone]);
		ds_queue_enqueue(animations, ["anim_moverestore", -1]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}

function aiKeepZapdosBoss() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	global.battleAllTele = [
		[
			["line", 320, 240, 0, 0, 600, 50, 0],
			["line", 320, 240, 0, 0, 600, 50, 90],
			["line", 320, 240, 0, 0, 600, 50, 180],
			["line", 320, 240, 0, 0, 600, 50, 270],
		],
		[
			["line", 320-100, 240-100, 0, 0, 600, 50, 0],
			["line", 320-100, 240-100, 0, 0, 600, 50, 90],
			["line", 320-100, 240-100, 0, 0, 600, 50, 180],
			["line", 320-100, 240-100, 0, 0, 600, 50, 270],
			["line", 320+100, 240+100, 0, 0, 600, 50, 0],
			["line", 320+100, 240+100, 0, 0, 600, 50, 90],
			["line", 320+100, 240+100, 0, 0, 600, 50, 180],
			["line", 320+100, 240+100, 0, 0, 600, 50, 270],
		],
		[
			["line", 320-200, 240-200, 0, 0, 600, 50, 0],
			["line", 320-200, 240-200, 0, 0, 600, 50, 90],
			["line", 320-200, 240-200, 0, 0, 600, 50, 180],
			["line", 320-200, 240-200, 0, 0, 600, 50, 270],
			["line", 320+200, 240+200, 0, 0, 600, 50, 0],
			["line", 320+200, 240+200, 0, 0, 600, 50, 90],
			["line", 320+200, 240+200, 0, 0, 600, 50, 180],
			["line", 320+200, 240+200, 0, 0, 600, 50, 270],
			["line", 320, 240, 0, 0, 600, 50, 0],
			["line", 320, 240, 0, 0, 600, 50, 90],
			["line", 320, 240, 0, 0, 600, 50, 180],
			["line", 320, 240, 0, 0, 600, 50, 270],
		]
	];
	
	if (global.turnCounter == 0 || global.turnCounter == 5 || global.turnCounter == 11) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Discharge@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Discharge"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		var everyone = allAliveAllies();
		for (var i=0; i<array_length(everyone); i++) {
			ds_queue_enqueue(animations, ["snd", FightSFXDischarge]);
			ds_queue_enqueue(animations, ["animpart_member", everyone[i], AnimEle2, 1]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgsingle_to", "electric", 50, noone, everyone[i]]);
			ds_queue_enqueue(animations, ["wait", 10]);
		}
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 1) {
		var tgt = randomAlly();
		applyEffectSilent(tgt, ["ChainLightning", 2]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Chain Lightning@0!"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snd", FightSFXMultiEff]);
		ds_queue_enqueue(animations, ["msg", tgt.combatantNameDecorated + " is affected by @1Chain Lightning@0."]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Electric Impulse@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		for (var i=0; i<3; i++) {
			ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele[i]]);
			ds_queue_enqueue(animations, ["wait", 40])
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			//ds_queue_enqueue(animations, ["dmgmulti", "flying", 50, ["TwiceComeRuin", 1]]);
		}
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 2) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Electric Impulse@0."]);
		ds_queue_enqueue(animations, ["lastblow", "Electric Impulse"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele[0]]);
		ds_queue_enqueue(animations, ["wait", 30])
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "electric", 50, ["DamageDown", 3]]);
		
		global.battleCurrentObj.stock = choose(0, 1);
		ds_queue_enqueue(animations, ["wait", 30]);
		if (global.battleCurrentObj.stock == 0) {
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is focusing on @2near targets@0."]);
		} else {
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is focusing on @2far targets@0."]);
		}
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 85]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 3 || global.turnCounter == 4) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + "'s @1Electric Impulse@0 continues!"]);
		ds_queue_enqueue(animations, ["lastblow", "Electric Impulse"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele[global.turnCounter-2]]);
		ds_queue_enqueue(animations, ["wait", 30])
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "electric", 50, ["DamageDown", 3]]);
		
		var which;
		if (global.battleCurrentObj.stock == 0) {
			which = allyNthNearest(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
		} else {
			which = allyNthFurthest(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
		}
		global.battleTargetObj = which;
		var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y, global.battleTargetObj.x, global.battleTargetObj.y);
		var tele = [];
		var xx = global.battleCurrentObj.x;
		var yy = global.battleCurrentObj.y;
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Shock Wave@0."]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["lastblow", "Shock Wave"]);
		ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
		array_push(tele, ["cone", xx, yy, 0, 0, 600, 1000, dr]);
		ds_queue_enqueue(animations, ["mktelegraph", tele]);
		ds_queue_enqueue(animations, ["snd", FightSFXEle2]);
		ds_queue_enqueue(animations, ["wait", 10])
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph", tele]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "electric", 50, ["TwiceComeRuin", 1]]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
	}
	if (global.turnCounter == 6) {
		var tgt = allAllies();
		for (var i=0; i<array_length(tgt); i++) {
			applyEffectSilent(tgt[i], ["ElectricTerrain", 5]);
		}
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Electric Terrain@0!"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snd", FightSFXMagnet]);
		ds_queue_enqueue(animations, ["msg", "Allies were affected by @1Electric Terrain@0."]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Electric Impulse@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		var ii = [1,2,1];
		for (var i=0; i<3; i++) {
			ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele[ii[i]]]);
			ds_queue_enqueue(animations, ["wait", 40])
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			//ds_queue_enqueue(animations, ["dmgmulti", "flying", 50, ["TwiceComeRuin", 1]]);
		}
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 7) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Electric Impulse@0."]);
		ds_queue_enqueue(animations, ["lastblow", "Electric Impulse"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele[1]]);
		ds_queue_enqueue(animations, ["wait", 30])
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "electric", 50, ["DamageDown", 3]]);
	}
	if (global.turnCounter == 8) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + "'s @1Electric Impulse@0 continues!"]);
		ds_queue_enqueue(animations, ["lastblow", "Electric Impulse"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele[2]]);
		ds_queue_enqueue(animations, ["wait", 30])
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "electric", 50, ["DamageDown", 3]]);
		
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Thunder@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Thunder"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		for (var i=0; i<5; i++) {
			var rx = irandom_range(global.battleCurrentObj.x - 120, global.battleCurrentObj.x + 120);
			var ry = irandom_range(global.battleCurrentObj.x - 120, global.battleCurrentObj.x + 120);
			ds_queue_enqueue(animations, ["animpart_coord", [rx, ry], AnimEle3, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXEle3]);
			ds_queue_enqueue(animations, ["mktelegraph", [["circle", rx, ry, 0, 0, 80, 0, 0]]]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgmulti", "electric", 35, noone]);
			ds_queue_enqueue(animations, ["wait", 15]);
		}
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 9) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + "'s @1Electric Impulse@0 continues!"]);
		ds_queue_enqueue(animations, ["lastblow", "Electric Impulse"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele[1]]);
		ds_queue_enqueue(animations, ["wait", 30])
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "electric", 50, ["DamageDown", 3]]);
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Air Cutter@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		var allies = allAllies();
		for (var i=0; i<array_length(allies); i++) {
			var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y, allies[i].x, allies[i].y);
			var tele = [];
			var xx = global.battleCurrentObj.x;
			var yy = global.battleCurrentObj.y;
			array_push(tele, ["cone", xx, yy, 0, 0, 600, 800, dr]);
			ds_queue_enqueue(animations, ["mktelegraph", tele]);
			ds_queue_enqueue(animations, ["callarg", aiLabyrinthMoltresPlaceSpreadMarker2, allies[i]]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["rmtelegraph", tele]);
			ds_queue_enqueue(animations, ["wait", 10]);
		}
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 10) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Air Cutter@0."]);
		ds_queue_enqueue(animations, ["lastblow", "Air Cutter"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		var allies = allAllies();
		for (var i=0; i<array_length(allies); i++) {
			var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y, allies[i].x, allies[i].y);
			var tele = [];
			var xx = global.battleCurrentObj.x;
			var yy = global.battleCurrentObj.y;
			ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
			array_push(tele, ["cone", xx, yy, 0, 0, 600, 800, dr]);
			ds_queue_enqueue(animations, ["mktelegraph", tele]);
			ds_queue_enqueue(animations, ["snd", FightSFXAce]);
			ds_queue_enqueue(animations, ["rmmarkers", allies[i]]);
			ds_queue_enqueue(animations, ["wait", 10])
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph", tele]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["dmgmulti", "flying", 50, ["PhysVuln", 1]]);
		}
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		global.battleCurrentObj.stock = choose(0, 1);
		ds_queue_enqueue(animations, ["wait", 30]);
		if (global.battleCurrentObj.stock == 0) {
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is focusing on @2near targets@0."]);
		} else {
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is focusing on @2far targets@0."]);
		}
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 85]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 12 || global.turnCounter == 13 || global.turnCounter == 14) {
		var which;
		if (global.battleCurrentObj.stock == 0) {
			which = allyNthNearestAlive(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
		} else {
			which = allyNthFurthestAlive(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
		}
		global.battleTargetObj = which;
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Drill Peck@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Bite"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimDrillPeck, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXDrill]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 12]);
		ds_queue_enqueue(animations, ["dmgsingle", "flying", 50, ["PhysVuln", 4]]);
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		
		if (global.turnCounter == 12 || global.turnCounter == 13) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Drill Peck@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
	if (global.turnCounter == 15) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is enraged!"]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter >= 16) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Discharge@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Discharge"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		var everyone = allAliveAllies();
		for (var i=0; i<array_length(everyone); i++) {
			ds_queue_enqueue(animations, ["snd", FightSFXDischarge]);
			ds_queue_enqueue(animations, ["animpart_member", everyone[i], AnimEle2, 1]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgsingle_to", "electric", 99999, noone, everyone[i]]);
			ds_queue_enqueue(animations, ["wait", 10]);
		}
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}

function effectChainLightning(t) {
	if (t == 0) {
		BattleController.alarm[0] = 10;
		global.battleCurrentObj = randomEnemy();
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s @7Chain Lightning@0 takes effect!"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["snd", FightSFXEle2]);
		ds_queue_enqueue(animations, ["mktelegraphq", [
			["circle", global.battleTargetObj.x, global.battleTargetObj.y, 0, 0, 100, 0, 0]
		]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshotq"]);
		ds_queue_enqueue(animations, ["rmtelegraphq"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "electric", 25, noone]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		var passCandidates = allAlliesInCircle(global.battleTargetObj.x, global.battleTargetObj.y, 100);
		var passed = false;
		for (var i=0; i<array_length(passCandidates); i++) {
			if (!hasStatus(passCandidates[i], "ChainLightning")) {
				passed = true;
				applyEffectQueue(passCandidates[i], ["ChainLightning", 1]);
			}
		}
		
		if (!passed) {
			ds_queue_enqueue(animations, ["msg", "The lightning spreads across the ground!"]);
			ds_queue_enqueue(animations, ["animpart_coord", [global.battleTargetObj.x-50, global.battleTargetObj.y-50], AnimEle3, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXEle2]);
			ds_queue_enqueue(animations, ["wait", 8]);
			ds_queue_enqueue(animations, ["animpart_coord", [global.battleTargetObj.x+50, global.battleTargetObj.y-50], AnimEle3, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXEle2]);
			ds_queue_enqueue(animations, ["wait", 8]);
			ds_queue_enqueue(animations, ["animpart_coord", [global.battleTargetObj.x, global.battleTargetObj.y+50], AnimEle3, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXEle2]);
			ds_queue_enqueue(animations, ["wait", 8]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snapshot_all"]);
			ds_queue_enqueue(animations, ["dmgmulti", "electric", 50, ["DamageDown", 8, 1]]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
		}
	}
}

function effectCharge(t) {
	BattleController.alarm[0] = 10;
	global.battleCurrentObj = randomEnemy();
	if (global.battleTargetObj.movedDist > 1) {
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s charge is released!"]);
		ds_queue_enqueue(animations, ["wait", 35]);
		ds_queue_enqueue(animations, ["nomsg"]);
		var potency = (max(120, global.battleTargetObj.movedDist)-120)*2 + 10;
		ds_queue_enqueue(animations, ["dmgsingle_to", "none", potency, noone, global.battleTargetObj]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	} else {
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + " had no charge buildup."]);
		ds_queue_enqueue(animations, ["wait", 75]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}

function aiKeepZapdosBossIntro() {
	if (global.turnCounter == 0) {
		audio_stop_all();
		global.musicIndex = 16;
		global.musicControl = MUS_PLAY;
	}	
}