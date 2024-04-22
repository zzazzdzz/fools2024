
function interactMission4(){}

function interactScriptExplainMission4(){
	if (tick == 0) {
		if (global.musicIndex != 6) {
			global.musicIndex = 6;
			global.musicControl = MUS_PLAY;
		}
		return scriptingDelay(40);	
	}
	if (tick == 1) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Ah, so the \c31Coin Case\c30 did not work, huh?
Yeah, we've run into similar problems some time ago.

Like I said before, a lot is still unknown about this artifact.
Sometimes it's just not willing to cooperate.

But it's all good. I called upon a very talented glitch specialist
to try and help us solve this mystery.<@
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
{PARTNER}: Wow, a talented glitch specialist?
Must be a very strong Pok%mon! I cannot wait to meet them!<@
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0xb]);
	}
	if (tick == 5) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 6) {
		return scriptingDelay(30);	
	}
	if (tick == 7) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: I appreciate your excitement.
Actually, they should be coming here any time now!<@
		"), [Portrait0028, 0]);
	}
	if (tick == 8) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 9) {
		return scriptingDelay(60);	
	}
	if (tick == 10) {
		array_push(global.teamMembers, createTeamMember(global.partnerSpeciesSecondary));
		global.partnerNameSecondary = global.speciesNames[$("m"+global.partnerSpeciesSecondary)];
		global.teamMembers[2].name = global.partnerNameSecondary;
		
		global.gp1 = 2;
		global.gp0 = 5000;
		
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
		var lv_gain = levelUpAddExp(global.teamMembers[global.gp1], global.gp0);
		var stat_gain = levelUpAddStats(global.teamMembers[global.gp1], starting_lv, lv_gain);
		// reapply stance
		stinfo = global.stanceDb[global.teamMembers[global.gp1].stance];
		if (stinfo[1] != 0) global.teamMembers[global.gp1].att += global.teamMembers[global.gp1].lv div stinfo[1];
		if (stinfo[2] != 0) global.teamMembers[global.gp1].def += global.teamMembers[global.gp1].lv div stinfo[2];
		if (stinfo[3] != 0) global.teamMembers[global.gp1].sp_att += global.teamMembers[global.gp1].lv div stinfo[3];
		if (stinfo[4] != 0) global.teamMembers[global.gp1].sp_def += global.teamMembers[global.gp1].lv div stinfo[4];
		if (stinfo[5] != 0) global.teamMembers[global.gp1].maxHP += global.teamMembers[global.gp1].lv div stinfo[5];
		if (stinfo[6] != 0) global.teamMembers[global.gp1].maxPP += global.teamMembers[global.gp1].lv div stinfo[6];
	}
	if (tick == 11) {
		with (scriptingSelectObj(global.partnerSpeciesSecondary)) {
			x = 159*2; y = 190*2;
		}
		sound_play(SFXGeneral12);
	}
	if (tick == 12) {
		return scriptingDelay(25);
	}
	if (tick == 13) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpeciesSecondary), 159*2, 177*2, 25);
	}
	if (tick == 14) {
		return scriptingDelay(25);
	}
	if (tick == 15) {
		OverworldHero.facing = FACING_D;
		scriptingSelectObj(global.partnerSpecies).facing = FACING_D;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: I am here.
What matters were you discussing just now?<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
	}
	if (tick == 16) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 17) {
		return scriptingDelay(60);
	}
	if (tick == 18) {
		OverworldHero.facing = FACING_U;
		scriptingSelectObj(global.partnerSpecies).facing = FACING_U;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: To be fair, for the amount of hype,
I did expect to see someone... far more intimidating.<@
		"), [ASSET_PARTNER_PORTRAIT, 0x4]);
	}
	if (tick == 19) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 20) {
		return scriptingDelay(25);
	}
	if (tick == 21) {
		OverworldHero.facing = FACING_D;
		scriptingSelectObj(global.partnerSpecies).facing = FACING_D;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Hey. That's pretty rude, considering I have some
information which might concern you.

In the past, I have done extensive analysis on \c51Glitch Dimensions\c30.
Apparently, to trigger them, certain conditions have to be met.<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
	}
	if (tick == 22) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 24) {
		return scriptingDelay(25);
	}
	if (tick == 25) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Conditions?
So, we need to do something special?<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	if (tick == 26) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 27) {
		return scriptingDelay(25);
	}
	if (tick == 28) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: Indeed. It appears that \c51Glitch Dimensions\c30 are
generated mostly upon hearing certain Pok%mon cries.<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
	}
	if (tick == 29) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 30) {
		return scriptingDelay(25);
	}
	if (tick == 31) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: So...
Pok%mon cries determine the behavior of \c51Glitch Dimensions\c30?

