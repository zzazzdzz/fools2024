// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function evoCaveLore(){

}

function evoCave_EncounterLore1(tick) { chunk_mem[0] = 5; }
function evoCave_ItemLore2(tick) { return 1; }
function evoCave_IntersectionLore3(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function evoCave_TreasureChestLore4(tick) { return 1; }
function evoCave_IntersectionLore5(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function evoCave_EncounterLore6(tick) { chunk_mem[0] = 5; }
function evoCave_IntersectionLore7(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function evoCave_ItemLore8(tick) { return 1; }
function evoCave_EncounterLore9(tick) { chunk_mem[0] = 5; }
function evoCave_TreasureChestLore10(tick) { return 1; }
function evoCave_EncounterLore11(tick) { chunk_mem[0] = 5; }
function evoCave_IntersectionLore12(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function evoCave_ItemLore13(tick) { return 1; }
function evoCave_CustomLore14(tick) {
	global.overworldCurMap = "EvoChamber";
	global.overworldCurVariant = "Main";
	global.overworldSpawnX = -999;
	global.overworldSpawnY = -999;
	global.overworldSpawnFacing = FACING_U;
	global.active = true;
	return 1;
}

function evoCave_Script(tick) {
	if (tick == 0) {
		audio_stop_all();
		if (global.eventFlags[EVO_CHAMBER_FIRST]) {
			return 1000;
		}
	}
	else if (tick == 1) {
		return scriptingDelay(40);	
	}
	else if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Wow, it's really dark in here.
Where are we even?<@
		"), [ASSET_PARTNER_PORTRAIT, 2]);
	}
	else if (tick == 3) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 4) {
		return scriptingDelay(70);	
	}
	else if (tick == 5) {
		MapPartEvoChamber.targetA = 1;	
	}
	else if (tick == 6) {
		return scriptingDelay(130);	
	}
	else if (tick == 7) {
		scriptingCloseAllText();
		global.musicIndex = 18;
		global.musicControl = MUS_PLAY;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Welcome to the \c51Evolution Chamber\c30.
Do you seek a new evolution?\f00
		"), noone);	
	}
	else if (tick == 8) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 9) {
		if (global.eventFlags[EVENT_LAB_EXPLAINED_MISSION9]) {
			global.gp0 = spawnChoiceTextbox("Evolve#Learn about evolution#Quit#Use the @1Coin Case@0");	
		} else {
			global.gp0 = spawnChoiceTextbox("Evolve#Learn about evolution#Quit");	
		}
	}
	else if (tick == 10) {
		return scriptingWaitForLastResult();	
	}
	else if (tick == 11) {
		if (global.lastResult == 0) return 100-tick;
		else if (global.lastResult == 1) return 200-tick;
		else if (global.lastResult == 3) return 400-tick;
		else return 300-tick;
	}
	
	else if (tick == 100) {
		scriptingCloseAllText();
		global.gp1 = spawnStandardTextbox(formatTextboxString(@"
Who shall undergo evolution?\f00
		"), noone);	
	}
	else if (tick == 101) {
		return scriptingWaitForTextInGP1();
	}
	else if (tick == 102) {
		var tx = "";
		for (var i=0; i<array_length(global.teamMembers); i++) {
			var attr = "7";
			var note = "Can't evolve";
			if (variable_struct_exists(global.evoData, "m" + global.teamMembers[i].species)) {
				var evoInfo = global.evoData[$("m"+global.teamMembers[i].species)];
				note = "Can evolve";
				attr = "9";
				if (global.teamMembers[i].lv < evoInfo[0]) {
					note = "Level too low"; attr = "7";
				}
			}
			var nameAttr = string(i==0 ? 3 : 6);			
			tx += "#@" + nameAttr + global.teamMembers[i].name + "@TC@0Lv. " + string(global.teamMembers[i].lv) + "@TD@" + attr + note + "";
		}
		tx = string_delete(tx, 1, 1);
		global.gp0 = spawnChoiceTextbox(tx, 10, 10, 455);
		global.gp0.closeOnConfirm = false;
	}
	else if (tick == 103) {
		return scriptingWaitForLastResult();	
	}
	else if (tick == 104) {
		if (global.lastResult == RESULT_QUIT) {
			return 7-tick;
		} else {
			var i = global.lastResult;
			global.gp3 = i;
			if (!variable_struct_exists(global.evoData, "m" + global.teamMembers[i].species)) {
				ratelimitedUIWrongSound();
				global.lastResult = RESULT_NONE;
				return -1;
			} else {
				var evoInfo = global.evoData[$("m"+global.teamMembers[i].species)];
				if (global.teamMembers[i].lv < evoInfo[0]) {
					ratelimitedUIWrongSound();
					global.lastResult = RESULT_NONE;
					return -1;
				} else {
					scriptingCloseAllText();
					global.gp1 = spawnStandardTextbox(formatTextboxString(@"
You shall evolve into \c32" + evoInfo[3] + @"\c30.
Is this really what you want?\f00
					"), noone);
				}
			}
		}
	}
	else if (tick == 105) {
		return scriptingWaitForTextInGP1();
	}
	else if (tick == 106) {
		global.gp0 = spawnChoiceTextbox("Yes.#No.");	
	}
	else if (tick == 107) {
		return scriptingWaitForLastResult();	
	}
	else if (tick == 108) {
		if (global.lastResult != 0) {
			return 7-tick;
		}
	}
	else if (tick == 109) {
		scriptingCloseAllText();
		global.musicControl = MUS_FADEOUT;	
	}
	else if (tick == 110) {
		// 220
		with (OverworldObject) animSpriteSetIndex = global.teamMembers[global.gp3].species;
		with (OverworldObject) event_user(1);
		scriptingApplyMovement(OverworldObject, OverworldObject.x, 200, 100);
	}
	else if (tick == 111) {
		return scriptingDelay(100);	
	}
	else if (tick == 112) {
		with (OverworldObject) facing = FACING_D;
		MapPartEvoChamber.targetA = 3;
	}
	else if (tick == 113) {
		return scriptingDelay(30);	
	}
	else if (tick == 114) {
		sound_play(SoundWhoosh);
		var transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOWHITE;
	}
	else if (tick == 115) {
		return scriptingDelay(30);	
	}
	else if (tick == 116) {
		var evoInfo = global.evoData[$("m"+global.teamMembers[global.gp3].species)];
		OverworldObject.animSpriteSetIndex = evoInfo[1];
		with (OverworldObject) event_user(1);
		MapPartEvoChamber.targetA = 1;
	}
	else if (tick == 117) {
		return scriptingDelay(30);	
	}
	else if (tick == 118) {
		with (ScreenTransitionController) instance_destroy();
		var transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADEFROMWHITE;
	}
	else if (tick == 119) {
		return scriptingDelay(50);	
	}
	else if (tick == 120) {
		return scriptingDelay(60);	
	}
	else if (tick == 121) {
		sound_play(SoundEvolve);
		var evoInfo = global.evoData[$("m"+global.teamMembers[global.gp3].species)];
		var nameAttr = string(global.gp3==0 ? 3 : 6);	
		global.teamMembers[global.gp3].types = evoInfo[2];
		global.teamMembers[global.gp3].species = evoInfo[1];
		global.partnerSpecies = global.teamMembers[1].species;
		global.partnerSpeciesSecondary = global.teamMembers[2].species;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c3" + nameAttr + global.teamMembers[global.gp3].name + @"\c30 evolved into \c32" + evoInfo[3] + @"\c30!\d60 \f00
		"), noone);
	}
	else if (tick == 122) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 123) {
		scriptingCloseAllText();
		return scriptingDelay(60);	
	}
	else if (tick == 124) {
		var stat_gain = global.evoData[$("d"+global.teamMembers[global.gp3].species)][4];
		global.teamMembers[global.gp3].att += stat_gain[0];
		global.teamMembers[global.gp3].def += stat_gain[1];
		global.teamMembers[global.gp3].sp_att += stat_gain[2];
		global.teamMembers[global.gp3].sp_def += stat_gain[3];
		global.teamMembers[global.gp3].maxHP += stat_gain[4];
		global.teamMembers[global.gp3].maxPP += stat_gain[5];
		var stat_increases = "Attack went up by " + string(stat_gain[0]) +"!\n";
		stat_increases += "Defense went up by " + string(stat_gain[1]) + "!<@";
		stat_increases += "Special Attack went up by " + string(stat_gain[2]) +"!\n";
		stat_increases += "Special Defense went up by " + string(stat_gain[3]) + "!<@";
		stat_increases += "Maximum HP went up by " + string(stat_gain[4]) +"!\n";
		stat_increases += "Maximum PP went up by " + string(stat_gain[5]) + "!<@";
		global.musicIndex = 2;
		global.musicControl = MUS_PLAY;
		global.gp0 = spawnStandardTextbox(stat_increases);
	}
	else if (tick == 125) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 126) {
		return scriptingDelay(20);	
	}
	else if (tick == 127) {
		global.musicControl = MUS_FADEOUT;
		scriptingApplyMovement(OverworldObject, OverworldObject.x, 440, 100);
	}
	else if (tick == 128) {
		return scriptingDelay(100);	
	}
	else if (tick == 129) {
		return 7-tick;
	}
	
	else if (tick == 200) {
		scriptingCloseAllText();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Among Pok%mon, there are some that can evolve. They may
do so at this very spot, provided they reach a sufficient level.

Evolution brings about changes in appearance, types, abilities,
as well as an increase in combat statistics.

Once evolved, a Pok%mon cannot go back to its previous form.
Think carefully before commiting to evolution.<@
		"), noone);	
	}	
	else if (tick == 201) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 202) {
		scriptingCloseAllText();
		return scriptingDelay(40);	
	}
	else if (tick == 203) {
		return 7-tick;	
	}
	
	else if (tick == 300) {
		scriptingCloseAllText();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
You shall return if evolution is what you seek...<@
		"), noone);	
	}
	else if (tick == 301) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 302) {
		return scriptingDelay(80);	
	}
	else if (tick == 303) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
	}
	else if (tick == 304) {
		return scriptingDelay(100);	
	}
	else if (tick == 305) {
		if (global.eventFlags[EVO_CHAMBER_FIRST]) tick = 308-tick;
		else {
			global.gp0 = spawnIntermissionTextbox(formatTextboxString(@"
\c41HHHJ\c30You reached the end of \c51Fogbound Keep\c30.
\c41OOOR\c30Impressive!<@
			"));	
			global.gp0.depth = -9999999;
		}
	}
	else if (tick == 306) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 307) {
		return scriptingDelay(40);	
	}
	else if (tick == 308) {
		if (!global.eventFlags[EVO_CHAMBER_FIRST]) {
			global.battleStats[3][2] = true;
			global.overworldCurMap = "Lab";
			global.overworldCurVariant = "Mission7";
			global.overworldSpawnX = 144*2;
			global.overworldSpawnY = 147*2;
			global.overworldSpawnFacing = FACING_U;
			global.eventFlags[EVO_CHAMBER_FIRST] = 1;
			room_goto(LastOutingRoom);
		} else {
			var outs = ["Town", "Standard2", 640*2, 220*2, FACING_D];
			global.overworldCurMap = outs[0];
			global.overworldCurVariant = outs[1];
			global.overworldSpawnX = outs[2];
			global.overworldSpawnY = outs[3];
			global.overworldSpawnFacing = outs[4];
			global.active = true;
			room_goto(OverworldRoom);
		}
	}
	
	else if (tick == 400) {
		if (global.eventFlags[EVENT_EVOCAVE_COINCASE]) {
			return 10;
		} else {
			scriptingCloseAllText();
			return scriptingDelay(40);	
		}
	}
	else if (tick == 401) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Oh. It appears you're wielding some sort of item.
Is this object intended for evolution?

Ah no. It's just a \c31Coin Case\c30. It seems weirdly peculiar to take
out this item in a situation like this...

It won't be of any use in this chamber. It's only a very small
container, holding 100 coins inside.\d50 `F q`F q`F q`F q`F q`F q`F@q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F
q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F@q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F
q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F@q`F q`F q`F q`F q`F q`F q`F q`F 
		"), noone);	
	}	
	else if (tick == 402) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 403) {
		MapPartEvoChamber.textSound = true;
	}
	else if (tick == 404) {
		scriptingCloseAllText();
		return scriptingDelay(40);	
	}
	else if (tick == 405) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Eh... This guy never shuts up.
We should ignore that voice and proceed with our plan.<@
		"), [ASSET_PARTNER_PORTRAIT, 2]);	
	}
	else if (tick == 406) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 407) {
		scriptingCloseAllText();
		return scriptingDelay(40);	
	}
	else if (tick == 408) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
It's really dark in here, but I assume I'm in the correct position.\d20
Let's see. There are 100 coins inside.\d10 which move?he PP of  \c30\f00
		"), [ASSET_PARTNER_PORTRAIT, 0]);	
	}
	else if (tick == 409) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 410) {
		audio_stop_all();	
		instance_create(MapPartGlitchDimensionColors, 0, 0);
	}
	else if (tick == 411) {
		return scriptingDelay(150);	
	}
	else if (tick == 412) {
		scriptingCloseAllText();	
		instance_destroy(MapPartEvoChamber);
		OverworldObject.x = -9999;
		var i1 = instance_create(OverworldObject, 160*2, 95*2);
		i1.animSpriteSetIndex = global.teamMembers[0].species;
		i1.facing = FACING_U;
		i1.onInteract = interactError;
		with (i1) event_user(1);
		var i2 = instance_create(OverworldObject, 160*2, 130*2);
		i2.animSpriteSetIndex = global.teamMembers[1].species;
		i2.facing = FACING_U;
		i2.onInteract = interactError;
		with (i2) event_user(1);
		var i3 = instance_create(OverworldObject, 160*2, 160*2);
		i3.animSpriteSetIndex = global.teamMembers[2].species;
		i3.facing = FACING_U;
		i3.onInteract = interactError;
		with (i3) event_user(1);
		
		OverworldController.bgAsset = EnvKeepGDPathBG;
	}
	else if (tick == 413) {
		return scriptingDelay(220);	
	}
	else if (tick == 414) {
		global.musicIndex = 23;
		global.musicControl = MUS_PLAY;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: There we go.
It appears there's a path forward now.

\p00Let's go see it, as we always do.
I shall lead the way!<@
		"), [ASSET_PARTNER_PORTRAIT, 1]);
	}
	else if (tick == 415) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 416) {
		return scriptingDelay(10);	
	}
	else if (tick == 417) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
	}
	else if (tick == 418) {
		return scriptingDelay(50);
	}
	else if (tick == 419) {
		global.eventFlags[EVENT_EVOCAVE_COINCASE] = 1;
		global.emulatedInput = 0;
		
		scriptingHealAll();
		var dungeonId = 10;
		global.curDungeonId = dungeonId;
		global.battleCurrentDutyName = global.dungeonDb[dungeonId][0];
		global.battleStats = [[0,0,0],[0,0,0],[0,0,0],[0,0,false]];
		global.battleLastBlow = "due to an unseen force";
		global.battleLastTarget = "@6Bepis@0";
		global.battleCurrentAttackerIndex = -1;
		global.dungeonData = variable_clone(global.dungeonDb[dungeonId][2]);
		global.overworldSourceMap = global.overworldCurMap;
		global.overworldSourceVariant = global.overworldCurVariant;
		global.dungeonDiscoveredTiles = global.dungeonDiscoveryProgress[global.curDungeonId];
		global.dungeonCurrentDiscoveredTiles = [];
		
		room_goto(DungeonRoom);
	}
	
	else if (tick == 1000) {
		return scriptingDelay(40);	
	}
	else if (tick == 1001) {
		return 7-tick;	
	}
	
	return SCRIPT_CONTINUE_ADVANCETICK;
}