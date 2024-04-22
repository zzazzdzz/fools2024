// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ai010LabyrinthGDFights(){

}

function aiLabyrinthGD1() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	if (global.battleCurrentObj.species == "0093") {
		var move = choose(1, 2);
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
		} else {
			global.battleTargetObj = randomAllyAliveProvokable();
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Feint Attack@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Feint Attack"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimFeint, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXFeint]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["dmgsingle", "dark", 40, noone]);
			ds_queue_enqueue(animations, ["wait", 20]);	
		}
	} else {
		var tc = global.turnCounter % 2;
		if (tc == 0) {
			global.battleTargetObj = randomAllyAlive();
			var decr = global.battleTargetObj.curPP div 3;
			if (decr <= 20) decr = 0;
			global.battleTargetObj.curPP -= decr;
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Spite@0!"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimSpite, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXSpite]);
			ds_queue_enqueue(animations, ["wait", 10]);
			if (decr == 0) {
				ds_queue_enqueue(animations, ["msg", "But nothing happened!"]);
			} else {
				ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + " lost " + string(decr) + " PP!"]);
			}
			ds_queue_enqueue(animations, ["wait", 70]);	
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 15]);
		} else {
			global.battleTargetObj = randomAllyAliveProvokable();
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Shadow Ball@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Shadow Ball"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimShadowBall, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXSwift]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["dmgsingle", "ghost", 60, noone]);
			ds_queue_enqueue(animations, ["wait", 20]);	
		}
	}
}

function aiLabyrinthGD2() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var tc = global.turnCounter % 3;
	
	if (tc == 0) {
		global.battleTargetObj = randomAllyAliveProvokable();
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Shadow Ball@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Shadow Ball"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimShadowBall, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXSwift]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgsingle", "ghost", 60, noone]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		var rnd = randomAllyAlive();
		global.battleTargetChoices = [
			[irandom_range(100,540), irandom_range(100,380)],
			[irandom_range(100,540), irandom_range(100,380)],
			[rnd.x + irandom_range(1, 70), rnd.y + irandom_range(1, 70)],
			[irandom_range(100,540), irandom_range(100,380)],
		];
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Phantom Strike@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		for (var i=0; i<4; i++) {
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", global.battleTargetChoices[i][0], global.battleTargetChoices[i][1], 0, 0, 120, 0, 0]
			]]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 15]);
		}
		ds_queue_enqueue(animations, ["wait", 15]);
	}
	if (tc == 1) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Phantom Strike@0."]);
		ds_queue_enqueue(animations, ["lastblow", "Phantom Strike"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		for (var i=0; i<4; i++) {
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", global.battleTargetChoices[i][0], global.battleTargetChoices[i][1], 0, 0, 120, 0, 0]
			]]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["dmgmulti", "ghost", 40, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 15]);
		}
		ds_queue_enqueue(animations, ["wait", 15]);
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Phantom Star@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		var everyone = allAllies();
		for (var i=0; i<array_length(everyone); i++) {
			var tele = [];
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 45+0]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 45+90]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 45+90+90]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 45+90+90+90]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 0]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 90]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 90+90]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 90+90+90]);
			ds_queue_enqueue(animations, ["mktelegraph", tele]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 15]);
		}
		ds_queue_enqueue(animations, ["wait", 15]);
	}
	if (tc == 2) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Phantom Star@0."]);
		ds_queue_enqueue(animations, ["lastblow", "Phantom Star"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		var everyone = allAllies();
		for (var i=0; i<array_length(everyone); i++) {
			var tele = [];
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 45+0]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 45+90]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 45+90+90]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 45+90+90+90]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 0]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 90]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 90+90]);
			array_push(tele, ["line", everyone[i].x, everyone[i].y, 0, 0, 600, 30, 90+90+90]);
			ds_queue_enqueue(animations, ["mktelegraph", tele]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["dmgmulti", "ghost", 40, ["VulnerabilityUp", 1]]);
			ds_queue_enqueue(animations, ["wait", 15]);
		}
		ds_queue_enqueue(animations, ["wait", 15]);
	}
}

