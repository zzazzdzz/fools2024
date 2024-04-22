// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function keepGDLore(){}

function keepGD_TreasureChestLore1(tick) { return 1; }
function keepGD_IntersectionLore2(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function keepGD_IntersectionLore3(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function keepGD_ItemLore4(tick) { return 1; }
function keepGD_IntersectionLore5(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function keepGD_EncounterLore6(tick) { chunk_mem[0] = 5; }
function keepGD_EncounterLore7(tick) { chunk_mem[0] = 5; }
function keepGD_TreasureChestLore8(tick) { return 1; }
function keepGD_IntersectionLore9(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function keepGD_IntersectionLore10(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function keepGD_TreasureChestLore11(tick) { return 1; }
function keepGD_IntersectionLore12(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function keepGD_ItemLore13(tick) { return 1; }
function keepGD_ItemLore14(tick) { return 1; }
function keepGD_EncounterLore15(tick) { chunk_mem[0] = 5; }
function keepGD_IntersectionLore16(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function keepGD_ItemLore17(tick) { return 1; }
function keepGD_CustomLore18(tick) {
	global.overworldCurMap = "KeepSafeRoom";
	global.overworldCurVariant = "Standard";
	global.overworldSpawnX = 317;
	global.overworldSpawnY = 378;
	global.overworldSpawnFacing = FACING_U;
	global.active = true;
	return 1;
}

function keepGD_GoOn(tick) {
	if (tick == 0) {
		if (global.eventFlags[EVENT_ZAPDOS_DEFEATED]) {
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
		if (global.eventFlags[EVENT_ZAPDOS_DEFEATED]) {
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
		var xx = ["KeepBossRoom", "Bepis", 156*2, 130*2, FACING_U];
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

function keepGD_BeforeBoss(tick) {
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
{PARTNER}: We reached a dead end again.
You all know what that means, right?<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
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
		with (scriptingSelectObj("0145")) {
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
\c32Zapdos\c30: I am \c32Zapdos\c30, the embodiment of lightning!
Succumb to my great and righteous fury!<@
		"), [Portrait0145, 0]); 
	}
	else if (tick == 14) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 15) {
		return scriptingDelay(20);	
	}
	else if (tick == 16) {
		global.musicControl = MUS_FADEOUT;
	}
	else if (tick == 17) {
		return scriptingDelay(45);	
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
		global.dungeonDiscoveredTiles = [];
		global.dungeonCurrentDiscoveredTiles = [];
		
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

function keepGD_AfterBoss(tick) {
	if (tick == 0) {
		audio_stop_all();
		with (scriptingSelectObj("0145")) {
			animIndex = "Injured";
			event_user(0);
		}
	}
	if (tick == 1) {
		return scriptingDelay(60);	
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: That's it.
That's the last legendary bird down!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
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
		scriptingSelectObj("0145").x = -999;
		OverworldController.bgAsset = EnvKeepReturnBG;
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
{PARTNER}: We're back to normal.
We should head back to the lab.

\p0aI cannot wait to pass the shocking news of my victory!
You get it? Shocking news?

\p00... ... ... ... ...
... ... ... ... ...\d23 \c30

Yeah, I'll be on my way.<@
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
\c41CCFC\c30You reached the end of \c51Fogbound Keep\c30's Glitch Dimension.
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
		global.overworldCurVariant = "MissionL";
		global.overworldSpawnX = 144*2;
		global.overworldSpawnY = 147*2;
		global.overworldSpawnFacing = FACING_U;
		global.eventFlags[EVENT_ZAPDOS_DEFEATED] = 1;
		room_goto(LastOutingRoom);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}