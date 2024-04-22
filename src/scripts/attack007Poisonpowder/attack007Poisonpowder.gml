// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack007Poisonpowder() {
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Poisonpowder@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimPoisonpowder, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXPowder]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 40]);
	if (hasStatus(global.battleTargetObj, "Poisoned")) {
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s poison duration extended!"]);
		ds_queue_enqueue(animations, ["apply_effect", -2, ["Poisoned", 4]]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["snd", FightSFXPoison]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	} else {
		ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + " was poisoned!"]);
		ds_queue_enqueue(animations, ["apply_effect", -2, ["Poisoned", 4]]);
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["snd", FightSFXPoison]);
		ds_queue_enqueue(animations, ["wait", 55]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}

function effect007Dot(t) {
	BattleController.alarm[0] = 10;
	global.battleCurrentObj = global.battleTargetObj;
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + " took damage from poison!"]);
	ds_queue_enqueue(animations, ["dmgsingle_nobuffs", "none", 15, noone]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}