// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function crystalGlacierFights(){}

function aiCrystalGlacier1() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	var tc = global.turnCounter;
	if (tc == 0) {
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
		
		global.battleTargetChoices = randomListOfAllies();
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Ancient Power@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["callarg", aiCrystalGlacier1Callback1, tc]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	
	if (tc >= 1) {
		global.battleTargetObj = global.battleTargetChoices[(tc-1) % array_length(global.battleTargetChoices)];
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Ancient Power@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Ancient Power"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["nomsg"]);
		
		ds_queue_enqueue(animations, ["mktelegraph", [
			["circle", global.battleTargetObj.x,global.battleTargetObj.y, 0, 0, 180, 0, 0]
		]]);
		ds_queue_enqueue(animations, ["rmmarkers", global.battleTargetObj]);
		ds_queue_enqueue(animations, ["snd", FightSFXAncientPower]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["dmgmulti", "rock", 30, ["VulnerabilityUp", 2]]);
		ds_queue_enqueue(animations, ["wait", 15]);
		
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Ancient Power@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["callarg", aiCrystalGlacier1Callback1, tc]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}
function aiCrystalGlacier1Callback1(ii) {
	with (global.battleTargetChoices[ii % array_length(global.battleTargetChoices)]) {
		if (alliance) {
			markerAlpha = 0;
			markerAlphaExcess = 2;
			radiusMarker = 180;
			personalMarker = MARKER_SPREAD;
			markerOwner = global.battleCurrentObj.id;
		}
	}
}

function aiCrystalGlacier2Begin() {
	if (global.turnCounter == 0) {
		audio_pause_sound(Mus11);
		global.musicIndex = 12;
		global.musicControl = MUS_PLAY;
		instance_create(BattlePartFurretWalk, 0, 0);	
	}
}
function aiCrystalGlacier2End() {
	audio_stop_all();
	global.musicIndex = 11;
	global.musicControl = MUS_PLAY;
	return aiBattleClear();
}
function aiCrystalGlacier2() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Cross Swipe@0!"]);
	ds_queue_enqueue(animations, ["lastblow", "Cross Swipe"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["mktelegraph", [
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 600, 35, 0],
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 600, 35, 90],
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 600, 35, 180],
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 600, 35, 270]
	]]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["snapshot"]);
	ds_queue_enqueue(animations, ["rmtelegraph"]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["dmgmulti", "normal", 30, ["DamageDown", 2]]);
	ds_queue_enqueue(animations, ["wait", 8]);
}

function aiCrystalGlacier3() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	if (global.battleCurrentObj.species == "0361") {
		global.battleTargetObj = randomAllyAliveProvokable();
		var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y-20, global.battleTargetObj.x, global.battleTargetObj.y);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Frost Breath@0!"]);
		ds_queue_enqueue(animations, ["lastblow", "Frost Breath"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["mktelegraph", [
			["cone", global.battleCurrentObjX, global.battleCurrentObjY, 0, 0, 300, 140, dr]
		]]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["wait", 10]);
		ds_queue_enqueue(animations, ["dmgmulti", "ice", 25, noone]);
		ds_queue_enqueue(animations, ["wait", 8]);
	}
	
	if (global.battleCurrentObj.species == "0086") {
		var tc = global.turnCounter;
		if (global.turnCounter == 0) global.battleAllTele = [];
		if (tc > 0) {
			global.battleTargetObj = randomAllyAliveProvokable();
			var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y-20, global.battleTargetObj.x, global.battleTargetObj.y);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Brine@0."]);
			ds_queue_enqueue(animations, ["lastblow", "Brine"]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["wait", 25]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["dmgmulti", "water", 60, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 20]);
			tc = 0;
		}
		if (tc == 0) {
			global.battleTargetObj = randomAllyAliveProvokable();
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Brine@0."]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			var a = allAllies();
			for (var i=0; i<array_length(a); i++) {
				array_push(global.battleAllTele, ["circle", a[i].x, a[i].y, 0, 0, 90, 0, 0]);
			}
			ds_queue_enqueue(animations, ["mktelegraph", global.battleAllTele]);
			ds_queue_enqueue(animations, ["wait", 40]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
}

function aiCrystalGlacier4() {
	if (global.battleCurrentObj.curHP <= 0) return;
	
	if (global.battleCurrentObj.species == "0288") { // vigoroth
		var tc = global.turnCounter % 2;
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
		if (tc == 0) {
			global.battleScriptTele2 = [choose(0,1,2,3,4,5,6,7), 0];
			global.battleScriptTele2[1] = choose(global.battleScriptTele2[0] + 2, global.battleScriptTele2[0] + 6) % 8;
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Double Pummel@0."]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleScriptTele2[0]]);
			ds_queue_enqueue(animations, ["mktelegraph", [haircuts[global.battleScriptTele2[0]]]]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 40]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleScriptTele2[1]]);
			ds_queue_enqueue(animations, ["mktelegraph", [haircuts[global.battleScriptTele2[1]]]]);
			ds_queue_enqueue(animations, ["wait", 60]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["anim_facepoint", -1, 320, 1000]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (tc == 1) {
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Double Pummel@0!"]);
			ds_queue_enqueue(animations, ["lastblow", "Double Pummel"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleScriptTele2[0]]);
			ds_queue_enqueue(animations, ["mktelegraph", [haircuts[global.battleScriptTele2[0]]]]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["dmgmulti", "normal", 30, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
			ds_queue_enqueue(animations, ["anim_setfacing", -1, global.battleScriptTele2[1]]);
			ds_queue_enqueue(animations, ["mktelegraph", [haircuts[global.battleScriptTele2[1]]]]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 5]);
			ds_queue_enqueue(animations, ["dmgmulti", "normal", 30, ["DamageDown", 3]]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["anim_facepoint", -1, 320, 1000]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
	
	if (global.battleCurrentObj.species == "0335") { // zangoose
		if (global.turnCounter == 0) {
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Belly Drum@0!"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["snd", FightSFXBellyDrum]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimWave, 1]);
			ds_queue_enqueue(animations, ["wait", 35]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXIncrAtt]);
			ds_queue_enqueue(animations, ["animpart_member", -1, AnimRaise, 1, make_color_rgb(255,76,76)]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["call", aiCrystalGlacier4Callback1]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " cut its HP and maximized Attack!"]);
			ds_queue_enqueue(animations, ["wait", 80]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
		if (global.turnCounter > 0) {
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["msg", "@3" + global.battleCurrentObj.combatantName + "@0 used @1Wide Slash@0!"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["wait", 10]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXWideSlash]);
			ds_queue_enqueue(animations, ["animpart_member", -2, AnimWideSlash, 1]);
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["dmgsingle", "normal", 40, noone]);
			ds_queue_enqueue(animations, ["anim_moverestore", -1]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);
		}
	}
}
function aiCrystalGlacier4Callback1() {
	global.battleCurrentObj.curHP = global.battleCurrentObj.curHP div 2;
	if (global.battleCurrentObj.curHP <= 0) global.battleCurrentObj.curHP = 1;
	global.battleCurrentObj.att = int64(global.battleCurrentObj.att * 2.2);
}