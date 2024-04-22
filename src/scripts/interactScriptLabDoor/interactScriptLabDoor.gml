#macro NAME_MAX_WIDTH 135
		
function interactScriptLabDoor(tick){
	global.active = false;
	if (tick == 0) {
		OverworldController.depth = -10000;
		MapPartLabSlidingDoor.depth = -9999;
		with (OverworldObject) depthOffset = -10099;
		depth = -100;	
	}
	if (tick == 60) {
		audio_play_sound(SoundOpening, 1, 1);	
	}
	if (tick < 135 && tick > 60 && (tick % 5 == 0)) {
		MapPartLabSlidingDoor.openness += 3;
	}
	if (tick == 135) {
		audio_stop_all();
	}
	if (tick == 160) {
		OverworldController.depth = -2;
		MapPartLabSlidingDoor.depth = -1;
		with (OverworldObject) depthOffset = -2000;
		global.emulatedInput = vk_down;
	}
	if (tick == 187) {
		global.emulatedInput = vk_right;
	}
	if (tick == 210) {
		global.emulatedInput = 0;
	}
	if (tick == 230) {
		audio_play_sound(SoundOpening, 1, 1);	
	}
	if (tick > 230 && tick < 325 && (tick % 5 == 0)) {
		MapPartLabSlidingDoor.openness -= 3;
		if (MapPartLabSlidingDoor.openness < 0) MapPartLabSlidingDoor.openness = 0;
	}
	if (tick == 315) {
		audio_stop_all();
	}
	if (tick == 350) {
		global.musicIndex = 6;
		global.musicControl = MUS_PLAY;
		OverworldHero.facing = FACING_R;
		with (OverworldObject) if (animSpriteSetIndex == "0028") facing = FACING_L;
		scriptingCreateNullSpriteAt(196,50);
		scriptingCreateNullSpriteAt(215,50);
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Congratulations!
You passed the fight simulation test with flying colors!

\p00I had my doubts when I first saw you, but you certainly proved
your worth in this battle, I can assure you.

\p01From now on, you are considered an official participant
of the Glitch Research Laboratory field exploration program.

\p00The only thing left is the paperwork.
Just sign your name here real quick...<@
		"), [Portrait0028, 10]);
	}
	if (tick == 351) {
		if (instance_exists(global.gp0)) return SCRIPT_CONTINUE_NOTICK;
		return SCRIPT_CONTINUE_ADVANCETICK;
	}
	if (tick == 380) {
		global.gp0 = spawnNamingTextbox("Sign your name!", 10);
	}
	if (tick == 381) {
		if (instance_exists(global.gp0)) return SCRIPT_CONTINUE_NOTICK;
		if (global.namingResult == "") global.namingResult = "Alice";
		
		draw_set_font(TextboxFont);
		global.gp3 = string_width(global.namingResult);
		
		if (global.gp3 > NAME_MAX_WIDTH) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
That name seems awfully long. It doesn't fit in the form...
You should probably shorten it.<@
			"));
			return 351-tick;
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Is the name \c33" + global.namingResult + @"\c30 OK?\f00
			"));
		}
		return SCRIPT_CONTINUE_ADVANCETICK;
	}
	if (tick == 382) {
		if (global.gp0.hang) {
			global.lastResult = RESULT_NONE;
			global.gp1 = spawnChoiceTextbox("Yes#No");
			return SCRIPT_CONTINUE_ADVANCETICK;	
		}
		return SCRIPT_CONTINUE_NOTICK;
	}
	if (tick == 383) {
		if (global.lastResult != RESULT_NONE) {
			with (global.gp0) instance_destroy();
			if (global.lastResult != 0) return -3;
			global.teamMembers[0].name = global.namingResult;
			return SCRIPT_CONTINUE_ADVANCETICK;
		}
		return SCRIPT_CONTINUE_NOTICK;
	}
	if (tick == 420) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: I see.
Congratulations, {PLAYER}!

