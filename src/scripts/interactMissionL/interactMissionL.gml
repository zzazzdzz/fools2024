// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function interactMissionL(){

}

function interactScriptExplainMissionL(tick) {
	if (tick == 0) {
		global.musicIndex = 6;
		global.musicControl = MUS_PLAY;
	}
	if (tick == 1) {
		return scriptingDelay(40);
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Good job on dealing with \c32Zapdos\c30. That should be
all three legendary birds brought back to their senses!

According to the data I've collected, it seems that the strange
behaviors among Pok%mon are slowly stopping.

I assume the \c37Glitch Lord\c30's influence is growing weaker too.
Your help was truly invaluable for achieving this.

In any case, here's the next mission I got for your group.<@\f00
		"), [Portrait0028, 0]);
	}
	if (tick == 3) {
		if (global.gp0.hang) {
			instance_destroy(global.gp0);
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Your ongoing task will be to investigate the behavior of\d08 
    TMZ4\d12 @    TMZ4
    TMZ4\d30 F q`F q`F q`F q`F q`F q`F@q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F
q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F
			"), [Portrait0028, 0]);
			global.musicControl = MUS_FADEOUT;
		} else return scriptingWaitForTextInGP0();	
	}
	if (tick == 6) {
		if (MusicController.state == 0) {
			sound_play(Sound33);
			return SCRIPT_CONTINUE_ADVANCETICK;
		} else return SCRIPT_CONTINUE_NOTICK;
	}
	if (tick == 7) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 8) {
		return scriptingDelay(40);	
	}
	if (tick == 9) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Huh? Same thing happened in the \c51Evolution
