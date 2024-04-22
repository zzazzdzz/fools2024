function interactMission1(){

}

function interactPartnerStartMission1(){
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: So, you're done with looking around?
Are you ready?\f00
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 1) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 2) {
		global.gp0 = spawnChoiceTextbox("I'm ready, let's go to sleep.#I want to look around a bit more.");
		global.gp0.quitStatusAllowed = false;
	}
	if (tick == 3) {
		return scriptingWaitForLastResult();	
	}
	if (tick == 4) {
		scriptingCloseAllText();
		if (global.lastResult == 1) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: OK, feel free to take your time.
Just tell me when you're ready.<@
			"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
			return 10;
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Great! Let's go to sleep for now.
I'm excited to see what assignment we're gonna get tomorrow!<@
			"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
		}
	}
	if (tick == 5) {
		return scriptingWaitForTextInGP0();
	}
	if (tick == 6) {
		return scriptingDelay(30);
	}
	if (tick == 7) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
	}
	if (tick == 8) {
		return scriptingDelay(100);	
	}
	if (tick == 9) {
		global.gp0 = spawnIntermissionTextbox(formatTextboxString(@"
\c41CCCE\c30On the next day, the two new recruits show up at the lab,
\c41DDDD\c30where they finally get some details about their mission.<@
		"));
		global.gp0.depth = -9999999;
	}
	if (tick == 10) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 11) {
		return scriptingDelay(60);	
	}
	if (tick == 12) {
		global.overworldCurMap = "Lab";
		global.overworldCurVariant = "Mission1";
		global.overworldSpawnX = 144*2;
		global.overworldSpawnY = 147*2;
		global.overworldSpawnFacing = FACING_U;
		room_goto(OverworldRoom);
		global.active = true;	
	}
	if (tick == 14) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 15) {
		return SCRIPT_STOP;	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function interactScriptExplainMission1() {
	if (tick == 0) {
		return scriptingDelay(40);	
	}
	if (tick == 1) {
		global.musicIndex = 31;
		global.musicControl = MUS_PLAY;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Let me start with a brief description.
We noticed a lot of Pok%mon started behaving strangely.

They grew hostile and aggressive. This includes legendary
Pok%mon, which started causing natural disasters.

The results are inconclusive, but it's almost certain that the
reason for this is some sort of \c32glitch phenomenon\c30.

This all happened back when the \c37Glitch Lord\c30 invaded certain
neighboring lands, like Glitchland and Glitch Islands.

I think it's fair to assume that he's the one causing trouble.
Regardless of that, all of this warrants an investigation.

There are multiple locations where we detected unusual activity.
One of them, fairly close to our camp, is \c51Serene Forest\c30.

Thus, I ask you to go to \c51Serene Forest\c30 and investigate.
I'm hoping you can provide some useful information.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 2) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 3) {
		return scriptingDelay(30);	
	}
	if (tick == 4) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Sounds like a good way to start off!
We should prepare ourselves, then head to \c51Serene Forest\c30.

The exit from the camp is located \c32to the east\c30, and that's where
I'll be waiting for you!

In the meantime, make sure to get everything ready. I heard
\c32Kecleon\c30 opened a shop. You should check that out!

Anyway, I'm gonna wait for you, and we're gonna leave once
you're ready. See you later!<@
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0], 20);
	}
	if (tick == 5) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 6) {
		return scriptingDelay(20);	
	}
	if (tick == 7) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 174*2, 190*2, 25);
	}
	if (tick == 8) {
		global.musicControl = MUS_FADEOUT;
		return scriptingDelay(25);	
	}
	if (tick == 9) {
		sound_play(SFXGeneral12);
		with (scriptingSelectObj(global.partnerSpecies)) {
			x = -1000; y = -1000;
		}	
	}
	if (tick == 10) {
		return scriptingDelay(60);	
	}
	if (tick == 11) {
		global.musicIndex = 6;
		global.musicControl = MUS_PLAY;
		array_push(global.teamMembers, createTeamMember(global.partnerSpecies));
		global.teamMembers[1].name = global.partnerName;
		array_push(global.unlockedDungeonLists[0], 1);
		global.curStoryHint = 1;
		global.eventFlags[EVENT_LAB_EXPLAINED_MISSION1] = 1;
		global.active = true;
		return SCRIPT_STOP;	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labSandslashMission1Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: You should head to \c51Serene Forest\c30.
Your friend will be waiting at the camp's eastern exit.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;	
}