\p00You should be provided with your first task tomorrow.
I am certain you will push our research forward.<@
		"), [Portrait0028, 10]);
	}
	if (tick == 421) {
		if (instance_exists(global.gp0)) return SCRIPT_CONTINUE_NOTICK;
	}
	if (tick == 422) {
		return scriptingDelay(30);	
	}
	if (tick == 423) {
		with (scriptingSelectObj(global.partnerSpecies)) {
			x = 159*2; y = 190*2;
		}
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 159*2, 143*2, 25);
		sound_play(SFXGeneral12);
	}
	if (tick == 424) {
		return scriptingDelay(25);
	}
	if (tick == 425) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 222*2, 112*2, 30);
	}
	if (tick == 426) {
		return scriptingDelay(30);
	}
	if (tick == 427) {
		scriptingPlayerFaceDir(FACING_DL);
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c36???\c30: Hey, I assume you won?
Why am I even asking... you definitely did!

\p0bThis means you got into the \c32field exploration program\c30 now!
Cannot wait to see the wonderful things you're gonna do!

\p00I certainly want to hear more about this.
Let's meet outside!<@
		"), [ASSET_PARTNER_PORTRAIT, 0]);
	}
	if (tick == 428) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 429) {
		return scriptingDelay(15);	
	}
	if (tick == 430) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 159*2, 143*2, 30);
	}
	if (tick == 431) {
		return scriptingDelay(30);
	}
	if (tick == 432) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 159*2, 190*2, 25);
	}
	if (tick == 433) {
		return scriptingDelay(25);	
	}
	if (tick == 434) {
		with (scriptingSelectObj(global.partnerSpecies)) {
			x = -1000; y = -1000;
		}
		sound_play(SFXGeneral12);	
	}
	if (tick == 435) {
		return scriptingDelay(45);	
	}
	if (tick == 436) {
		scriptingPlayerFaceDir(FACING_R);
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Ahhh, always so fast.
A true classic...

\p10This candidate qualified today as well, but they forgot to sign
their papers. Ran out faster than I could say anything.

\p0aI heard hasty personalities excel in courage and resilience, so
I'm definitely having very high hopes for this one!

\p04The only issue is that we're missing the necessary paperwork.
Most notably, I don't even have their name.

\p00Do you happen to know it? If you do, I could just figure out the
rest from there.<@
		"), [Portrait0028, 2]);
	}
	if (tick == 437) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 438) {
		return scriptingDelay(20);	
	}
	if (tick == 439) {
		global.gp0 = spawnNamingTextbox("Name your friend.", 10);
	}
	if (tick == 440) {
		if (instance_exists(global.gp0)) return SCRIPT_CONTINUE_NOTICK;
		if (global.namingResult == "") global.namingResult = "Bob";
		
		draw_set_font(TextboxFont);
		global.gp3 = string_width(global.namingResult);
		
		if (global.gp3 > NAME_MAX_WIDTH) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
That name seems awfully long. It doesn't fit in the form...
You should probably shorten it.<@
			"));
			return 437-tick;
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
Is the name \c36" + global.namingResult + @"\c30 OK?\f00
			"));
		}
		return SCRIPT_CONTINUE_ADVANCETICK;
	}
	if (tick == 441) {
		if (global.gp0.hang) {
			global.lastResult = RESULT_NONE;
			global.gp1 = spawnChoiceTextbox("Yes#No");
			return SCRIPT_CONTINUE_ADVANCETICK;	
		}
		return SCRIPT_CONTINUE_NOTICK;
	}
	if (tick == 442) {
		if (global.lastResult != RESULT_NONE) {
			with (global.gp0) instance_destroy();
			if (global.lastResult != 0) return -3;
			global.partnerName = global.namingResult;
			return SCRIPT_CONTINUE_ADVANCETICK;
		}
		return SCRIPT_CONTINUE_NOTICK;
	}
	if (tick == 443) {
		return scriptingDelay(20);
	}
	if (tick == 444) {
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: That's true, I think I remember now. Thank you.
I should be able to figure everything else that's necessary.

For now, you should prepare for your first mission tomorrow.
I will give you a more detailed outline of your tasks by then.

I heard your friend {PARTNER} is waiting for you outside.
You better go meet them while I get things ready!<@
		"), [Portrait0028, 0]);
	}
	if (tick == 445) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 446) {
		global.eventFlags[EVENT_LAB_EXITING_DOOR] = 1;
		global.active = true;
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labNPC1Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Vaporeon\c30: Hey, I'm in charge of preparing and executing
fight simulations to train our members.

\p01Needless to say, I'm very knowledgeable!
As such, I can share many helpful tips and facts with you.

\p0aFor example,\d0a did you know that in terms of-\m0b\f00
		"), [Portrait0134, 0]);
	}
	if (tick == 1) {
		return scriptingWaitForTextInGP0();
	}
	if (tick == 2) {
		return scriptingDelay(40);
	}
	if (tick == 3) {
		with (TextboxController) instance_destroy();
	}
	if (tick == 4) {
		scriptingFaceDir(FACING_U);
	}
	if (tick == 5) {
		return scriptingDelay(110);	
	}
	if (tick == 6) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Vaporeon\c30: Ah sorry... I'm a bit busy right now.
