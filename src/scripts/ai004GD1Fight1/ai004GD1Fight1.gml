
function ai004GD1Fight1(){
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var tc = global.turnCounter;
	if (tc == 0) {
		setLastBlow("Poisonous Mist");
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Poisonous Mist@0!"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimScent, 1, make_color_rgb(234,85,204)]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["snd", FightSFXScent]);
		ds_queue_enqueue(animations, ["wait", 70]);
		ds_queue_enqueue(animations, ["snapshot_all"]);
		ds_queue_enqueue(animations, ["dmgmulti", "poison", 8, ["Poisoned", 3]]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
	
	if (tc == 1) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Cyclic Cross Poison@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		var tele = [];
		var allies = allAllies();
		for (var i=0; i<array_length(allies); i++) {
			var xx = allies[i].x;
			var yy = allies[i].y;
			array_push(tele, ["line", xx, yy, 0, 0, 600, 25, 45]);
			array_push(tele, ["line", xx, yy, 0, 0, 600, 25, 45+90]);
			array_push(tele, ["line", xx, yy, 0, 0, 600, 25, 45+90+90]);
			array_push(tele, ["line", xx, yy, 0, 0, 600, 25, 45+90+90+90]);
		}
		ds_queue_enqueue(animations, ["mktelegraph", tele]);
	
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc >= 2) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Cyclic Cross Poison@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Cyclic Cross Poison"]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "poison", 20, ["Poisoned", 3]]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + "'s @1Cyclic Cross Poison@0 continues!"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		var tele = [];
		var allies = allAllies();
		for (var i=0; i<array_length(allies); i++) {
			var xx = allies[i].x;
			var yy = allies[i].y;
			array_push(tele, ["line", xx, yy, 0, 0, 600, 25, 45]);
			array_push(tele, ["line", xx, yy, 0, 0, 600, 25, 45+90]);
			array_push(tele, ["line", xx, yy, 0, 0, 600, 25, 45+90+90]);
			array_push(tele, ["line", xx, yy, 0, 0, 600, 25, 45+90+90+90]);
		}
		ds_queue_enqueue(animations, ["mktelegraph", tele]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
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
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}

function ai004GD1Fight2() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	if (global.battleCurrentObj.species == "0022") {
		global.battleTargetObj = randomAllyAliveProvokable();
		attack009Peck();
	}
	
	if (global.battleCurrentObj.species == "0021") {
		global.battleTargetObj = allBySpecies("0022");
		var roost = false;
		if (global.battleTargetObj != noone) {
			if (global.battleTargetObj.curHP < 50) roost = true;
			else roost = choose(true, false);
		}
		if (roost) {
			if (global.battleTargetObj == noone) global.battleTargetObj = global.battleCurrentObj;
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Roost@0!"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["snd", FightSFXFeather]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimFeather, 1]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimHeal, 1]);
			ds_queue_enqueue(animations, ["healsingle", -2, 40]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 10]);
		} else {
			global.battleTargetObj = randomAllyAliveProvokable();
			attack009Peck();
		}
	}
}

function ai004GD1Fight3() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var tc = global.turnCounter % 4;
	
	if (tc == 0) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Earth Power@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["call", ai004GD1Fight3Callback1]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc == 1) {
		setLastBlow("Earth Power");
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Earth Power@0!"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		
		var everyone = allAllies();
		for (var i=0; i<array_length(everyone); i++) {
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", everyone[i].x, everyone[i].y, 0, 0, 100, 0, 0]
			]]);
			ds_queue_enqueue(animations, ["rmmarkers", everyone[i]]);
			ds_queue_enqueue(animations, ["snd", FightSFXGround]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgmulti", "ground", 15, ["VulnerabilityUp", 1]]);
			ds_queue_enqueue(animations, ["wait", 15]);
		}
	}
	
	if (tc == 2) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Giga Impact@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["call", ai004GD1Fight3Callback2]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc == 3) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Giga Impact@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Giga Impact"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		
		var tgt = markedAllyOrRandom();
		ds_queue_enqueue(animations, ["mktelegraph", [
			["circle", tgt.x, tgt.y, 0, 0, 85, 0, 0]
		]]);
		var stackedAllies = allAlliesInCircle(tgt.x, tgt.y, 85);
		var potency = 70;
		if (array_length(stackedAllies) > 1) potency = 40 div array_length(stackedAllies);
		ds_queue_enqueue(animations, ["rmmarkers", BattleObject]);
		ds_queue_enqueue(animations, ["snd", FightSFX5Hit]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", potency, noone]);
		ds_queue_enqueue(animations, ["wait", 15]);
		
		with (BattleObject) removeEffect(self, "Prey");
	}
}

function ai004GD1Fight3Before() {
	if (global.eventFlags[EVENT_TUTORIAL_STACKSPREAD]) return;
	if (global.turnCounter == 0) {
		allBySpecies("0034").effects = [["PlotArmor", 4]];
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
{PARTNER}: Oh, that's interesting...
Looks like some sort of mysterious power is reducing damage.

But surely it's not gonna last forever.
Let's focus on surviving the incoming attacks for now.<@
		"), [ASSET_PARTNER_PORTRAIT, 0]]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		ds_queue_enqueue(animations, ["wait", 30]);
	}
	if (global.turnCounter == 1) {
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
{PARTNER}: Watch out!
Looks like it's gonna target all of us individually.

We should try \c32spreading out\c30 to avoid overlapping damage!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		ds_queue_enqueue(animations, ["wait", 30]);
	}
	if (global.turnCounter == 3) {
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
{PARTNER}: It switched strategies now...
It looks like it's charging a single powerful attack instead.

We should try \c32staying close together\c30 to share its damage!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		ds_queue_enqueue(animations, ["wait", 30]);
	}
	if (global.turnCounter == 4) {
		global.eventFlags[EVENT_TUTORIAL_STACKSPREAD] = 1;
	}
}	
	
