
function ai001Intro(){
	if (global.turnCounter == 0) {
		global.musicIndex = 1;
		global.musicControl = MUS_PLAY;
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["msg", "The @5Hooked Metapod@0 attacked!"]);
		ds_queue_enqueue(animations, ["wait", 60]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["lore_msg", "\\c32???\\c30: Yes! It worked!\nI think the transfer was successful!<@\\c32???\\c30: Stay calm, don't panic. It's all part of the training.\nNow, show me what you've got!< ", [Portrait1000, 0]]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		ds_queue_enqueue(animations, ["wait", 30]);
		ds_queue_enqueue(animations, ["lore_msg", "\\m08Uh oh!\nLooks like you'll need to fight your way out of this one!<@Each round, all allies and enemies will have an opportunity\nto perform various actions.<@Claim victory by \\c32attacking\\c30.\nReduce your opponent's HP to 0!< ", noone]);
		ds_queue_enqueue(animations, ["wait_msg"]);
		ds_queue_enqueue(animations, ["wait", 30]);
	}
}