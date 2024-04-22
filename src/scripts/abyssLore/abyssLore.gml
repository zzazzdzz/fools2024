// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function abyssLore(){}

function abyss_IntersectionLore1(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function abyss_ItemLore2(tick) { return 1; }
function abyss_EncounterLore3(tick) { chunk_mem[0] = 5; }
function abyss_TreasureChestLore4(tick) { return 1; }
function abyss_IntersectionLore5(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function abyss_TreasureChestLore6(tick) { return 1; }
function abyss_ItemLore7(tick) { return 1; }
function abyss_EncounterLore8(tick) { chunk_mem[0] = 5; }
function abyss_IntersectionLore9(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function abyss_ItemLore10(tick) { return 1; }
function abyss_EncounterLore11(tick) { chunk_mem[0] = 5; }
function abyss_TreasureChestLore12(tick) { return 1; }
function abyss_IntersectionLore13(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function abyss_EncounterLore14(tick) { chunk_mem[0] = 5; }
function abyss_ItemLore15(tick) { return 1; }
function abyss_CustomLore16(tick) { 
	global.overworldCurMap = "AbyssPost";
	global.overworldCurVariant = global.eventFlags[EVENT_MISSINGNO_DEFEATED] ? "Returnable" : "Bepis";
	global.overworldSpawnX = 160*2;
	global.overworldSpawnY = 124*2;
	global.overworldSpawnFacing = FACING_U;
	global.active = true;
	return 1;
}