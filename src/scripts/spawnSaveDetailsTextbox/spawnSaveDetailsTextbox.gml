function spawnSaveDetailsTextbox(at_x, at_y){
	txno = instance_number(TextboxController);
	inst = instance_create_depth(10, 480-112-10, -100000-txno, TextboxController);
	with (inst) {
		x = at_x;
		y = at_y;
		t_w = 400;
		t_h = 240;
		t_type = "savedata";
		event_user(0); // reload text vars
	}
}