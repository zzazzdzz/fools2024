
function lavaLabyrinthLore(){

}

function lavaLabyrinth_IntersectionLore1(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function lavaLabyrinth_ItemLore2(tick) { return 1; }
function lavaLabyrinth_IntersectionLore3(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function lavaLabyrinth_ItemLore4(tick) { return 1; }
function lavaLabyrinth_ItemLore5(tick) { return 1; }
function lavaLabyrinth_ItemLore6(tick) { return 1; }
function lavaLabyrinth_TreasureChestLore7(tick) { return 1; }
function lavaLabyrinth_EncounterLore8(tick) { chunk_mem[0] = 5; }
function lavaLabyrinth_IntersectionLore9(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function lavaLabyrinth_IntersectionLore10(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function lavaLabyrinth_TreasureChestLore11(tick) { return 1; }
function lavaLabyrinth_ItemLore12(tick) { return 1; }
function lavaLabyrinth_EncounterLore13(tick) { chunk_mem[0] = 5; }
function lavaLabyrinth_EncounterLore14(tick) { chunk_mem[0] = 5; }
function lavaLabyrinth_IntersectionLore15(tick) { return [GENERIC_INTERSECTION_SCRIPT, noone]; }
function lavaLabyrinth_ItemLore16(tick) { return 1; }
function lavaLabyrinth_CustomLore17(tick) {
	global.overworldCurMap = "LabyrinthEnd";
	global.overworldCurVariant = "First";
	global.overworldSpawnX = (156)*2;
	global.overworldSpawnY = 130*2;
	global.overworldSpawnFacing = FACING_U;
	global.active = true;
	return 1;
}

function lavaLabyrinth_FirstLore(tick) {
	if (global.eventFlags[EVENT_LAVALABY_CLEAR]) {
		return lavaLabyrinth_Complete(tick);
	}
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
{PARTNER2}: Looks like we arrived at the end. However,
going in immediately would be reckless, to say the least.

Let's go back to the lab for now and report our findings.
We can return here once we're better prepared.<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
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
		return scriptingDelay(40);	
	}
	else if (tick == 10) {
		global.battleStats[3][2] = true;
		global.overworldCurMap = "Lab";
		global.overworldCurVariant = "Mission8";
		global.overworldSpawnX = 144*2;
		global.overworldSpawnY = 147*2;
		global.overworldSpawnFacing = FACING_U;
		global.eventFlags[EVENT_LAVALABY_CLEAR] = 1;
		room_goto(LastOutingRoom);	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}
	
function lavaLabyrinth_Complete(tick) {
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
\c41HHHJ\c30You reached the end of \c51Lava Labyrinth\c30.
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

function lavaLabyrinth_ReturnLore(tick) {
	if (tick == 0) {
		audio_stop_all();
		global.musicIndex = 8;
		global.musicControl = MUS_PLAY;
	}
	else if (tick == 1) {
		return scriptingDelay(90);	
	}
	else if (tick == 2) {
		if (global.eventFlags[EVENT_LAVALABI_FIRST]) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: We're back here.
Time to use the \c31Coin Case\c30.<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
		return 17-tick;
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Okay, everyone!
It's time to slay a giant flaming bird!<@
			"), [ASSET_PARTNER_PORTRAIT, 1]);
		}
	}
	else if (tick == 5) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 6) {
		return scriptingDelay(40);	
	}
	else if (tick == 7) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Let me see then...
There are 100 coins inside the \c31Coin Case\c30!\d40 <@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 8) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 9) {
		return scriptingDelay(80);	
	}
	else if (tick == 10) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Ah of course. It's not working again.
Time for some more troubleshooting?<@
		"), [ASSET_PARTNER_PORTRAIT, 2]);
	}
	else if (tick == 11) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 12) {
		return scriptingDelay(40);	
	}
	else if (tick == 13) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: That's not much of a surprise.
\c51Glitch Dimensions\c30 are highly volatile.

\p04Accessing them is not entirely reliable. Their behavior depends
on delicate circumstances - many of them out of control.

The effects could be influenced by even the slightest factors,
such as the exact location the \c31Coin Case\c30 is used at...<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
	}
	else if (tick == 14) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 15) {
		return scriptingDelay(10);	
	}
	else if (tick == 16) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Oh! So if I go to a different spot,
there is a chance it will work?<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 17) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 18) {
		return scriptingDelay(10);	
	}
	else if (tick == 19) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 100*2, 100*2, 25);
	}
	else if (tick == 20) {
		return scriptingDelay(25);	
	}
	else if (tick == 21) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: There are 100 coins inside the \c31Coin Case\c30.\d10 \c30
which move?he PP of  \c30\f00
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 22) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 23) {
		audio_stop_all();	
		instance_create(MapPartGlitchDimensionColors, 0, 0);
	}
	else if (tick == 24) {
		return scriptingDelay(150);	
	}
	else if (tick == 25) {
		scriptingCloseAllText();	
		OverworldController.bgAsset = EnvLabyrinthEndBG2;
	}
	else if (tick == 26) {
		return scriptingDelay(220);	
	}
	else if (tick == 27) {
		scriptingSelectObj(global.partnerSpecies).facing = FACING_DR;
		global.musicIndex = 20;
		global.musicControl = MUS_PLAY;
		global.eventFlags[EVENT_LAVALABI_FIRST] = 1;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p0b{PARTNER}: Wow, that really worked?
It's shocking to see something working for once.

\p00A passage opened up too. Our bird-slaying plans are in order.
Let's go!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 28) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 29) {
		return scriptingDelay(10);	
	}
	else if (tick == 30) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		/*global.musicControl = MUS_FADEOUT;*/
	}
	else if (tick == 31) {
		return scriptingDelay(50);
	}
	else if (tick == 32) {
		global.eventFlags[EVENT_LABYGD_FIRSTVISIT] = 1;
		global.emulatedInput = 0;
		room_goto(DungeonRoom);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