function aiLabyrinthGD3() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	if (global.battleCurrentObj.species == "0200") {
		if (global.turnCounter == 0) {
			var allies = allThreeAliveAllies();
			if (allies[0] != noone) applyEffectSilent(allies[0], ["HealBlock", 5]);
			if (allies[1] != noone) applyEffectSilent(allies[1], ["HealBlock", 5]);
			if (allies[2] != noone) applyEffectSilent(allies[2], ["HealBlock", 5]);
		
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Heal Block@0!"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["snd", FightSFXMultiEff]);
			ds_queue_enqueue(animations, ["msg", "Effectiveness of healing was greatly reduced!"]);
			ds_queue_enqueue(animations, ["wait", 80]);
			ds_queue_enqueue(animations, ["nomsg"]);
		} else {
			global.battleTargetObj = randomAllyAliveProvokable();
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Confusion@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Confusion"]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["spawn", BattlePartConfusion, 0, 0]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["snd", FightSFXConfusion]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgsingle", "psychic", 35, noone]);
			ds_queue_enqueue(animations, ["wait", 20]);		
		}
	}
	if (global.battleCurrentObj.species == "0472") {
		var tc = global.turnCounter % 2;
		if (tc == 0) {
			global.battleTargetObj = randomAllyAliveProvokable();
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Aerial Ace@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Aerial Ace"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimAce, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXAce]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["dmgsingle", "flying", 50, noone]);
			ds_queue_enqueue(animations, ["wait", 45]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (tc == 1) {
			attack010Concentrate();
		}
	}
}

function aiLabyrinthDelirianBoss() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var haircuts = [
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 800, 0],
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 800, 45],
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 800, 90],
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 800, 90+45],
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 800, 90+90],
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 800, 90+90+45],
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 800, 90+90+90],
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 800, 90+90+90+45],
	];
	
	if (global.turnCounter == 0) {
		ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
\c46B\c30here it is..\d30 time to SHINE !!\d30
i will WIN !!\d30 yaYA!\c46A\c00\d50 \c00
		"), noone]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		
		ds_queue_enqueue(animations, ["wait", 20]);
		global.battleCurrentObj.stock = choose(0, 1);
		global.battleCurrentObj.facingStock = choose(FACING_D, FACING_DL, FACING_DR);		
		if (global.battleCurrentObj.stock == 0) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Left Pummel@0."]);
			ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleCurrentObj.facingStock]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 85]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
			ds_queue_enqueue(animations, ["wait", 20]);
		} else {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Right Pummel@0."]);
			ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleCurrentObj.facingStock]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 85]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
	if (global.turnCounter == 1) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1" + (global.battleCurrentObj.stock == 0 ? "Left" : "Right") + " Pummel@0!"]);
		ds_queue_enqueue(animations, ["lastblow", (global.battleCurrentObj.stock == 0 ? "Left" : "Right") + " Pummel"]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleCurrentObj.facingStock]);
		ds_queue_enqueue(animations, ["mktelegraph", [haircuts[(global.battleCurrentObj.facingStock + global.battleCurrentObj.stock * 4) % 8]]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 100, ["DamageDown", 3]]);
		
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
\c46B\c30ay ayo!\d30 do i tell truth ?\d30
you NEVER know !!\c46A\c00\d50 \c00
		"), noone]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		
		ds_queue_enqueue(animations, ["wait", 20]);
		global.battleCurrentObj.stock = choose("Fake ", "True ");
		global.battleCurrentObj.stock += choose("Left", "Right") + " Pummel";
		global.battleCurrentObj.facingStock = choose(FACING_D, FACING_DL, FACING_DR);	
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1" + global.battleCurrentObj.stock + "@0."]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleCurrentObj.facingStock]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 110]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 2) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1" + global.battleCurrentObj.stock + "@0!"]);
		ds_queue_enqueue(animations, ["lastblow", global.battleCurrentObj.stock]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleCurrentObj.facingStock]);
		ds_queue_enqueue(animations, ["mktelegraph", [haircuts[haircutFacingFromName(global.battleCurrentObj.stock, global.battleCurrentObj.facingStock)]]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 100, ["DamageDown", 3]]);
	}
	if (global.turnCounter == 3) {
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
\c46B\c30uawawa..\d30 u strong !\d30
will need too ... call friends !!\c46A\c00\d50 \c00
		"), noone]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Summon@0!"]);
		ds_queue_enqueue(animations, ["wait", 35]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["fadetowhite"]);
		ds_queue_enqueue(animations, ["snd", FightSFXWind3]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["call", aiLabyrinthDelirianBoss_PlaceClones1]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["fadefromwhite"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["msg", "Friends were called upon!"]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 4) {		
		var cc = choose("Left Pummel", "Right Pummel");
		global.battleCurrentObj.stock = [
			choose("Left Pummel", "Right Pummel"),
			cc,
			cc == "Left Pummel" ? "Right Pummel" : "Left Pummel"
		];
		
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1" + global.battleCurrentObj.stock[0] + "@0."]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["call", aiLabyrinthDelirianBoss_CloneHop1]);
		ds_queue_enqueue(animations, ["wait", 50]);
		ds_queue_enqueue(animations, ["msg", "@2Mew's Clone@0 readies @1" + global.battleCurrentObj.stock[1] + "@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);		
		
		ds_queue_enqueue(animations, ["call", aiLabyrinthDelirianBoss_CloneHop2]);
		ds_queue_enqueue(animations, ["wait", 50]);
		ds_queue_enqueue(animations, ["msg", "@2Mew's Clone@0 readies @1" + global.battleCurrentObj.stock[2] + "@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);		
	}
	if (global.turnCounter == 5) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1" + global.battleCurrentObj.stock[0] + "@0!"]);
		ds_queue_enqueue(animations, ["lastblow", global.battleCurrentObj.stock[0]]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		var dd = haircutFacingFromName(global.battleCurrentObj.stock[0], FACING_D);
		ds_queue_enqueue(animations, ["mktelegraph", [haircutFrom(global.battleCurrentObj.x, global.battleCurrentObj.y, dd)]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 100, ["DamageDown", 3]]);
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1" + global.battleCurrentObj.stock[1] + "@0!"]);
		ds_queue_enqueue(animations, ["lastblow", global.battleCurrentObj.stock[1]]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_coord", [100, 100], AnimGeneric1, 1]);
		var dd = haircutFacingFromName(global.battleCurrentObj.stock[1], FACING_DR);
		ds_queue_enqueue(animations, ["mktelegraph", [haircutFrom(100, 100, dd)]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 100, ["DamageDown", 3]]);
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1" + global.battleCurrentObj.stock[2] + "@0!"]);
		ds_queue_enqueue(animations, ["lastblow", global.battleCurrentObj.stock[2]]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_coord", [640-100, 100], AnimGeneric1, 1]);
		var dd = haircutFacingFromName(global.battleCurrentObj.stock[2], FACING_DL);
		ds_queue_enqueue(animations, ["mktelegraph", [haircutFrom(640-100, 100, dd)]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 100, ["DamageDown", 3]]);
	}
	if (global.turnCounter == 6) {
		ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
\c46B\c30GO MY FRIENDS !\d30
we .. STRIKE!\d30 uhahahah !!\c46A\c00\d50 \c00
		"), noone]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		global.battleCurrentObj.stock = ["", "", ""];
		global.battleCurrentObj.stock[1] += choose("Fake ", "True ");
		global.battleCurrentObj.stock[1] += choose("Fake ", "True ");
		global.battleCurrentObj.stock[2] += choose("Fake ", "True ");
		global.battleCurrentObj.stock[2] += choose("Fake ", "True ");
		global.battleCurrentObj.stock[1] += choose("Left", "Right") + " Pummel";
		global.battleCurrentObj.stock[2] += choose("Left", "Right") + " Pummel";
		
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Trinity@0."]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["call", aiLabyrinthDelirianBoss_TrinityMark]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["call", aiLabyrinthDelirianBoss_CloneHop1]);
		ds_queue_enqueue(animations, ["wait", 50]);
		ds_queue_enqueue(animations, ["msg", "@2Mew's Clone@0 readies @1" + global.battleCurrentObj.stock[1] + "@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);		
		
		ds_queue_enqueue(animations, ["call", aiLabyrinthDelirianBoss_CloneHop2]);
		ds_queue_enqueue(animations, ["wait", 50]);
		ds_queue_enqueue(animations, ["msg", "@2Mew's Clone@0 readies @1" + global.battleCurrentObj.stock[2] + "@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
	if (global.turnCounter == 7) {
		setLastBlow("Trinity");
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Trinity@0!"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		
		var everyone = allAllies();
		for (var i=0; i<array_length(everyone); i++) {
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", everyone[i].x, everyone[i].y, 0, 0, 75, 0, 0]
			]]);
			ds_queue_enqueue(animations, ["rmmarkers", everyone[i]]);
			ds_queue_enqueue(animations, ["snd", FightSFXAce]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["dmgmulti", "normal", 50, ["VulnerabilityUp", 1]]);
			ds_queue_enqueue(animations, ["wait", 10]);
		}	
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1" + global.battleCurrentObj.stock[1] + "@0!"]);
		ds_queue_enqueue(animations, ["lastblow", global.battleCurrentObj.stock[1]]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_coord", [100, 100], AnimGeneric1, 1]);
		var dd = haircutFacingFromName(global.battleCurrentObj.stock[1], FACING_DR);
		ds_queue_enqueue(animations, ["mktelegraph", [haircutFrom(100, 100, dd)]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 100, ["DamageDown", 3]]);
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1" + global.battleCurrentObj.stock[2] + "@0!"]);
		ds_queue_enqueue(animations, ["lastblow", global.battleCurrentObj.stock[2]]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_coord", [640-100, 100], AnimGeneric1, 1]);
		var dd = haircutFacingFromName(global.battleCurrentObj.stock[2], FACING_DL);
		ds_queue_enqueue(animations, ["mktelegraph", [haircutFrom(640-100, 100, dd)]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 100, ["DamageDown", 3]]);
		
		ds_queue_enqueue(animations, ["msg", "The clones fade away."]);
		ds_queue_enqueue(animations, ["call", aiLabyrinthDelirianBoss_FadeClones]);
		ds_queue_enqueue(animations, ["snd", KeyChamberOpenSound]);
		ds_queue_enqueue(animations, ["wait", 70]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
\c46B\c30NO!! MY FRIENDSS!\d30
need revenge..\d30 will go ALL OUT now !!!\c46A\c00\d50 \c00
		"), noone]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["wait", 20]);
		global.battleCurrentObj.stock = choose("Fake ", "True ");
		global.battleCurrentObj.stock += choose("Fake ", "True ");
		global.battleCurrentObj.stock += choose("Fake ", "True ");
		global.battleCurrentObj.stock += choose("Fake ", "True ");
		global.battleCurrentObj.stock += choose("Fake ", "True ");
		global.battleCurrentObj.stock += choose("Left", "Right") + " Pummel";
		global.battleCurrentObj.facingStock = choose(FACING_D, FACING_DL, FACING_DR);	
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1" + global.battleCurrentObj.stock + "@0."]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleCurrentObj.facingStock]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 130]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (global.turnCounter == 8) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1" + global.battleCurrentObj.stock + "@0!"]);
		ds_queue_enqueue(animations, ["lastblow", global.battleCurrentObj.stock]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleCurrentObj.facingStock]);
		ds_queue_enqueue(animations, ["mktelegraph", [haircuts[haircutFacingFromName(global.battleCurrentObj.stock, global.battleCurrentObj.facingStock)]]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 100, ["DamageDown", 3]]);
		
		ds_queue_enqueue(animations, ["wait", 40]);
		global.battleCurrentObj.stock = choose("Fake ", "True ");
		global.battleCurrentObj.stock += choose("Fake ", "True ");
		global.battleCurrentObj.stock += choose("Fake ", "True ");
		global.battleCurrentObj.stock += choose("Fake ", "True ");
		global.battleCurrentObj.stock += choose("Fake ", "True ");
		global.battleCurrentObj.stock += choose("Left", "Right") + " Pummel";
		global.battleCurrentObj.facingStock = choose(FACING_D, FACING_DL, FACING_DR);	
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1" + global.battleCurrentObj.stock + "@0."]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleCurrentObj.facingStock]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 130]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (global.turnCounter == 9) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1" + global.battleCurrentObj.stock + "@0!"]);
		ds_queue_enqueue(animations, ["lastblow", global.battleCurrentObj.stock]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleCurrentObj.facingStock]);
		ds_queue_enqueue(animations, ["mktelegraph", [haircuts[haircutFacingFromName(global.battleCurrentObj.stock, global.battleCurrentObj.facingStock)]]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 100, ["DamageDown", 3]]);
		
		ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
\c46B\c30uwuwa.. i am tired..\d30
will finish it!!!\d30 VERY !!!\c46A\c00\d50 \c00
		"), noone]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Delirious Finish@0."]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (global.turnCounter >= 10) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is enraged!"]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["wait", 10]);
		
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Delirious Finish@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Delirious Finish"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["spawn", BattlePartQuake, 0, 0]);
		ds_queue_enqueue(animations, ["snd", FightSFXLongQuake]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["snapshot_all"]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 99999, noone]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}
function aiLabyrinthDelirianBoss_TrinityMark() {
	with (BattleObject) {
		if (alliance) {
			markerAlpha = 0;
			markerAlphaExcess = 2;
			radiusMarker = 75;
			personalMarker = MARKER_SPREAD;
			markerOwner = global.battleCurrentObj.id;
		}
	}
}
function aiLabyrinthDelirianBoss_FadeClones() {
	BattlePartMewClone.fade = true;
}
function haircutFrom(xx, yy, dd) {
	var haircuts = [
		["line", xx, yy, 0, 0, 800, 800, 0],
		["line", xx, yy, 0, 0, 800, 800, 45],
		["line", xx, yy, 0, 0, 800, 800, 90],
		["line", xx, yy, 0, 0, 800, 800, 90+45],
		["line", xx, yy, 0, 0, 800, 800, 90+90],
		["line", xx, yy, 0, 0, 800, 800, 90+90+45],
		["line", xx, yy, 0, 0, 800, 800, 90+90+90],
		["line", xx, yy, 0, 0, 800, 800, 90+90+90+45],
	];
	return variable_clone(haircuts[dd]);
}
function haircutFacingFromName(xx, trn) {
	var face = string_count("Fake", xx) * 4 + trn;
	face += string_count("Left", xx) > 0 ? 0 : 4;
	face %= 8;
	return face;
}
function aiLabyrinthDelirianBoss_PlaceClones1() {
	instance_create(BattlePartMewClone, 100, 100);
	instance_create(BattlePartMewClone, 640-100, 100);
}
function aiLabyrinthDelirianBoss_CloneHop1() {
	with (BattlePartMewClone) {
		if (x < 400) {
			facing = FACING_DR;
			alarm[1] = 1;
		}
	}
}
function aiLabyrinthDelirianBoss_CloneHop2() {
	with (BattlePartMewClone) {
		if (x > 400) {
			facing = FACING_DL;
			alarm[1] = 1;
		}
	}
}
function aiLabyrinthDelirianBossLore() {
	if (global.turnCounter == 0) {
		audio_stop_all();
		global.musicIndex = 21;
		global.musicControl = MUS_PLAY;
	}	
}
function aiLabyrinthDelirianClear() {
	audio_stop_all();
	global.musicIndex = 20;
	global.musicControl = MUS_PLAY;
	return aiBattleClear();
}

function aiLabyrinthMoltresBoss() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var coords = [
		[global.battleCurrentObj.x - 120, global.battleCurrentObj.y],
		[global.battleCurrentObj.x, global.battleCurrentObj.y + 120],
		[global.battleCurrentObj.x + 120, global.battleCurrentObj.y]
	];
	
	if (global.turnCounter == 0) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Lock-On@0!"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " takes aim!"]);
		
		global.battleTargetChoices = randomListOfAllies();
		var lcScripts = [aiLavaLabyrinth3LC1, aiLavaLabyrinth3LC2, aiLavaLabyrinth3LC3];
		for (var i=0; i<3; i++) {
			if (i >= array_length(global.battleTargetChoices)) continue;
			removeEffect(global.battleTargetChoices[i], "Line1");
			removeEffect(global.battleTargetChoices[i], "Line2");
			removeEffect(global.battleTargetChoices[i], "Line3");
			applyEffectSilent(global.battleTargetChoices[i], ["Line" + string(i+1), 999]);
			//applyEffectSilent(global.battleTargetChoices[i], ["Intemperate", 4]);
			ds_queue_enqueue(animations, ["snd", FightSFXLC]);
			ds_queue_enqueue(animations, ["callarg", lcScripts[i], global.battleTargetChoices[i]]);
			ds_queue_enqueue(animations, ["wait", 40]);
		}
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["rmmarkers_all"]);
		ds_queue_enqueue(animations, ["wait", 40]);
		
		global.battleTargetObj = global.battleTargetChoices[0];
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Twin Blazing Strike@0."]);
		ds_queue_enqueue(animations, ["callarg", aiLabyrinthMoltresPlaceSpreadMarker, global.battleTargetObj]);
		ds_queue_enqueue(animations, ["mktelegraph", [
			["circle", coords[0][0], coords[0][1], 0, 0, 80, 0, 0]
		]]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (global.turnCounter == 1 || global.turnCounter == 2 || global.turnCounter == 3) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Twin Blazing Strike@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Twin Blazing Strike"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["snd", FightSFXBlazeKick]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "fire", 40, noone]);
		
		var allies = allAlliesInCircle(coords[global.turnCounter-1][0], coords[global.turnCounter-1][1], 80);
		if (array_length(allies) > 0) {
			for (var i=0; i<array_length(allies); i++) {
				applyEffect(allies[i], ["TwiceComeRuin", 1]);
				if (!hasStatus(allies[i], "LingeringFlame")) {
					applyEffect(allies[i], ["LingeringFlame", 2]);
				}
			}
		} else {
			ds_queue_enqueue(animations, ["msg", "The strike hits the ground, causing an earthquake!"]);
			ds_queue_enqueue(animations, ["lastblow", "Unmitigated Blazing Strike"]);
			ds_queue_enqueue(animations, ["spawn", BattlePartQuake, 0, 0]);
			ds_queue_enqueue(animations, ["snd", FightSFXLongQuake]);
			ds_queue_enqueue(animations, ["wait", 75]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snapshot_all"]);
			ds_queue_enqueue(animations, ["dmgmulti", "ground", 40, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
		}
		
		global.battleTargetObj = allyWithEffect("Line" + string(global.turnCounter));
		ds_queue_enqueue(animations, ["snd", FightSFXBlazeKick]);
		ds_queue_enqueue(animations, ["mktelegraph", [
			["circle", global.battleTargetObj.x, global.battleTargetObj.y, 0, 0, 200, 0, 0]
		]]);
		ds_queue_enqueue(animations, ["rmmarkers_all"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "fire", 40, noone]);
		
		allies = allAlliesInCircle(global.battleTargetObj.x, global.battleTargetObj.y, 200);
		if (array_length(allies) > 0) {
			for (var i=0; i<array_length(allies); i++) {
				applyEffect(allies[i], ["TwiceComeRuin", 1]);
			}
		} else {
			ds_queue_enqueue(animations, ["msg", "The strike hits the ground, causing an earthquake!"]);
			ds_queue_enqueue(animations, ["lastblow", "Unmitigated Blazing Strike"]);
			ds_queue_enqueue(animations, ["spawn", BattlePartQuake, 0, 0]);
			ds_queue_enqueue(animations, ["snd", FightSFXLongQuake]);
			ds_queue_enqueue(animations, ["wait", 75]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snapshot_all"]);
			ds_queue_enqueue(animations, ["dmgmulti", "ground", 40, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
		}
		
		ds_queue_enqueue(animations, ["wait", 20]);
		
		if (global.turnCounter == 3) {
			with (BattleObject) {
				removeEffect(self, "Line1");
				removeEffect(self, "Line2");
				removeEffect(self, "Line3");
			}
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Heat Wave@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		} else {
			var tgt = allyWithEffect("Line" + string(global.turnCounter + 1));
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Twin Blazing Strike@0."]);
			ds_queue_enqueue(animations, ["callarg", aiLabyrinthMoltresPlaceSpreadMarker, tgt]);
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", coords[global.turnCounter][0], coords[global.turnCounter][1], 0, 0, 80, 0, 0]
			]]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
	if (global.turnCounter == 4) {
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
		ds_queue_enqueue(animations, ["dmgmulti", "fire", 30, noone]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
	if (global.turnCounter == 5) {
		var allies = randomListOfAllThreeAllies();
		if (allies[0] != noone) applyEffectSilent(allies[0], [choose("DesireIn", "DesireOut"), 2]);
		if (allies[1] != noone) applyEffectSilent(allies[1], [choose("DesireOut", "DesireOut"), 3]);
		if (allies[2] != noone) applyEffectSilent(allies[2], [choose("DesireIn", "DesireIn"), 4]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Burning Desire@0!"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snd", FightSFXMultiEff]);
		ds_queue_enqueue(animations, ["msg", "Party members were affected by @1Burning Desire@0."]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Air Slash@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		var allies = allAllies();
		for (var i=0; i<array_length(allies); i++) {
			var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y, allies[i].x, allies[i].y);
			var tele = [];
			var xx = global.battleCurrentObj.x;
			var yy = global.battleCurrentObj.y;
			array_push(tele, ["line", xx, yy, 0, 0, 600, 40, dr]);
			ds_queue_enqueue(animations, ["mktelegraph", tele]);
			ds_queue_enqueue(animations, ["callarg", aiLabyrinthMoltresPlaceSpreadMarker2, allies[i]]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["rmtelegraph", tele]);
			ds_queue_enqueue(animations, ["wait", 10]);
		}
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 6) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Air Slash@0."]);
		ds_queue_enqueue(animations, ["lastblow", "Air Slash"]);
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
			array_push(tele, ["line", xx, yy, 0, 0, 600, 40, dr]);
			ds_queue_enqueue(animations, ["mktelegraph", tele]);
			ds_queue_enqueue(animations, ["rmmarkers", allies[i]]);
			ds_queue_enqueue(animations, ["wait", 10])
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph", tele]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["dmgmulti", "flying", 50, ["TwiceComeRuin", 1]]);
		}
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Single Blazing Strike@0."]);
		ds_queue_enqueue(animations, ["mktelegraph", [
			["circle", global.battleCurrentObj.x, global.battleCurrentObj.y + 90, 0, 0, 80, 0, 0]
		]]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 7) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Single Blazing Strike@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Single Blazing Strike"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["snd", FightSFXBlazeKick]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "fire", 40, noone]);
		var allies = allAlliesInCircle(global.battleCurrentObj.x, global.battleCurrentObj.y + 90, 80);
		if (array_length(allies) > 0) {
			for (var i=0; i<array_length(allies); i++) {
				applyEffect(allies[i], ["TwiceComeRuin", 1]);
				if (!hasStatus(allies[i], "LingeringFlame")) {
					applyEffect(allies[i], ["LingeringFlame", 2]);
				}
			}
		} else {
			ds_queue_enqueue(animations, ["msg", "The strike hits the ground, causing an earthquake!"]);
			ds_queue_enqueue(animations, ["lastblow", "Unmitigated Blazing Strike"]);
			ds_queue_enqueue(animations, ["spawn", BattlePartQuake, 0, 0]);
			ds_queue_enqueue(animations, ["snd", FightSFXLongQuake]);
			ds_queue_enqueue(animations, ["wait", 75]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snapshot_all"]);
			ds_queue_enqueue(animations, ["dmgmulti", "ground", 40, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
		}
		
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Double Blazing Strike@0."]);
		ds_queue_enqueue(animations, ["mktelegraph", [
			["circle", global.battleCurrentObj.x - 100, global.battleCurrentObj.y + 90, 0, 0, 80, 0, 0],
			["circle", global.battleCurrentObj.x + 100, global.battleCurrentObj.y + 90, 0, 0, 80, 0, 0]
		]]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 8) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Double Blazing Strike@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Double Blazing Strike"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["snd", FightSFXBlazeKick]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "fire", 40, noone]);
		
		var allies = allAlliesInCircle(global.battleCurrentObj.x - 100, global.battleCurrentObj.y + 90, 80);
		if (array_length(allies) > 0) {
			for (var i=0; i<array_length(allies); i++) {
				applyEffect(allies[i], ["TwiceComeRuin", 1]);
				if (!hasStatus(allies[i], "LingeringFlame")) {
					applyEffect(allies[i], ["LingeringFlame", 2]);
				}
			}
		} else {
			ds_queue_enqueue(animations, ["msg", "The strike hits the ground, causing an earthquake!"]);
			ds_queue_enqueue(animations, ["lastblow", "Unmitigated Blazing Strike"]);
			ds_queue_enqueue(animations, ["spawn", BattlePartQuake, 0, 0]);
			ds_queue_enqueue(animations, ["snd", FightSFXLongQuake]);
			ds_queue_enqueue(animations, ["wait", 75]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snapshot_all"]);
			ds_queue_enqueue(animations, ["dmgmulti", "ground", 40, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
		}
		
		var allies = allAlliesInCircle(global.battleCurrentObj.x + 100, global.battleCurrentObj.y + 90, 80);
		if (array_length(allies) > 0) {
			for (var i=0; i<array_length(allies); i++) {
				applyEffect(allies[i], ["TwiceComeRuin", 1]);
				if (!hasStatus(allies[i], "LingeringFlame")) {
					applyEffect(allies[i], ["LingeringFlame", 2]);
				}
			}
		} else {
			ds_queue_enqueue(animations, ["msg", "The strike hits the ground, causing an earthquake!"]);
			ds_queue_enqueue(animations, ["lastblow", "Unmitigated Blazing Strike"]);
			ds_queue_enqueue(animations, ["spawn", BattlePartQuake, 0, 0]);
			ds_queue_enqueue(animations, ["snd", FightSFXLongQuake]);
			ds_queue_enqueue(animations, ["wait", 75]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snapshot_all"]);
			ds_queue_enqueue(animations, ["dmgmulti", "ground", 40, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
		}
		
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
	if (global.turnCounter == 9) {
		var which;
		if (global.battleCurrentObj.stock == 0) {
			which = allyNthNearest(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
		} else {
			which = allyNthFurthest(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
		}
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Eruption@0!"]);
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
		ds_queue_enqueue(animations, ["dmgmulti", "fire", 50, ["TwiceComeRuin", 1]]);
		ds_queue_enqueue(animations, ["wait", 15]);
	}
	if (global.turnCounter == 10) {
		var allies = randomListOfAllThreeAllies();
		var d1 = choose("DesireIn", "DesireOut");
		var d2 = choose("DesireIn", "DesireOut");
		var d3 = choose("DesireIn", "DesireOut");
		if (allies[0] != noone) applyEffectSilent(allies[0], [d1, 2]);
		if (allies[1] != noone) applyEffectSilent(allies[1], [d1, 2]);
		if (allies[1] != noone) applyEffectSilent(allies[1], [d2, 3]);
		if (allies[2] != noone) applyEffectSilent(allies[2], [d2, 3]);
		if (allies[0] != noone) applyEffectSilent(allies[0], [d3, 4]);
		if (allies[2] != noone) applyEffectSilent(allies[2], [d3, 4]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Burning Desire@0!"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snd", FightSFXMultiEff]);
		ds_queue_enqueue(animations, ["msg", "Party members were affected by @1Burning Desire@0."]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Aerial Ace@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 11 || global.turnCounter == 13) {
		global.battleTargetObj = randomAllyAliveProvokable();
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Aerial Ace@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Aerial Ace"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimAce, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXAce]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgsingle", "flying", 50, noone]);
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, FACING_D]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 12) {
		attack010Concentrate();
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Aerial Ace@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter >= 14) {
		var potency = 30;
		if (global.turnCounter > 15) potency = 99999;
		if (global.turnCounter == 15) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is enraged!"]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		} else {
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
			ds_queue_enqueue(animations, ["dmgmulti", "fire", potency, noone]);
			ds_queue_enqueue(animations, ["wait", 20]);	
		}
	}
}
function effectDesireInnerFire(t) {
	if (t == 0) {
		BattleController.alarm[0] = 10;
		global.battleCurrentObj = randomEnemy();
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s @7Inner Fire@0 takes effect!"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["mktelegraphq", [
			["donut", global.battleTargetObj.x, global.battleTargetObj.y, 0, 0, 130, 5, 0]
		]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshotq"]);
		ds_queue_enqueue(animations, ["rmtelegraphq"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti_nobuffs", "fire", 50, ["DamageDown", 3, 1]]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}
function effectDesireThrownFlames(t) {
	if (t == 0) {
		BattleController.alarm[0] = 10;
		global.battleCurrentObj = randomEnemy();
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s @7Thrown Flames@0 takes effect!"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["mktelegraphq", [
			["donut", global.battleTargetObj.x, global.battleTargetObj.y, 0, 0, 800, 120, 0]
		]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshotq"]);
		ds_queue_enqueue(animations, ["rmtelegraphq"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti_nobuffs", "fire", 50, ["DamageDown", 3, 1]]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}
function effectLingeringFlame(t) {
	if (t == 0) {
		BattleController.alarm[0] = 10;
		global.battleCurrentObj = randomEnemy();
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s @7Lingering Flame@0 takes effect!"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["mktelegraphq", [
			["circle", global.battleTargetObj.x, global.battleTargetObj.y, 0, 0, 80, 0, 0]
		]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshotq"]);
		ds_queue_enqueue(animations, ["rmtelegraphq"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti_nobuffs", "fire", 25, noone]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}
function effectIntemperate(t) {
	if (t == 0) {
		BattleController.alarm[0] = 10;
		global.battleCurrentObj = randomEnemy();
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + " cannot take it anymore!"]);
		ds_queue_enqueue(animations, ["wait", 35]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["dmgsingle_to", "none", 150, global.battleTargetObj]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}

function aiLabyrinthMoltresBossIntro() {
	if (global.turnCounter == 0) {
		audio_stop_all();
		global.musicIndex = 16;
		global.musicControl = MUS_PLAY;
	}	
}
function aiLabyrinthMoltresPlaceSpreadMarker(ii) {
	with (ii) {
		if (alliance) {
			markerAlpha = 0;
			markerAlphaExcess = 2;
			radiusMarker = 200;
			personalMarker = MARKER_SPREAD;
			markerOwner = global.battleCurrentObj.id;
		}
	}
}
function aiLabyrinthMoltresPlaceSpreadMarker2(ii) {
	with (ii) {
		if (alliance) {
			markerAlpha = 0;
			markerAlphaExcess = 2;
			personalMarker = MARKER_SPREAD;
			markerOwner = global.battleCurrentObj.id;
		}
	}
}