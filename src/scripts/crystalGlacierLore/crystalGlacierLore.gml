// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function crystalGlacierLore(){}

function crystalGlacier_EncounterLore1(tick) { chunk_mem[0] = 5; }
function crystalGlacier_IntersectionLore2(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function crystalGlacier_TreasureChestLore3(tick) { return 1; }
function crystalGlacier_ItemLore4(tick) { return 1; }
function crystalGlacier_EncounterLore5(tick) { chunk_mem[0] = 5; }
function crystalGlacier_EncounterLore6(tick) { chunk_mem[0] = 5; }
function crystalGlacier_IntersectionLore7(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function crystalGlacier_IntersectionLore8(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function crystalGlacier_ItemLore9(tick) { return 1; }
function crystalGlacier_EncounterLore10(tick) { chunk_mem[0] = 5; }
function crystalGlacier_ItemLore11(tick) { return 1; }
function crystalGlacier_TreasureChestLore12(tick) { return 1; }
function crystalGlacier_EncounterLore13(tick) { chunk_mem[0] = 5; }
function crystalGlacier_CustomLore14(tick) {
	global.overworldCurMap = "GlacierEnd";
	global.overworldCurVariant = "First";
	global.overworldSpawnX = (156-15)*2;
	global.overworldSpawnY = 220*2;
	global.overworldSpawnFacing = FACING_U;
	global.active = true;
	return 1;
}

function crystalGlacier_FirstLore(tick) {
	if (global.eventFlags[EVENT_CRYSTALGLACIER_CLEAR]) {
		return crystalGlacier_Complete(tick);
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
		OverworldObject.y = OverworldHero.y - 6;
		return scriptingDelay(60);
	}
	else if (tick == 3) {
		global.emulatedInput = 0;
		return scriptingDelay(60);	
	}
	else if (tick == 4) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Finally, we arrived at the end.
I think it's time to use the \c31Coin Case\c30 now!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 5) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 6) {
		return scriptingDelay(10);	
	}
	else if (tick == 7) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Let me see.
There are 100 coins inside.\d33 \c30<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 8) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 9) {
		return scriptingDelay(40);	
	}
	else if (tick == 10) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: I said...
There are 100 coins inside.\d33 \c30<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 11) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 12) {
		return scriptingDelay(40);	
	}
	else if (tick == 13) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p04{PARTNER}: Yeah, I figured it would be the case.
Why would anything ever work two times in a row?

\p00We made it to the end, but we clearly seem to be missing
something. Let's go back for now.<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 14) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 15) {
		return scriptingDelay(30);	
	}
	else if (tick == 16) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
	}
	else if (tick == 17) {
		return scriptingDelay(60);	
	}
	else if (tick == 18) {
		global.gp0 = spawnIntermissionTextbox(formatTextboxString(@"
\c41HHHI\c30You reached the end of \c51Crystal Glacier\c30.
\c41OOOR\c30Impressive!<@
		"));	
		global.gp0.depth = -9999999;
	}
	else if (tick == 19) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 20) {
		return scriptingDelay(40);	
	}
	else if (tick == 21) {
		global.battleStats[3][2] = true;
		global.overworldCurMap = "Lab";
		global.overworldCurVariant = "Mission4";
		global.overworldSpawnX = 144*2;
		global.overworldSpawnY = 147*2;
		global.overworldSpawnFacing = FACING_U;
		global.eventFlags[EVENT_CRYSTALGLACIER_CLEAR] = 1;
		room_goto(LastOutingRoom);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}
	
function crystalGlacier_Complete(tick) {
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
		OverworldObject.y = OverworldHero.y - 6;
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
\c41HHHI\c30You reached the end of \c51Crystal Glacier\c30.
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

function crystalGlacier_ReturnLore(tick) {
	if (tick == 0) {
		audio_stop_all();
		global.musicIndex = 8;
		global.musicControl = MUS_PLAY;
	}
	else if (tick == 1) {
		return scriptingDelay(90);	
	}
	else if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: We're back here.
Time to see if it works after all of that trouble...<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 5) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 6) {
		return scriptingDelay(10);	
	}
	else if (tick == 7) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Ahem.\d10 \c30
There are 100 coins inside.\d10 which move?he PP of  \c30\f00
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 8) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 9) {
		audio_stop_all();	
		instance_create(MapPartGlitchDimensionColors, 0, 0);
	}
	else if (tick == 10) {
		return scriptingDelay(150);	
	}
	else if (tick == 11) {
		scriptingCloseAllText();	
		OverworldController.bgAsset = EnvGlacierGDSafeRoomBG;
	}
	else if (tick == 12) {
		return scriptingDelay(220);	
	}
	else if (tick == 13) {
		global.musicIndex = 14;
		global.musicControl = MUS_PLAY;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: It worked!
We've changed locations again! Let's go.<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 14) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 15) {
		return scriptingDelay(10);	
	}
	else if (tick == 16) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
	}
	else if (tick == 17) {
		return scriptingDelay(50);
	}
	else if (tick == 18) {
		global.eventFlags[EVENT_CRYSTAL_GLACIER_CLEARING_FIRST_VISIT] = 1;
		global.emulatedInput = 0;
		room_goto(DungeonRoom);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}