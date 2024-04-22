// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ai003ForestFight1(){
	if (global.battleCurrentObj.curHP <= 0) return;
	
	if (global.turnCounter == 0) {
		attack005Harden();
		if (!global.eventFlags[EVENT_TUTORIALTEXT_MOVE]) {
			ds_queue_enqueue(animations, ["wait", 50]);
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
\p02{PARTNER}: Wow, looks like this one is smarter than the
simulated one... it has increased its defenses!

\p00But it's not like it's gonna change anything.
We need to keep attacking!<@
			"), [ASSET_PARTNER_PORTRAIT, 3]]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			ds_queue_enqueue(animations, ["wait", 30]);
		}
	}
	
	if (global.turnCounter == 1) {
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["anim_savefacing", -1]);
		ds_queue_enqueue(animations, ["anim_facepoint", -1, 320, 120]);
		ds_queue_enqueue(animations, ["anim_movepoint", -1, 320, 120, 35]);
		ds_queue_enqueue(animations, ["anim_restorefacing", -1]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " is running away!"]);
		ds_queue_enqueue(animations, ["wait", 45]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		if (!global.eventFlags[EVENT_TUTORIALTEXT_MOVE]) {
			ds_queue_enqueue(animations, ["wait", 50]);
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
{PARTNER}: Huh? No way! That's cheating!
Our target is running away! We better give chase!<@
			"), [ASSET_PARTNER_PORTRAIT, 3]]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
\m08Use the \c32Move\c30 option to reposition your party members.
Changing your position doesn't end your turn.<@
			"), noone]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			global.eventFlags[EVENT_TUTORIALTEXT_MOVE] = 1;
		}
	}
	
	if (global.turnCounter > 1) {
		global.battleTargetObj = randomAllyAliveProvokable();
		setLastBlow("Tackle");
		attack001Tackle();
	}
}