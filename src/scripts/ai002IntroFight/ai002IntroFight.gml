// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ai002IntroFight(){
	if (global.battleCurrentObj.curHP <= 0) return;
	if (global.turnCounter == 0 || global.turnCounter == 1 || global.turnCounter == 2) {
		attack001Tackle();
	} else {
		var r = irandom(4);
		var texts = [
			"@3" + global.battleCurrentObj.combatantName + "@0 plots world domination.",
			"@3" + global.battleCurrentObj.combatantName + "@0 is loafing around.",
			"@3" + global.battleCurrentObj.combatantName + "@0 carefully plans its next move.",
			"@3" + global.battleCurrentObj.combatantName + "@0 is getting tired...",
			"@3" + global.battleCurrentObj.combatantName + "@0 is trying to concentrate."
		];
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["msg", texts[r]]);
		ds_queue_enqueue(animations, ["wait", 60]);	
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	}
}