// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ai007GlacierGDFights(){

}

function aiGlacierGlitchDimension1() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	global.battleTargetObj = randomAllyAliveProvokable();
	var potency = choose(15, 30, 45);
	var heal = choose(true, false);
	
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Present@0!"]);
	ds_queue_enqueue(animations, ["lastblow", "Present"]);
	ds_queue_enqueue(animations, ["wait", 30]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimPresent, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXThrow]);
	ds_queue_enqueue(animations, ["wait", 10]);
		
	if (heal) {
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimHeal, 1]);
		ds_queue_enqueue(animations, ["healsingle", -2, potency]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	} else {
		ds_queue_enqueue(animations, ["dmgsingle", "none", potency, noone]);
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
}

function aiGlacierGlitchDimension2() {
	if (global.battleCurrentObj.curHP <= 0) return;
	var tc = global.turnCounter;
	
	if (global.battleCurrentObj.species == "0238") {
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
	
	if (global.battleCurrentObj.species == "0124") {
		if (global.turnCounter == 0) {
			var allies = randomListOfThreeAllies();
			if (allies[0] != noone) {
				applyEffectSilent(allies[0], ["Abandonment", 2]);
				applyEffectSilent(distinguish2(allies[1], allies[2]), ["Isolation", 2]);
			}
			if (allies[1] != noone) {
				applyEffectSilent(allies[1], ["Abandonment", 3]);
				applyEffectSilent(distinguish2(allies[2], allies[0]), ["Isolation", 3]);
			}
			if (allies[2] != noone) {
				applyEffectSilent(allies[2], ["Abandonment", 4]);
				applyEffectSilent(distinguish2(allies[1], allies[0]), ["Isolation", 4]);
			}
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Manipulation@0!"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["snd", FightSFXMultiEff]);
			ds_queue_enqueue(animations, ["msg", "The battlefield was enveloped by an ominous aura!"]);
			ds_queue_enqueue(animations, ["wait", 80]);
			ds_queue_enqueue(animations, ["nomsg"]);
		} else {
			global.battleTargetObj = randomAllyAliveProvokable();
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Icy Wind@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Icy Wind"]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimIcyWind, 1]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["snd", FightSFXIcyWind]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgsingle", "ice", 30, ["Bind", 2]]);
			ds_queue_enqueue(animations, ["wait", 20]);		
		}
	}
}

function effectAbandonment(t) {
	if (t == 1) {
		with (global.battleTargetObj) {
			markerAlpha = 0;
			markerAlphaExcess = 2;
			radiusMarker = 100;
			personalMarker = MARKER_STACK;
			markerOwner = 1337;
		}
	}
	if (t == 0) {
		BattleController.alarm[0] = 10;
		global.battleCurrentObj = randomEnemy();
		var numAllies = array_length(allAlliesInCircle(global.battleTargetObj.x, global.battleTargetObj.y, 100));
		var potency = 10;
		if (numAllies == 1) potency = 80;
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s @7Abandonment@0 takes effect!"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["mktelegraph", [
			["circle", global.battleTargetObj.x, global.battleTargetObj.y, 0, 0, 100, 0, 0]
		]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["rmmarkers", -2]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "none", potency, noone]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}
function effectIsolation(t) {
	if (t == 1) {
		with (global.battleTargetObj) {
			markerAlpha = 0;
			markerAlphaExcess = 2;
			radiusMarker = 100;
			personalMarker = MARKER_SPREAD;
			markerOwner = 1337;
		}
	}
	if (t == 0) {
		BattleController.alarm[0] = 10;
		global.battleCurrentObj = randomEnemy();
		var numAllies = array_length(allAlliesInCircle(global.battleTargetObj.x, global.battleTargetObj.y, 100));
		var potency = 10;
		if (numAllies != 1) potency = 80;
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s @7Isolation@0 takes effect!"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["mktelegraph", [
			["circle", global.battleTargetObj.x, global.battleTargetObj.y, 0, 0, 100, 0, 0]
		]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["rmmarkers", -2]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "none", potency, noone]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}

function aiGlacierGlitchDimension2HandleTele() {
	with (BattleObject) markersClear = true;
}

