
function mysticGDLore(){

}

function mysticGD_IntersectionLore1(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function mysticGD_ItemLore2(tick) { return 1; }
function mysticGD_TreasureChestLore3(tick) { return 1; }
function mysticGD_IntersectionLore4(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function mysticGD_EncounterLore5(tick) { chunk_mem[0] = 5; }
function mysticGD_EncounterLore6(tick) { chunk_mem[0] = 5; }
function mysticGD_IntersectionLore7(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function mysticGD_EncounterLore8(tick) { chunk_mem[0] = 5; }
function mysticGD_ItemLore9(tick) { return 1; }
function mysticGD_TreasureChestLore10(tick) { return 1; }
function mysticGD_EncounterLore11(tick) { chunk_mem[0] = 5; }
function mysticGD_IntersectionLore12(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function mysticGD_EncounterLore13(tick) { chunk_mem[0] = 5; }
function mysticGD_ItemLore14(tick) { return 1; }
function mysticGD_CustomLore15(tick) { 
	global.overworldCurMap = "GlacierGDSafeRoom";
	global.overworldCurVariant = "Standard";
	global.overworldSpawnX = 317;
	global.overworldSpawnY = 378;
	global.overworldSpawnFacing = FACING_U;
	global.active = true;
	return 1;
}

function mysticGD_GoOn(tick) {
	if (tick == 0) {
		if (global.eventFlags[EVENT_ARTICUNO_DEFEATED]) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
There's no one here.
You should head back.<@
			"), noone);
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Do you wish to go on?\f00
			"), noone);
		}
	}
	if (tick == 1) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 2) {
		if (global.eventFlags[EVENT_ARTICUNO_DEFEATED]) {
			global.lastResult = 1;
		} else {
			global.gp0 = spawnChoiceTextbox("Yes#No");
		}
	}
	if (tick == 3) {
		return scriptingWaitForLastResult();	
	}
	if (tick == 4) {
		scriptingCloseAllText();
		if (global.lastResult == 0) {
			global.gp1 = 1;
		} else {
			global.gp1 = 0;
			global.emulatedInput = vk_down;
		}
	}
	if (tick == 5) {
		return scriptingDelay(8);	
	}
	if (tick == 6) {
		if (global.gp1 == 0) {
			global.emulatedInput = 0;
			global.active = true;
			return SCRIPT_STOP;
		} else {
			scriptingCloseAllText();
			scriptingHealAll();
			global.battleStats = [[0,0,0],[0,0,0],[0,0,0],[0,0,false]];
			global.battleLastBlow = "due to an unseen force";
			global.battleLastTarget = "@6Bepis@0";
			global.battleCurrentAttackerIndex = -1;
			global.overworldSourceMap = global.overworldCurMap;
			global.overworldSourceVariant = global.overworldCurVariant;
			global.dungeonDiscoveredTiles = [];
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
		var xx = ["GlacierGDBossRoom", "Bepis", 156*2, 130*2, FACING_U];
		global.overworldCurMap = xx[0];
		global.overworldCurVariant = xx[1];
		global.overworldSpawnX = xx[2];
		global.overworldSpawnY = xx[3];
		global.overworldSpawnFacing = xx[4];
		global.active = true;
		room_goto(OverworldRoom);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function mysticGD_BeforeBoss(tick) {
	if (tick == 0) {
		audio_stop_all();
		global.musicIndex = 8;
		global.musicControl = MUS_PLAY;
	}
	else if (tick == 1) {
		return scriptingDelay(20);	
	}
	else if (tick == 2) {
		return scriptingDelay(20);
	}
	else if (tick == 3) {
		return scriptingDelay(20);	
	}
	else if (tick == 4) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Ugh, it's really cold here.
Being surrounded by stone walls probably makes it worse too...<@
		"), [ASSET_PARTNER_PORTRAIT, 5]);
	}
	else if (tick == 5) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 6) {
		return scriptingDelay(10);	
	}
	else if (tick == 7) {
		sound_play(FightSFXBirb);	
	}
	else if (tick == 8) {
		return scriptingDelay(20);	
	}
	else if (tick == 9) {
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_FADETOWHITE;
	}
	else if (tick == 10) {
		return scriptingDelay(100);	
	}
	else if (tick == 11) {
		with (scriptingSelectObj("0144")) {
			x = 156*2; y = 85*2;
		}
		instance_destroy(global.gp0);
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_FADEFROMWHITE;
	}
	else if (tick == 12) {
		return scriptingDelay(50);	
	}
	else if (tick == 13) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Articuno\c30: I am \c32Articuno\c30, the warder of ice.
Those who enter this realm I shall destroy with all my might.<@
		"), [Portrait0144, 0]);
	}
	else if (tick == 14) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 15) {
		return scriptingDelay(30);	
	}
	else if (tick == 16) {
		global.musicControl = MUS_FADEOUT;
	}
	else if (tick == 17) {
		return scriptingDelay(25);	
	}
	else if (tick == 18) {
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_SQUARES_IN;
	}
	else if (tick == 19) {
		return scriptingDelay(90);	
	}
	else if (tick == 20) {
		scriptingHealAll();
		
		var dungeonId = 5;
		global.curDungeonId = dungeonId;
		global.battleCurrentDutyName = global.dungeonDb[dungeonId][0];
		global.battleStats = [[0,0,0],[0,0,0],[0,0,0],[0,0,false]];
		global.battleLastBlow = "due to an unseen force";
		global.battleLastTarget = "@6Bepis@0";
		global.battleCurrentAttackerIndex = -1;
		global.dungeonData = variable_clone(global.dungeonDb[dungeonId][2]);
		global.overworldSourceMap = global.overworldCurMap;
		global.overworldSourceVariant = global.overworldCurVariant;
		global.dungeonDiscoveredTiles = [];
		global.dungeonCurrentDiscoveredTiles = [];
		
		var opponentData = global.dungeonData[2][5];
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

function mysticGD_AfterBoss(tick) {
	if (tick == 0) {
		audio_stop_all();
		with (scriptingSelectObj("0144")) {
			animIndex = "Injured";
			event_user(0);
		}
	}
	if (tick == 1) {
		return scriptingDelay(60);	
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: It's injured.
It appears that we won this battle.<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
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
		scriptingSelectObj("0144").x = -999;
		OverworldController.bgAsset = EnvGlacierEndBG;
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
{PARTNER}: Just like that. We're back to normal!
Exactly how it happened in \c51Serene Forest\c30!

With \c32Articuno\c30's Glitch Dimension image defeated, the natural
disasters around here will probably stop soon.

Let's go back to the lab and inform \c32Sandslash\c30 about our
progress! Well done, team!<@
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
\c41CCCE\c30You reached the end of \c51Crystal Glacier\c30's \c51Glitch Dimension\c30.
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
		global.overworldCurVariant = "Mission6";
		global.overworldSpawnX = 144*2;
		global.overworldSpawnY = 147*2;
		global.overworldSpawnFacing = FACING_U;
		global.eventFlags[EVENT_ARTICUNO_DEFEATED] = 1;
		room_goto(LastOutingRoom);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}