Chamber\c30... Are you alri-\f00
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 10) {
		if (global.gp0.hang) {
			instance_destroy(global.gp0);
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F
q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F q`F
			"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
		} else return scriptingWaitForTextInGP0();
	}
	if (tick == 11) {
		OverworldController.bgOffset = ((MusicController.frameCount div 8) % 2) * -250 + -200;
		with (OverworldObject) drawCol = choose(c_red, c_black);
		if (!instance_exists(global.gp0)) {
			return SCRIPT_CONTINUE_ADVANCETICK;	
		}
		return SCRIPT_CONTINUE_NOTICK;
	}
	if (tick == 12) {
		var t = instance_create(ScreenTransitionController, 0, 0);
		t.transition_type = TRANSITION_JUSTBLACK;
	}
	if (tick == 13) {
		return scriptingDelay(100);
	}
	if (tick == 14) {
		var outs = ["Dream", "Bepis", -222, -222, FACING_D];
		global.overworldCurMap = outs[0];
		global.overworldCurVariant = outs[1];
		global.overworldSpawnX = outs[2];
		global.overworldSpawnY = outs[3];
		global.overworldSpawnFacing = outs[4];
		room_goto(OverworldRoom);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function dreamSequence(tick) {
	if (tick == 0) {
		with (OverworldObject) animSpriteSetIndex = global.teamMembers[0].species;
		with (OverworldObject) event_user(1);
		with (OverworldObject) OverworldObject.animIndex = "Faint";
		if (global.teamMembers[0].species == "0001") {
			with (OverworldObject) animIsLooping = false;
		}
		if (global.teamMembers[0].species == "0004") {
			with (OverworldObject) animIsLooping = false;
		}
		if (global.teamMembers[0].species == "0007") {
			with (OverworldObject) animIsLooping = false;
		}
		with (OverworldObject) event_user(0);
	}
	if (tick == 1) {
		return scriptingDelay(70);
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Where...
Where am I...\d22 \c30

My vision is fading...\d22 \c30

Were we too late?
The world as I know it...\d15 it's disappearing.\d22 \c30

The world enveloped by corruption...
Has the Glitch Lord won?\d22 \c30

Is this adventure over?
Is everything lost?\d22 <@\c30
		"), noone); // [asset_get_index("Portrait" + global.teamMembers[0].species), 0]
		global.gp0.soundEnabled = false;
	}
	if (tick == 3) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 4) {
		return scriptingDelay(70);
	}
	if (tick == 5) {
		//instance_create(HeroCompanion, 0, 0);	
	}
	if (tick == 6) {
		return scriptingDelay(40);
	}
	if (tick == 7) {
		global.musicIndex = 24;
		global.musicControl = MUS_PLAY;
	}
	if (tick == 8) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Yes. It would appear you were slightly too late.
The \c37Glitch Lord\c30 has gained full control over the land.

Soon, this world will cease to exist. Everyone's friends, memories
their created, their lives... all overwritten with garbage.

This is the end of the line. Or at least, it would be, had I not
intervened and prevented the world's final collapse...\f00
		"), noone);
	}
	if (tick == 9) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 10) {
		global.gp0 = spawnChoiceTextbox("You saved me?#Who are you?");	
	}
	if (tick == 11) {
		return scriptingWaitForLastResult();
	}
	if (tick == 12) {
		scriptingCloseAllText();
		if (global.lastResult == 0) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Yes. In some sense, I saved you. More exactly, I have prevented
the data of your avatar from being overwritten due to a \c32crash\c30.

I am responsible for maintaining the Fight Simulation Program,
the Glitch Research Institute's digital interface to Glitchtopia.

The goal of the project was to let people of your world interact
with inhabitants of Glitchtopia through an emulation layer.

And while I can't directly make changes to the world, I can still
facilitate them by many different means.

Most notably, I was able to use \c32arbitrary code execution\c30 and
\c32OAM DMA hijacking\c30, to save this world from ending.\f00
			"), noone);
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
I'm responsible for maintaining the Fight Simulation Program, the
Glitch Research Institute's digital interface to Glitchtopia.

The goal of the project was to let people of your world interact
with inhabitants of Glitchtopia through an emulation layer.

And while I'm not permitted to make direct changes to the world,
I can still facilitate change by many different means.

More exactly, I have prevented the data of your avatar from
being overwritten due to a \c32crash\c30.

This was done by utilizing \c32arbitrary code execution\c30 and
\c32OAM DMA hijacking\c30, to save this world from ending.\f00
			"), noone);
		}
	}
	if (tick == 13) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 14) {
		global.gp0 = spawnChoiceTextbox("Code execution?#Digital interface?");	
	}
	if (tick == 15) {
		return scriptingWaitForLastResult();
	}
	if (tick == 16) {
		scriptingCloseAllText();
		if (global.lastResult == 0) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Indeed. In this digital world, the rules of all existence are fully
governed by code.

It is solely why the Glitch Lord is such a formidable force.
It's an imperfection of the code itself, made manifest.

Though, by following specific actions, this code can be changed.
And by manipulating the code, total control is attained.

This process, commonly named \c32arbitrary code execution\c30, is
the key to proceeding forward from our current state.<@
			"), noone);
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Yes. The interface - that is, the program running of your machine,
is a contrived method for both you and me to interact with Glitchtopia...

It is a digital interface, and thus, rules of all existence are fully
governed by this universe's \c32code\c30.

It is solely why the Glitch Lord is such a formidable force.
It's an imperfection of the code itself, made manifest.

Though, by following specific actions, this code can be changed.
And by manipulating the code, total control is attained.

This process, commonly named \c32arbitrary code execution\c30, is
the key to proceeding forward from our current state.<@
			"), noone);
		}
	}
	if (tick == 17) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 18) {
		return scriptingDelay(40);
	}
	if (tick == 19) {
		
	}
	if (tick == 20) {
		scriptingCloseAllText();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Thanks to your efforts, both recent ones and the past ones
from previous years, the Glitch Lord's power is weakened.

Though it would be reckless to engage in a fight immediately.
You will certainly need assistance.

Therefore, I have prepared a certain piece of code that will
grant you immense strength when triggered.

Should you manage to trigger it by using the \c31Coin Case\c30, it will
allow you and your friends to confront the Glitch Lord.

An appropriate place to trigger my payload should be right at
the end of \c51Unending Abyss\c30.

Yes.
Go to \c51Unending Abyss\c30...\d33 \c30

You will be transported there promptly.
I wish you best of luck...<@
		"));
	}
	if (tick == 21) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 22) {
		return scriptingDelay(80);
	}
	if (tick == 23) {
		var o = instance_create(ScreenTransitionController, 0, 0);
		o.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
	}
	if (tick == 24) {
		return scriptingDelay(80);
	}
	if (tick == 25) {
		sound_play(SFXGeneral12);
	}
	if (tick == 26) {
		return scriptingDelay(60);
	}
	if (tick == 27) {
		var outs = ["AbyssPre", "Bepis", 148*2, 116*2, FACING_D];
		global.overworldCurMap = outs[0];
		global.overworldCurVariant = outs[1];
		global.overworldSpawnX = outs[2];
		global.overworldSpawnY = outs[3];
		global.overworldSpawnFacing = outs[4];
		room_goto(OverworldRoom);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function dreamSequence2(tick) {
	if (tick == 1) {
		return scriptingDelay(70);
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Where are we?

This place... it looks horrible.
It looks like... a \c51Glitch Dimension\c30?<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	if (tick == 3) {
		return scriptingWaitForTextInGP0();
	}
	if (tick == 4) {
		return scriptingDelay(90);
	}
	if (tick == 5) {
		global.musicIndex = 25;
		global.musicControl = MUS_PLAY;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: That's no good.
Looks like the \c37Glitch Lord\c30 is gaining more and more power.

There is a path in front of us.
I assume it will lead us to his magnificence.

There is no other path to follow, so again, it's not like we have
much of a choice other than go forward.

Do all the necessary preparations, {TEAM0}.
We will follow you as usual.<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
	}
	if (tick == 6) {
		global.curStoryHint = 10;
		global.eventFlags[EVENT_ABYSSPRE_INTRO] = 1;
		global.active = true;
		return SCRIPT_STOP;	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function abyssPre_GoOn(tick) {
	if (tick == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Do you wish to go on?\f00
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
	}
	if (tick == 10) {
		return scriptingDelay(80);	
	}
	if (tick == 11) {
		global.emulatedInput = 0;
		
		scriptingHealAll();
		var dungeonId = 11;
		global.curDungeonId = dungeonId;
		global.battleCurrentDutyName = global.dungeonDb[dungeonId][0];
		global.battleStats = [[0,0,0],[0,0,0],[0,0,0],[0,0,false]];
		global.battleLastBlow = "due to an unseen force";
		global.battleLastTarget = "@6Bepis@0";
		global.battleCurrentAttackerIndex = -1;
		global.dungeonData = variable_clone(global.dungeonDb[dungeonId][2]);
		global.overworldSourceMap = global.overworldCurMap;
		global.overworldSourceVariant = global.overworldCurVariant;
		global.dungeonDiscoveredTiles = global.dungeonDiscoveryProgress[global.curDungeonId];
		global.dungeonCurrentDiscoveredTiles = [];
		
		room_goto(DungeonRoom);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;	
}

function dreamSequence3(tick) {
	if (tick == 0) {
		audio_stop_all();
		global.musicIndex = 15;
		global.musicControl = MUS_PLAY;
	}
	else if (tick == 1) {
		return scriptingDelay(60);	
	}
	else if (tick == 2) {
		if (global.eventFlags[EVENT_ABYSSPRE_FAILEDFIGHT]) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Ouch...
Apparently, the Glitch Lord is very strong.

This fight might be more difficult for us than I imagined...<@
			"), [ASSET_PARTNER_PORTRAIT, 4]);
		} else {
			array_push(global.unlockedDungeonLists[0], 11);
			array_push(global.roamingShopData, [8, 800]);
			array_push(global.roamingShopData, [11, 1500]);
			global.roamingShopData[0] = [5, 800];
			global.roamingShopData[3] = [12, 2000];
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Ufff...
Looks like we made it to another safe room.<@
			"), [ASSET_PARTNER_PORTRAIT, 0]);
		}
	}
	else if (tick == 3) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 4) {
		return scriptingDelay(60);	
	}
	else if (tick == 5) {
		if (global.eventFlags[EVENT_ABYSSPRE_COINCASEUSED]) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: We should rest and prepare as usual.
We'll be waiting for you, {TEAM0}.<@
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: We should rest and prepare as usual.
We'll be waiting for you, {TEAM0}.\f00
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		}
	}
	else if (tick == 6) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 7) {
		if (global.eventFlags[EVENT_ABYSSPRE_COINCASEUSED]) {
			return 103-tick;
		}
		global.gp0 = spawnChoiceTextbox("Let's use the @1Coin Case@0 here.#Let's prepare.");	
	}
	else if (tick == 8) {
		return scriptingWaitForLastResult();
	}
	if (tick == 9) {
		scriptingCloseAllText();
		if (global.lastResult == 0) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Huh? Use the \c31Coin Case\c30...
But we're already in a \c51Glitch Dimension\c30.

It seems like doing that would be completely pointless...\f00
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		} else {
			return 100-tick;
		}
	}
	else if (tick == 10) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 11) {
		global.gp0 = spawnChoiceTextbox("It wouldn't hurt to try.#You're right. It's a stupid idea.");	
	}
	else if (tick == 12) {
		return scriptingWaitForLastResult();
	}
	else if (tick == 13) {
		scriptingCloseAllText();
		if (global.lastResult == 0) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: I see. To be completely honest...
You're not wrong. This world is full of unexplained behaviors.

And it's all but certain that our current strength does not
suffice to take on the Glitch Lord...

Needless to say, we're out of options, and we need to try
everything we can hold our hopes on.<@
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		} else {
			return 100-tick;
		}
	}
	else if (tick == 14) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 15) {
		return scriptingDelay(30);
	}
	else if (tick == 16) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Sooo, translating that from fancy philosophical
talk... we should try using the \c31Coin Case\c30 right now?

I think that's my job, so let's see what I can do.\d22
There are 100 coins inside.\d45 Which move?
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 17) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 18) {
		audio_stop_all();	
		sound_play(SoundGlitch1);
	}
	else if (tick == 19) {
		spawnToastTextbox("All opponents were defeated!");
	}
	else if (tick == 20) {
		return scriptingDelay(180);
	}
	else if (tick == 21) {
		scriptingCloseAllText();
		global.gp0 = spawnStandardTextbox("\\c33" + global.teamMembers[0].name + "\\c30 and friends gained 9999999 Exp. Points each.< ");
	}
	else if (tick == 22) {
		global.gp1 = 0;
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 23) {
		return scriptingDelay(10);
	}
	else if (tick == 24) {
		var starting_lv = global.teamMembers[global.gp1].lv;
		// undo stance first
		var stinfo = global.stanceDb[global.teamMembers[global.gp1].stance];
		if (stinfo[1] != 0) global.teamMembers[global.gp1].att -= global.teamMembers[global.gp1].lv div stinfo[1];
		if (stinfo[2] != 0) global.teamMembers[global.gp1].def -= global.teamMembers[global.gp1].lv div stinfo[2];
		if (stinfo[3] != 0) global.teamMembers[global.gp1].sp_att -= global.teamMembers[global.gp1].lv div stinfo[3];
		if (stinfo[4] != 0) global.teamMembers[global.gp1].sp_def -= global.teamMembers[global.gp1].lv div stinfo[4];
		if (stinfo[5] != 0) global.teamMembers[global.gp1].maxHP -= global.teamMembers[global.gp1].lv div stinfo[5];
		if (stinfo[6] != 0) global.teamMembers[global.gp1].maxPP -= global.teamMembers[global.gp1].lv div stinfo[6];
		// apply stat changes
		var lv_gain = levelUpAddExp(global.teamMembers[global.gp1], 9999999);
		var stat_gain = levelUpAddStats(global.teamMembers[global.gp1], starting_lv, lv_gain);
		// reapply stance
		stinfo = global.stanceDb[global.teamMembers[global.gp1].stance];
		if (stinfo[1] != 0) global.teamMembers[global.gp1].att += global.teamMembers[global.gp1].lv div stinfo[1];
		if (stinfo[2] != 0) global.teamMembers[global.gp1].def += global.teamMembers[global.gp1].lv div stinfo[2];
		if (stinfo[3] != 0) global.teamMembers[global.gp1].sp_att += global.teamMembers[global.gp1].lv div stinfo[3];
		if (stinfo[4] != 0) global.teamMembers[global.gp1].sp_def += global.teamMembers[global.gp1].lv div stinfo[4];
		if (stinfo[5] != 0) global.teamMembers[global.gp1].maxHP += global.teamMembers[global.gp1].lv div stinfo[5];
		if (stinfo[6] != 0) global.teamMembers[global.gp1].maxPP += global.teamMembers[global.gp1].lv div stinfo[6];
		// show stat changes
		var stat_increases = "Attack went up by " + string(stat_gain[0]) +"!\n";
		stat_increases += "Defense went up by " + string(stat_gain[1]) + "!<@";
		stat_increases += "Special Attack went up by " + string(stat_gain[2]) +"!\n";
		stat_increases += "Special Defense went up by " + string(stat_gain[3]) + "!<@";
		stat_increases += "Maximum HP went up by " + string(stat_gain[4]) +"!\n";
		stat_increases += "Maximum PP went up by " + string(stat_gain[5]) + "!<@";
		
		var decorator = "6";
		if (global.gp1 == 0) decorator = "3";
		
		if (lv_gain > 0) {
			global.musicIndex = 2;
			global.musicControl = MUS_PLAY;	
			global.gp0 = spawnStandardTextbox("\\c3" + decorator + global.teamMembers[global.gp1].name + "\\c30's level is now " + string(global.teamMembers[global.gp1].lv) + "!<@" + stat_increases);	
		}
	}
	else if (tick == 25) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 26) {
		global.gp1 += 1;
		if (global.gp1 > 2) return SCRIPT_CONTINUE_ADVANCETICK;
		else return -3;
	}
	else if (tick == 27) {
		global.musicControl = MUS_FADEOUT;	
	}
	else if (tick == 28) {
		return scriptingDelay(90);
	}
	else if (tick == 29) {
		audio_stop_all();
		global.musicIndex = 15;
		global.musicControl = MUS_PLAY;
		global.eventFlags[EVENT_ABYSSPRE_COINCASEUSED] = 1;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Wow, that was insane!
How in the world did that happen?<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 30) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Intriguing... so \c31Coin Case\c30 effects...
They are not just limited to causing \c51Glitch Dimensions\c30.

But this makes me curious - I assume your decision to use the
\c31Coin Case\c30 here was not accidental.

How did you know this was going to happen in the first place?\f00
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
	}		
	else if (tick == 31) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 32) {
		global.gp0 = spawnChoiceTextbox("I had a vision.#I just had a hunch.");	
	}
	else if (tick == 33) {
		return scriptingWaitForLastResult();
	}
	else if (tick == 34) {
		scriptingCloseAllText();
		if (global.lastResult == 0) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Hmm, a vision?
The rules governing this world are unexplainable sometimes.

It might be related to how we were transported to this weird
dimension, without a warning.

I suspect some external force is acting upon us and making
changes to the world as we speak...

In any case, this is going to be of tremendous help.
With all that extra strength, we should defeat the Glitch Lord.

Prepare yourself, as usual...
And then, let's head for the final showdown.<@
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Ah, I can see it. Having ran out
of options, it is common to resort to making guesses.

In any case, this is going to be of tremendous help.
With all that extra strength, we should defeat the Glitch Lord.

Prepare yourself, as usual...
And then, let's head for the final showdown.<@
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		}
	}
	else if (tick == 35) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 36) {
		global.eventFlags[EVENT_ABYSSPRE_INTRO2] = 1;
		global.eventFlags[EVENT_ABYSSPRE_FAILEDFIGHT] = 1;
		global.active = true;
		return SCRIPT_STOP;
	}
	
	else if (tick == 100) {
		scriptingCloseAllText();
		return scriptingDelay(15);
	}
	else if (tick == 101) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Very well. Let's prepare.
Then, we finish the \c37Glitch Lord\c30, once and for all.<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
	}
	else if (tick == 102) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 103) {
		global.eventFlags[EVENT_ABYSSPRE_INTRO2] = 1;
		global.eventFlags[EVENT_ABYSSPRE_FAILEDFIGHT] = 1;
		global.active = true;
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function glitchKecleonInteract(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c47x\c323 \c47x\c323 \c47x\c323 \c47x\c323 \c47x\c323 \c47x\c323 \c47x\c30: Hello!
Welcome to the \c47x\c32h \c47x\c32h \c47x\c32h \c47x\c32h \c47x\c32h \c47x\c32h \c47x\c32\f00
		"), [Portrait0352, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		spawnChoiceTextbox("Take a look.#Leave.");	
	}
	if (tick == 3) {
		return scriptingWaitForLastResult();	
	}
	if (tick == 4) {
		scriptingCloseAllText();
		if (global.lastResult != 0) return SCRIPT_STOP;
	}
	if (tick == 5) {
		return scriptingDelay(10);
	}
	if (tick == 6) {
		transitionObj = instance_create(ScreenTransitionController, 0, 0);
		transitionObj.transition_type = TRANSITION_FADETOBLACK;
		global.musicControl = MUS_FADEOUT;
	}
	if (tick == 7) {
		return scriptingDelay(40);	
	}
	if (tick == 8) {
		room_goto(ShopRoom);	
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function abyssPost_GoOn(tick) {
	if (tick == 0) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Do you wish to go on?\f00
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
		var xx = ["AbyssBossRoom", "Bepis", 160*2, 490*2, FACING_U];
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

function abyss_BeforeBoss(tick) {
	if (tick == 0) {
		global.eventFlags[EVENT_ABYSSPRE_INTRO2] = 0;
		global.musicIndex = 26;
		global.musicControl = MUS_PLAY;	
		with (OverworldObject) {
			animIndex = "Walk";
			event_user(0);
		}
	}
	else if (tick == 1) {
		global.emulatedInput = vk_up;
		with(OverworldObject) y = OverworldHero.y + 60;
		return scriptingDelay(245);
	}
	else if (tick == 2) {
		global.emulatedInput = 0;
		with (OverworldObject) {
			animIndex = "Idle";
			event_user(0);
		}
	}
	else if (tick == 3) {
		return scriptingDelay(60);	
	}
	else if (tick == 4) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c37Glitch Lord\c30: Welcome... to die.
I was expecting your arrival.

You really did your best to try and stop me.
It's sad to see that your actions were in vain.

This entire world will soon be devoured by an endless stream of
corrupted data. And you will be my first subjects.

Are you ready to meet your end?
Brace yourself!<@
		"), noone);
	}
	else if (tick == 5) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 6) {
		return scriptingDelay(30);	
	}
	else if (tick == 7) {
		global.musicControl = MUS_FADEOUT;
	}
	else if (tick == 8) {
		return scriptingDelay(25);	
	}
	else if (tick == 9) {
		global.gp0 = instance_create(ScreenTransitionController, 0, 0);
		global.gp0.transition_type = TRANSITION_SQUARES_IN;
	}
	else if (tick == 10) {
		return scriptingDelay(90);	
	}
	else if (tick == 11) {
		scriptingHealAll();
		
		var dungeonId = 12;
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
		
		var opponentData = global.dungeonData[2][0];
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

function abyss_AfterBoss(tick) {
	if (tick == 0) {
		return scriptingDelay(120);	
	}
	else if (tick == 1) {
		if (global.teamMembers[0].stance == STANCE_OFF && global.teamMembers[1].stance == STANCE_OFF && global.teamMembers[2].stance == STANCE_OFF) {
			global.eventFlags[EVENT_ACHIEVEMENT_OFFONLY] = 1;
		}
		if (global.teamMembers[0].stance == STANCE_DEF && global.teamMembers[1].stance == STANCE_DEF && global.teamMembers[2].stance == STANCE_DEF) {
			global.eventFlags[EVENT_ACHIEVEMENT_DEFONLY] = 1;
		}
		if (global.teamMembers[0].stance == STANCE_SUPP && global.teamMembers[1].stance == STANCE_SUPP && global.teamMembers[2].stance == STANCE_SUPP) {
			global.eventFlags[EVENT_ACHIEVEMENT_SUPONLY] = 1;
		}		
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Looks like, against all odds...
We have managed to win this battle.<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
	}
	else if (tick == 2) {
		return scriptingWaitForTextInGP0();
	}
	else if (tick == 3) {
		return scriptingDelay(70);	
	}
	else if (tick == 4) {
		instance_create(BattlePartOverworldFade, 0, 0);
	}
	else if (tick == 5) {
		return scriptingDelay(100);	
	}
	else if (tick == 6) {
		global.musicIndex = 24;
		global.musicControl = MUS_PLAY;
	}
	else if (tick == 7) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Yes. By using our joined powers, it appears we have put the
reign of the Glitch Lord to its final end.<@
		"), noone);
	}
	else if (tick == 8) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 9) {
		return scriptingDelay(60);	
	}
	else if (tick == 10) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Hmm, please excuse my lack of tact...
But remind me, who are you anyway?<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 11) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 12) {
		return scriptingDelay(60);	
	}
	else if (tick == 13) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
I am responsible for maintaining the Fight Simulation Program,
the Glitch Research Institute's digital interface to Glitchtopia.

I assisted you throughout your journey to defeat the Glitch Lord,
by utilizing a technique called \c32arbitrary code execution\c30.

Through my assistance, and your great courage, we have
fully succeeded in banishing the Glitch Lord.<@
		"), noone);
	}
	else if (tick == 14) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 15) {
		return scriptingDelay(60);	
	}
	else if (tick == 16) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: It seems my assumptions were correct.
There was an external influence upon this world...

But with your boundless, infinite power, granted to you with
arbitrary code execution...

Why did you not take on the Glitch Lord yourself?
With total control, shouldn't that be an easy task?<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
	}
	else if (tick == 17) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 18) {
		return scriptingDelay(60);	
	}
	else if (tick == 19) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
It is not that easy. Although this world is digital, the Glitch Lord
is a fully sentient being, like we all are.

My powers are limited to manipulation of the code...
To truly defeat someone, is to make them experience defeat.

To force them to reflect about their actions, understand their
wrongdoing... and finally, admit defeat.

With how easy digital data is to replicate, it is not sufficient to
just erase one instance of their being from existence.

Rather, you need to make them give up.
And your actions, your mission... were successful.<@
		"), noone);
	}
	else if (tick == 20) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 21) {
		return scriptingDelay(60);	
	}
	else if (tick == 22) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: What will happen to the \c37Glitch Lord\c30 now?
Or us? As far as I can tell, we're still trapped here...<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	else if (tick == 23) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 24) {
		return scriptingDelay(60);	
	}
	else if (tick == 25) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
All sentient life, in any form, is precious. Be it a Pok%mon,
a glitch, or a human - they deserve to live their life.

The Glitch Lord dreamed of a world where glitches could
dominate... but this wish cannot be made true either.

But, we can create a different world... put his data in a different
universe, where domination of glitches isn't an issue.

Say, this " + "\"Pok%mon Red\"" + @" game...
It would be a perfect candidate...

As for your fate, getting you out of here is trivial, if you have
\c32arbitrary code execution\c30 at your disposal.

Farewell...<@
		"), noone);
	}
	else if (tick == 26) {
		return scriptingWaitForTextInGP0();	
	}
	else if (tick == 27) {
		return scriptingDelay(40);	
	}
	else if (tick == 28) {
		global.musicControl = MUS_FADEOUT;
	}
	else if (tick == 29) {
		return scriptingDelay(90);	
	}
	else if (tick == 30) {
		with (BattlePartOverworldFade) instance_destroy();
		OverworldController.bgAsset = EnvHouseBG;
		audio_play_sound(SFXGeneral12, 1, 0);
	}
	else if (tick == 31) {
		return scriptingDelay(90);	
	}
	else if (tick == 32) {
		var oo = instance_create(ScreenTransitionController, 0, 0);
		oo.transition_type = TRANSITION_JUSTBLACK;
		audio_play_sound(SFXGeneral12, 1, 0);
	}
	else if (tick == 33) {
		return scriptingDelay(180);	
	}
	else if (tick == 34) {
		room_goto(CreditsRoom);	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}