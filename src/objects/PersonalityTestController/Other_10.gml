if (curStage == 1) {
	curStage += 1;
	pause = 80;
}

else if (curStage == 2) {
	spawnIntermissionTextbox(formatTextboxString(@"
\c41zE\c30Welcome.
\c41O\c30Beyond here lies the gateway to a brand new world.

\c41V\c30But before proceeding, you will have to create
\c41W\c30an avatar - the true reflection of your being.

\c41Y\c30For that, I shall ask you several questions.
\c41a\c30Stay truthful when answering them.

\c41x\c30Are you ready?
\c41l\c30Let the questioning... begin!<@
	"));
}

else if (curStage == 3) {
	var o = instance_create(ScreenTransitionController, 0, 0);
	o.transition_type = TRANSITION_FADEFROMBLACK;
	drawBackground = true;
	curStage += 1;
	pause = 60;
}

else if (curStage == 4) {
	drawFlash = false;
	curStage += 1;
	pause = 20;
}

else if (curStage == 5) {
	//loadGameData();
	if (curQuestion == 0) {
		global.musicIndex = 5;
		global.musicControl = MUS_PLAY;
	}
	spawnStandardTextbox(questions[shuffledQids[curQuestion], 0] + "\\f00");
}

else if (curStage == 6) {
	var c = spawnChoiceTextbox(questions[shuffledQids[curQuestion], 1]);
	c.quitStatusAllowed = false;
}

else if (curStage == 7) {
	with (TextboxController) instance_destroy();
	//show_debug_message(string(global.lastResult));
	var changes = questions[shuffledQids[curQuestion], 2][global.lastResult];
	results[0] += changes[0];
	results[1] += changes[1];
	results[2] += changes[2];
	//show_debug_message(string(results));
	curQuestion += 1;
	if (curQuestion < 8) {
		curStage = 5;
		pause = 15;
	}
	else {
		curStage = 8;
		pause = 15;
	}
}

else if (curStage == 8) {
	if (results[0] > results[1] && results[0] > results[2]) {
		curStage = 9;
		lastNumTextboxes += 1;
		pause = 50;
		finalResult = 0;
	} else if (results[1] > results[0] && results[1] > results[2]) {
		curStage = 9;
		lastNumTextboxes += 1;
		pause = 50;
		finalResult = 1;
	} else if (results[2] > results[0] && results[2] > results[1]) {
		curStage = 9;
		lastNumTextboxes += 1;
		pause = 50;
		finalResult = 2;
	} else {
		// need extra questions
		curStage = 4;
		lastNumTextboxes += 1;
		if (curQuestion >= array_length(shuffledQids)) {
			curQuestion = 0;	
		}
	}
}

else if (curStage == 9) {
	if (finalResult == 0) {
		spawnStandardTextbox(formatTextboxString(@"
Very well. Thank you for your cooperation.
Your questioning is now complete.

You possess... the \c36Spirit of the Black Wolf\c30.
The sign of the strong and responsible.

Your resiliency and determination will be your greatest asset
to help guide you towards your greatest goals.

No matter the circumstances, you keep moving forward.
You let the circumstances shape you, but they won't stop you.

A bearer of a strong, resilient mind like this...<@
		"));
	}
	else if (finalResult == 1) {
		spawnStandardTextbox(formatTextboxString(@"
Very well. Thank you for your cooperation.
Your questioning is now complete.

You possess... the \c36Spirit of the Mighty Fox\c30.
The sign of resourcefulness and intelligence.

You make calm and rational decisions, by approaching
things with detailed calculation and extensive planning.

While brute force and immense strength may be beneficial,
in the end, you shall win by strategical prowess.

A bearer of a bright, collected mind like this...<@
		"));
	}
	else if (finalResult == 2) {
		spawnStandardTextbox(formatTextboxString(@"
Very well. Thank you for your cooperation.
Your questioning is now complete.

You possess... the \c36Spirit of the Swift Hare\c30.
The sign of openness and innocence.

Your compassionate, positive outlook could raise even the
lowest spirits to the greatest heights.

This calm and relaxed approach shall be your greatest asset
in this upcoming adventure.

A bearer of a carefree, pure spirit like this...<@
		"));
	}
	else {
		interactError();
	}
}

else if (curStage == 10) {
	drawPortrait = true;
	if (finalResult == 0) spawnStandardTextbox(formatTextboxString(@"
\c41m\c30Should be a \c32Charmander\c30!\f00
	"));
	else if (finalResult == 1) spawnStandardTextbox(formatTextboxString(@"
\c41r\c30Should be a \c32Squirtle\c30!\f00
	"));
	else spawnStandardTextbox(formatTextboxString(@"
\c41o\c30Should be a \c32Bulbasaur\c30!\f00
	"));
	pause = 100;
	alarm[1] = 70;
	curStage = 11;
}

else if (curStage == 11) {
	var speciesIds = ["0004","0007","0001"];
	var c = spawnChoiceTextbox("That's pretty accurate.#There must have been a mistake!");
	c.quitStatusAllowed = false;
}

else if (curStage == 12) {
	drawPortrait = false;
	with (TextboxController) instance_destroy();
	if (global.lastResult == 0) {
		global.lastResult = RESULT_NONE;
		curStage = 14;
		drawPortrait = false;
		event_user(0);
	} else {
		global.lastResult = RESULT_NONE;
		spawnStandardTextbox(formatTextboxString(@"
Very well.
Which of the following species should be your avatar?\f00
		"));
	}
}

else if (curStage == 13) {
	var c = spawnChoiceTextbox("@2Charmander#@2Squirtle#@2Bulbasaur");
	c.quitStatusAllowed = false;
}

else if (curStage == 14) {
	if (global.lastResult != RESULT_NONE) {
		finalResult = global.lastResult;
	}
	var speciesIds = ["0004","0007","0001"];
	var typeNames = [["fire"],["water"],["grass","poison"]];
	var rates = [1,0,2];
	global.teamMembers[0].species = speciesIds[finalResult];
	global.teamMembers[0].types = typeNames[finalResult];
	global.teamMembers[0].moves = [finalResult == 0 ? 2 : 1];
	global.teamMembers[0].xp_rate = rates[finalResult];
	if (finalResult == 0) { // 0004 charmander
		global.partnerSpecies = "0007"; // squirtle
		global.partnerSpeciesSecondary = "0001"; // bulbasaur
	}
	if (finalResult == 1) { // 0007 squirtle
		global.partnerSpecies = "0004"; // charmander
		global.partnerSpeciesSecondary = "0001"; // bulbasaur
	}
	if (finalResult == 2) { // 0001 bulbasaur
		global.partnerSpecies = "0007"; // squirtle
		global.partnerSpeciesSecondary = "0004"; // charmander
	}
	with (TextboxController) instance_destroy();
	pause = 50;
	curStage = 15;
}

else if (curStage == 15) {
	spawnStandardTextbox(formatTextboxString(@"
Thank you for your cooperation.
However, there is one more thing that should be discussed.

To promote active participation in our Simulation Program,
we have estabilished a \c32public leaderboard system\c30.

All participants are encouraged to upload documentation of their
achievements to attain the highest score possible.

Do you wish to participate in the \c32online leaderboards\c30,
thus allowing your progress to be shared and uploaded?\f00
	"));
}
else if (curStage == 16) {
	spawnChoiceTextbox("Yes, please record my data.#I don't want to participate.");	
}
else if (curStage == 17) {
	with (TextboxController) instance_destroy();
	if (global.lastResult == 0) {
		if (os_browser == browser_not_a_browser) {
			global.onlineLeaderboardBind = [];
			spawnStandardTextbox(formatTextboxString(@"
Very well. It appears that you're utilizing the \c36offline version\c30
of the Fight Simulation Program client.

As such, you will need to take additional steps to configure your
client, so our staff can be informed about your progress.

To perform the necessary configuration steps, \c32save\c30 your data,
restart the client, then select \c32Leaderboard\c30 in the top menu.<@
			"));
		} else {
			global.onlineLeaderboardBind = [true, global.onlineAuto1, global.onlineAuto2];
			spawnStandardTextbox(formatTextboxString(@"
Very well. It appears that you're utilizing the \c36online version\c30
of the Fight Simulation Program client.

In such case, your client will be automatically configured to
inform our staff about the progress of your adventure.

Should you wish to ever change your mind, \c32save\c30 your data,
restart the client, then select \c32Leaderboard\c30 in the top menu.<@
			"));
		}
	} else {
		global.onlineLeaderboardBind = [false];
		curStage = 100;
		pause = 50;
	}
}
else if (curStage == 18) {
	pause = 50;
	curStage = 100;
}

else if (curStage == 100) {
	spawnStandardTextbox(formatTextboxString(@"
Understood. It appears we're all set.
Are you ready?

A new tale of adventure is about to unfold before your very
eyes...

It will be a story of hardships, faith and survival, but also
a story about overcoming obstacles and achieving success.

But most importantly, it will serve as a universal lesson about
    TMZ4\d12 @    TMZ4
    TMZ4\f00
	"));
}

else if (curStage == 101) {
	alarm[2] = 40;
}