function aiGlacierGlitchDimension3() {
	if (global.battleCurrentObj.curHP <= 0) return;
	var tc = global.turnCounter % 3;
	
	if (global.battleCurrentObj.species == "0471") {
		if (tc == 0) {
			global.snapshot = allAliveAllies();
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Powder Snow@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Powder Snow"]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["spawn", BattlePartPowderSnow, 0, 0]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["snd", FightSFXPowderSnow]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgmulti", "ice", 20, noone]);
			ds_queue_enqueue(animations, ["wait", 20]);		
		}
		if (tc == 1) {
			global.battleTargetObj = randomAllyAliveProvokable();
			applyEffectSilent(global.battleTargetObj, ["FrigidIce", 999]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Frigid Ice@0."]);
			ds_queue_enqueue(animations, ["lastblow", "Frigid Ice"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["call", aiGlacierGlitchDimension3Callback2]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (tc == 2) {
			global.battleTargetObj = markedAllyOrRandom();
			removeEffect(global.battleTargetObj, "FrigidIce");
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Frigid Ice@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Frigid Ice"]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["snd", FightSFXIce1]);
			ds_queue_enqueue(animations, ["rmmarkers_all"]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimIce1, 1]);
			ds_queue_enqueue(animations, ["wait", 10]);
			var allies = allThreeAliveAllies();
			// first yourself
			ds_queue_enqueue(animations, ["dmgsingle", "ice", 20, noone]);
			// then everyone else
			for (var i=0; i<3; i++) {
				if (allies[i] != noone && allies[i].id != global.battleTargetObj.id) {
					var dist = point_distance(allies[i].x, allies[i].y, global.battleTargetObj.x, global.battleTargetObj.y);
					var potency = max(10, 80 - dist * 0.2);
					ds_queue_enqueue(animations, ["dmgsingle_to", "none", potency, noone, allies[i]]);
				}
			}
		}
	}
	
	if (global.battleCurrentObj.species == "0473") {	
		if (tc == 0) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Earth Power@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["call", ai004GD1Fight3Callback1]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["rmmarkers_all"]);
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
			
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Ice Shard@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			var tele = [];
			for (var i=0; i<8; i++) {
				array_push(tele, ["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 600, 25, i*45]);
			}
			ds_queue_enqueue(animations, ["mktelegraph", tele]);
			ds_queue_enqueue(animations, ["wait", 75]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		
		if (tc == 2) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Ice Shard@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Ice Shard"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			var tele = [];
			for (var i=0; i<8; i++) {
				array_push(tele, ["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 600, 25, i*45]);
			}
			ds_queue_enqueue(animations, ["mktelegraph", tele]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["dmgmulti", "ice", 50, ["DamageDown", 3]]);
		}
	}
}
function aiGlacierGlitchDimension3Callback2() {
	with (global.battleTargetObj) {
		if (alliance) {
			markerAlpha = 0;
			markerAlphaExcess = 2;
			personalMarker = MARKER_FLARE;
			markerOwner = global.battleCurrentObj.id;
		}
	}
}

function aiGlacierGlitchDimension4Init() {
	if (global.turnCounter == 0) {
		with (BattleObject) {
			if (alliance) array_push(self.effects, variable_clone(["GoodBoy", 999]));	
		}
		instance_create(BattlePartMightyena, 0, 0);
	}
}

function aiGlacierGlitchDimension4() {
	if (global.petCounter < 3) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is looking for attention."]);
		ds_queue_enqueue(animations, ["wait", 90]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	} else {
		var msgs = [
			"" + global.battleCurrentObj.combatantNameDecorated + " is overstimulated!",
			"" + global.battleCurrentObj.combatantNameDecorated + "'s excitement grows ever more!",
			"" + global.battleCurrentObj.combatantNameDecorated + " starts turning into a fluffy blur.",
			"" + global.battleCurrentObj.combatantNameDecorated + " is approaching QPU speed.",
			"" + global.battleCurrentObj.combatantNameDecorated + " is experiencing float imprecision issues.",
			"" + global.battleCurrentObj.combatantNameDecorated + " has broken out of bounds.",
		];
		if (BattlePartMightyena.phase == 5) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", msgs[BattlePartMightyena.phase]]);
			ds_queue_enqueue(animations, ["wait", 90]);
			ds_queue_enqueue(animations, ["dmgsingle_to", "none", 99999, noone, global.battleCurrentObj]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		} else {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", msgs[BattlePartMightyena.phase]]);
			ds_queue_enqueue(animations, ["wait", 110]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		global.petCounter -= 3;
		BattlePartMightyena.phase += 1;
	}
}

function aiGlacierGlitchDimensionBoss() {
	if (global.turnCounter == 0) {
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Dreams of Ice@0!"]);
		ds_queue_enqueue(animations, ["wait", 35]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["fadetowhite"]);
		ds_queue_enqueue(animations, ["snd", FightSFXPowderSnow]);
		ds_queue_enqueue(animations, ["wait", 50]);
		ds_queue_enqueue(animations, ["call", aiGlacierGlitchDimensionBoss_PlaceIce1]);
		ds_queue_enqueue(animations, ["snd", FightSFXIce1]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["fadefromwhite"]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["msg", "Ice crystals have formed around the arena!"]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		global.battleSelectedDir = choose(FACING_U, FACING_D, FACING_L, FACING_R);
		var tele = [
			["cone", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 600, 1200, facingToDir(global.battleSelectedDir)]
		];
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Frost Breath@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleSelectedDir]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["mktelegraph", tele]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["anim_facepoint", -1, 320, 1000]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 1) {
		var tele = [
			["cone", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 600, 1200, facingToDir(global.battleSelectedDir)]
		];
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Frost Breath@0."]);
		ds_queue_enqueue(animations, ["lastblow", "Frost Breath"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleSelectedDir]);
		ds_queue_enqueue(animations, ["mktelegraph", tele]);
		ds_queue_enqueue(animations, ["snd", FightSFXWind3]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["snd", FightSFXIce1]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snapshot2"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["dmgmulti", "ice", 40, ["DamageDown", 3]]);
		ds_queue_enqueue(animations, ["anim_facepoint", -1, 320, 1000]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["msg", "Crystals were imbued with @1Reflected Frost Breath@0."]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		global.battleTargetObj = randomAllyAliveProvokable();
		applyEffectSilent(global.battleTargetObj, ["FrigidIce", 999]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Frigid Ice@0."]);
		ds_queue_enqueue(animations, ["lastblow", "Frigid Ice"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["call", aiGlacierGlitchDimension3Callback2]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 2) {
		aiGlacierGlitchDimensionBoss_ReflectedFrostBreath();
		
		global.battleTargetObj = markedAllyOrRandom();
		removeEffect(global.battleTargetObj, "FrigidIce");
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Frigid Ice@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Frigid Ice"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["snd", FightSFXIce1]);
		ds_queue_enqueue(animations, ["rmmarkers_all"]);
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimIce1, 1]);
		ds_queue_enqueue(animations, ["wait", 10]);
		var allies = allThreeAliveAllies();
		// first yourself
		ds_queue_enqueue(animations, ["dmgsingle", "ice", 20, noone]);
		// then everyone else
		for (var i=0; i<3; i++) {
			if (allies[i] != noone && allies[i].id != global.battleTargetObj.id) {
				var dist = point_distance(allies[i].x, allies[i].y, global.battleTargetObj.x, global.battleTargetObj.y);
				var potency = max(10, 80 - dist * 0.2);
				ds_queue_enqueue(animations, ["dmgsingle_to", "none", potency, noone, allies[i]]);
			}
		}
	}
	if (global.turnCounter == 3) {
		aiGlacierGlitchDimensionBoss_ReflectedFrostBreath();
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Powder Snow@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Powder Snow"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["spawn", BattlePartPowderSnow, 0, 0]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["snd", FightSFXPowderSnow]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["snapshot_all"]);
		ds_queue_enqueue(animations, ["dmgmulti", "ice", 20, noone]);
		ds_queue_enqueue(animations, ["wait", 20]);		
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Shatter@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 65]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 4) {
		aiGlacierGlitchDimensionBoss_ReflectedFrostBreath();
		
		global.battleAllTele2 = [];
		with (BattlePartIceCrystal) {
			array_push(global.battleAllTele2, ["circle", x, y, 0, 0, 115, 0, 0]);
		}
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Shatter@0."]);
		ds_queue_enqueue(animations, ["lastblow", "Shatter"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele2]);
		ds_queue_enqueue(animations, ["snd", FightSFXIce1]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["call", aiGlacierGlitchDimensionBoss_RemoveAllIce]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["dmgmulti", "ice", 40, ["DamageDown", 3]]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "The ice has shattered!"]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 5) {
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Dreams of Ice@0!"]);
		ds_queue_enqueue(animations, ["wait", 35]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["fadetowhite"]);
		ds_queue_enqueue(animations, ["snd", FightSFXPowderSnow]);
		ds_queue_enqueue(animations, ["wait", 50]);
		ds_queue_enqueue(animations, ["call", aiGlacierGlitchDimensionBoss_PlaceIce2]);
		ds_queue_enqueue(animations, ["snd", FightSFXIce1]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["fadefromwhite"]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["msg", "Ice crystals have formed around the arena!"]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		var tele = [
			["donut", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 200, 90, 0]
		];
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Hollow Icestorm@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["mktelegraph", tele]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 6) {
		var tele = [
			["donut", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 200, 90, 0]
		];
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Hollow Icestorm@0."]);
		ds_queue_enqueue(animations, ["lastblow", "Hollow Icestorm"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["mktelegraph", tele]);
		ds_queue_enqueue(animations, ["snd", FightSFXWind3]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["snapshot2"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["dmgmulti", "ice", 40, ["DamageDown", 3]]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["msg", "Crystals were imbued with @1Reflected Hollow Icestorm@0."]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Hurricane@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["call", ai004GD1Fight3Callback1]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 7) {
		aiGlacierGlitchDimensionBoss_ReflectedHollowIcestorm();
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Hurricane@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Hurricane"]);
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
			ds_queue_enqueue(animations, ["snd", FightSFXTwister]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgmulti", "flying", 30, ["VulnerabilityUp", 1]]);
			ds_queue_enqueue(animations, ["wait", 15]);
		}
	}
	if (global.turnCounter == 8) {
		aiGlacierGlitchDimensionBoss_ReflectedHollowIcestorm();

		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Powder Snow@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Powder Snow"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["spawn", BattlePartPowderSnow, 0, 0]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["snd", FightSFXPowderSnow]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["snapshot_all"]);
		ds_queue_enqueue(animations, ["dmgmulti", "ice", 20, noone]);
		ds_queue_enqueue(animations, ["wait", 20]);		
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Shatter@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["wait", 65]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 9) {
		aiGlacierGlitchDimensionBoss_ReflectedHollowIcestorm();
		
		global.battleAllTele2 = [];
		with (BattlePartIceCrystal) {
			array_push(global.battleAllTele2, ["circle", x, y, 0, 0, 115, 0, 0]);
		}
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Shatter@0."]);
		ds_queue_enqueue(animations, ["lastblow", "Shatter"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele2]);
		ds_queue_enqueue(animations, ["snd", FightSFXIce1]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["call", aiGlacierGlitchDimensionBoss_RemoveAllIce]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["dmgmulti", "ice", 40, ["DamageDown", 3]]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "The ice has shattered!"]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter == 10) {
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Dreams of Ice@0!"]);
		ds_queue_enqueue(animations, ["wait", 35]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["fadetowhite"]);
		ds_queue_enqueue(animations, ["snd", FightSFXPowderSnow]);
		ds_queue_enqueue(animations, ["wait", 50]);
		ds_queue_enqueue(animations, ["call", aiGlacierGlitchDimensionBoss_PlaceIce3]);
		ds_queue_enqueue(animations, ["snd", FightSFXIce1]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["fadefromwhite"]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["msg", "Ice crystals have formed around the arena!"]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		
		var allies = randomListOfThreeAllies();
		if (allies[0] != noone) {
			applyEffectSilent(allies[0], ["SpreadingCold", 2]);
		}
		if (allies[1] != noone) {
			applyEffectSilent(allies[1], ["SpreadingCold", 2]);
		}
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Spreading Cold@0!"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snd", FightSFXMultiEff]);
		ds_queue_enqueue(animations, ["msg", "Party members were affected by @1Spreading Cold@0."]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
	}
	if (global.turnCounter == 11 || global.turnCounter == 12) {
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Absolute Zero@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Absolute Zero"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["spawn", BattlePartAbsoluteZero, 0, 0]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["snd", FightSFXPowderSnow]);
		ds_queue_enqueue(animations, ["wait", 25]);
		var allies = allAllies();
		for (var i=0; i<array_length(allies); i++) {
			ds_queue_enqueue(animations, ["animpart_member", allies[i], AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXIce1]);
			if (!hasStatus(allies[i], "SpreadingCold")) {
				ds_queue_enqueue(animations, ["dmgsingle_to", "none", 15, noone, allies[i]]);
				ds_queue_enqueue(animations, ["wait", 10]);
				continue;
			}
			ds_queue_enqueue(animations, ["dmgsingle_to", "none", 40, ["TwiceComeRuin", 1], allies[i]]);
			var nearest1 = aiGlacierGlitchNthNearestAllyOrIce(allies[i].x, allies[i].y, 2);
			var nearest2 = aiGlacierGlitchNthNearestAllyOrIce(allies[i].x, allies[i].y, 3);
			aiGlacierGlitchDimensionBoss_HandleSpreadingCold(nearest1);
			aiGlacierGlitchDimensionBoss_HandleSpreadingCold(nearest2);
		}
		var ice = aiGlacierGlitchDimensionBoss_GetAllIce();
		for (var i=0; i<array_length(ice); i++) {
			if (!ice[i].affected) continue;
			ds_queue_enqueue(animations, ["animpart_member", ice[i], AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["snd", FightSFXIce1]);
			var nearest1 = aiGlacierGlitchNthNearestAllyOrIce(ice[i].x, ice[i].y, 2);
			var nearest2 = aiGlacierGlitchNthNearestAllyOrIce(ice[i].x, ice[i].y, 3);
			aiGlacierGlitchDimensionBoss_HandleSpreadingCold(nearest1);
			aiGlacierGlitchDimensionBoss_HandleSpreadingCold(nearest2);
		}
		ds_queue_enqueue(animations, ["call", aiGlacierGlitchDimensionBoss_StruckToAffected]);
		
		if (global.turnCounter == 12) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Shatter@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 65]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
	if (global.turnCounter == 13) {
		global.battleAllTele2 = [];
		with (BattlePartIceCrystal) {
			array_push(global.battleAllTele2, ["circle", x, y, 0, 0, 115, 0, 0]);
		}
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Shatter@0."]);
		ds_queue_enqueue(animations, ["lastblow", "Shatter"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele2]);
		ds_queue_enqueue(animations, ["snd", FightSFXIce1]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["call", aiGlacierGlitchDimensionBoss_RemoveAllIce]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["dmgmulti", "ice", 40, ["DamageDown", 3]]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "The ice has shattered!"]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (global.turnCounter >= 14) {
		var potency = 20;
		if (global.turnCounter > 15) potency = 99999;
		if (global.turnCounter == 15) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is enraged!"]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		} else {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Powder Snow@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Powder Snow"]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["spawn", BattlePartPowderSnow, 0, 0]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["snd", FightSFXPowderSnow]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["snapshot_all"]);
			ds_queue_enqueue(animations, ["dmgmulti", "ice", potency, noone]);
			ds_queue_enqueue(animations, ["wait", 20]);	
		}
	}
}

function aiGlacierGlitchDimensionBoss_StruckToAffected() {
	with (BattlePartIceCrystal) {
		if (struck) affected = true;
	}
}
function aiGlacierGlitchDimensionBoss_HandleSpreadingCold(nearest1) {
	ds_queue_enqueue(animations, ["snd", FightSFXWarp]);
	ds_queue_enqueue(animations, ["animpart_member", nearest1, AnimGeneric2, 1]);
	ds_queue_enqueue(animations, ["wait", 15]);
	if (nearest1.object_index == BattleObject) {
		ds_queue_enqueue(animations, ["dmgsingle_to", "normal", 25, ["TwiceComeRuin", 1], nearest1]);
		applyEffect(nearest1, ["SpreadingCold", 2]);
	} else {
		ds_queue_enqueue(animations, ["callarg", aiGlacierGlitchDimensionBossStrikeIce, nearest1]);
		ds_queue_enqueue(animations, ["msg", "Crystal was imbued with @1Spreading Cold@0."]);
		ds_queue_enqueue(animations, ["wait", 50]);
		ds_queue_enqueue(animations, ["nomsg"]);
	}
	ds_queue_enqueue(animations, ["wait", 15]);
}
function aiGlacierGlitchDimensionBossStrikeIce(idx) {
	idx.struck = true;
}
function aiGlacierGlitchNthNearestAllyOrIce(pointx, pointy, n){
    var list,nearest;
    n = min(max(1,n),instance_number(BattleTangible));
    list = ds_priority_create();
    nearest = noone;
    with (BattleTangible) {
		var ok = false;
		if (object_index == BattleObject) {
			if (alliance && curHP > 0) ok = true;
		}
		if (object_index == BattlePartIceCrystal) ok = true;
		if (ok) ds_priority_add(list,id,distance_to_point(pointx,pointy));
	}
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}
function aiGlacierGlitchDimensionBossIntro() {
	if (global.turnCounter == 0) {
		audio_stop_all();
		global.musicIndex = 16;
		global.musicControl = MUS_PLAY;
	}	
}
function aiGlacierGlitchDimensionBoss_RemoveAllIce() {
	with (BattlePartIceCrystal) del = true;
}
function aiGlacierGlitchDimensionBoss_PlaceIce(xx, yy, refl) {
	var oo = instance_create(BattlePartIceCrystal, xx, yy);
	oo.refl = refl;
	var coll = collision_rectangle(oo.x-30, oo.y-30, oo.x+30, oo.y+30, BattleObject, false, false);
	if (instance_exists(coll)) {
		coll.x += lengthdir_x(60, facingToDir(refl));
		coll.y += lengthdir_y(60, facingToDir(refl));
	}
}
function aiGlacierGlitchDimensionBoss_PlaceIce1() {
	aiGlacierGlitchDimensionBoss_PlaceIce(100, 240-55, FACING_R);
	aiGlacierGlitchDimensionBoss_PlaceIce(100, 240+55, FACING_R);
	aiGlacierGlitchDimensionBoss_PlaceIce(640-100, 240-55, FACING_L);
	aiGlacierGlitchDimensionBoss_PlaceIce(640-100, 240+55, FACING_L);
	aiGlacierGlitchDimensionBoss_PlaceIce(320, 100, FACING_D);
	aiGlacierGlitchDimensionBoss_PlaceIce(320, 480-100, FACING_U);
}
function aiGlacierGlitchDimensionBoss_PlaceIce2() {
	aiGlacierGlitchDimensionBoss_PlaceIce(320, 100, FACING_D);
	aiGlacierGlitchDimensionBoss_PlaceIce(130, 100, FACING_D);
	aiGlacierGlitchDimensionBoss_PlaceIce(640-130, 100, FACING_D);
	aiGlacierGlitchDimensionBoss_PlaceIce(320, 480-100, FACING_U);
	aiGlacierGlitchDimensionBoss_PlaceIce(130, 480-100, FACING_U);
	aiGlacierGlitchDimensionBoss_PlaceIce(640-130, 480-100, FACING_U);
}
function aiGlacierGlitchDimensionBoss_PlaceIce3() {
	var pos1 = choose(100, 480-100);
	var pos2 = choose(100, 480-100);
	var pos3 = choose(100, 480-100);
	aiGlacierGlitchDimensionBoss_PlaceIce(100, pos1, pos1 == 100 ? FACING_D : FACING_U);
	aiGlacierGlitchDimensionBoss_PlaceIce(320, pos2, pos2 == 100 ? FACING_D : FACING_U);
	aiGlacierGlitchDimensionBoss_PlaceIce(640-100, pos3, pos3 == 100 ? FACING_D : FACING_U);
}

function aiGlacierGlitchDimensionBoss_GetAllIce() {
	global.scratch = [];
	with (BattlePartIceCrystal) {
		array_push(global.scratch, self);
	}
	return global.scratch;
}
function aiGlacierGlitchDimensionBoss_ReflectedFrostBreath() {
		global.battleAllTele = [];
		with (BattlePartIceCrystal) {
			if (struck) {
				refl = facingOpposite(global.battleSelectedDir);
				array_push(global.battleAllTele, [
					"cone", x+lengthdir_x(5, facingToDir(refl)), y+lengthdir_y(5, facingToDir(refl)),
					0, 0, 600, 1200, facingToDir(refl)
				]);
			}
			struck = false;
		}
		global.battleSelectedDir = facingOpposite(global.battleSelectedDir);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "@2Environment@0 used @1Reflected Frost Breath@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Reflected Frost Breath"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele]);
		ds_queue_enqueue(animations, ["snd", FightSFXWind3]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snapshot2"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["dmgmulti", "ice", 40, ["DamageDown", 3]]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["msg", "Crystals were imbued with @1Frost Breath@0's effect!"]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
}
function aiGlacierGlitchDimensionBoss_ReflectedHollowIcestorm() {
		global.battleAllTele = [];
		with (BattlePartIceCrystal) {
			if (struck) {
				array_push(global.battleAllTele, ["donut", x, y, 0, 0, 200, 90, 0]);
			}
			struck = false;
		}
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "@2Environment@0 used @1Reflected Hollow Icestorm@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Reflected Frost Breath"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele]);
		ds_queue_enqueue(animations, ["snd", FightSFXWind3]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snapshot2"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["dmgmulti", "ice", 40, ["DamageDown", 3]]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["msg", "Crystals were imbued with @1Hollow Icestorm@0's effect!"]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
}