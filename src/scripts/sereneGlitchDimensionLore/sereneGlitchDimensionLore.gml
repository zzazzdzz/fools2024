// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sereneGlitchDimensionLore(){}

function sereneGlitchDimension_TreasureChestLore1(tick) { return 1; }
function sereneGlitchDimension_IntersectionLore2(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function sereneGlitchDimension_ItemLore3(tick) { return 1; }
function sereneGlitchDimension_IntersectionLore4(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function sereneGlitchDimension_EncounterLore5(tick) { chunk_mem[0] = 5; }
function sereneGlitchDimension_ItemLore6(tick) { return 1; }
function sereneGlitchDimension_ItemLore7(tick) { return 1; }
function sereneGlitchDimension_IntersectionLore8(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function sereneGlitchDimension_EncounterLore9(tick) { chunk_mem[0] = 5; }
function sereneGlitchDimension_ItemLore10(tick) { return 1; }
function sereneGlitchDimension_TreasureChestLore11(tick) { return 1; }
function sereneGlitchDimension_EncounterLore12(tick) { chunk_mem[0] = 5; }
function sereneGlitchDimension_IntersectionLore13(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function sereneGlitchDimension_ItemLore14(tick) { return 1; }
function sereneGlitchDimension_EncounterLore15(tick) { chunk_mem[0] = 5; }
function sereneGlitchDimension_TreasureChestLore16(tick) { return 1; }
function sereneGlitchDimension_CustomLore17(tick) { 
	global.overworldCurMap = "SereneGDEnd";
	global.overworldCurVariant = "Encounter";
	global.overworldSpawnX = (156-15)*2;
	global.overworldSpawnY = 220*2;
	global.overworldSpawnFacing = FACING_U;
	global.active = true;
	return 1;
}

function sereneGlitchDimension_Complete(tick) {
	if (tick == 0) {
		audio_stop_all();
		global.musicIndex = 8;
		global.musicControl = MUS_PLAY;
	}
	else if (tick == 1) {
		return scriptingDelay(60);	
	}
	else if (tick == 2) {
		global.emulatedInput = vk_up;
		with (OverworldObject) y = OverworldHero.y - 6;
		return scriptingDelay(60);
	}
	else if (tick == 3) {
		global.emulatedInput = 0;
		return scriptingDelay(60);	
	}
	else if (tick == 4) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
This is the end of the dungeon.
It's impossible to go any further.<@
		"), noone);
	}
	else if (tick == 5) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 6) {
		return scriptingDelay(30);	
	}
	else if (tick == 7) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
	}
	else if (tick == 8) {
		return scriptingDelay(60);	
	}
	else if (tick == 9) {
		global.gp0 = spawnIntermissionTextbox(formatTextboxString(@"
\c41CCCF\c30You reached the end of \c51Serene Forest\c30's Glitch Dimension.
\c41OOOR\c30Impressive!<@
		"));	
		global.gp0.depth = -9999999;
	}
	else if (tick == 10) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 11) {
		return scriptingDelay(40);	
	}
	else if (tick == 12) {
		global.battleStats[3][2] = true;
		global.overworldCurMap = global.overworldSourceMap;
		global.overworldCurVariant = global.overworldSourceVariant;
		global.overworldSpawnX = 1000*2;
		global.overworldSpawnY = 486*2;
		global.overworldSpawnFacing = FACING_L;
		room_goto(LastOutingRoom);	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function sereneGlitchDimension_Encounter(tick) {
	if (global.eventFlags[EVENT_SERENE_GLITCHDIMENSION_CLEAR]) {
		return sereneGlitchDimension_Complete(tick);
	}
	if (tick == 0) {
		audio_stop_all();
		global.musicIndex = 8;
		global.musicControl = MUS_PLAY;
	}
	else if (tick == 1) {
		return scriptingDelay(60);	
	}
	else if (tick == 2) {
		global.emulatedInput = vk_up;
		with (OverworldObject) y = OverworldHero.y - 6;
		return scriptingDelay(60);
	}
	else if (tick == 3) {
		global.emulatedInput = 0;
		return scriptingDelay(60);	
	}
	else if (tick == 4) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: It was exhausting, but we reached the end.
What now?<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 5) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 6) {
		return scriptingDelay(10);	
	}
	else if (tick == 7) {
		sound_play(FightSFXKangaskhanCry);	
	}
	else if (tick == 8) {
		return scriptingDelay(60);	
	}
	else if (tick == 9) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Wait...
Did you hear that?<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 10) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 11) {
		return scriptingDelay(20);	
	}
	else if (tick == 12) {
		sound_play(FightSFXKangaskhanCry);	
	}
	else if (tick == 13) {
		return scriptingDelay(60);	
	}
	else if (tick == 14) {
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_FADETOWHITE;
	}
	else if (tick == 15) {
		return scriptingDelay(100);	
	}
	else if (tick == 16) {
		with (scriptingSelectObj("0115")) {
			x = 156*2; y = 90*2;
		}
		instance_destroy(global.gp0);
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_FADEFROMWHITE;
	}
	else if (tick == 17) {
		return scriptingDelay(50);	
	}
	else if (tick == 18) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Kangaskhan\c30: Who are you to cross into the domain of glitches?
You are not welcome in this area.

Resistance against the \c37Glitch Lord\c30's will shall not be tolerated.
Prepare to be defeated. Your journey ends right here!
<@
		"), [Portrait0115, 0]);
	}
	else if (tick == 19) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 20) {
		return scriptingDelay(30);	
	}
	else if (tick == 21) {
		global.musicControl = MUS_FADEOUT;
	}
	else if (tick == 22) {
		return scriptingDelay(25);	
	}
	else if (tick == 23) {
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_SQUARES_IN;
	}
	else if (tick == 24) {
		return scriptingDelay(90);	
	}
	else if (tick == 25) {
		scriptingHealAll();
		var opponentData = global.dungeonData[2][3];
		global.battleAdversaryScript = opponentData.scripts;
		global.battleInitData = opponentData.adversaries;
		global.tileMap = opponentData.tilemap;
		global.battleType = BATTLETYPE_OVERWORLD;
		global.battleLog = [];
		
		global.battleWarpMap = global.overworldCurMap;
		global.battleWarpVariant = "EncounterFinished";
		global.overworldSpawnX = OverworldHero.x;
		global.overworldSpawnY = OverworldHero.y;
		global.overworldSpawnFacing = FACING_U;
		
		room_goto(BattleRoom);	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function sereneGlitchDimension_Encounter2(tick) {
	if (tick == 0) {
		audio_stop_all();
	}
	if (tick == 1) {
		return scriptingDelay(60);	
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Woah, that was pretty wild...
But we did our job perfectly it seems like. Now what?<@
		"), [ASSET_PARTNER_PORTRAIT, 4]);
	}
	if (tick == 3) {
		return scriptingWaitForTextInGP0();
	}
	if (tick == 4) {
		return scriptingDelay(25);	
	}
	if (tick == 5) {
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_FADETOWHITE;
	}
	if (tick == 6) {
		return scriptingDelay(100);	
	}
	if (tick == 7) {
		OverworldController.bgAsset = EnvSereneEndBG;
		instance_destroy(global.gp0);
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_FADEFROMWHITE;
	}
	if (tick == 8) {
		return scriptingDelay(60);
	}
	if (tick == 9) {
		global.musicIndex = 8;
		global.musicControl = MUS_PLAY;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: We're back to normal!
It almost felt like it was just a bad dream...

We should head back to the lab and tell \c32Sandslash\c30 about
everything we discovered.<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	if (tick == 10) {
		return scriptingWaitForTextInGP0();
	}
	if (tick == 11) {
		return scriptingDelay(30);	
	}
	else if (tick == 12) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
	}
	else if (tick == 13) {
		return scriptingDelay(60);	
	}
	else if (tick == 14) {
		global.gp0 = spawnIntermissionTextbox(formatTextboxString(@"
\c41CCCF\c30You reached the end of \c51Serene Forest\c30's Glitch Dimension.
\c41OOOR\c30Impressive!<@
		"));	
		global.gp0.depth = -9999999;
	}
	else if (tick == 15) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 16) {
		return scriptingDelay(40);	
	}
	else if (tick == 17) {
		global.battleStats[3][2] = true;
		global.overworldCurMap = "Lab";
		global.overworldCurVariant = "Mission3";
		global.overworldSpawnX = 144*2;
		global.overworldSpawnY = 147*2;
		global.overworldSpawnFacing = FACING_U;
		global.eventFlags[EVENT_SERENE_GLITCHDIMENSION_CLEAR] = 1;
		room_goto(LastOutingRoom);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}