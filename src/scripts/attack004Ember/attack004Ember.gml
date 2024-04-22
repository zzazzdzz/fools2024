function attack004Ember(){
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Ember@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXEmber]);
	ds_queue_enqueue(animations, ["wait", 15]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimEmber, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXBurn]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["dmgsingle", "fire", 25, noone]);
	ds_queue_enqueue(animations, ["wait", 45]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}