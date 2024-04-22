// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function interactMission2(){

}

function labSandslashMission2Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
You should go use that \c32Coin Case\c30 I gave you.
Do it at the \c51Serene Forest Clearing\c30.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function interactScriptExplainMission2(tick) {
	if (tick == 0) {
		global.musicIndex = 6;
		global.musicControl = MUS_PLAY;
	}
	if (tick == 1) {
		return scriptingDelay(40);
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Oh, so there was nothing there?
This is exactly how I predicted that mission to go.

\p01In fact, this mission was more of a test. There's a second part
to that investigation, which is far more important.

\p00I found a very interesting item in the neighboring land of
\c32Glitch Islands\c30. It's called the \c31Coin Case\c30.

We brought it to the lab for analysis, since it exhibited weird,
unexplained behavior when examined in certain areas.

\p04It's pretty certain that this item has some sort of connection
to the \c32glitch phenomena\c30 occuring all around us...

\p00How about you take this \c31Coin Case\c30 and try using it at the
\c51Serene Forest Clearing\c30? 

I am fairly certain this might cause interesting effects,
according to our current understanding of glitchology.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 3) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 4) {
		return scriptingDelay(40);	
	}
	if (tick == 5) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\m0e{PLAYER} obtained the \c31Coin Case\c30!<@
		"));
	}
	if (tick == 6) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 7) {
		return scriptingDelay(40);	
	}
	if (tick == 8) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: What sort of legendary item is that?
It's literally just a sack full of casino coins...

\p03And there's barely anything inside too.
There are only 100 coins there.\d30 which move? \d30 \c30 \c30
		"), [ASSET_PARTNER_PORTRAIT, 2]);
	}
	if (tick == 9) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 10) {
		return scriptingDelay(20);	
	}
	if (tick == 11) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Hey, what in the world?
You heard me say " + "\"which move\"" + @"? That was trippy...<@
		"), [ASSET_PARTNER_PORTRAIT, 0x0d]);
	}
	if (tick == 12) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 13) {
		return scriptingDelay(40);	
	}
	if (tick == 14) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: I appreciate your enthusiasm, but please, only use
the item in the predetermined spots I provide.

\p00We do not know all of this item's internal workings yet.
Many of its properties are still shrouded in mystery.

The looks of this artifact are very deceiving. It might look like
an ordinary sack of coins - but it's everything but ordinary.<@
		"), [Portrait0028, 2]);
	}
	if (tick == 15) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 16) {
		return scriptingDelay(40);	
	}
	if (tick == 17) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p04{PARTNER}: Understandable...
I will be more careful next time.

\p00So, we should try using this item near the forest's clearing.
Let's go if it has any interesting effects.

By the way. Since we're an exploration team now, I think it would
be wise to discuss our strategies more!

\p01I'm gonna wait in our house in case you want to try doing a small
\c32tactical meeting\c30 with me.

\p00Then we could discuss several matters, like learning new moves
or changing existing ones, as well as choosing \c32specializations\c30.

You see, it makes sense for different members to specialize in
different actions, like \c37offensive\c30, \c38defensive\c30 or \c39supportive\c30.

It gives us a way to clearly divide our responsibilities, and might
grant us access to more powerful techniques!

