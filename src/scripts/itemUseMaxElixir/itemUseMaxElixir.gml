// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function itemUseMaxElixir(){
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used the @1" + global.battleCurrentItemName + "@0."]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimEat, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXEat]);
	ds_queue_enqueue(animations, ["wait", 5]);
	ds_queue_enqueue(animations, ["nomsg"]);
	global.battleTargetObj.curPP = global.battleTargetObj.maxPP;
	ds_queue_enqueue(animations, ["snd", FightSFXIncrPP]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleTargetObj.combatantNameDecorated + "'s PP was fully restored."]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimRaise, 1, c_aqua]);
	ds_queue_enqueue(animations, ["wait", 50]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);	
	return true;
}

function itemUseElixir(){
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used the @1" + global.battleCurrentItemName + "@0."]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimEat, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXEat]);
	ds_queue_enqueue(animations, ["wait", 5]);
	ds_queue_enqueue(animations, ["nomsg"]);
	global.battleTargetObj.curPP = global.battleTargetObj.maxPP div 2;
	if (global.battleTargetObj.curPP > global.battleTargetObj.maxPP) global.battleTargetObj.curPP = global.battleTargetObj.maxPP;
	ds_queue_enqueue(animations, ["snd", FightSFXIncrPP]);
	ds_queue_enqueue(animations, ["msg", "Some of " + global.battleTargetObj.combatantNameDecorated + "'s PP was restored."]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimRaise, 1, c_aqua]);
	ds_queue_enqueue(animations, ["wait", 50]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);	
	return true;
}