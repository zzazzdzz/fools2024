// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function itemUseBlastSeed(){
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "@3" + global.battleCurrentObj.combatantName + "@0 used the @1" + global.battleCurrentItemName + "@0."]);
	ds_queue_enqueue(animations, ["wait", 25]);
	ds_queue_enqueue(animations, ["animpart_member", -1, AnimEat, 1]);
	ds_queue_enqueue(animations, ["snd", FightSFXEat]);
	ds_queue_enqueue(animations, ["wait", 10]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["snd", FightSFXBlast]);
	ds_queue_enqueue(animations, ["animpart_member", -2, AnimBlast, 1]);
	ds_queue_enqueue(animations, ["wait", 20]);
	dealDamage(global.battleTargetObj, "none", min(100, global.battleCurrentObj.lv * 5), noone, false, true);
	ds_queue_enqueue(animations, ["wait", 30]);	
	ds_queue_enqueue(animations, ["nomsg"]);	
	return true;
}