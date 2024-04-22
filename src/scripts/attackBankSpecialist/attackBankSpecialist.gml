function attackBankSpecialist(){
}

function attack008HealPulse() {	
	global.battleCurrentObj.curPP -= 5;
	
	var amount = global.battleCurrentObj.sp_att * 1.15;
	var rnd = random_range(9000,11000)/10000.0;
	if (instance_exists(DebugController)) {
		if (DebugController.alwaysHighroll) {
			rnd = 11000/10000.0;
		}
	}
	amount *= rnd;
	amount = int64(amount);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Heal Pulse@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimHealMove1, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXBeatup]);
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimHeal, 1]);
	ds_queue_enqueue(animations, ["healsingle", -2, amount]);
	ds_queue_enqueue(animations, ["wait", 40]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);	
}

function attack009Taunt() {
	global.battleCurrentObj.curPP -= 5;
	
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Taunt@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimTaunt, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXTaunt]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is drawing attention."]);
	ds_queue_enqueue(animations, ["apply_effect", -1, ["Daredevil", 1]]);
	ds_queue_enqueue(animations, ["wait", 50]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);	
}

function attack010Concentrate() {
	global.battleCurrentObj.curPP -= 10;
	
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Concentrate@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimConcentrate, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXConcentrate]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is focused!"]);
	ds_queue_enqueue(animations, ["apply_effect", -1, ["Concentrate", 2]]);
	ds_queue_enqueue(animations, ["wait", 60]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 25]);	
}

function attack011RevengeBlast() {
	global.battleCurrentObj.curPP -= 15;
	
	var potency = 25;
	var r = global.battleCurrentObj.curHP * 2.0;
	r /= global.battleCurrentObj.maxHP * 2.0;
	if (r <= 0.3) potency = 70;
	
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Revenge@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimEnrage, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXEnrage]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["dmgsingle", "none", potency, noone]);
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function attack012Barrier() {
	global.battleCurrentObj.curPP -= 15;
	
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Barrier@0!"]);
	ds_queue_enqueue(animations, ["wait", 30]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimLight, 1, c_aqua]);
	ds_queue_enqueue(animations, ["snd", FightSFXBarrier]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["apply_effect", -2, ["Barrier", 3]]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + " is defended!"]);
	ds_queue_enqueue(animations, ["wait", 60]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function attack013Rejuvenate() {
	global.battleCurrentObj.curPP -= 15;
	
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Rejuvenate@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	if (global.battleTargetObj.curHP >= global.battleTargetObj.maxHP) {
		var overheal = int64(global.battleTargetObj.maxHP * 0.25);
		global.battleTargetObj.curHP += overheal;
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimRejuvenate, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXSuck]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimHeal, 1]);
		ds_queue_enqueue(animations, ["healsingle", -2, overheal]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	} else {
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["msg", "But it failed!"]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
	}
}

function attack014HealWave() {
	global.battleCurrentObj.curPP -= 20;
	
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Heal Wave@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["nomsg"]);
	
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric2, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXGeneric2]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric2, 1]);
	ds_queue_enqueue(animations, ["wait", 25]);
	
	var allies = allAliveAllies();
	for (var i=0; i<array_length(allies); i++) {
		var amount = global.battleCurrentObj.sp_att * 1.05;
		var rnd = random_range(9000,11000)/10000.0;
		if (instance_exists(DebugController)) {
			if (DebugController.alwaysHighroll) {
				rnd = 11000/10000.0;
			}
		}
		amount *= rnd;
		amount = int64(amount);
		ds_queue_enqueue(animations, ["animpart_member", allies[i], AnimHeal, 1]);
		ds_queue_enqueue(animations, ["healsingle", allies[i], amount]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
}

function attack015HeatWave() {
	global.battleCurrentObj.curPP -= 10;
	global.snapshot = allEnemiesAlive();
	
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Heat Wave@0!"]);
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
	ds_queue_enqueue(animations, ["dmgmulti", "fire", 20, noone]);
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function attack016Bite() {
	global.battleCurrentObj.curPP -= 5;
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Bite@0!"]);
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
}

function attackPet(){
	BattleController.isPetting = true;
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Pet@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
	ds_queue_enqueue(animations, ["anim_movetarget", -1, 25]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["snd", FightSFXPet]);
	ds_queue_enqueue(animations, ["anim", -2, "Pose", 0]);
	ds_queue_enqueue(animations, ["wait", 5]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + " is content!"]);
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["anim_moverestore", -1]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["call", attackPetStop]);
	global.petCounter += 1;
}
function attackPetStop() {
	BattleController.isPetting = false;
}

