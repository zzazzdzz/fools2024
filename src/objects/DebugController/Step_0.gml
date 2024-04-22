if (global.recomputeBaseEncryptionHashKey != "e5bbb37aa887157f28ec7914937257c2") {
	instance_destroy();
	exit;
}

if (keyboard_check_pressed(vk_tab)) {
	game_set_speed(600, gamespeed_fps);
	room_speed = 600;
}
if (keyboard_check_released(vk_tab)) {
	game_set_speed(60, gamespeed_fps);
	room_speed = 60;
}
if (keyboard_check_pressed(vk_f2)) {
	alwaysHighroll = true;
}
if (keyboard_check_pressed(vk_f3)) {
	if (room == BattleRoom) {
		BattleController.turnState = 1000;
	}
}
if (keyboard_check_pressed(vk_f4)) {
	with (DungeonTravelController) {
		global.dungeonDataOffset = (array_length(global.dungeonData[0]) - 2) div 2;
		chunk_queue = global.dungeonData[0][global.dungeonDataOffset*2];
		chunk_scripts = global.dungeonData[1][global.dungeonDataOffset];
		event_user(2);
	}
}
if (keyboard_check_pressed(vk_f5)) {
	with (BattleObject) { if (alliance && curHP > 0) { def = 999; sp_def = 999; curHP = 9999; } }
}
if (keyboard_check_pressed(vk_f6)) {
	global.money = 99999;
}
if (keyboard_check_pressed(vk_f7)) {
	global.eventFlags = array_create(200, 0);	
}
if (keyboard_check_pressed(vk_f8)) {
	with (BattleObject) { if (alliance && curHP > 0) { def = 1; sp_def = 1; curHP = 1; } }
}