#macro MULT_DISADVANTAGE 0.65
#macro MULT_ADVANTAGE 1.55

function typeMatchup(tx, ty) {
	var matchups = [
		[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, MULT_DISADVANTAGE, 0, 1, 1, MULT_DISADVANTAGE, 1],
		[1, MULT_DISADVANTAGE, MULT_DISADVANTAGE, 1, MULT_ADVANTAGE, MULT_ADVANTAGE, 1, 1, 1, 1, 1, MULT_ADVANTAGE, MULT_DISADVANTAGE, 1, MULT_DISADVANTAGE, 1, MULT_ADVANTAGE, 1],
		[1, MULT_ADVANTAGE, MULT_DISADVANTAGE, 1, MULT_DISADVANTAGE, 1, 1, 1, MULT_ADVANTAGE, 1, 1, 1, MULT_ADVANTAGE, 1, MULT_DISADVANTAGE, 1, 1, 1],
		[1, 1, MULT_ADVANTAGE, MULT_DISADVANTAGE, MULT_DISADVANTAGE, 1, 1, 1, 0, MULT_ADVANTAGE, 1, 1, 1, 1, MULT_DISADVANTAGE, 1, 1, 1],
		[1, MULT_DISADVANTAGE, MULT_ADVANTAGE, 1, MULT_DISADVANTAGE, 1, 1, MULT_DISADVANTAGE, MULT_ADVANTAGE, MULT_DISADVANTAGE, 1, MULT_DISADVANTAGE, MULT_ADVANTAGE, 1, MULT_DISADVANTAGE, 1, MULT_DISADVANTAGE, 1],
		[1, MULT_DISADVANTAGE, MULT_DISADVANTAGE, 1, MULT_ADVANTAGE, MULT_DISADVANTAGE, 1, 1, MULT_ADVANTAGE, MULT_ADVANTAGE, 1, 1, 1, 1, MULT_ADVANTAGE, 1, MULT_DISADVANTAGE, 1],
		[MULT_ADVANTAGE, 1, 1, 1, 1, MULT_ADVANTAGE, 1, MULT_DISADVANTAGE, 1, MULT_DISADVANTAGE, MULT_DISADVANTAGE, MULT_DISADVANTAGE, MULT_ADVANTAGE, 0, 1, MULT_ADVANTAGE, MULT_ADVANTAGE, MULT_DISADVANTAGE],
		[1, 1, 1, 1, MULT_ADVANTAGE, 1, 1, MULT_DISADVANTAGE, MULT_DISADVANTAGE, 1, 1, 1, MULT_DISADVANTAGE, MULT_DISADVANTAGE, 1, 1, 0, MULT_ADVANTAGE],
		[1, MULT_ADVANTAGE, 1, MULT_ADVANTAGE, MULT_DISADVANTAGE, 1, 1, MULT_ADVANTAGE, 1, 0, 1, MULT_DISADVANTAGE, MULT_ADVANTAGE, 1, 1, 1, MULT_ADVANTAGE, 1],
		[1, 1, 1, MULT_DISADVANTAGE, MULT_ADVANTAGE, 1, MULT_ADVANTAGE, 1, 1, 1, 1, MULT_ADVANTAGE, MULT_DISADVANTAGE, 1, 1, 1, MULT_DISADVANTAGE, 1],
		[1, 1, 1, 1, 1, 1, MULT_ADVANTAGE, MULT_ADVANTAGE, 1, 1, MULT_DISADVANTAGE, 1, 1, 1, 1, 0, MULT_DISADVANTAGE, 1],
		[1, MULT_DISADVANTAGE, 1, 1, MULT_ADVANTAGE, 1, MULT_DISADVANTAGE, MULT_DISADVANTAGE, 1, MULT_DISADVANTAGE, MULT_ADVANTAGE, 1, 1, MULT_DISADVANTAGE, 1, MULT_ADVANTAGE, MULT_DISADVANTAGE, MULT_DISADVANTAGE],
		[1, MULT_ADVANTAGE, 1, 1, 1, MULT_ADVANTAGE, MULT_DISADVANTAGE, 1, MULT_DISADVANTAGE, MULT_ADVANTAGE, 1, MULT_ADVANTAGE, 1, 1, 1, 1, MULT_DISADVANTAGE, 1],
		[0, 1, 1, 1, 1, 1, 1, 1, 1, 1, MULT_ADVANTAGE, 1, 1, MULT_ADVANTAGE, 1, MULT_DISADVANTAGE, 1, 1],
		[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, MULT_ADVANTAGE, 1, MULT_DISADVANTAGE, 0],
		[1, 1, 1, 1, 1, 1, MULT_DISADVANTAGE, 1, 1, 1, MULT_ADVANTAGE, 1, 1, MULT_ADVANTAGE, 1, MULT_DISADVANTAGE, 1, MULT_DISADVANTAGE],
		[1, MULT_DISADVANTAGE, MULT_DISADVANTAGE, MULT_DISADVANTAGE, 1, MULT_ADVANTAGE, 1, 1, 1, 1, 1, 1, MULT_ADVANTAGE, 1, 1, 1, MULT_DISADVANTAGE, MULT_ADVANTAGE],
		[1, MULT_DISADVANTAGE, 1, 1, 1, 1, MULT_ADVANTAGE, MULT_DISADVANTAGE, 1, 1, 1, 1, 1, 1, MULT_ADVANTAGE, MULT_ADVANTAGE, MULT_DISADVANTAGE, 1]
	];
	var types = [
		"normal", "fire", "water", "electric", "grass", "ice",
		"fighting", "poison", "ground", "flying", "psychic",
		"bug", "rock", "ghost", "dragon", "dark", "steel", "fairy"
	];
	var ix = -1;
	var iy = -1;
	for (var i=0; i<array_length(types); i++) {
		if (types[i] == tx) ix = i;
		if (types[i] == ty) iy = i;
	}
	if (ix == -1) return 1;
	if (iy == -1) return 1;
	var r = matchups[ix][iy];
	if (r < 0.1) r = 0.1;
	return r;
}