\p0aWe can discuss it in more detail later. See you at the house!
And when you're ready, just head to the camp's eastern exit.<@
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 18) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 19) {
		return scriptingDelay(20);	
	}
	if (tick == 20) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 174*2, 190*2, 25);
	}
	if (tick == 21) {
		return scriptingDelay(25);	
	}
	if (tick == 22) {
		sound_play(SFXGeneral12);
		with (scriptingSelectObj(global.partnerSpecies)) {
			x = -1000; y = -1000;
		}	
	}
	if (tick == 23) {
		return scriptingDelay(30);	
	}
	if (tick == 24) {
		array_push(global.unlockedDungeonLists[0], 2);
		array_push(global.roamingShopData, [3, 800]);
		global.curStoryHint = 2;
		global.eventFlags[EVENT_LAB_EXPLAINED_MISSION2] = 1;
		global.active = true;
		return SCRIPT_STOP;	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function interactPartnerTacticalMeeting(tick) {
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
{PARTNER}: Fair enough! Once you're ready to explore,
just go to the town's eastern exit.<@
			"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
			return 10;
		} else {
			if (global.curStoryHint == 2) {
				// you can brainstorm wrong?
				global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: As you wish.
Time for some brainstorming!

\p01And by that, I don't mean drawing three cards and putting two
of them back. I mean actual brainstorming! Let's go!<@
				"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
			} else {
				global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: As you wish.
Time for some brainstorming!<@
				"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
			}
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

function sereneForestClearingRevisitLore1() {
	if (tick == 0) {
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
		if (global.eventFlags[EVENT_SERENE_FOREST_CLEARING_FIRST_VISIT]) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Alrighty. We're back here.
Let's use the \c31Coin Case\c30 again.<@
			"), noone);
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: We're back at the end of the forest.
I think we're supposed to use the \c31Coin Case\c30 now?

\p04I am still a bit sceptical... I don't really understand what this guy
expects from us. How is counting our coins supposed to help?

But it's not like we have any other options, so we should probably
just do as instructed...

\p00Let me open that \c31Coin Case\c30 and see how many coins are inside.\d44 
Hmm, it still has 100 coins inside.\d10 which move?he PP of  \c30\f00
			"), [ASSET_PARTNER_PORTRAIT, 0]);
		}
		global.eventFlags[EVENT_SERENE_FOREST_CLEARING_FIRST_VISIT] = true;
	}
	else if (tick == 5) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 6) {
		audio_stop_all();	
		instance_create(MapPartGlitchDimensionColors, 0, 0);
	}
	else if (tick == 7) {
		return scriptingDelay(150);	
	}
	else if (tick == 8) {
		scriptingCloseAllText();	
		OverworldController.bgAsset = EnvSereneEndBG2;
	}
	else if (tick == 9) {
		return scriptingDelay(220);	
	}
	else if (tick == 10) {
		global.musicIndex = 9;
		global.musicControl = MUS_PLAY;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Woah, what happened?
This entire place feels different. The colors are all weird too...

\p00Look. There's a passage in front of us now!
Maybe we should go explore it?
<@
		"), [ASSET_PARTNER_PORTRAIT, 0xd]);
	}
	else if (tick == 11) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 12) {
		return scriptingDelay(10);	
	}
	else if (tick == 13) {
		global.emulatedInput = vk_up;
		with (OverworldObject) y = OverworldHero.y - 6;
		return scriptingDelay(20);
	}
	else if (tick == 14) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		//global.musicControl = MUS_FADEOUT;
		with (OverworldObject) y = OverworldHero.y - 6;
	}
	else if (tick == 15) {
		with (OverworldObject) y = OverworldHero.y - 6;
		return scriptingDelay(50);
	}
	else if (tick == 16) {
		global.emulatedInput = 0;
		room_goto(DungeonRoom);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function chunkScriptOnSereneGlitchDimensionLoad() {
	if (tick == 0) {
		with (DungeonTravelController) {
			/*ds_queue_enqueue(events, ["lock"]);
			ds_queue_enqueue(events, ["stop"]);
			ds_queue_enqueue(events, ["lore_msg", formatTextboxString(@"
*!* Wow this place is huge!
Let's start out our first exploration!<@
			"), [ASSET_PARTNER_PORTRAIT, 0]]);
			ds_queue_enqueue(events, ["wait_msg"]);
			ds_queue_enqueue(events, ["wait", 30]);*/
			ds_queue_enqueue(events, ["go"]);
			ds_queue_enqueue(events, ["unlock"]);
		}
		return SCRIPT_CONTINUE_ADVANCETICK;
	}
	return SCRIPT_STOP;
}

function sereneGlitchDimensionLore1() {
		
}