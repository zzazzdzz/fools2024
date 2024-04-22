// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack009Peck(){
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Peck@0!"]);
	ds_queue_enqueue(animations, ["lastblow", "Peck"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
	ds_queue_enqueue(animations, ["anim_movetarget", -1, 45]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["snd", FightSFXPeck]);
	ds_queue_enqueue(animations, ["anim", -1, "Attack", 0]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["dmgsingle", "flying", 20, noone]);
	ds_queue_enqueue(animations, ["anim_moverestore", -1]);
	ds_queue_enqueue(animations, ["wait", 30]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}