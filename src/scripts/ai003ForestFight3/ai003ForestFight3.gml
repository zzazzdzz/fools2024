function ai003ForestFight3Lore() {
	if (!global.eventFlags[EVENT_TUTORIALTEXT_MATCHUPS]) {
		if (global.turnCounter == 1) {
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
{PARTNER}: Ouch, that really hurt!
This Bellsprout is really exploiting its \c32type advantage\c30.

Its \c31Vine Whip\c30 is a really big threat.
We should knock it down first!<@
			"), [ASSET_PARTNER_PORTRAIT, 0]]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
\m08Moves might deal highly increased or reduced damage based on
the types of attackers and defenders.

Preventing opponents from exploiting your weaknesses is crucial
for achieving success in your adventures!<@
			"), noone]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			ds_queue_enqueue(animations, ["wait", 30]);
		}
		if (global.turnCounter == 2) {
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
{PARTNER}: I'm getting really bored...
If we could go a bit faster, that would be great!<@
			"), [ASSET_PARTNER_PORTRAIT, 4]]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
\m08Hold \c39Spacebar\c30 to speed up animated sections within fights.
However, be careful not to miss important information!<@
			"), noone]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			global.eventFlags[EVENT_TUTORIALTEXT_MATCHUPS] = 1;
		}
	}
}

function ai003ForestFight3(){
	if (global.battleCurrentObj.curHP <= 0) return;
	
	if (global.battleCurrentObj.species == "0069") {
		setLastBlow("Vine Whip");
		if (global.turnCounter % 2 == 0) {
			global.battleTargetObj = randomAllyPrioritizeSpecies("0007");
			attack006VineWhip();
		} else {
			global.battleTargetObj = allyBySpecies("0004");
			if (global.battleTargetObj == noone) global.battleTargetObj = allyBySpecies("0001");
			if (global.battleTargetObj == noone) global.battleTargetObj = randomAllyAliveProvokable();
			attack006VineWhip();
		}
	}
	if (global.battleCurrentObj.species == "0048") {
		var tc = global.turnCounter % 3;
		global.battleTargetObj = randomAllyAliveProvokable();
		if (tc == 0) {
			attack007Poisonpowder();
		}
		else if (tc == 1) {
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Bug Buzz@0."]);
		
			ds_queue_enqueue(animations, ["wait", 15]);
			ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
			ds_queue_enqueue(animations, ["mktelegraph", [
				["circle", global.battleCurrentObj.x, global.battleCurrentObj.y, 0, 0, 100, 0, 0]
			]]);
	
			ds_queue_enqueue(animations, ["wait", 35]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["wait", 20]);	
		}
		else if (tc == 2) {
			setLastBlow("Bug Buzz");
			ds_queue_enqueue(animations, ["snapshot"]);
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Bug Buzz@0!"]);
			ds_queue_enqueue(animations, ["wait", 35]);
			ds_queue_enqueue(animations, ["rmtelegraph"]);
			ds_queue_enqueue(animations, ["nomsg"]);
			ds_queue_enqueue(animations, ["snd", FightSFXUse]);
			ds_queue_enqueue(animations, ["anim_spin", -1]);
			ds_queue_enqueue(animations, ["wait", 20]);
	
			ds_queue_enqueue(animations, ["dmgmulti", "bug", 35, noone]);
	
			ds_queue_enqueue(animations, ["wait", 20]);	
		}
	}
}