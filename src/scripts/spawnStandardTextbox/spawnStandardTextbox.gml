function spawnStandardTextbox(tx, portrait=noone){
	txno = instance_number(TextboxController);
	inst = instance_create_depth(10, 480-112-10, -100000-txno, TextboxController);
	with (inst) {
		x = 10;
		y = 480-106-10;
		t_w = 620;
		t_h = 106;
		t_type = "textbox";
		t_text = tx;
		t_portrait = portrait;
		event_user(0); // reload text vars
	}
	return inst;
}