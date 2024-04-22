function spawnIntermissionTextbox(tx){
	txno = instance_number(TextboxController);
	inst = instance_create_depth(10, 480-112-10, -100000-txno, TextboxController);
	with (inst) {
		x = 10;
		y = 170;
		t_w = 620;
		t_h = 112;
		t_type = "intermission";
		t_text = tx;
		event_user(0); // reload text vars
	}
	return inst;
}