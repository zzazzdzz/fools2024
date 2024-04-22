
function attack002Bepis(){
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "@3" + global.battleCurrentObj.combatantName + "@0 used @1Bepis Teletest@0!"]);
	ds_queue_enqueue(animations, ["wait", 35]);
	
	/*
	var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y-20, global.battleTargetObj.x, global.battleTargetObj.y);
	ds_queue_enqueue(animations, ["mktelegraph", [
		["line", global.battleCurrentObj.x, global.battleCurrentObj.y-20, 0, 0, 500, 33, dr]
	]]);*/
	
	var tele = [
		["circle", global.battleTargetObj.x, global.battleTargetObj.y, 0, 0, 100, 0, 0]
	];
	
	ds_queue_enqueue(animations, ["mktelegraph", tele]);
	
	//dealDamage(global.battleTargetObj, "normal", 20);
	ds_queue_enqueue(animations, ["wait", 40]);
	ds_queue_enqueue(animations, ["snapshot"]);
	ds_queue_enqueue(animations, ["rmtelegraph"]);
	ds_queue_enqueue(animations, ["nomsg"]);
	
	ds_queue_enqueue(animations, ["dmgmulti", "normal", 10]);
	
	ds_queue_enqueue(animations, ["wait", 20]);
}