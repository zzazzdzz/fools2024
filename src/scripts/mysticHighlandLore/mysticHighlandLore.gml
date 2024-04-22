// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mysticHighlandLore(){

}

function mysticHighland_IntersectionLore1(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function mysticHighland_ItemLore2(tick) { return 1; }
function mysticHighland_EncounterLore3(tick) { chunk_mem[0] = 5; }
function mysticHighland_IntersectionLore4(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function mysticHighland_EncounterLore5(tick) { chunk_mem[0] = 5; }
function mysticHighland_IntersectionLore6(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function mysticHighland_ItemLore7(tick) { return 1; }
function mysticHighland_EncounterLore8(tick) { chunk_mem[0] = 5; }
function mysticHighland_IntersectionLore9(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function mysticHighland_ItemLore10(tick) { return 1; }
function mysticHighland_ItemLore11(tick) { return 1; }
function mysticHighland_IntersectionLore12(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function mysticHighland_EncounterLore13(tick) { chunk_mem[0] = 5; }
function mysticHighland_ItemLore14(tick) { return 1; }
function mysticHighland_IntersectionLore15(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function mysticHighland_EncounterLore16(tick) {
	if (chunk_mem[1] == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Oh, oops!
This is not a \c32Machop\c30. It's a \c32Machamp\c30!

But it's not an issue. The \c31Coin Case\c30 glitch should still work.
Let's dispose of this \c32Machamp\c30 real quick.<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
		chunk_mem[1] = 1;
	}
	else if (chunk_mem[1] == 1) {
		if (!instance_exists(global.gp0)) {
			chunk_mem[0] = 5;
		}
	}
}

function mysticHighland_CustomLore17(tick) { 
	// used key
	if (chunk_mem[0] == 0) {
		global.eventFlags[EVENT_MYSTICHIGHLAND_CLEAR] = 1;
		global.battleStats[3][2] = true;
		if (global.eventFlags[EVENT_MYSTICHIGHLAND_MACHAMP]) {
			global.overworldCurMap = global.overworldSourceMap;
			global.overworldCurVariant = global.overworldSourceVariant;
			global.overworldSpawnX = 640*2;
			global.overworldSpawnY = 210*2;
			global.overworldSpawnFacing = FACING_D;
		} else {
			global.overworldCurMap = "Lab";
			global.overworldCurVariant = "Mission5";
			global.overworldSpawnX = 144*2;
			global.overworldSpawnY = 147*2;
			global.overworldSpawnFacing = FACING_U;
			global.eventFlags[EVENT_MYSTICHIGHLAND_MACHAMP] = 1;
		}
		chunk_mem[0] = 1;
	}
	return 1; 
}
function mysticHighland_CustomLore18(tick) { 
	// no key
	if (chunk_mem[0] == 0) {
		global.eventFlags[EVENT_LAB_EXPLAINED_MISSION4LOOP] = 0;
		global.battleStats[3][2] = true;
		if (global.eventFlags[EVENT_MYSTICHIGHLAND_CLEAR]) {
			global.overworldCurMap = global.overworldSourceMap;
			global.overworldCurVariant = global.overworldSourceVariant;
			global.overworldSpawnX = 640*2;
			global.overworldSpawnY = 210*2;
			global.overworldSpawnFacing = FACING_D;
		} else {
			global.overworldCurMap = "Lab";
			global.overworldCurVariant = "Mission4Loop";
			global.overworldSpawnX = 144*2;
			global.overworldSpawnY = 147*2;
			global.overworldSpawnFacing = FACING_U;
			global.eventFlags[EVENT_MYSTICHIGHLAND_CLEAR] = 1;
		}
		chunk_mem[0] = 1;
	}
	return 1; 
}