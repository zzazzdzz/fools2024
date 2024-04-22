
function attack001Tackle(){
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Tackle@0!"]);
	ds_queue_enqueue(animations, ["lastblow", "Tackle"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
	ds_queue_enqueue(animations, ["anim_movetarget", -1, 45]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["snd", FightSFXTackle]);
	ds_queue_enqueue(animations, ["anim", -1, "Attack", 0]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["dmgsingle", "normal", 20, noone]);
	ds_queue_enqueue(animations, ["anim_moverestore", -1]);
	ds_queue_enqueue(animations, ["wait", 30]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}