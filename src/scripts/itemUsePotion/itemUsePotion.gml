
function itemUsePotion(tick) {
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + "@0 used the @1" + global.battleCurrentItemName + "@0."]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimEat, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXEat]);
	ds_queue_enqueue(animations, ["wait", 5]);
	ds_queue_enqueue(animations, ["nomsg"]);
	if (global.battleTargetObj.curHP <= 0) {
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "The target is unconscious..."]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	} else {
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimHeal, 1]);
		ds_queue_enqueue(animations, ["healsingle", -2, 50]);
		ds_queue_enqueue(animations, ["wait", 50]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
	return true;
}

function itemUseSitrusBerry(tick) {
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + "@0 used the @1" + global.battleCurrentItemName + "@0."]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimEat, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXEat]);
	ds_queue_enqueue(animations, ["wait", 5]);
	ds_queue_enqueue(animations, ["nomsg"]);
	if (global.battleTargetObj.curHP <= 0) {
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "The target is unconscious..."]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	} else {
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimHeal, 1]);
		ds_queue_enqueue(animations, ["healsingle", -2, global.battleTargetObj.maxHP]);
		ds_queue_enqueue(animations, ["wait", 50]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
	return true;
}

function itemUseLifeSeed() {
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + "@0 used the @1" + global.battleCurrentItemName + "@0."]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimEat, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXEat]);
	ds_queue_enqueue(animations, ["wait", 5]);
	ds_queue_enqueue(animations, ["nomsg"]);
	if (global.battleTargetObj.curHP <= 0) {
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "The target is unconscious..."]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	} else {
		global.battleTargetObj.curHP = (global.battleTargetObj.maxHP div 2) * 3;
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimHeal, 1]);
		ds_queue_enqueue(animations, ["healsingle", -2, global.battleTargetObj.maxHP]);
		ds_queue_enqueue(animations, ["wait", 50]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);	
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimEat, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXReflected]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + "@0 HP increased temporarily."]);
		ds_queue_enqueue(animations, ["wait", 70]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
	return true;
}

function itemUseJuice1(tick) {
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + "@0 shared the @1" + global.battleCurrentItemName + "@0 with others."]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["snd", FightSFXEat]);
	ds_queue_enqueue(animations, ["wait", 5]);
	ds_queue_enqueue(animations, ["nomsg"]);
		
	var allies = allAliveAllies();
	for (var i=0; i<array_length(allies); i++) {
		var amount = 70;
		ds_queue_enqueue(animations, ["animpart_member", allies[i], AnimHeal, 1]);
		ds_queue_enqueue(animations, ["healsingle", allies[i], amount]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
	return true;
}

function itemUseJuice2(tick) {
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + "@0 shared the @1" + global.battleCurrentItemName + "@0 with others."]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["snd", FightSFXEat]);
	ds_queue_enqueue(animations, ["wait", 5]);
	ds_queue_enqueue(animations, ["nomsg"]);
		
	var allies = allAliveAllies();
	for (var i=0; i<array_length(allies); i++) {
		var amount = allies[i].maxHP;
		ds_queue_enqueue(animations, ["animpart_member", allies[i], AnimHeal, 1]);
		ds_queue_enqueue(animations, ["healsingle", allies[i], amount]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
	return true;
}

function itemUsePearl() {
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + "@0 used the @1" + global.battleCurrentItemName + "@0."]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["snd", FightSFXDelirium]);
	ds_queue_enqueue(animations, ["msg", "Random blessings have been attained!"]);
	var everyone = allAllies();
	for (var i=0; i<array_length(everyone); i++) {
		var rndEff;
		while (true) {
			rndEff = choose("Hardened","Daredevil","Concentrate","Barrier","GoodBoy","LightScreen","PlotArmor","Charged","Brilliancy");
			if (!hasStatus(everyone[i], rndEff)) break;
		}		
		ds_queue_enqueue(animations, ["apply_effect", everyone[i], [rndEff, 1]]);
	}
	ds_queue_enqueue(animations, ["wait", 80]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	return false;
}