// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function interactDungeonWarpZones(){

}

function interactDungeonWarpZone1(tick) {
	if (tick == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Where do you want to go?\f00
		"));
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		var dungeonsStringified = "";
		for (var i=0; i<array_length(global.unlockedDungeonLists[0]); i++) {
			var dungeonId = global.unlockedDungeonLists[0][i];
			var go = "@Cx@0";
			if (global.dungeonDb[dungeonId][6] == global.curStoryHint) go = "@Ix";
			var nn = global.dungeonDb[dungeonId][0];
			if (dungeonId == 2 && !global.eventFlags[EVENT_SERENE_FOREST_CLEARING_FIRST_VISIT]) {
				nn = "Serene Forest Clearing";
			}
			if (dungeonId == 5 && !global.eventFlags[EVENT_CRYSTAL_GLACIER_CLEARING_FIRST_VISIT]) {
				nn = "Crystal Glacier Clearing";
			}
			if (dungeonId == 9 && !global.eventFlags[EVENT_LABYGD_FIRSTVISIT]) {
				nn = "Heart of the Labyrinth";
			}
			dungeonsStringified += "#" + go + "@Q" + nn + "@0";
		}
		dungeonsStringified = string_delete(dungeonsStringified, 1, 1);
		spawnChoiceTextbox(dungeonsStringified, 10, 10);	
	}
	if (tick == 3) {
		return scriptingWaitForLastResult();	
	}
	if (tick == 4) {
		if (global.lastResult == RESULT_QUIT) {
			scriptingCloseAllText();
			global.emulatedInput = vk_left;
		} else {
			return 100;	
		}
	}
	if (tick == 5) {
		return scriptingDelay(10);	
	}
	if (tick == 6) {
		global.emulatedInput = 0;	
	}
	if (tick == 7) {
		return scriptingDelay(10);	
	}
	if (tick == 8) {
		global.active = true;
		return SCRIPT_STOP;	
	}
	if (tick == 104) {
		scriptingCloseAllText();
		scriptingHealAll();
		var dungeonId = global.unlockedDungeonLists[0][global.lastResult];
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
	}
	if (tick == 105) {
		return scriptingDelay(20);	
	}
	if (tick == 106) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
	}
	if (tick == 107) {
		return scriptingDelay(80);	
	}
	if (tick == 108) {
		if (global.dungeonDb[global.curDungeonId][5] == noone) {
			room_goto(DungeonRoom);
		} else {
			global.overworldCurMap = global.dungeonDb[global.curDungeonId][5][0];
			global.overworldCurVariant = global.dungeonDb[global.curDungeonId][5][1];
			global.overworldSpawnX = global.dungeonDb[global.curDungeonId][5][2];
			global.overworldSpawnY = global.dungeonDb[global.curDungeonId][5][3];
			global.overworldSpawnFacing = global.dungeonDb[global.curDungeonId][5][4];
			room_goto(OverworldRoom);
		}
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function townPartnerDungeonEntryMulti(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Where do you want to go?\f00
		"));
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		var dungeonsStringified = "";
		for (var i=0; i<array_length(global.unlockedDungeonLists[1]); i++) {
			var dungeonId = global.unlockedDungeonLists[1][i];
			var go = "@Cx@0";
			if (global.dungeonDb[dungeonId][6] == global.curStoryHint) go = "@Ix";
			var nn = global.dungeonDb[dungeonId][0];
			dungeonsStringified += "#" + go + "@Q" + nn + "@0";
		}
		dungeonsStringified = string_delete(dungeonsStringified, 1, 1);
		spawnChoiceTextbox(dungeonsStringified, 10, 10);	
	}
	if (tick == 3) {
		return scriptingWaitForLastResult();	
	}
	if (tick == 4) {
		if (global.lastResult == RESULT_QUIT) {
			scriptingCloseAllText();
		} else {
			return 100;	
		}
	}
	if (tick == 5) {
		return scriptingDelay(10);	
	}
	if (tick == 6) {
		global.active = true;
		return SCRIPT_STOP;	
	}
	if (tick == 104) {
		scriptingCloseAllText();
		scriptingHealAll();
		var dungeonId = global.unlockedDungeonLists[1][global.lastResult];
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
		global.dungeonCurrentDiscoveredTiles = []
	}
	if (tick == 105) {
		return scriptingDelay(20);	
	}
	if (tick == 106) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
	}
	if (tick == 107) {
		return scriptingDelay(80);	
	}
	if (tick == 108) {
		if (global.dungeonDb[global.curDungeonId][5] == noone) {
			room_goto(DungeonRoom);
		} else {
			global.overworldCurMap = global.dungeonDb[global.curDungeonId][5][0];
			global.overworldCurVariant = global.dungeonDb[global.curDungeonId][5][1];
			global.overworldSpawnX = global.dungeonDb[global.curDungeonId][5][2];
			global.overworldSpawnY = global.dungeonDb[global.curDungeonId][5][3];
			global.overworldSpawnFacing = global.dungeonDb[global.curDungeonId][5][4];
			room_goto(OverworldRoom);
		}
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function townPartnerDungeonEntry(tick) {
	if (global.eventFlags[EVENT_LAB_EXPLAINED_MISSION6]) {
		return townPartnerDungeonEntryMulti(tick);	
	}
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Should we head off to \c51Mystic Highlands\c30?\f00
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
	}
	if (tick == 1) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 2) {
		global.gp0 = spawnChoiceTextbox("Yes#No");
	}
	if (tick == 3) {
		return scriptingWaitForLastResult();	
	}
	if (tick == 4) {
		scriptingCloseAllText();
		if (global.lastResult == 0) {
			global.gp1 = 1;
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: OK, let's head off.<@
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		} else {
			global.gp1 = 0;
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: It's important to prepare adequately.
Come back once you're ready.<@
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		}
	}
	if (tick == 5) {
		return scriptingWaitForTextInGP0();
	}
	if (tick == 6) {
		return scriptingDelay(30);	
	}
	if (tick == 7) {
		if (global.gp1 == 0) {
			return SCRIPT_STOP;
		} else {
			scriptingCloseAllText();
			scriptingHealAll();
			var dungeonId = global.unlockedDungeonLists[1][0];
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
		}
	}
	if (tick == 8) {
		return scriptingDelay(20);	
	}
	if (tick == 9) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
	}
	if (tick == 10) {
		return scriptingDelay(80);	
	}
	if (tick == 11) {
		if (global.dungeonDb[global.curDungeonId][5] == noone) {
			room_goto(DungeonRoom);
		} else {
			global.overworldCurMap = global.dungeonDb[global.curDungeonId][5][0];
			global.overworldCurVariant = global.dungeonDb[global.curDungeonId][5][1];
			global.overworldSpawnX = global.dungeonDb[global.curDungeonId][5][2];
			global.overworldSpawnY = global.dungeonDb[global.curDungeonId][5][3];
			global.overworldSpawnFacing = global.dungeonDb[global.curDungeonId][5][4];
			room_goto(OverworldRoom);
		}
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}