function attack018Venoshock() {
	global.battleCurrentObj.curPP -= 10;
	var potency = 30;
	if (hasStatus(global.battleTargetObj, "Poisoned")) potency = 60;
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Venoshock@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["snd", FightSFXGeneric1]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimCloud, 1]);
	ds_queue_enqueue(animations, ["wait", 35]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["dmgsingle", "poison", potency, noone]);
	ds_queue_enqueue(animations, ["wait", 40]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function attack019Aquatail() {
	global.battleCurrentObj.curPP -= 15;
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Aqua Tail@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimAqua, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXAqua]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["dmgsingle", "water", 60, noone]);
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function attack020Flamethrower() {
	global.battleCurrentObj.curPP -= 15;
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Flamethrower@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXStatus]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimFlamethrower, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXFlamethrower]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["dmgsingle", "fire", 60, noone]);
	ds_queue_enqueue(animations, ["wait", 55]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function attack021LightScreen() {
	global.battleCurrentObj.curPP -= 20;
	
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Light Screen@0!"]);
	ds_queue_enqueue(animations, ["wait", 30]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["wait", 10]);
	var allies = allAllies();
	for (var i=0; i<array_length(allies); i++) {
		ds_queue_enqueue(animations, ["animpart_member", allies[i], AnimProtect, 1, c_aqua]);
		removeEffect(allies[i], "LightScreen");
		applyEffectSilent(allies[i], ["LightScreen", 3]);
	}
	ds_queue_enqueue(animations, ["snd", FightSFXProtect]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["msg", "A magic barrier was erected!"]);
	ds_queue_enqueue(animations, ["wait", 60]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function attack022TakeDown() {
	global.battleCurrentObj.curPP -= 10;
	
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Take Down@0!"]);
	ds_queue_enqueue(animations, ["lastblow", "Take Down"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
	ds_queue_enqueue(animations, ["anim_movetarget", -1, 45]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["snd", FightSFXTackle]);
	ds_queue_enqueue(animations, ["anim", -1, "Attack", 0]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["dmgsingle", "none", 80, noone]);
	ds_queue_enqueue(animations, ["anim_moverestore", -1]);
	ds_queue_enqueue(animations, ["dmgsingle_to", "none", global.battleCurrentObj.lv, noone, global.battleCurrentObj]);
	ds_queue_enqueue(animations, ["wait", 30]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function attack023Blizzard() {
	global.battleCurrentObj.curPP -= 20;
	//applyEffectSilent(global.battleCurrentObj, ["Pausing", 2]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Blizzard@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimBlizzard, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXIce1]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["dmgsingle", "ice", 65, ["DamageDown", 2]]);
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function attack024PetalDance() {
	global.battleCurrentObj.curPP -= 20;
	//applyEffectSilent(global.battleCurrentObj, ["Pausing", 2]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Petal Dance@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["nomsg"]);
	for (var i=0; i<3; i++) {
		var tgt = randomEnemyAlive();
		ds_queue_enqueue(animations, ["animpart_member", tgt, AnimPetal, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXPetal]);
		ds_queue_enqueue(animations, ["wait", 70]);
		ds_queue_enqueue(animations, ["dmgsingle_to", "grass", 60, noone, tgt]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	applyEffect(global.battleCurrentObj, ["Pausing", 2]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function attack025BlastBurn() {
	global.battleCurrentObj.curPP -= 20;
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Blast Burn@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimBlastBurn, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXBurn]);
	ds_queue_enqueue(animations, ["wait", 14]);
	ds_queue_enqueue(animations, ["snd", FightSFXBurn]);
	ds_queue_enqueue(animations, ["wait", 14]);
	ds_queue_enqueue(animations, ["snd", FightSFXBurn]);
	ds_queue_enqueue(animations, ["wait", 14]);
	ds_queue_enqueue(animations, ["dmgsingle", "fire", 50, ["Burning", 4]]);
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}
function effect025Dot(t) {
	BattleController.alarm[0] = 10;
	global.battleCurrentObj = global.battleTargetObj;
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + " is hurt by the burn!"]);
	ds_queue_enqueue(animations, ["dmgsingle_nobuffs", "none", 15, noone]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function attack026Recover() {
	global.battleCurrentObj.curPP -= 15;
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Moonlight@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimMoonlight, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXMoonlight]);
	ds_queue_enqueue(animations, ["wait", 90]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimHeal, 1]);
	ds_queue_enqueue(animations, ["healsingle", -2, global.battleTargetObj.maxHP]);
	ds_queue_enqueue(animations, ["wait", 40]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);	
}

function attack027SkillSwap() {
	global.battleCurrentObj.curPP -= 20;
	
	var t1 = global.battleCurrentObj.types;
	var t2 = global.battleTargetObj.types;
	global.battleTargetObj.types = t1;
	global.battleCurrentObj.types = t2;
	
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Skill Swap@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimEat, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXBlink]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimEat, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXBlink]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " and " + global.battleTargetObj.combatantNameDecorated + " swapped types!"]);
	ds_queue_enqueue(animations, ["wait", 60]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);	
}

function attack028FocusBlast() {
	global.battleCurrentObj.curPP -= 15;
	
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Focus Blast@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimFocus, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXFocus]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 8]);
	ds_queue_enqueue(animations, ["dmgsingle", "fighting", 80, noone]);
	applyEffect(global.battleCurrentObj, ["Exhausted", 2]);
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}