function applyEffect(target, eff) {
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["snd", FightSFXEffect]);
	if (hasStatus(target, eff[0])) {
		ds_queue_enqueue(animations, ["msg", "" + target.combatantNameDecorated + "'s @5" + string(global.statusDb[$ eff[0]][0]) + "@0 duration extended."]);
	} else {
		ds_queue_enqueue(animations, ["msg", "" + target.combatantNameDecorated + " is affected by @5" + string(global.statusDb[$ eff[0]][0]) + "@0."]);
	}
	ds_queue_enqueue(animations, ["apply_effect", target, eff]);
	ds_queue_enqueue(animations, ["wait", 40]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 10]);
}

function applyEffectQueue(target, eff) {
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["snd", FightSFXEffect]);
	if (hasStatus(target, eff[0])) {
		ds_queue_enqueue(animations, ["msg", "" + target.combatantNameDecorated + "'s @5" + string(global.statusDb[$ eff[0]][0]) + "@0 duration extended."]);
	} else {
		ds_queue_enqueue(animations, ["msg", "" + target.combatantNameDecorated + " is affected by @5" + string(global.statusDb[$ eff[0]][0]) + "@0."]);
	}
	ds_queue_enqueue(animations, ["apply_effect_queue", target, eff]);
	ds_queue_enqueue(animations, ["wait", 40]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 10]);
}

function applyEffectSilent(target, eff) {
	ds_queue_enqueue(animations, ["apply_effect", target, eff]);
}

#macro T_PHYS 0
#macro T_SPEC 1