Feel free to come back when I have a bit more free time!<@
		"), [Portrait0134, 0]);
	}
	if (tick == 7) {
		return scriptingWaitForTextInGP0();
	}
	if (tick == 8) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labNPC2Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Nidorino\c30: We're having a lot of concerns about our friend,
and we really don't know what to do about him...

You see, one time, we caught him using Visual Boy Advance for
glitch research purposes. Do you understand the implications?

He might get removed from the roster if \c32Sandslash\c30 finds out!
We need to find a way to convince him to change his habits...<@
		"), [Portrait0033, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labNPC3Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Graveler\c30: While I'm worried about our friend's behavior,
I think \c32Nidorino\c30 might be slightly overexaggerating too.

It was likely an isolated incident. Our friend was probably just
curious, or wanted to test things out quickly.

\p04On the other hand... there are reasons to be concerned.
This is a grave matter.

It all begins with using VBA... then you start doing stuff like using
8F over -gm... and then, it ends with murder and tax evasion!<@
		"), [Portrait0075, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labNPC4Interact(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Weepinbell\c30: At the Glitch Research Laboratory, we are trying
to understand glitches - anomalies of unknown source.

They are highly common around Glitchtopia and its surrounding
lands, like Glitchland and Glitch Islands.

These anomalies used to be rare and elusive, until the invasion
of the \c37Glitch Lord\c30 has caused these effects to amplify.

We are looking for ways to explain and control those anomalies,
or rather, use them to benefit us in various ways.<@
		"), [Portrait0070, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function labNPCSandslashInteract(tick) {
	// todo: different talk dependent on story point
	if (tick == 0) {
		scriptingFacePlayer();
		if (global.curStoryHint == 0) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: Hey, isn't your friend waiting outside?
Go see them! Brag about your achievement or something!<@
			"), [Portrait0028, 0]);
		}
		else if (global.curStoryHint == 1) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: You should head to \c51Serene Forest\c30.
Your friend will be waiting at the camp's eastern exit.<@
			"), [Portrait0028, 0]);
		}
		else if (global.curStoryHint == 2) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: You should go use that \c32Coin Case\c30 I gave you.
Do it at the \c51Serene Forest Clearing\c30.<@	
			"), [Portrait0028, 0]);
		}
		else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Sandslash\c30: You might be wondering... how am I actually creating
those hooked \c32Metapod\c30 fights for new recruits?

It's simple! I am just using this very convenient item I brought
from Glitchland. It's called \c314 \c4cx\c31  \c4cx\c31't 4 \c4cx\c31\c30.

Just looking at this item in very specific spots causes a \c32Metapod\c30
to appear right in front of you! Isn't that amazing?

Of course, we don't know the cause of this behavior, or if there
are any adverse side-effects. Research is still ongoing.<@
			"), [Portrait0028, 0]);
		}
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}
	