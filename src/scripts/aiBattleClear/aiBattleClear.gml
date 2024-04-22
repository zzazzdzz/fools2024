// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function aiBattleClear(){
	if (global.battleType != BATTLETYPE_DUNGEON) {
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["sndstop"]);
		ds_queue_enqueue(animations, ["snd", BattleClearFanfare]);
		ds_queue_enqueue(animations, ["msg", "All opponents were defeated!"]);
		ds_queue_enqueue(animations, ["wait", 180]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
	} else {
		ds_queue_enqueue(animations, ["wait", 5]);
		ds_queue_enqueue(animations, ["msg", "All opponents were defeated!"]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 10]);
	}
}

function aiBattleFinalClear() {
	BattlePartMissingno.alarm[2] = 1;
	ds_queue_enqueue(animations, ["halt"]);
}