That has to be a joke...
There is no way these things are related in any way!\f00
		"), [ASSET_PARTNER_PORTRAIT, 2]);
	}
	if (tick == 32) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 33) {
		global.gp0 = spawnChoiceTextbox("We should still try it.#Yeah, it sounds stupid!");
		global.gp0.quitStatusAllowed = false;
	}
	if (tick == 34) {
		return scriptingWaitForLastResult();	
	}
	if (tick == 35) {
		scriptingCloseAllText();
		return scriptingDelay(25);	
	}
	if (tick == 36) {
		if (global.lastResult == 0) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: I am glad you understand the situation.
This lead is very weak, but it's the best we got.

Through my analysis, I have determined that we will get the
best chance of success by encountering a \c32Machop\c30.

I have heard reports of them residing in \c51Mystic Highlands\c30.
However, the Pokemon in this area are fairly powerful.

Together with \c32Sandslash\c30, we have decided that it would be best
if I joined you on your adventure.

I will be waiting for you at the northern exit from the town.
Make necessary preparations, then meet me outside.<@
			"), [ASSET_PARTNER2_PORTRAIT, 0]);
		} else {
			return 80;
		}
	}
	if (tick == 37) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 38) {
		return scriptingDelay(25);	
	}
	if (tick == 39) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpeciesSecondary), 159*2, 190*2, 25);
	}
	if (tick == 40) {
		return scriptingDelay(25);	
	}
	if (tick == 41) {
		sound_play(SFXGeneral12);
		with (scriptingSelectObj(global.partnerSpeciesSecondary)) {
			x = -1000; y = -1000;
		}	
	}
	if (tick == 42) {
		return scriptingDelay(35);	
	}
	if (tick == 43) {
		if (global.teamMembers[2].species == "0001") global.teamMembers[2].name = "Bulbasaur";
		if (global.teamMembers[2].species == "0004") global.teamMembers[2].name = "Charmander";
		if (global.teamMembers[2].species == "0007") global.teamMembers[2].name = "Squirtle";
		OverworldHero.facing = FACING_R;
		scriptingSelectObj(global.partnerSpecies).facing = FACING_L;
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Well then.
Now we're off to an adventure to hunt down a \c32Machop\c30.

\p0aSounds very exciting, am I right?
{PARTNER2} should be waiting for us at the northern gate.

\p00Since a new member will be joining our team, remember to assign
correct roles at a \c32tactics meeting\c30.

\p01We can give our new member a cool nickname along the way,
so they fit better within our team!

\p00I'm at the house if need be.
See you in \c51Mystic Highlands\c30!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	if (tick == 44) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 45) {
		return scriptingDelay(20);	
	}
	if (tick == 46) {
		OverworldHero.facing = FACING_D;
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 174*2, 190*2, 25);
	}
	if (tick == 47) {
		return scriptingDelay(25);	
	}
	if (tick == 48) {
		sound_play(SFXGeneral12);
		with (scriptingSelectObj(global.partnerSpecies)) {
			x = -1000; y = -1000;
		}	
	}
	if (tick == 49) {
		return scriptingDelay(30);	
	}
	if (tick == 50) {
		array_push(global.unlockedDungeonLists[1], 4);
		global.eventFlags[EVENT_LAB_EXPLAINED_MISSION4] = 1;
		global.curStoryHint = 4;
		global.active = true;
		return SCRIPT_STOP;
	}
	
	if (tick == 131) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER2}: I can see your doubts. However, you should ask
yourself - what other options do you have exactly?<@
		"), [ASSET_PARTNER2_PORTRAIT, 4]);
	}
	if (tick == 132) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 133) {
		return scriptingDelay(25);	
	}
	if (tick == 134) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
{PARTNER}: Well, he's not completely wrong.
It's not like we have any better leads.

And if \c32Sandslash\c30 agreed with the findings, then we hardly
have an option - even if it seems irrational at first.<@
		"), [ASSET_PARTNER_PORTRAIT, 4]);
	}
	if (tick == 135) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 136) {
		return scriptingDelay(25);	
	}
	if (tick == 137) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p01{PARTNER2}: Great!
Maybe we're in agreement after all!

\p00Through my analysis, I have determined that we will get the
best chance of success by encountering a \c32Machop\c30.

I have heard reports of them residing in \c51Mystic Highlands\c30.
However, the Pokemon in this area are fairly powerful.

Together with \c32Sandslash\c30, we have decided that it would be best
if I joined you on your adventure.

I will be waiting for you at the northern exit from the town.
Make necessary preparations, then meet me outside.<@
		"), [ASSET_PARTNER2_PORTRAIT, 0]);
		return -(137-37);
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labSandslashMission4Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: You should head to \c51Mystic Highlands\c30.
Hopefully you can encounter a \c32Machop\c30 there.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;	
}

function labSandslashMission4LoopInteract(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: You should head to \c51Mystic Highlands\c30.
Hopefully you can encounter a \c32Machop\c30 there.<@
		"), [Portrait0028, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;	
}

function interactScriptExplainMission4Loop(tick) {
	if (tick == 0) {
		global.musicIndex = 6;
		global.musicControl = MUS_PLAY;
	}
	if (tick == 1) {
		return scriptingDelay(40);
	}
	if (tick == 2) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: You didn't find a \c32Machop\c30?
I'm sure there were at least some in that area.<@
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
{PARTNER}: Apparently, it looks like we're gonna need
to retry our \c32Machop\c30 expedition...

That locked chamber at the end looked very suspicious too.
Maybe we should investigate it?

I saw \c32Kecleon\c30 was selling some \c31Keys\c30 which would probably
let us unlock it. Probably worth to drop some money on them.

We'll meet with {PARTNER2} again at the northern exit.
See you there!<@
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 6) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 7) {
		return scriptingDelay(20);	
	}
	if (tick == 8) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 174*2, 190*2, 25);
	}
	if (tick == 9) {
		return scriptingDelay(25);	
	}
	if (tick == 10) {
		sound_play(SFXGeneral12);
		with (scriptingSelectObj(global.partnerSpecies)) {
			x = -1000; y = -1000;
		}	
	}
	if (tick == 11) {
		return scriptingDelay(30);	
	}
	if (tick == 12) {
		global.eventFlags[EVENT_LAB_EXPLAINED_MISSION4LOOP] = 1;
		global.active = true;
		return SCRIPT_STOP;	
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}