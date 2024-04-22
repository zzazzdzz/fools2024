function spawnNamingTextbox(hdr, l){
	txno = instance_number(TextboxController);
	inst = instance_create_depth(10, 180, -100000-txno, TextboxController);
	with (inst) {
		maxLen = l;
		t_w = 550;
		x = 640/2 - t_w/2;
		t_text = hdr;
		t_type = "naming";
		event_user(0); // reload text vars
		t_h = 110 + (11-1) * 30;
		y = 240-55-(11-1)*15;
	}
	return inst;
}