function dealDamage(target, aspect, potency, statuseff, buffs=true, pure=false, statCount=true){
	var moveTypeToDmgType = {
		"normal": T_PHYS,
		"fire": T_SPEC,
		"water": T_SPEC,
		"electric": T_SPEC,
		"grass": T_SPEC,
		"ice": T_SPEC,
		"fighting": T_PHYS,
		"poison": T_SPEC,
		"ground": T_PHYS,
		"flying": T_PHYS,
		"psychic": T_SPEC,
		"bug": T_PHYS,
		"rock": T_PHYS,
		"ghost": T_SPEC,
		"dragon": T_SPEC,
		"dark": T_PHYS,
		"steel": T_PHYS,
		"fairy": T_SPEC,
	};
	
	if (target.curHP <= 0) {
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["snd", choose(FightSFXMiss1, FightSFXMiss2)]);
		ds_queue_enqueue(animations, ["msg", "The target is unconscious..."]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 5]);
		return;
	}
	
	var dmg = potency;
	var target_types = target.types;
	var mult = 1;
	var status_mod = 1;
	var reason = "aura";
	var longText = false;
	if (pure) {
		ds_queue_enqueue(animations, ["snd", FightSFXDmgNormal]);
	} else {
		// the redundant *1.5 is to force a conversion to float (gml jank is exceptional)
		if (aspect == "none") {
			dmg *= sqrt(((global.battleCurrentObj.att + global.battleCurrentObj.sp_att)*1.5) / ((target.def + target.sp_def)*1.5));
		} else {
			if (moveTypeToDmgType[$ aspect] == T_PHYS) {
				dmg *= sqrt((global.battleCurrentObj.att*1.5) / (target.def*1.5));
			} else {
				dmg *= sqrt((global.battleCurrentObj.sp_att*1.5) / (target.sp_def*1.5));
			}
		}
	
		var rnd = random_range(9000,11000)/10000.0;
		if (instance_exists(DebugController)) {
			if (DebugController.alwaysHighroll) {
				rnd = 11000/10000.0;
			}
		}
		dmg *= rnd;
	
		for (var i=0; i<array_length(target_types); i++) {
			mult *= typeMatchup(aspect, target.types[i]);
		}
	
		dmg *= mult;
		
		var dmgAction = "bepis";
	
		if (buffs) {
			for (var i=0; i<array_length(target.effects); i++) {
				if (target.effects[i][0] == "VulnerabilityUp") {
					status_mod *= 7; dmgAction = "increased";
					reason = target.combatantNameDecorated + "'s @7Vulnerability Up@0";
				}
				if (target.effects[i][0] == "Exhausted") {
					status_mod *= 2; dmgAction = "increased";
					reason = target.combatantNameDecorated + "'s @7Exhausted@0";
				}
				if (target.effects[i][0] == "TwiceComeRuin") {
					status_mod *= 999; dmgAction = "increased";
					reason = target.combatantNameDecorated + "'s @7Twice-come Ruin@0";
				}
				if (target.effects[i][0] == "Hardened") {
					status_mod *= 0.8; dmgAction = "reduced";
					reason = target.combatantNameDecorated + "'s @9Hardened@0";
				}
				if (target.effects[i][0] == "Barrier") {
					status_mod *= 0.7; dmgAction = "reduced";
					reason = target.combatantNameDecorated + "'s @9Barrier@0";
				}
				if (target.effects[i][0] == "LightScreen") {
					status_mod *= 0.85; dmgAction = "reduced";
					reason = target.combatantNameDecorated + "'s @9Light Screen@0";
				}
				if (target.effects[i][0] == "PhysVuln") {
					if (moveTypeToDmgType[$ aspect] == T_PHYS) {
						status_mod *= 7; dmgAction = "increased";
						reason = target.combatantNameDecorated + "'s @7Weakness@0";
					}
				}
				if (target.effects[i][0] == "Charged") {
					if (moveTypeToDmgType[$ aspect] == T_SPEC) {
						status_mod *= 0.8; dmgAction = "reduced";
						reason = target.combatantNameDecorated + "'s @9Charged@0";
					}
				}
				if (target.effects[i][0] == "PlotArmor") {
					status_mod *= 0.3; dmgAction = "reduced";
					reason = target.combatantNameDecorated + "'s @9Plot Armor@0";
				}
				if (target.effects[i][0] == "InfernalClose") {
					var oth = allyWithEffect("InfernalTarget");
					var dist = point_distance(oth.x, oth.y, target.x, target.y);
					if (dist > 80) status_mod *= 10;
					reason = target.combatantNameDecorated + "'s @9Close Inferno@0";
					dmgAction = "increased";
				}
				if (target.effects[i][0] == "InfernalFar") {
					var oth = allyWithEffect("InfernalTarget");
					var dist = point_distance(oth.x, oth.y, target.x, target.y);
					if (dist < 200) status_mod *= 10;
					reason = target.combatantNameDecorated + "'s @9Far Inferno@0";
					dmgAction = "increased";
				}
				if (target.effects[i][0] == "Brilliancy") {
					status_mod *= 0.5;
					reason = target.combatantNameDecorated + "'s @9Brilliancy@0";
					dmgAction = "reduced";
				}
			}
			for (var i=0; i<array_length(global.battleCurrentObj.effects); i++) {
				if (global.battleCurrentObj.effects[i][0] == "DamageDown") {
					status_mod *= 0.75;
					reason = global.battleCurrentObj.combatantNameDecorated + "'s @7Damage Down@0";
					dmgAction = "reduced";
				}
				if (global.battleCurrentObj.effects[i][0] == "Concentrate") {
					status_mod *= 2.2;
					reason = global.battleCurrentObj.combatantNameDecorated + "'s @9Concentrate@0";
					dmgAction = "increased";
				}
				if (global.battleCurrentObj.effects[i][0] == "Charged") {
					if (aspect == "electric") {
						status_mod *= 2;
						reason = global.battleCurrentObj.combatantNameDecorated + "'s @9Charged@0";
						dmgAction = "increased";
					}
				}
				if (global.battleCurrentObj.effects[i][0] == "Brilliancy") {
					status_mod *= 3;
					reason = global.battleCurrentObj.combatantNameDecorated + "'s @9Brilliancy@0";
					dmgAction = "increased";
				}
			}
		}
	
		if (status_mod > 1.05) {
			ds_queue_enqueue(animations, ["msg", "@0Damage " + dmgAction + " by " + reason + "!@0"]);
			ds_queue_enqueue(animations, ["snd", FightSFXDmgSuper]);
			longText = true;
		} else if (status_mod < 0.95) {
			ds_queue_enqueue(animations, ["msg", "@0Damage " + dmgAction + " by " + reason + "!@0"]);
			ds_queue_enqueue(animations, ["snd", FightSFXDmgNormal]);
			longText = true;
		} else if (mult > 1.05) {
			ds_queue_enqueue(animations, ["msg", "@0It's super effective!@0"]);
			ds_queue_enqueue(animations, ["snd", FightSFXDmgSuper]);
		} else if (mult < 0.15) {
			ds_queue_enqueue(animations, ["msg", "@0It has little effect...@0"]);
			ds_queue_enqueue(animations, ["snd", FightSFXDmgWeak]);
		} else if (mult < 0.95) {
			ds_queue_enqueue(animations, ["msg", "@0It's not very effective...@0"]);
			ds_queue_enqueue(animations, ["snd", FightSFXDmgWeak]);
		} else {
			ds_queue_enqueue(animations, ["snd", FightSFXDmgNormal]);
		}
	
		dmg *= status_mod;
		dmg = int64(dmg);
		if (dmg >= 999) dmg = 999;
		if (dmg <= 1) dmg = 1;
	}
	
	if (!target.alliance) {
		if (target.species != "NullSprite") {
			if (dmg > 998) global.eventFlags[EVENT_ACHIEVEMENT_999DMG] = 1;
		}
	}
	
	if (!target.alliance && dmg >= target.curHP) {
		ds_queue_enqueue(animations, ["anim", target, "Hurt", 1]);
		ds_queue_enqueue(animations, ["blink", target]);
		ds_queue_enqueue(animations, ["wait", 20]);
	} else {
		ds_queue_enqueue(animations, ["anim", target, "Hurt", 0]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim", target, "Idle", 0]);
	}
	
	if (statCount) ds_queue_enqueue(animations, ["dmg", target, dmg]);
	else ds_queue_enqueue(animations, ["dmg_nostat", target, dmg]);
	ds_queue_enqueue(animations, ["wait", 15]);
	if (longText) ds_queue_enqueue(animations, ["wait", 20]);
	
	ds_queue_enqueue(animations, ["nomsg"]);
	
	if (statuseff != noone) {
		if (array_length(statuseff) > 2) {
			applyEffectQueue(target, [statuseff[0], statuseff[1]]);
		} else {
			removeEffect(target, statuseff[0]);
			applyEffect(target, statuseff);
		}
	}
	
	if (dmg >= target.curHP) {
		if (target.alliance) {
			global.battleLastTarget = target.combatantNameDecorated;
			//ds_queue_enqueue(animations, ["cleanse", target]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["snd", FightSFXDead]);
			ds_queue_enqueue(animations, ["msg", "" + target.combatantNameDecorated + " got hurt and collapsed."]);
			ds_queue_enqueue(animations, ["anim", target, "Faint", 0]);
			ds_queue_enqueue(animations, ["anim_noidle", target]);
			ds_queue_enqueue(animations, ["wait", 70]);
			ds_queue_enqueue(animations, ["nomsg"]);
			// beviver beeds?
			var its = global.teamMembers[target.combatantIndex].items;
			for (var i=0; i<array_length(its); i++) {
				if (its[i] == 3) {
					global.teamMembers[target.combatantIndex].items[i] = 4;
					ds_queue_enqueue(animations, ["revive", target]);
					ds_queue_enqueue(animations, ["animpart_member", target, AnimLight, 1]);
					ds_queue_enqueue(animations, ["anim_enableidle", target]);
					ds_queue_enqueue(animations, ["anim", target, "Idle", 1]);
					ds_queue_enqueue(animations, ["snd", FightSFXReviver]);
					ds_queue_enqueue(animations, ["wait", 20]);
					ds_queue_enqueue(animations, ["msg", "" + target.combatantNameDecorated + " was revived!"]);
					ds_queue_enqueue(animations, ["wait", 50]);
					ds_queue_enqueue(animations, ["nomsg"]);
					break;	
				}
			}
		} else {
			if (instance_exists(BattlePartMissingno)) {
				BattlePartMissingno.death = true;
			}
			ds_queue_enqueue(animations, ["unblink", target]);
			ds_queue_enqueue(animations, ["hide", target]);
			ds_queue_enqueue(animations, ["snd", BattleOpponentDefeated]);
			ds_queue_enqueue(animations, ["rmproperties_target", target]);
			ds_queue_enqueue(animations, ["msg", "" + target.combatantNameDecorated + " was defeated!"]);
			ds_queue_enqueue(animations, ["wait", 50]);
			ds_queue_enqueue(animations, ["nomsg"]);
			global.compendiumData[$("m"+target.species)] = string_copy(md5_string_utf8(SAVE_CHECKSUM_KEY + target.species), 1, 4);
			getCompendiumData(); // this updates compendium data too. great naming convention huh?
		}
	}
}