function interactPartnerBeforeMission1(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: How is it going? Everything ready to go?
If so, we should be going to \c51Serene Forest\c30!

\p0aHaha, noticed how i used the word " + "\"go\"" + @" here in three different
contexts? You better laugh at my amazing wordplay!<@
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function chunkScriptOnSereneForestLoad(tick) {
	if (tick == 0) {
		if (global.eventFlags[EVENT_TUTORIALTEXT_EXPLORE]) {
			with (DungeonTravelController) {
				ds_queue_enqueue(events, ["go"]);
				ds_queue_enqueue(events, ["unlock"]);
			}
			return SCRIPT_STOP;
		}
		with (DungeonTravelController) {
			ds_queue_enqueue(events, ["lock"]);
			ds_queue_enqueue(events, ["stop"]);
			ds_queue_enqueue(events, ["lore_msg", formatTextboxString(@"
{PARTNER}: Wow! This is almost exactly how I imagined it!
Time to begin our first exploration!<@
			"), [ASSET_PARTNER_PORTRAIT, 0]]);
			ds_queue_enqueue(events, ["wait_msg"]);
			ds_queue_enqueue(events, ["wait", 30]);
			if (!global.eventFlags[EVENT_TUTORIALTEXT_EXPLORE]) {
				ds_queue_enqueue(events, ["lore_msg", formatTextboxString(@"
\m08In dungeons, you and your team will automatically move forward
and explore the surrounding area.

Should you encounter any obstacles or decisions to make,
your team members will stop and wait for your input.<@
				"), noone]);
				ds_queue_enqueue(events, ["wait_msg"]);
				ds_queue_enqueue(events, ["wait", 30]);
				global.eventFlags[EVENT_TUTORIALTEXT_EXPLORE] = true;
			}
			ds_queue_enqueue(events, ["go"]);
			ds_queue_enqueue(events, ["unlock"]);
		}
		return SCRIPT_CONTINUE_ADVANCETICK;
	}
	return SCRIPT_STOP;
}

function sereneForestLoreScript1() {
	if (chunk_mem[1] == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p0c{PARTNER}: Wahh!
It's like the simulation!

It's a hooked Metapod!
It's real!\f00
		"), [ASSET_PARTNER_PORTRAIT, 0]);
		chunk_mem[1] = 1;
	}
	else if (chunk_mem[1] == 1) {
		if (global.gp0.hang) {
			global.gp0 = spawnChoiceTextbox("Let's go kill it!#It's just a normal Metapod.#You know this entire world is a simulation?");
			global.gp0.quitStatusAllowed = false;
			chunk_mem[1] = 2;
		}
	}
	else if (chunk_mem[1] == 2) {
		if (global.lastResult != RESULT_NONE) {
			chunk_mem[1] = 3;
		}
	}
	else if (chunk_mem[1] == 3) {
		scriptingCloseAllText();
		if (global.lastResult == 0) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p02{PARTNER}: Yeah, I like that thinking!
Let's go kick its... chrysalis, I think?<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
		}
		if (global.lastResult == 1) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p02{PARTNER}: Hmm, on second thought, maybe you're right.
But how are you supposed to tell if it's hooked anyway?

\p00It could be different, like a...
Wait, what's the opposite of " + "\"" + "hooked" + "\"" + @"?

\p03And the most important thing, why am I thinking about it
instead of beating this guy up? Let's go already!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
		}
		if (global.lastResult == 2) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p02{PARTNER}: Huh?
I think you've played way too many video games...

What would make you think that in the first place?
Let's just go beat this guy up already!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
		}
		chunk_mem[1] = 4;
	}
	else if (chunk_mem[1] == 4) {
		if (!instance_exists(global.gp0)) {
			chunk_mem[0] = 5;	
		}
	}
}

function sereneForestLoreScript2() {
	return [formatTextboxString(@"
{PARTNER}: Oh wow, decisions!
Looks like we need to pick a path!\f00
	"), [ASSET_PARTNER_PORTRAIT, 0]];
}

function sereneForestLoreScript3() {
	if (chunk_mem[1] == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p0a{PARTNER}: Yes! Can you guess what we have here?
It's treasure! We found some treasure!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
		chunk_mem[1] = 1;
	}
	else if (chunk_mem[1] == 1) {
		if (!instance_exists(global.gp0)) {
			chunk_mem[1] = 2;	
			chunk_mem[2] = 10;
		}
	}
	else if (chunk_mem[1] == 2) {
		chunk_mem[2] -= 1;
		if (chunk_mem[2] <= 0) chunk_mem[1] = 3;
	}
	else if (chunk_mem[1] == 3) {
		if (global.eventFlags[EVENT_TUTORIALTEXT_ITEMS]) {
			chunk_mem[1] = 6;	
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\m08While exploring, you may find treasure, such as money and items,
laying on the dungeon floor or in chests.

Each item can only be picked up once, and will not appear in
subsequent visits to the same dungeon.<@
			"), noone);
			chunk_mem[1] = 4;
			global.eventFlags[EVENT_TUTORIALTEXT_ITEMS] = 1;
		}
	}
	else if (chunk_mem[1] == 4) {
		if (!instance_exists(global.gp0)) {
			chunk_mem[1] = 5;	
			chunk_mem[2] = 10;
		}
	}
	else if (chunk_mem[1] == 5) {
		chunk_mem[2] -= 1;
		if (chunk_mem[2] <= 0) chunk_mem[1] = 6;
	}
	else if (chunk_mem[1] == 6) return 1;
	return 0;	
}

function sereneForestLoreScript4() {
	if (global.eventFlags[EVENT_TUTORIALTEXT_SPEED]) return;
	if (chunk_mem[0] == 0) {
		ds_queue_enqueue(events, ["lock"]);
		ds_queue_enqueue(events, ["stop"]);
		ds_queue_enqueue(events, ["lore_msg", formatTextboxString(@"
{PARTNER}: Ehm, that corridor seems really long.
How about we try going just a little bit faster?<@
		"), [ASSET_PARTNER_PORTRAIT, 0]]);
		ds_queue_enqueue(events, ["wait_msg"]);
		ds_queue_enqueue(events, ["wait", 30]);
		ds_queue_enqueue(events, ["lore_msg", formatTextboxString(@"
\m08Hold the \c32Cancel Button\c30 \c39[" + chr(global.keybinds[1]) + @"]\c30 to speed up exploration.
Your character will automatically stop if action is required.<@
		"), noone]);
		ds_queue_enqueue(events, ["wait_msg"]);
		ds_queue_enqueue(events, ["wait", 30]);
		ds_queue_enqueue(events, ["go"]);
		ds_queue_enqueue(events, ["unlock"]);
		chunk_mem[0] = 1;
		global.eventFlags[EVENT_TUTORIALTEXT_SPEED] = 1;
	}
}

function sereneForestLoreScript5() {
	if (chunk_mem[1] == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Oh no, they have doubled up!
Looks like we're gonna need to do twice the fighting!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
		chunk_mem[1] = 1;
	}
	else if (chunk_mem[1] == 1) {
		if (!instance_exists(global.gp0)) {
			chunk_mem[0] = 5;
		}
	}
}

function sereneForestLoreScript6() {
	if (chunk_mem[1] == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Ah, it's treasure again... but now in a chest!
It's almost like in the movies!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
		chunk_mem[1] = 1;
	}
	else if (chunk_mem[1] == 1) {
		if (!instance_exists(global.gp0)) {
			chunk_mem[1] = 2;	
			chunk_mem[2] = 10;
		}
	}
	else if (chunk_mem[1] == 2) {
		chunk_mem[2] -= 1;
		if (chunk_mem[2] <= 0) chunk_mem[1] = 3;
	}
	else if (chunk_mem[1] == 3) {
		if (global.eventFlags[EVENT_TUTORIALTEXT_ITEMS]) {
			chunk_mem[1] = 6;	
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\m08While exploring, you may find treasure, such as money and items,
laying on the dungeon floor or in chests.

Each item can only be picked up once, and will not appear in
subsequent visits to the same dungeon.<@
			"), noone);
			chunk_mem[1] = 4;
			global.eventFlags[EVENT_TUTORIALTEXT_ITEMS] = 1;
		}
	}
	else if (chunk_mem[1] == 4) {
		if (!instance_exists(global.gp0)) {
			chunk_mem[1] = 5;	
			chunk_mem[2] = 10;
		}
	}
	else if (chunk_mem[1] == 5) {
		chunk_mem[2] -= 1;
		if (chunk_mem[2] <= 0) chunk_mem[1] = 6;
	}
	else if (chunk_mem[1] == 6) return 1;
	return 0;	
}

function sereneForestLoreScript7() {
	if (chunk_mem[0] == 0) {
		ds_queue_enqueue(events, ["lock"]);
		ds_queue_enqueue(events, ["stop"]);
		ds_queue_enqueue(events, ["lore_msg", formatTextboxString(@"
{PARTNER}: I see a bit of light.
I think we are reaching the end!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]]);
		ds_queue_enqueue(events, ["wait_msg"]);
		ds_queue_enqueue(events, ["wait", 30]);
		ds_queue_enqueue(events, ["go"]);
		ds_queue_enqueue(events, ["unlock"]);
		chunk_mem[0] = 1;
		
		global.overworldCurMap = "SereneEnd";
		global.overworldCurVariant = "Mission1";
		global.overworldSpawnX = (156-15)*2;
		global.overworldSpawnY = 220*2;
		global.overworldSpawnFacing = FACING_U;
		global.active = true;
	}
}

function dungeonSereneEndScript1(tick) {
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
		if (global.eventFlags[EVENT_SERENE_FOREST_FIRST_CLEAR]) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
This is the end of the dungeon.
It's impossible to go any further.<@
			"), noone);
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: We reached the end of the forest.
But it's all... empty?

\p03There's nothing here! How incredibly disappointing, I almost feel
like I got scammed!

\p02In any case, it was a good start, even if we didn't learn anything.
Let's go back to the lab and report on what we saw.<@
			"), [ASSET_PARTNER_PORTRAIT, 0]);
		}
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
	if (tick == 9) {
		global.gp0 = spawnIntermissionTextbox(formatTextboxString(@"
\c41GGGH\c30You have reached the end of \c51Serene Forest\c30.
\c41OOOR\c30Impressive!<@
		"));	
		global.gp0.depth = -9999999;
	}
	if (tick == 10) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 11) {
		return scriptingDelay(40);	
	}
	if (tick == 12) {
		global.battleStats[3][2] = true;
		if (!global.eventFlags[EVENT_SERENE_FOREST_FIRST_CLEAR]) {
			global.overworldCurMap = "Lab";
			global.overworldCurVariant = "Mission2";
			global.overworldSpawnX = 144*2;
			global.overworldSpawnY = 147*2;
			global.overworldSpawnFacing = FACING_U;
			global.eventFlags[EVENT_SERENE_FOREST_FIRST_CLEAR] = true;
		} else {
			global.overworldCurMap = global.overworldSourceMap;
			global.overworldCurVariant = global.overworldSourceVariant;
			global.overworldSpawnX = 1000*2;
			global.overworldSpawnY = 486*2;
			global.overworldSpawnFacing = FACING_L;
		}
		room_goto(LastOutingRoom);	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function sereneForestLoreScript8() {
	if (chunk_mem[1] == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: What do we have here?
Another pair to beat up! It's like they want to get wrecked!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
		chunk_mem[1] = 1;
	}
	else if (chunk_mem[1] == 1) {
		if (!instance_exists(global.gp0)) {
			chunk_mem[0] = 5;
		}
	}
}

function generalLoreScriptNop() {
	return 1;	
}