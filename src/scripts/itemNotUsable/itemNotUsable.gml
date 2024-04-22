function itemNotUsable() {}

function itemNotUsableOverworld(tick){
	if (tick == 0) {
		global.battleToastBox = spawnStandardTextbox(formatTextboxString(@"
Dad's advice... {PLAYER}!
There is a time and place for everything! But not now.<@
		"));
		return SCRIPT_CONTINUE_ADVANCETICK;
	}
	if (tick == 1) {
		if (instance_exists(global.battleToastBox)) return SCRIPT_CONTINUE_NOTICK;
		else return SCRIPT_STOP;
	}
	return false;
}

function itemNotUsableBattle(tick){
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " took out the @1" + global.battleCurrentItemName + "@0 and used it!"]);
	ds_queue_enqueue(animations, ["wait", 50]);
	ds_queue_enqueue(animations, ["nomsg"]);
	ds_queue_enqueue(animations, ["wait", 20]);
	ds_queue_enqueue(animations, ["msg", "But nothing happened!"]);
	ds_queue_enqueue(animations, ["wait", 50]);
	ds_queue_enqueue(animations, ["nomsg"]);
	return false;
}