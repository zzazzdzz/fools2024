// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function interactGeneral(){}

function interactSaveStatue(tick) {
	if (tick == 0) {	
		spawnSaveDetailsTextbox(10, 10);
		global.gp0 = spawnStandardTextbox("Would you like to save your progress?\\f00");
	}
	if (tick == 1) {
		return scriptingWaitForTextInGP0();
	}
	if (tick == 2) {
		spawnChoiceTextbox("Yes#No");
	}
	if (tick == 3) {
		return scriptingWaitForLastResult();
	}
	if (tick == 4) {
		if (global.lastResult != RESULT_NONE) {
			if (global.lastResult == 0) {
				saveGame();
				return 1;
			} else {
				scriptingCloseAllText();
				return SCRIPT_STOP;
			}
		}
	}
	if (tick == 5) {
		if (instance_exists(global.gp0)) instance_destroy(global.gp0);
		var bound = true;
		if (array_length(global.onlineLeaderboardBind) == 0) bound = false;
		else if (!global.onlineLeaderboardBind[0]) bound = false;
		if (!bound) {
			global.gp0 = spawnStandardTextbox("\\m0aSave completed successfully.<@");
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\m0aSave completed successfully.

If you wish to synchronize your progress with the leaderboard,
please save the game from the \c32Start Menu\c30.<@
			"));
		}
	}
	if (tick == 6) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 7) {
		scriptingCloseAllText();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function interactSaveRoomPartner(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Hey, {PLAYER}!
Should we talk strategy?\f00
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 1) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 2) {
		global.gp0 = spawnChoiceTextbox("Let's do a tactical meeting.#I'm fine for now.");
		global.gp0.quitStatusAllowed = true;
	}
	if (tick == 3) {
		return scriptingWaitForLastResult();	
	}
	if (tick == 4) {
		scriptingCloseAllText();
		if (global.lastResult != 0) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Fair enough!
Once you feel prepared, just proceed forward.<@
			"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
			return 10;
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: As you wish.
Time for some brainstorming!<@
			"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
		}
	}
	if (tick == 5) {
		return scriptingWaitForTextInGP0();
	}
	if (tick == 6) {
		return scriptingDelay(20);
	}
	if (tick == 7) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
	}
	if (tick == 8) {
		return scriptingDelay(50);	
	}
	if (tick == 9) {
		global.overworldSpawnX = OverworldHero.x;
		global.overworldSpawnY = OverworldHero.y;
		global.overworldSpawnFacing = OverworldHero.facing;
		room_goto(TacticsRoom);	
	}
	if (tick == 14) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 15) {
		return SCRIPT_STOP;	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function interactSaveRoomPartner2() {
	if (tick == 0) {
		scriptingFacePlayer();
		if (global.overworldCurMap == "GlacierGDSafeRoom") {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: So it appears, we're going to be fighting
against an ice-type Pok%mon...

This means our \c32grass types\c30 might need some extra coverage.
Consider using defensive skills like \c31Barrier\c30 or \c31Rejuvenate\c30.

Additionally, our \c32fire-type moves\c30 should be exceptionally
powerful here. Try powering them up with \c31Concentrate\c30.

And if the fight makes you feel overwhelmed, there is nothing
wrong with leaving the dungeon and leveling up for a bit.

In any case, I leave the choice of strategy up to you.
We can surely win with enough practice.<@
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		} else if (global.overworldCurMap == "LabyrinthSafeRoom") {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: So it appears, we're going to be fighting
against a fire-type Pok%mon.

Our \c32grass types\c30 will need extra coverage, to make sure they
survive any unavoidable attacks.

If the fight turns out to be too problematic, there is no shame
in retreating and preparing first.

In any case, I leave the choice of strategy up to you.
We can surely win with enough practice.<@
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		} else if (global.overworldCurMap == "KeepSafeRoom") {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: So it appears, we're going to be fighting
against a electric-type Pok%mon.

Our \c32water types\c30 will need extra care and protection.
Frustrating, considering we don't have advantages ourselves.

Positioning for this fight might end up extremely tight.
It might be beneficial to develop a strategy in advance.

If the fight turns out to be problematic, there is no shame in
backing off and coming back later.

In any case, I leave the choice of strategy up to you.
We can surely win with enough practice.<@
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		} else if (global.overworldCurMap == "AbyssPre" || global.overworldCurMap == "AbyssPost") {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Are you ready to proceed?
Lead the way if so.<@
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
bepis be a lady tonight<@
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		}
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;	
}

function interactGoBackToTown() {
	if (tick == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Do you wish to go back?\f00
		"), noone);
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
		} else {
			global.gp1 = 0;
			global.emulatedInput = vk_up;
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
		var xx = ["Town", "Standard2", 1000*2, 486*2, FACING_L];
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

function interactGoBackToTown2() { 
	if (tick == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Do you wish to go back?\f00
		"), noone);
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
		} else {
			global.gp1 = 0;
			global.emulatedInput = vk_up;
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
		var xx = ["Town", "Standard2", 640*2, 220*2, FACING_D];
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