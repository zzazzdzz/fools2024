
function interactTown1(){

}

function townKecleonInteract(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Kecleon\c30: Guess what? I heard a lot of adventurers start their
journeys in this area, so I'm setting up a shop here!

You'll need to give me a tiny bit more time though.
I'm still waiting for some key item deliveries.<@
		"), [Portrait0352, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function townMudkipInteract(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\p0f\c32Mudkip\c30: So you qualified for the field exploration program
together with {PARTNER}? Great work you two!

\p05I'm still trying to get past the training requirements.
That \c32Hooked Metapod\c30 is way too scary...

\p10I think they should reduce the level of detail they use in their
simulation procedures. It all looks way too real!<@
		"), [Portrait0258, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function townCyndaquilInteract(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Cyndaquil\c30: One day, I hope to qualify for the field exploration
program as well. It sounds so cool!

\p01Great tales of adventure! Lots of treasure! Getting to discover
the world's secrets too. What's not to like?<@
		"), [Portrait0155, 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function townScytherInteract(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		if (global.curStoryHint == 0) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Scyther\c30: Good job! I was watching you the entire time.
You might say that... I saw your feat from the grass!<@
			"), [Portrait0123, 0]);
		} else {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Scyther\c30: Watching field exploration program candidates do their
first fights is relaxing. I could do this for hours...<@
			"), [Portrait0123, 0]);
		}
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function townMarillInteract(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		if (global.curStoryHint == 0 || global.curStoryHint == 1) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Marill\c30: To succeed in your adventures, it is crucial to study
and understand key strategies used in battles.

\p0aDid you know? You can choose to \c32wait\c30 in a battle and let your
opponent attack first, to better prepare for their next move.

\p00Additionally, if you delay your turn and move first on the next
round, you'll be able to execute two actions in a row!

\p01Use this trick to deal massive burst damage, or to set up your
party with vital \c32healing\c30 and \c32mitigation\c30 skills!

\p00Huh? But what's \c32healing\c30 and \c32mitigation\c30, you might ask?
I will explain that to you next time. Stay tuned!<@
			"), [Portrait0183, 0]);
		}
		else if (global.curStoryHint == 2) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Marill\c30: To succeed in your adventures, it is crucial to study
and understand key strategies used in battles.

\p0aDid you know? Choosing the \c32specialization\c30 of your team members
wisely can really give you a big advantage!

\p00The \c37offensive\c30 specialization excels in dealing high damage,
but has a hard time dealing with enemy attacks by itself.

The \c38defensive\c30 specialization focuses on \c32mitigation\c30, providing
ways to protect the party and reduce incoming damage.

The \c39supportive\c30 specialization provides \c32healing\c30 skills, allowing
party members to survive longer in combat.

\p0aAn ideal team would include a mix of all three specializations,
to better take advantage of all of these benefits!

\p00That's it for today.
Stay tuned for more!<@
			"), [Portrait0183, 0]);
		}
		else if (global.curStoryHint == 3) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Marill\c30: To succeed in your adventures, it is crucial to study
and understand key strategies used in battles.

\p0aDid you know? Losing a battle might feel bad initially - but you
should use it as an opportunity to learn from your mistakes.

\p00Your money and items are not affected by losses, so there's no
harm in repeatedly retrying the fights many times over!

In fact, multiple attempts might be necessary to understand some
attack patterns and develop strategies. Do not be discouraged!

That's it for today.
Stay tuned for more!<@
			"), [Portrait0183, 0]);
		}
		else if (global.curStoryHint == 4 || global.curStoryHint == 5) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Marill\c30: To succeed in your adventures, it is crucial to study
and understand key strategies used in battles.

\p0aDid you know? Inventory management gets boring sometimes,
but it's a key component of ensuring your victory.

\p00An item can only be used by the team member holding it.
As such, plan your distribution of items accordingly.

For example, if a party member is weaker and lacks sustain,
it might be beneficial to stock them up with defensive items.

And putting all eggs into one basket is rarely a good idea too!
If a team member falls, they won't be able to use their items.

That's it for today.
Stay tuned for more!<@
			"), [Portrait0183, 0]);
		}
		else if (global.curStoryHint == 6) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Marill\c30: To succeed in your adventures, it is crucial to study
and understand key strategies used in battles.

\p0aDid you know? When you find yourself affected by a status, it's
good practice to verify its description.

\p00By using the \c32Status\c30 option, you'll be able to see all of
the status ailments inflicted on the current party member.

Reading their descriptions might reveal hints which will aid in
properly resolving all effects which might be applied to you!

That's it for today.
Stay tuned for more!<@
			"), [Portrait0183, 0]);
		}
		else if (global.curStoryHint == 7 || global.curStoryHint == 8) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Marill\c30: To succeed in your adventures, it is crucial to study
and understand key strategies used in battles.

\p0aDid you know? Reading your opponent's tells is mandatory to win
in certain fights.

\p00Opponents might reveal their intentions through names of their
moves, direction they're looking, position they move to...

Always keep an eye out for any actions your opponents perform!
Every piece of information might end up crucial to success.