function ai004GD1Fight3Callback1() {
	with (BattleObject) {
		if (alliance) {
			markerAlpha = 0;
			markerAlphaExcess = 2;
			radiusMarker = 100;
			personalMarker = MARKER_SPREAD;
			markerOwner = global.battleCurrentObj.id;
		}
	}
}

function ai004GD1Fight3Callback2() {
	global.battleTargetObj = randomAllyAliveProvokable();
	global.battleTargetObj.markerAlpha = 0;
	global.battleTargetObj.markerAlphaExcess = 2;
	global.battleTargetObj.radiusMarker = 85;
	global.battleTargetObj.personalMarker = MARKER_STACK;
	applyEffectSilent(global.battleTargetObj, ["Prey", 999]);
	global.battleTargetObj.markerOwner = global.battleCurrentObj.id;
}

function ai004GD1BossIntro() {
	if (global.turnCounter == 0) {
		audio_stop_all();
		global.musicIndex = 10;
		global.musicControl = MUS_PLAY;
	}
}

function ai004GD1Boss() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var tc = global.turnCounter;
	var teles = [
		[
			["circle", 0+160, 0+120, 0, 0, 180, 0, 0],
			["circle", 320+160, 240+120, 0, 0, 180, 0, 0]
		],
		[
			["circle", 320+160, 0+120, 0, 0, 180, 0, 0],
			["circle", 0+160, 240+120, 0, 0, 180, 0, 0]
		]
	];
	
	if (tc == 0) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Tectonic Rage@0!"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snd", FightSFXLongQuake]);
		ds_queue_enqueue(animations, ["spawn", BattlePartQuake, 0, 0]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		global.battleScriptTele = choose(0, 1);
		ds_queue_enqueue(animations, ["mktelegraph", teles[global.battleScriptTele]]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["msg", "The ground is trembling!"]);
		ds_queue_enqueue(animations, ["wait", 75]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc > 0) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + "'s @1Tectonic Rage@0 continues."]);
		ds_queue_enqueue(animations, ["lastblow", "Tectonic Rage"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["spawn", BattlePartQuake, 0, 0]);
		ds_queue_enqueue(animations, ["snd", FightSFXLongQuake]);
		ds_queue_enqueue(animations, ["mktelegraph", teles[global.battleScriptTele]]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 20, ["DamageDown", 3]]);
		ds_queue_enqueue(animations, ["wait", 20]);
		if (global.battleScriptTele == 1) global.battleScriptTele = 0;
		else global.battleScriptTele = 1;
		ds_queue_enqueue(animations, ["mktelegraph", teles[global.battleScriptTele]]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["msg", "The ground is trembling!"]);
		ds_queue_enqueue(animations, ["wait", 85]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc == 1 || tc == 8) {
		global.battleTargetObj = randomAllyAliveProvokable();
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Stomp@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Stomp"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimStomp, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXStomp]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgsingle", "normal", 25, noone]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc == 2 || tc == 6) {
		var haircuts = [
			["Right Pummel", ["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 800, dirWrap(facingToDir(global.battleCurrentObj.facing) - 90)]],
			["Left Pummel", ["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 800, dirWrap(facingToDir(global.battleCurrentObj.facing) + 90)]]
		];
		global.battleScriptTele2 = choose(haircuts[0], haircuts[1]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1" + global.battleScriptTele2[0] + "@0."]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["mktelegraph", [global.battleScriptTele2[1]]]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc == 3 || tc == 7) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1" + global.battleScriptTele2[0] + "@0!"]);
		ds_queue_enqueue(animations, ["lastblow", global.battleScriptTele2[0]]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["mktelegraph", [global.battleScriptTele2[1]]]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 30, ["DamageDown", 3]]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc == 4) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Giga Impact@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["call", ai004GD1Fight3Callback2]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc == 5) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Giga Impact@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Giga Impact"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		
		var tgt = markedAllyOrRandom();
		ds_queue_enqueue(animations, ["mktelegraph", [
			["circle", tgt.x, tgt.y, 0, 0, 85, 0, 0]
		]]);
		var stackedAllies = allAlliesInCircle(tgt.x, tgt.y, 85);
		var potency = 60;
		if (array_length(stackedAllies) > 1) potency = 40 div array_length(stackedAllies);
		ds_queue_enqueue(animations, ["rmmarkers", BattleObject]);
		ds_queue_enqueue(animations, ["snd", FightSFX5Hit]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", potency, noone]);
		ds_queue_enqueue(animations, ["wait", 15]);
		
		with (BattleObject) removeEffect(self, "Prey");
	}
	
	if (tc == 9 || tc == 10) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Lamentation@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Lamentation"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimWave, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXKangaskhanCry]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snapshot_all"]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 15, noone]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc == 11) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is enraged!"]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc >= 12) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Final Lamentation@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Final Lamentation"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimWave, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXKangaskhanCry]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snapshot_all"]);
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 99999, noone]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}