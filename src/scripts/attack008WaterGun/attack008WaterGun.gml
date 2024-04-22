function attack008WaterGun(){
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Water Gun@0!"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["anim_faceenemy", -1]);
	ds_queue_enqueue(animations, ["anim_spin", -1]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimGeneric1, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXUse]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimWater, 0.75]);
	ds_queue_enqueue(animations, ["snd", FightSFXWater]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 5]);
	ds_queue_enqueue(animations, ["dmgsingle", "water", 25, noone]);
	ds_queue_enqueue(animations, ["wait", 35]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
}