That's it for today.
Stay tuned for more!<@
			"), [Portrait0183, 0]);
		}
		else if (global.curStoryHint == 9 || global.curStoryHint == 10) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Marill\c30: To succeed in your adventures, it is crucial to study
and understand key strategies used in battles.

\p0aDid you know? Targets for all moves are locked in exactly when
the move is executed - no sooner, no later.

\p00This means, should a target be knocked out by a multi-hit attack,
subsequent hits might still end up hitting the same target.

\p0aOn a side note, any detrimental effects will persist after getting
knocked out too. Be aware of any unconscious party members!

\p00That's it for today.
Stay tuned for more!<@
			"), [Portrait0183, 0]);
		}
		else if (global.curStoryHint == 11) {
			global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Marill\c30: You did it! You defeated the Glitch Lord!
My tips were probably helpful for you, were they not?

\p0aWith the land at peace, you might want to focus on some lighter
tasks, like finishing the \c32Compendium\c30!

Or maybe aim for some \c32achievements\c30, to get you on top of
that \c32public leaderboard\c30 everyone's talking about!

\p00But keep in mind - having been freed from Glitch Lord's influence,
Pok%mon around all areas started growing exceptionally well.

Despite you growing stronger, any wild encounters might still
pose a threat to you. Be careful!<@
			"), [Portrait0183, 0]);
		}
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function townPartnerEasterEggInteract(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
*!* redacted6<@
		"), [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 1) return scriptingWaitForTextInGP0();
	if (tick == 2) {
		scriptingRestoreFacing();
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function townPartnerFirstVisitScript1(tick) {
	if (tick == 0) {
		global.interactedWith = scriptingSelectObj(global.partnerSpecies);
		scriptingFacePlayer();
	}
	if (tick == 1) {
		return scriptingDelay(10);	
	}
	if (tick == 2) {
		var tx = formatTextboxString(@"
{PARTNER}: Oh great, you're back.
That took you a while!

\p01Anyways, good job with your performance today.
Can't wait to go on an expedition together!\f00
		");
		if (OverworldHero.facing == FACING_L || OverworldHero.facing == FACING_UL || OverworldHero.facing == FACING_DL) {
			tx = formatTextboxString(@"
{PARTNER}: Hey, you caught me off guard here!
You're so sneaky!

But you should probably know, approaching others from behind
might be seen as a bit rude, so you gotta be careful.

\p01Anyways, good job with your performance today.
Can't wait to go on an expedition together!\f00
			");
		}
		global.gp0 = spawnStandardTextbox(tx, [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 3) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 4) {
		global.gp0 = spawnChoiceTextbox("Yeah! It will be fun!#Wait... you said \"together\"?");
		global.gp0.quitStatusAllowed = false;
	}
	if (tick == 5) {
		return scriptingWaitForLastResult();
	}
	if (tick == 6) {
		scriptingCloseAllText();
		var tx = "bepis";
		if (global.lastResult == 0) {
			tx = formatTextboxString(@"
{PARTNER}: Great! Then, we're in agreement!
Let's get a good night's sleep before we go explore.

Tomorrow, \c32Sandslash\c30 will likely tell us more about what we'll
be expected to do.

I'll see you inside.
Feel free to look around the area first!<@
		");
		} else {
			tx = formatTextboxString(@"
{PARTNER}: Yes, you heard that right!
Expeditions are all done in groups.

\p00We're both new recruits, so we're likely going to be assigned
to an exploration group together. Isn't that amazing?

\p02Going out on expeditions alone would spell certain doom to most
who would dare to try it.

\p04And you see, I value my life a lot, and getting lost alone in some
weird dungeon is not the way I want to live it!

\p00I'll see you inside.
Feel free to look around before you follow me.<@
		");
		}
		global.gp0 = spawnStandardTextbox(tx, [asset_get_index("Portrait" + global.partnerSpecies), 0]);
	}
	if (tick == 7) {
		return scriptingWaitForTextInGP0();	
	}
	if (tick == 8) {
		return scriptingDelay(10);	
	}
	if (tick == 9) {
		scriptingApplyMovement(scriptingSelectObj(global.partnerSpecies), 850*2, 405*2, 40);
	}
	if (tick == 10) {
		return scriptingDelay(40);	
	}
	if (tick == 11) {
		with (scriptingSelectObj(global.partnerSpecies)) {
			x = -1000;
			y = -1000;
		}
		sound_play(SFXGeneral12);
	}
	if (tick == 12) {
		return scriptingDelay(30);	
	}
	if (tick == 13) {
		global.eventFlags[EVENT_MET_PARTNER_FRONT_OF_HOUSE] = 1;
		global.active = true;
		return SCRIPT_STOP;
	}
	return SCRIPT_CONTINUE_ADVANCETICK;
}

function townKecleonShopInteract(tick) {
	if (tick == 0) {
		scriptingFacePlayer();
		global.gp0 = spawnStandardTextbox(formatTextboxString(@"
\c32Kecleon\c30: Welcome to the \c32Kecleon Shop\c30!
Do you wish to take a look at my merchandise?\f00
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