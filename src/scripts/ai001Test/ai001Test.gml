// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ai001Test(){
	if (global.battleCurrentObj.curHP <= 0) return;
	
	ds_queue_enqueue(animations, ["snapshot_all"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "@3" + global.battleCurrentObj.combatantName + "@0 used @1Super Bepis@0!"]);
	ds_queue_enqueue(animations, ["wait", 35]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["dmgmulti", "normal", 100, ["DamageDown", 5]]);
	ds_queue_enqueue(animations, ["wait", 20]);
	
	/*
	ds_queue_enqueue(animations, ["snapshot_all"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "@3" + global.battleCurrentObj.combatantName + "@0 used @1Super Bepis@0!"]);
	ds_queue_enqueue(animations, ["wait", 35]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["dmgmulti", "fire", 10, ["DamageDown", 2]]);
	ds_queue_enqueue(animations, ["wait", 20]);
	*/
	
	/*
	if (global.turnCounter % 2 == 0) {
		
		global.battleTargetObj = randomAlly();
		
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["msg", "@3" + global.battleCurrentObj.combatantName + "@0 readies @1Bepis@0."]);
		ds_queue_enqueue(animations, ["wait", 15]);
		
		var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y-20, global.battleTargetObj.x, global.battleTargetObj.y);
		
		ds_queue_enqueue(animations, ["mktelegraph", [
			["line", global.battleCurrentObj.x, global.battleCurrentObj.y-20, 0, 0, 500, 33, dr]
		]]);
	
		ds_queue_enqueue(animations, ["wait", 35]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	
		//dealDamage(global.battleTargetObj, "normal", 20
	}
	if (global.turnCounter % 2 == 1) {
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "@3" + global.battleCurrentObj.combatantName + "@0 used @1Bepis@0!"]);
		ds_queue_enqueue(animations, ["wait", 35]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	
		ds_queue_enqueue(animations, ["dmgmulti", "normal", 10, ["DamageDown", 2]]);
	
		ds_queue_enqueue(animations, ["wait", 20]);
	}
	*/
	
}