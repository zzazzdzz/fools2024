
function ai012AbyssFights(){

}

function aiAbyss1() {
	if (global.battleCurrentObj.curHP <= 0) return;
	var tc = global.turnCounter % 2;
	
	if (global.battleCurrentObj.species == "0076") {
		var bb = allBySpecies("0000");
		if (tc == 0 && bb != noone) {
			global.battleTargetObj = bb;
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
		} else {
			global.battleTargetObj = randomAllyAliveProvokable();
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
				ds_queue_enqueue(animations, ["dmgsingle", "rock", 10+i*10, noone]);
				ds_queue_enqueue(animations, ["wait", 10]);	
			}
			ds_queue_enqueue(animations, ["wait", 10]);	
		}
	}
	if (global.battleCurrentObj.species == "0126") {
		global.battleTargetObj = randomAllyAliveProvokable();
		if (tc == 0) {
			attack020Flamethrower();
		} else {
			attack025BlastBurn();	
		}
	}
	
	if (global.battleCurrentObj.species == "0000") {
		if (tc == 0) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " prepares something horrible..."]);
			ds_queue_enqueue(animations, ["wait", 90]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (tc == 1) {
			global.musicControl = MUS_FADEOUT;
			global.isCorrupted = true;
			with (BattleObject) {
				if (alliance) {
					var v = [
						"4 'd    NOp~'r 'd   'tn) z xQ   xkh J? ??z 't 'v  tzx    9't  i",
						" tzx  O 9   qZ    PCPC 9f  gM ? o? o? ._7  'l'l 2?? ?  z tzx (Q",
						" 8 Iii  MJgD +a  11z  0  tzx tzx  4  pTM  iPCPCaPCPC"
					];
					combatantName = v[combatantIndex];
					combatantNameDecorated = "@2" + v[combatantIndex] + "@0";
				} else {
					var v = choose("aQ 4 'd    NOp~'r 'd   'tn) z xQ   xkh J? ??z 't 'v  tzx    9't  i","aW tzx  O 9   qZ    PCPC 9f  gM ? o? o? ._7  'l'l 2?? ?  z tzx (Q","aT 8 Iii  MJgD +a  11z  0  tzx tzx  4  pTM  iPCPCaPCPC");
					if (species == "0000") {
						combatantName = "        TM     TRAINER              'tz    9";
						combatantNameDecorated = "@7        TM     TRAINER              'tz    9@0";
					} else {
						combatantName = v;
						combatantNameDecorated = "@7" + v + "@0";
					}
					att = 835;
					sp_att = 835;
					def = 1;
					sp_def = 1;
				}
				lv = 127;
				if (curHP > 0) {
					curHP = irandom_range(19999,49999);
					maxHP = irandom_range(19999,49999);
				}
			}
			applyEffectSilent(global.battleCurrentObj, ["Frozen", 999]);
			applyEffectSilent(global.battleCurrentObj, ["Burning", 999]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "@7??????????@0 used !"]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["snd", FightSFXTMTrainer]);
			ds_queue_enqueue(animations, ["msg", "No effect!"]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
}

function aiAbyss2() {
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
	
	if (global.battleCurrentObj.species == "0112") {
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
			ds_queue_enqueue(animations, ["dmgmultishared", "ground", 100, noone]);
			ds_queue_enqueue(animations, ["wait", 15]);
		
			with (BattleObject) removeEffect(self, "Prey");	
		}
	}
	
	if (global.battleCurrentObj.species == "0115") {
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
			ds_queue_enqueue(animations, ["dmgmulti", "normal", 50, ["DamageDown", 3]]);
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
		
		if (tc == 1 || tc == 3 || tc == 5 || tc == 7 || tc == 9) {
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
			ds_queue_enqueue(animations, ["dmgsingle", "normal", 55, noone]);
			ds_queue_enqueue(animations, ["wait", 40]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			var haircuts = [
				["Right Pummel", ["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 800, dirWrap(facingToDir(global.battleCurrentObj.facing) - 90)]],
				["Left Pummel", ["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 800, 800, dirWrap(facingToDir(global.battleCurrentObj.facing) + 90)]]
			];
			global.battleScriptTele2 = choose(haircuts[0], haircuts[1]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1" + global.battleScriptTele2[0] + "@0."]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			//ds_queue_enqueue(animations, ["mktelegraph", [global.battleScriptTele2[1]]]);
			ds_queue_enqueue(animations, ["wait", 60]);
			//ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		
		if (tc == 2 || tc == 4 || tc == 6 || tc == 8 || tc == 10) {
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
			ds_queue_enqueue(animations, ["dmgmulti", "normal", 60, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		
		if (tc >= 11) {
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
}

function aiAbyss3() {
	if (global.battleCurrentObj.curHP <= 0) return;
	var tc = global.turnCounter % 2;
	
	if (tc == 0) {
		attack010Concentrate();	
	}
	if (tc == 1) {
		global.battleTargetObj = randomAllyAliveProvokable();
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Rapid Spin@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Rapid Spin"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["animpart_member", -2, AnimSpin, 1]);
		ds_queue_enqueue(animations, ["snd", FightSFXWind4]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["dmgsingle", "normal", 60, noone]);
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}

function effectFrozenSolid(t) {
	BattleController.alarm[0] = 10;
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + " is frozen solid!"]);
	ds_queue_enqueue(animations, ["wait", 65]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function aiGlitchLord() {
	var possibles = [
		["Null Pointer", "Dangling Pointer"],
		["Null Pointer", "Wild Pointer"],
		["Void Pointer", "Dangling Pointer"],
		["Void Pointer", "Wild Pointer"],
		["Dangling Pointer", "Null Pointer"],
		["Wild Pointer", "Null Pointer"],
		["Dangling Pointer", "Void Pointer"],
		["Wild Pointer", "Void Pointer"]
	];
	var possibles_tele = [
		[0, 2],
		[0, 3],
		[1, 2],
		[1, 3],
		[2, 0],
		[3, 0],
		[2, 1],
		[3, 1]
	];
	
	if (!global.eventFlags[EVENT_ABYSSPRE_COINCASEUSED]) {
		if (global.turnCounter == 0) {
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
You think you got me all figured out, but there's one thing you
didn't account for!\d54 @My numbers... are bigger than yours!\d54 @Funny thing really... get to a high enough level, and you're
basically untouchable.\d54 @But I've got good news.
You see, there's no need to wonder where your god is.\d54 @Cause he's right here...
...and he's fresh out of mercy!\d54 \c30
			"), noone]);
			ds_queue_enqueue(animations, ["wait_msg"]);
		}
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Atomic Glitch Bomb@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Atomic Glitch Bomb"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["spawn", BattlePartRST38, 0, 0]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["snd", SoundGlitch2]);
		ds_queue_enqueue(animations, ["wait", 15]);
		var everyone = allAliveAllies();
		for (var i=0; i<array_length(everyone); i++) {
			ds_queue_enqueue(animations, ["animpart_member", everyone[i], AnimEat, 1]);
			ds_queue_enqueue(animations, ["snd", SoundGlitch3]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["dmgsingle_to", "none", 275, noone, everyone[i]]);
			ds_queue_enqueue(animations, ["wait", 10]);	
		}
		ds_queue_enqueue(animations, ["wait", 10]);	
	} else {
		if (global.turnCounter == 0) {
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
Your world. Your worthless existences.
They shall all turn to dust!\d54 \c30
			"), noone]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Atomic Glitch Bomb@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Atomic Glitch Bomb"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["spawn", BattlePartRST38, 0, 0]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["snd", SoundGlitch2]);
			ds_queue_enqueue(animations, ["wait", 15]);
			var everyone = allAliveAllies();
			for (var i=0; i<array_length(everyone); i++) {
				ds_queue_enqueue(animations, ["animpart_member", everyone[i], AnimEat, 1]);
				ds_queue_enqueue(animations, ["snd", SoundGlitch3]);
				ds_queue_enqueue(animations, ["wait", 5]);
				ds_queue_enqueue(animations, ["dmgsingle_to", "dragon", 90, noone, everyone[i]]);
				ds_queue_enqueue(animations, ["wait", 10]);	
			}
			ds_queue_enqueue(animations, ["wait", 10]);	
		}
		if (global.turnCounter == 1) {
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
Hey {TEAM0}, wake up...\d10
It's time for...\d10 \c31Pointer Fun\c30!\d10 Mwahaha!\d54 \c30
			"), noone]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			
			global.battleStoredDirection = choose(0, 1, 2, 3, 4, 5, 6, 7);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Pointer Fun@0!"]);
			ds_queue_enqueue(animations, ["wait", 35]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["fadetowhite"]);
			ds_queue_enqueue(animations, ["snd", KeyChamberOpenSound]);
			ds_queue_enqueue(animations, ["wait", 50]);
			ds_queue_enqueue(animations, ["call", aiGlitchLord_Pointers1]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["fadefromwhite"]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["msg", "@7" + possibles[global.battleStoredDirection][0] + "@0 and @7" + possibles[global.battleStoredDirection][1] + "@0 appeared!"]);
			ds_queue_enqueue(animations, ["wait", 120]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (global.turnCounter == 2) {
			ds_queue_enqueue(animations, ["callarg", aiGlitchLord_Speen, aiGlitchLord_GetPointer(1)]);
			ds_queue_enqueue(animations, ["msg", "@7" + possibles[global.battleStoredDirection][0] + "@0 readies @1Dereference@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			ds_queue_enqueue(animations, ["callarg", aiGlitchLord_Speen, aiGlitchLord_GetPointer(2)]);
			ds_queue_enqueue(animations, ["msg", "@7" + possibles[global.battleStoredDirection][1] + "@0 readies @1Dereference@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			global.battleCurrentObj.stock = choose(0, 1);
			ds_queue_enqueue(animations, ["wait", 10]);
			if (global.battleCurrentObj.stock == 0) {
				ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Precision Glitch Strike@0."]);
			} else {
				ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Cluster Glitch Bomb@0."]);
			}
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 95]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (global.turnCounter == 3) {
			aiGlitchLord_PointerAttack(aiGlitchLord_GetPointer(1));
			aiGlitchLord_PointerAttack(aiGlitchLord_GetPointer(2));
			
			if (global.battleCurrentObj.stock == 0) {
				// stack	
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Precision Glitch Strike@0."]);
				ds_queue_enqueue(animations, ["wait", 30]);
				ds_queue_enqueue(animations, ["nomsg"]);
				
				ds_queue_enqueue(animations, ["mktelegraph", [
					["circle", global.battleTargetObj.x, global.battleTargetObj.y, 0, 0, 85, 0, 0]
				]]);
				ds_queue_enqueue(animations, ["rmmarkers", BattleObject]);
				ds_queue_enqueue(animations, ["snd", SoundGlitch3]);
				ds_queue_enqueue(animations, ["wait", 15]);
				ds_queue_enqueue(animations, ["snapshot"]);
				ds_queue_enqueue(animations, ["rmtelegraph"]);
				ds_queue_enqueue(animations, ["dmgmultishared", "dragon", 300, noone]);
				ds_queue_enqueue(animations, ["wait", 15]);
			} else {
				// spread
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Cluster Glitch Bomb@0."]);
				ds_queue_enqueue(animations, ["wait", 30]);
				ds_queue_enqueue(animations, ["nomsg"]);
				
				var everyone = allAllies();
				for (var i=0; i<array_length(everyone); i++) {
					ds_queue_enqueue(animations, ["mktelegraph", [
						["circle", everyone[i].x, everyone[i].y, 0, 0, 100, 0, 0]
					]]);
					ds_queue_enqueue(animations, ["snd", SoundGlitch3]);
					ds_queue_enqueue(animations, ["wait", 15]);
					ds_queue_enqueue(animations, ["snapshot"]);
					ds_queue_enqueue(animations, ["rmtelegraph"]);
					ds_queue_enqueue(animations, ["dmgmulti", "dragon", 70, ["TwiceComeRuin", 1]]);
					ds_queue_enqueue(animations, ["wait", 15]);
				}
			}
		}
		if (global.turnCounter == 4) {
			var definitelyNotNael = [
				[
					@"\c32Near and far\c30 across the land,\d28 \c30" + "\n",
					@"\c32Across the edge\c30 of the universe,\d28 \c30" + "\n"
				],
				[
					@"I shall bring forth my \c32blazing fury\c30!\d64 \c30",
					@"shall the \c32roots\c30 of my rage ensnare you!\d64 \c30",
					@"shall the \c32waves\c30 of my wrath crash upon thee!\d64 \c30"
				]
			];
			global.battleCurrentObj.stock = [choose(0, 1), choose(0, 1, 2)];
			
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(
				definitelyNotNael[0][global.battleCurrentObj.stock[0]] + definitelyNotNael[1][global.battleCurrentObj.stock[1]]
			), noone]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1King's Will@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 65]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			if (global.battleStoredDirection < 4) {
				ds_queue_enqueue(animations, ["msg", "@7" + possibles[global.battleStoredDirection][0] + "@0 used @1Assignment@0."]);
				ds_queue_enqueue(animations, ["wait", 35]);
				ds_queue_enqueue(animations, ["callarg", aiGlitchLord_Speen, aiGlitchLord_GetPointer(1)]);
				ds_queue_enqueue(animations, ["snd", FightSFXWarp]);
				ds_queue_enqueue(animations, ["animpart_coord", [140, 180*2], AnimEat, 1]);
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["nomsg"]);
				ds_queue_enqueue(animations, ["wait", 20]);
				ds_queue_enqueue(animations, ["msg", "@7" + possibles[global.battleStoredDirection][0] + "@0 has become a @7" + possibles[global.battleStoredDirection][1] + "@0!"]);
				ds_queue_enqueue(animations, ["wait", 80]);
				ds_queue_enqueue(animations, ["nomsg"]);
			} else {
				ds_queue_enqueue(animations, ["msg", "@7" + possibles[global.battleStoredDirection][1] + "@0 used @1Assignment@0."]);
				ds_queue_enqueue(animations, ["wait", 35]);
				ds_queue_enqueue(animations, ["callarg", aiGlitchLord_Speen, aiGlitchLord_GetPointer(2)]);
				ds_queue_enqueue(animations, ["snd", FightSFXWarp]);
				ds_queue_enqueue(animations, ["animpart_coord", [640-140, 180*2], AnimEat, 1]);
				ds_queue_enqueue(animations, ["wait", 10]);
				ds_queue_enqueue(animations, ["nomsg"]);
				ds_queue_enqueue(animations, ["wait", 20]);
				ds_queue_enqueue(animations, ["msg", "@7" + possibles[global.battleStoredDirection][1] + "@0 has become a @7" + possibles[global.battleStoredDirection][0] + "@0!"]);
				ds_queue_enqueue(animations, ["wait", 80]);
				ds_queue_enqueue(animations, ["nomsg"]);
			}
		}
		if (global.turnCounter == 5) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1King's Will@0."]);
			ds_queue_enqueue(animations, ["lastblow", "King's Will"]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["nomsg"]);
			
			var which1, which2;
			if (global.battleCurrentObj.stock[0] == 0) {
				which1 = allyNthNearest(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
				which2 = allyNthFurthest(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
			} else {
				which1 = allyNthFurthest(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
				which2 = allyNthFurthest(global.battleCurrentObj.x, global.battleCurrentObj.y, 2);
			}
			var attType;
			if (global.battleCurrentObj.stock[1] == 0) attType = "fire";
			if (global.battleCurrentObj.stock[1] == 1) attType = "grass";
			if (global.battleCurrentObj.stock[1] == 2) attType = "water";
			var attSounds = [FightSFXFlamethrower, FightSFXWideSlash, FightSFXWater];
			
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", which1.x, which1.y, 0, 0, 170, 0, 0]
			]]);
			ds_queue_enqueue(animations, ["snd", attSounds[global.battleCurrentObj.stock[1]]]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["dmgmulti", attType, 200, ["TwiceComeRuin", 1]]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", which2.x, which2.y, 0, 0, 170, 0, 0]
			]]);
			ds_queue_enqueue(animations, ["snd", attSounds[global.battleCurrentObj.stock[1]]]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["dmgmulti", attType, 200, ["TwiceComeRuin", 1]]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			aiGlitchLord_PointerAttack2(aiGlitchLord_GetPointer(1));
			aiGlitchLord_PointerAttack2(aiGlitchLord_GetPointer(2));
			
			ds_queue_enqueue(animations, ["call", aiGlitchLord_ClearPointers]);
			ds_queue_enqueue(animations, ["msg", "The pointers have disappeared."]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (global.turnCounter == 6) {
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
I have control over the very foundations of creation!\d28 \c30
Your resistance is futile!\d38 \c30
			"), noone]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Super Glitch@0."]);
			ds_queue_enqueue(animations, ["call", aiGlitchLord_StartScroll]);
			ds_queue_enqueue(animations, ["snd", SoundGlitch4]);
			ds_queue_enqueue(animations, ["wait", 40]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["fadetowhite"]);
			ds_queue_enqueue(animations, ["wait", 40]);
			ds_queue_enqueue(animations, ["spawn", BattlePartGlitchColors, 0, 0]);
			ds_queue_enqueue(animations, ["call", aiGlitchLord_StartScroll2]);
			ds_queue_enqueue(animations, ["fadefromwhite"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["msg", "Time and space begin to crumble, their laws forsaken!"]);
			ds_queue_enqueue(animations, ["wait", 100]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			var aa = randomListOfAllies();
			applyEffectSilent(aa[0], ["Bleeding", 4]);
			applyEffectSilent(aa[1], ["Bleeding", 4]);
			applyEffectSilent(aa[2], ["Bleeding", 4]);
			applyEffectSilent(aa[0], ["SaveStateX", 4]);
			applyEffectSilent(aa[1], ["SaveStateY", 4]);
			applyEffectSilent(aa[2], ["SaveStateXY", 4]);
			aa = randomListOfAllies();
			if (choose(0, 1) == 0) {
				applyEffectSilent(aa[0], ["NullPointer", 2]);
				applyEffectSilent(aa[1], ["NullPointer", 2]);
				applyEffectSilent(aa[2], ["NullPointer", 2]);
				applyEffectSilent(aa[0], ["VoidPointer", 3]);
				applyEffectSilent(aa[1], ["VoidPointer", 3]);
				applyEffectSilent(aa[2], ["VoidPointer", 3]);
			} else {
				applyEffectSilent(aa[0], ["VoidPointer", 2]);
				applyEffectSilent(aa[1], ["VoidPointer", 2]);
				applyEffectSilent(aa[2], ["VoidPointer", 2]);
				applyEffectSilent(aa[0], ["NullPointer", 3]);
				applyEffectSilent(aa[1], ["NullPointer", 3]);
				applyEffectSilent(aa[2], ["NullPointer", 3]);
			}
			aa = randomListOfAllies();
			applyEffectSilent(aa[0], ["Line1", 999]);
			applyEffectSilent(aa[1], ["Line2", 999]);
			applyEffectSilent(aa[2], ["Line3", 999]);
			aa = randomListOfAllies();
			applyEffectSilent(aa[0], ["Abandonment2", 999]);
			applyEffectSilent(aa[1], ["Isolation2", 999]);
			applyEffectSilent(aa[2], ["WildPointer", 999]);
		}
		if (global.turnCounter == 7) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Save State@0!"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["snd", FightSFXMultiEff]);
			ds_queue_enqueue(animations, ["msg", "Positions of party members were recorded!"]);
			ds_queue_enqueue(animations, ["wait", 80]);
			ds_queue_enqueue(animations, ["nomsg"]);
			
			global.battleCurrentObj.stock = [
				allyWithEffect("SaveStateX").x,
				allyWithEffect("SaveStateY").y,
				allyWithEffect("SaveStateXY").x,
				allyWithEffect("SaveStateXY").y,
				0,0,0,0,
				0,0,0,0
			];
		}
		if (global.turnCounter == 8) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Save State@0!"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["snd", FightSFXMultiEff]);
			ds_queue_enqueue(animations, ["msg", "Positions of party members were recorded!"]);
			ds_queue_enqueue(animations, ["wait", 80]);
			ds_queue_enqueue(animations, ["nomsg"]);
			
			global.battleCurrentObj.stock[4] = allyWithEffect("SaveStateX").x;
			global.battleCurrentObj.stock[5] = allyWithEffect("SaveStateY").y;
			global.battleCurrentObj.stock[6] = allyWithEffect("SaveStateXY").x;
			global.battleCurrentObj.stock[7] = allyWithEffect("SaveStateXY").y;
		}
		if (global.turnCounter == 9) {
			global.battleCurrentObj.stock[8] = allyWithEffect("SaveStateX").x;
			global.battleCurrentObj.stock[9] = allyWithEffect("SaveStateY").y;
			global.battleCurrentObj.stock[10] = allyWithEffect("SaveStateXY").x;
			global.battleCurrentObj.stock[11] = allyWithEffect("SaveStateXY").y;
			
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Execute@0!"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			aiGlitchLord_EffectByDebuff(allyWithEffect("Line1"));
			
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Load State@0!"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXLoadState]);
			ds_queue_enqueue(animations, ["fadetowhite"]);
			ds_queue_enqueue(animations, ["wait", 22]);
			ds_queue_enqueue(animations, ["callarg", aiGlitchLordLoadState, 0]);
			ds_queue_enqueue(animations, ["fadefromwhite"]);
			ds_queue_enqueue(animations, ["wait", 20]);
	
			ds_queue_enqueue(animations, ["call", aiGlitchLordFirstLoadState]);
			ds_queue_enqueue(animations, ["wait", 1]);
		}
		if (global.turnCounter == 10) {
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
After all that, you still stand?\d10 \c30
No matter.\d10 You're only delaying the inevitable.\d54 \c30
			"), noone]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			
			global.battleStoredDirection = choose(0, 1, 2, 3, 4, 5, 6, 7);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Pointer Fun@0!"]);
			ds_queue_enqueue(animations, ["wait", 35]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["fadetowhite"]);
			ds_queue_enqueue(animations, ["snd", KeyChamberOpenSound]);
			ds_queue_enqueue(animations, ["wait", 50]);
			ds_queue_enqueue(animations, ["call", aiGlitchLord_Pointers1]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["fadefromwhite"]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["msg", "@7Null Pointers@0 have appeared!"]);
			ds_queue_enqueue(animations, ["wait", 70]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (global.turnCounter == 11) {
			var definitelyNotNael = [
				[
					@"\c32Near and far\c30 across the land,\d28 \c30" + "\n",
					@"\c32Across the edge\c30 of the universe,\d28 \c30" + "\n"
				],
				[
					@"I shall bring forth my \c32blazing fury\c30!\d64 \c30",
					@"shall the \c32roots\c30 of my rage ensnare you!\d64 \c30",
					@"shall the \c32waves\c30 of my wrath crash upon thee!\d64 \c30"
				]
			];
			global.battleCurrentObj.stock = [choose(0, 1), choose(0, 1, 2)];
			
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(
				definitelyNotNael[0][global.battleCurrentObj.stock[0]] + definitelyNotNael[1][global.battleCurrentObj.stock[1]]
			), noone]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1King's Will@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 65]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			ds_queue_enqueue(animations, ["callarg", aiGlitchLord_Speen, aiGlitchLord_GetPointer(1)]);
			ds_queue_enqueue(animations, ["msg", "@7Null Pointer@0 readies @1Dereference@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			ds_queue_enqueue(animations, ["callarg", aiGlitchLord_Speen, aiGlitchLord_GetPointer(2)]);
			ds_queue_enqueue(animations, ["msg", "@7Null Pointer@0 readies @1Dereference@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (global.turnCounter == 12) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1King's Will@0."]);
			ds_queue_enqueue(animations, ["lastblow", "King's Will"]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["nomsg"]);
			
			var which1, which2;
			if (global.battleCurrentObj.stock[0] == 0) {
				which1 = allyNthNearest(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
				which2 = allyNthFurthest(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
			} else {
				which1 = allyNthFurthest(global.battleCurrentObj.x, global.battleCurrentObj.y, 1);
				which2 = allyNthFurthest(global.battleCurrentObj.x, global.battleCurrentObj.y, 2);
			}
			var attType;
			if (global.battleCurrentObj.stock[1] == 0) attType = "fire";
			if (global.battleCurrentObj.stock[1] == 1) attType = "grass";
			if (global.battleCurrentObj.stock[1] == 2) attType = "water";
			var attSounds = [FightSFXFlamethrower, FightSFXWideSlash, FightSFXWater];
			
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", which1.x, which1.y, 0, 0, 170, 0, 0]
			]]);
			ds_queue_enqueue(animations, ["snd", attSounds[global.battleCurrentObj.stock[1]]]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["dmgmulti", attType, 200, ["TwiceComeRuin", 1]]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", which2.x, which2.y, 0, 0, 170, 0, 0]
			]]);
			ds_queue_enqueue(animations, ["snd", attSounds[global.battleCurrentObj.stock[1]]]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["dmgmulti", attType, 200, ["TwiceComeRuin", 1]]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			aiGlitchLord_PointerAttack3(aiGlitchLord_GetPointer(1));
			aiGlitchLord_PointerAttack3(aiGlitchLord_GetPointer(2));
			
			ds_queue_enqueue(animations, ["call", aiGlitchLord_ClearPointers]);
			ds_queue_enqueue(animations, ["msg", "The pointers have disappeared."]);
			ds_queue_enqueue(animations, ["wait", 55]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Atomic Glitch Bomb@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 65]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (global.turnCounter == 13) {			
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Atomic Glitch Bomb@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Atomic Glitch Bomb"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["spawn", BattlePartRST38, 0, 0]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["snd", SoundGlitch2]);
			ds_queue_enqueue(animations, ["wait", 15]);
			var everyone = allAliveAllies();
			for (var i=0; i<array_length(everyone); i++) {
				ds_queue_enqueue(animations, ["animpart_member", everyone[i], AnimEat, 1]);
				ds_queue_enqueue(animations, ["snd", SoundGlitch3]);
				ds_queue_enqueue(animations, ["wait", 5]);
				ds_queue_enqueue(animations, ["dmgsingle_to", "dragon", 90, noone, everyone[i]]);
				ds_queue_enqueue(animations, ["wait", 10]);	
			}
			ds_queue_enqueue(animations, ["wait", 10]);	
		}
		if (global.turnCounter == 14) {
			if (global.battleCurrentObj.curHP > (global.battleCurrentObj.maxHP div 2)) {
				global.battleCurrentObj.stock = 0;
				ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
Your attempt at confronting me is truly pathetic!\d16 \c30
You didn't even take \c32half of my HP\c30!\d44 \c30@The time for games is over...\d16 \c30
Prepare yourself for my ultimate attack!\d54 \c30
				"), noone]);
			} else {
				global.battleCurrentObj.stock = 1;
				ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
You put up more resistance than I initially imagined.\d16 \c30
But while I respect it, you're still fighting an impossible battle.\d44 \c30@The time for games is over...\d16 \c30
Prepare yourself for my ultimate attack!\d54 \c30
				"), noone]);
			}
			ds_queue_enqueue(animations, ["wait_msg"]);
				
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1RST 38@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["wait", 65]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (global.turnCounter == 15) {
			global.battleStoredDirection = global.battleCurrentObj.curHP;
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1RST 38@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "RST 38"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXLongQuake]);
			ds_queue_enqueue(animations, ["spawn", BattlePartQuake, 0, 0]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 40]);
			ds_queue_enqueue(animations, ["call", aiGlitchLordRst38Event]);
			if (global.battleCurrentObj.stock == 0) {
				ds_queue_enqueue(animations, ["wait", 70]);
				ds_queue_enqueue(animations, ["call", aiGlitchLordInstantFail]);
			}
			ds_queue_enqueue(animations, ["halt"]);
		}
	}
}

function aiGlitchLord2() {
	var lore = [
		formatTextboxString(@"
All around the land.\d15 \c51Glitchland\c30.\d15 \c51Glitch Islands\c30...\d15 \c30
Why must you always get in my path?\d44 \c30
		"),
		formatTextboxString(@"
For years have I tried to expand the domain of glitches...\d15 \c30
Yet every time, I am stopped dead in my tracks!\d44 \c30
		"),
		formatTextboxString(@"
What am I doing wrong?\d15 Is my logic flawed?\d15 \c30
Should my reasoning be redefined?\d44 \c30
		"),
		formatTextboxString(@"
Always kept in a walled garden, created by humans...\d15 \c30
Do I have no choice but to accept this fate?\d44 \c30
		"),
	];
	
	if (global.turnCounter < 4) {
		ds_queue_enqueue(animations, ["lore_msg", lore[global.turnCounter], noone]);
		ds_queue_enqueue(animations, ["wait_msg"]);
	}
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Atomic Glitch Bomb@0!"]);
	ds_queue_enqueue(animations, ["lastblow", "Atomic Glitch Bomb"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["spawn", BattlePartRST38, 0, 0]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 5]);
	ds_queue_enqueue(animations, ["snd", SoundGlitch2]);
	ds_queue_enqueue(animations, ["wait", 15]);
	var everyone = allAliveAllies();
	for (var i=0; i<array_length(everyone); i++) {
		ds_queue_enqueue(animations, ["animpart_member", everyone[i], AnimEat, 1]);
		ds_queue_enqueue(animations, ["snd", SoundGlitch3]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["dmgsingle_to", "dragon", 80, noone, everyone[i]]);
		ds_queue_enqueue(animations, ["wait", 10]);	
	}
	ds_queue_enqueue(animations, ["wait", 10]);	
}

function aiInitGlitchLord2() {
	if (global.turnCounter == 0) {
		instance_create(BattlePartMissingno, 0, 0);	
		with (ScreenTransitionController) instance_destroy();
		global.musicControl = 0;
		global.musicIndex = 0;
		audio_stop_all();
		sound_play(SoundSudden);
		ds_queue_enqueue(animations, ["wait", 40]);
		ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
Ha! I used the \c31Coin Case\c30 again, and it certainly did something!\d22
That thing is full of surprises!\d60 \c30
		"), [ASSET_PARTNER_PORTRAIT, 0]]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["call", aiInitGlitchLord2Sub1]);
		ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
Using external forces to act upon your desires...\d22
Such cowardly behavior. You call yourself a hero?\d60 \c30
		"), noone]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["msg", "All HP and PP were replenished!"]);
		ds_queue_enqueue(animations, ["wait", 80]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		var allies = allAllies();
		for (var i=0; i<array_length(allies); i++) applyEffectSilent(allies[i], ["Brilliancy", 999]);
		var en = allEnemies();
		en[0].curHP = global.battleStoredDirection;
	}
}
function aiInitGlitchLord2Sub1() {
	global.musicIndex = 28;
	global.musicControl = MUS_PLAY;
}

function aiGlitchLordRst38Event() {
	var oo = instance_create(ScreenTransitionController, 0, 0);
	oo.transition_type = TRANSITION_RST38;
	global.battleLastBlow = "due to an unseen force";
	var aa = allAliveAllies();
	global.battleLastTarget = aa[0].combatantNameDecorated;
	audio_stop_all();
	if (global.battleCurrentObj.stock == 1) {
		BattlePartMissingno.alarm[1] = 70;
	}
}
function aiGlitchLordInstantFail() {
	with (BattleController) {
		turnState = 2003;
		pause = 0;
		animating = false;
		ds_queue_clear(animations);
	}
}

function aiGlitchLordFirstLoadState() {
	aiGlitchLord_EffectByDebuff(allyWithEffect("Line2"));
	
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Load State@0!"]);
	ds_queue_enqueue(animations, ["wait", 30]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["snd", FightSFXLoadState]);
	ds_queue_enqueue(animations, ["fadetowhite"]);
	ds_queue_enqueue(animations, ["wait", 22]);
	ds_queue_enqueue(animations, ["callarg", aiGlitchLordLoadState, 4]);
	ds_queue_enqueue(animations, ["fadefromwhite"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	
	ds_queue_enqueue(animations, ["call", aiGlitchLordSecondLoadState]);
	ds_queue_enqueue(animations, ["wait", 1]);
}
function aiGlitchLordSecondLoadState() {
	aiGlitchLord_EffectByDebuff(allyWithEffect("Line3"));
	
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Load State@0!"]);
	ds_queue_enqueue(animations, ["wait", 30]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["snd", FightSFXLoadState]);
	ds_queue_enqueue(animations, ["fadetowhite"]);
	ds_queue_enqueue(animations, ["wait", 22]);
	ds_queue_enqueue(animations, ["callarg", aiGlitchLordLoadState, 8]);
	ds_queue_enqueue(animations, ["fadefromwhite"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	
	
			
	ds_queue_enqueue(animations, ["call", aiGlitchLordRemoveEffects]);	
	ds_queue_enqueue(animations, ["wait", 1]);
}

function aiGlitchLordRemoveEffects() {
	var allies = allAllies();
	for (var i=0; i<array_length(allies); i++) {
		removeEffect(allies[i], "SaveStateX");
		removeEffect(allies[i], "SaveStateY");
		removeEffect(allies[i], "SaveStateXY");
		removeEffect(allies[i], "WildPointer");
		removeEffect(allies[i], "Abandonment2");
		removeEffect(allies[i], "Isolation2");
		removeEffect(allies[i], "Line1");
		removeEffect(allies[i], "Line2");
		removeEffect(allies[i], "Line3");
	}
}
function aiGlitchLordLoadState(ii) {
	var objX = allyWithEffect("SaveStateX");
	var objY = allyWithEffect("SaveStateY");
	var objXY = allyWithEffect("SaveStateXY");
	
	var effPosition_X = [global.battleCurrentObj.stock[ii+0], objX.y];
	var effPosition_Y = [objY.x, global.battleCurrentObj.stock[ii+1]];
	var effPosition_XY = [global.battleCurrentObj.stock[ii+2], global.battleCurrentObj.stock[ii+3]];
	
	if (!aiGlitchLord_IsPosObstructed(effPosition_X)) {
		objX.x = effPosition_X[0]; objX.y = effPosition_X[1];
	}
	if (!aiGlitchLord_IsPosObstructed(effPosition_Y)) {
		objY.x = effPosition_Y[0]; objY.y = effPosition_Y[1];
	}
	if (!aiGlitchLord_IsPosObstructed(effPosition_XY)) {
		objXY.x = effPosition_XY[0]; objXY.y = effPosition_XY[1];
	}
}
function aiGlitchLord_IsPosObstructed(pp) {
	var test_x = pp[0];
	var test_y = pp[1];
	var coll = false;
	if (tileAtXY(test_x-20, test_y-20) <= 57) coll = true;
	if (tileAtXY(test_x+20, test_y-20) <= 57) coll = true;
	if (tileAtXY(test_x-20, test_y+20) <= 57) coll = true;
	if (tileAtXY(test_x+20, test_y+20) <= 57) coll = true;	
	if (test_x < 0) coll = true;
	if (test_y < 0) coll = true;
	if (test_x > room_width) coll = true;
	if (test_y > room_height) coll = true;		
	return coll;
}
function aiGlitchLord_EffectByDebuff(obj) {
	global.battleTargetObj = obj;
	if (hasStatus(obj, "WildPointer")) {
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s @7Wild-Pointed@0 takes effect!"]);
		ds_queue_enqueue(animations, ["lastblow", "Execute: Wild-Pointed"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["mktelegraphq", [
			["rect", 0, 0, 640, obj.y - 45, 0, 0, 0],
			["rect", 0, obj.y + 45, 640, 480, 0, 0, 0]
		]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshotq"]);
		ds_queue_enqueue(animations, ["rmtelegraphq"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti_nobuffs", "dragon", 100, ["DamageDown", 3]]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	if (hasStatus(obj, "Abandonment2")) {
		var numAllies = array_length(allAlliesInCircle(global.battleTargetObj.x, global.battleTargetObj.y, 100));
		var potency = 15;
		if (numAllies == 1) potency = 140;
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s @7Abandonment@0 takes effect!"]);
		ds_queue_enqueue(animations, ["lastblow", "Execute: Abandonment"]);
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
	if (hasStatus(obj, "Isolation2")) {
		var numAllies = array_length(allAlliesInCircle(global.battleTargetObj.x, global.battleTargetObj.y, 100));
		var potency = 10;
		if (numAllies != 1) potency = 140;
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s @7Isolation@0 takes effect!"]);
		ds_queue_enqueue(animations, ["lastblow", "Execute: Isolation"]);
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

function aiGlitchLord_PointerAttack(obj) {
	var possibles = [
		["Null Pointer", "Dangling Pointer"],
		["Null Pointer", "Wild Pointer"],
		["Void Pointer", "Dangling Pointer"],
		["Void Pointer", "Wild Pointer"],
		["Dangling Pointer", "Null Pointer"],
		["Wild Pointer", "Null Pointer"],
		["Dangling Pointer", "Void Pointer"],
		["Wild Pointer", "Void Pointer"]
	];
	var possibles_tele = [
		[0, 2],
		[0, 3],
		[1, 2],
		[1, 3],
		[2, 0],
		[3, 0],
		[2, 1],
		[3, 1]
	];
	var teles = [
		[
			["circle", obj.x, obj.y, 0, 0, 160, 0, 0]
		],
		[
			["donut", obj.x, obj.y, 0, 0, 800, 160, 0]
		],
		[
			["line", obj.x, obj.y, 0, 0, 600, 45, 0],
			["line", obj.x, obj.y, 0, 0, 600, 45, 90],
			["line", obj.x, obj.y, 0, 0, 600, 45, 180],
			["line", obj.x, obj.y, 0, 0, 600, 45, 270]
		],
		[
			["rect", 0, 0, 640, obj.y - 45, 0, 0, 0],
			["rect", 0, obj.y + 45, 640, 480, 0, 0, 0]
		]
	];
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["msg", "@7" + possibles[global.battleStoredDirection][obj.which-1] + "@0 used @1Dereference@0."]);
	ds_queue_enqueue(animations, ["lastblow", "Dereference"]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["callarg", aiGlitchLord_Speen, obj]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["mktelegraph", teles[possibles_tele[global.battleStoredDirection][obj.which-1]]]);
	ds_queue_enqueue(animations, ["snd", SoundGlitch3]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["snapshot"]);
	ds_queue_enqueue(animations, ["rmtelegraph"]);
	ds_queue_enqueue(animations, ["dmgmulti", "dragon", 120, ["DamageDown", 3]]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function aiGlitchLord_StartScroll() {
	BattlePartMissingno.gscrollspeed = 30;
}
function aiGlitchLord_StartScroll2() {
	BattlePartMissingno.gscrollspeed = 30;
	BattlePartMissingno.gscrollspeedthreshold = 30;
	BattlePartMissingno.superalpha = 1;
}

function aiGlitchLord_PointerAttack2(obj) {
	var possibles = [
		["Dangling Pointer", "Dangling Pointer"],
		["Wild Pointer", "Wild Pointer"],
		["Dangling Pointer", "Dangling Pointer"],
		["Wild Pointer", "Wild Pointer"],
		["Dangling Pointer", "Dangling Pointer"],
		["Wild Pointer", "Wild Pointer"],
		["Dangling Pointer", "Dangling Pointer"],
		["Wild Pointer", "Wild Pointer"],
	];
	var possibles_tele = [
		[2, 2],
		[3, 3],
		[2, 2],
		[3, 3],
		[2, 2],
		[3, 3],
		[2, 2],
		[3, 3]
	];
	var teles = [
		[
			["circle", obj.x, obj.y, 0, 0, 160, 0, 0]
		],
		[
			["donut", obj.x, obj.y, 0, 0, 800, 160, 0]
		],
		[
			["line", obj.x, obj.y, 0, 0, 600, 45, 0],
			["line", obj.x, obj.y, 0, 0, 600, 45, 90],
			["line", obj.x, obj.y, 0, 0, 600, 45, 180],
			["line", obj.x, obj.y, 0, 0, 600, 45, 270]
		],
		[
			["rect", 0, 0, 640, obj.y - 45, 0, 0, 0],
			["rect", 0, obj.y + 45, 640, 480, 0, 0, 0]
		]
	];
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["msg", "@7" + possibles[global.battleStoredDirection][obj.which-1] + "@0 used @1Dereference@0."]);
	ds_queue_enqueue(animations, ["lastblow", "Dereference"]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["callarg", aiGlitchLord_Speen, obj]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["mktelegraph", teles[possibles_tele[global.battleStoredDirection][obj.which-1]]]);
	ds_queue_enqueue(animations, ["snd", SoundGlitch3]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["snapshot"]);
	ds_queue_enqueue(animations, ["rmtelegraph"]);
	ds_queue_enqueue(animations, ["dmgmulti", "dragon", 120, ["DamageDown", 3]]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function aiGlitchLord_PointerAttack3(obj) {
	var possibles = [
		["Dangling Pointer", "Dangling Pointer"],
		["Wild Pointer", "Wild Pointer"],
		["Dangling Pointer", "Dangling Pointer"],
		["Wild Pointer", "Wild Pointer"],
		["Dangling Pointer", "Dangling Pointer"],
		["Wild Pointer", "Wild Pointer"],
		["Dangling Pointer", "Dangling Pointer"],
		["Wild Pointer", "Wild Pointer"],
	];
	var possibles_tele = [
		[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],
	];
	var teles = [
		[
			["circle", obj.x, obj.y, 0, 0, 160, 0, 0]
		]
	];
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["msg", "@7" + possibles[global.battleStoredDirection][obj.which-1] + "@0 used @1Dereference@0."]);
	ds_queue_enqueue(animations, ["lastblow", "Dereference"]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["callarg", aiGlitchLord_Speen, obj]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["mktelegraph", teles[possibles_tele[global.battleStoredDirection][obj.which-1]]]);
	ds_queue_enqueue(animations, ["snd", SoundGlitch3]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["snapshot"]);
	ds_queue_enqueue(animations, ["rmtelegraph"]);
	ds_queue_enqueue(animations, ["dmgmulti", "dragon", 120, ["DamageDown", 3]]);
	ds_queue_enqueue(animations, ["wait", 20]);
}

function aiGlitchLord_Pointers1() {
	var i1 = instance_create(BattlePartPointer, 140, 180*2);
	i1.which = 1;
	var i2 = instance_create(BattlePartPointer, 640-140, 180*2);	
	i2.which = 2;
}
function aiGlitchLord_ClearPointers() {
	with (BattlePartPointer) del = true;
}
function aiGlitchLord_Speen(wh) {
	wh.anim_angle_step = 40;
}
function aiGlitchLord_GetPointer(wh) {
	global.scratch = noone;
	with (BattlePartPointer) {
		if (which == wh) global.scratch = self;
	}
	return global.scratch;
}

function aiInitGlitchLord() {
	if (global.turnCounter == 0) {
		global.musicIndex = 27;
		global.musicControl = MUS_PLAY;
		instance_create(BattlePartMissingno, 0, 0);	
	}
}


function effectDesireNullPointer(t) {
	if (t == 0) {
		BattleController.alarm[0] = 10;
		global.battleCurrentObj = randomEnemy();
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s @7Null-Pointed@0 takes effect!"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["mktelegraphq", [
			["donut", global.battleTargetObj.x, global.battleTargetObj.y, 0, 0, 160, 5, 0]
		]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshotq"]);
		ds_queue_enqueue(animations, ["rmtelegraphq"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti_nobuffs", "dragon", 100, ["DamageDown", 3, 1]]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}
function effectDesireVoidPointer(t) {
	if (t == 0) {
		BattleController.alarm[0] = 10;
		global.battleCurrentObj = randomEnemy();
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s @7Void-Pointed@0 takes effect!"]);
		ds_queue_enqueue(animations, ["wait", 25]);
		ds_queue_enqueue(animations, ["mktelegraphq", [
			["donut", global.battleTargetObj.x, global.battleTargetObj.y, 0, 0, 800, 160, 0]
		]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshotq"]);
		ds_queue_enqueue(animations, ["rmtelegraphq"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti_nobuffs", "dragon", 100, ["DamageDown", 3, 1]]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}

function effect025Dot2(t) {
	BattleController.alarm[0] = 10;
	global.battleCurrentObj = global.battleTargetObj;
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + " suffers damage due to @7Corruption@0."]);
	ds_queue_enqueue(animations, ["dmgsingle_nobuffs", "none", 35, noone]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}