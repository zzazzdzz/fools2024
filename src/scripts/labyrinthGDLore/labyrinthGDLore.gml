
function labyrinthGDLore(){

}

function labyrinthGD_EncounterLore1(tick) {
	if (chunk_mem[1] == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Huh? \c32Ghost-type\c30 Pok%mon?
I thought this was an area inhabited by fire-types.

Interesting. It looks like, types of Pok%mon in \c51Glitch Dimensions\c30
might not correlate to types in their source areas...<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
		chunk_mem[1] = 1;
	}
	else if (chunk_mem[1] == 1) {
		if (!instance_exists(global.gp0)) {
			chunk_mem[0] = 5;
		}
	}
}
function labyrinthGD_IntersectionLore2(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function labyrinthGD_IntersectionLore3(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function labyrinthGD_TreasureChestLore4(tick) { return 1; }
function labyrinthGD_TreasureChestLore5(tick) { return 1; }
function labyrinthGD_EncounterLore6(tick) { chunk_mem[0] = 5; }
function labyrinthGD_ItemLore7(tick) { return 1; }
function labyrinthGD_ItemLore8(tick) { return 1; }
function labyrinthGD_IntersectionLore9(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function labyrinthGD_EncounterLore10(tick) { 
	if (chunk_mem[1] == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Wow, I can't believe what I'm seeing!
It's \c32Mew\c30, a legendary Pok%mon!<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
		chunk_mem[1] = 1;
	}
	else if (chunk_mem[1] == 1) {
		if (!instance_exists(global.gp0)) {
			chunk_mem[1] = 2;	
			chunk_mem[2] = 30;
		}
	}
	else if (chunk_mem[1] == 2) {
		chunk_mem[2] -= 1;
		if (chunk_mem[2] <= 0) {
			chunk_mem[1] = 3;
		}
	}
	else if (chunk_mem[1] == 3) {
		scriptingCloseAllText();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c46B\c30ooo... heyo !!\d30
i protecc.. LEGENDARY ITEM!

\c46B\c30you want it ?\d30 
we need.. FIGHT ! hayaaa !!\c46A\c30<@
		"), [Portrait0151, 0]);
		chunk_mem[1] = 4;
	}
	else if (chunk_mem[1] == 4) {
		if (!instance_exists(global.gp0)) {
			global.musicControl = MUS_FADEOUT;
			chunk_mem[1] = 5;	
			chunk_mem[2] = 60;
		}
	}
	else if (chunk_mem[1] == 5) {
		chunk_mem[2] -= 1;
		if (chunk_mem[2] <= 0) {
			chunk_mem[1] = 6;
		}
	}
	else if (chunk_mem[1] == 6) {
		chunk_mem[0] = 5;
	}
}
function labyrinthGD_ItemLore11(tick) { return 1; }
function labyrinthGD_EncounterLore12(tick) { chunk_mem[0] = 5; }
function labyrinthGD_CustomLore13(tick) {
	global.overworldCurMap = "LabyrinthSafeRoom";
	global.overworldCurVariant = "Standard";
	global.overworldSpawnX = 317;
	global.overworldSpawnY = 378;
	global.overworldSpawnFacing = FACING_U;
	global.active = true;
	return 1;
}

function labyrinthGD_GoOn() {
	if (tick == 0) {
		if (global.eventFlags[EVENT_MOLTRES_DEFEATED]) {
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
		if (global.eventFlags[EVENT_MOLTRES_DEFEATED]) {
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
		var xx = ["LabyrinthGDBossRoom", "Bepis", 156*2, 130*2, FACING_U];
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


function labyrinthGD_BeforeBoss(tick) {
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
{PARTNER}: Yeah, we made it to the end!
Where's the flaming bird? Come on!<@
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
		with (scriptingSelectObj("0146")) {
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
\c32Moltres\c30: I am Moltres, the warrior of fire!
All who defy the \c37Glitch Lord\c30 shall be purged by my flames!<@
		"), [Portrait0146, 0]); 
	}
	else if (tick == 14) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 15) {
		return scriptingDelay(40);	
	}
	else if (tick == 16) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Yup yup! Spare me the details.
You all ready? Time to extinguish that chicken!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 17) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 18) {
		return scriptingDelay(20);	
	}
	else if (tick == 19) {
		global.musicControl = MUS_FADEOUT;
	}
	else if (tick == 20) {
		return scriptingDelay(45);	
	}
	else if (tick == 21) {
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_SQUARES_IN;
	}
	else if (tick == 22) {
		return scriptingDelay(90);	
	}
	else if (tick == 23) {
		scriptingHealAll();
		
		var dungeonId = 9;
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
		
		var opponentData = global.dungeonData[2][4];
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

function labyrinthGD_AfterBoss(tick) {
	if (tick == 0) {
		audio_stop_all();
		with (scriptingSelectObj("0146")) {
			animIndex = "Injured";
			event_user(0);
		}
	}
	if (tick == 1) {
		return scriptingDelay(60);	
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: It's down. Was easy enough!
I declare this another victory for our team.<@
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
		scriptingSelectObj("0146").x = -999;
		OverworldController.bgAsset = EnvLabyrinthEndBG;
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
{PARTNER2}: And just like that, the area around us has
returned back to normal. Let's go back.<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
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
\c41CCCE\c30You reached the end of \c51Lava Labyrinth\c30's Glitch Dimension.
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
		global.overworldCurVariant = "Mission9";
		global.overworldSpawnX = 144*2;
		global.overworldSpawnY = 147*2;
		global.overworldSpawnFacing = FACING_U;
		global.eventFlags[EVENT_MOLTRES_DEFEATED] = 1;
		room_goto(LastOutingRoom);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}