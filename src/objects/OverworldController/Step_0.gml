if (keyboard_check(vk_enter) && !instance_exists(PauseMenuController) && global.active) {
	instance_create(PauseMenuController, 0, 0);	
}