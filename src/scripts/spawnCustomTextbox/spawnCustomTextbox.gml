function spawnCustomTextbox(tp, _x=-1, _y=-1, _w=-1, _h=-1, _t=""){
	txno = instance_number(TextboxController);
	inst = instance_create_depth(10, 180, -100000-txno, TextboxController);
	with (inst) {
		t_w = _w > 0 ? _w : 550;
		x = _x > 0 ? _x : (640/2 - t_w/2);
		t_text = _t;
		t_type = tp;
		t_h = _h > 0 ? _h : (110 + (11-1) * 30);
		y = _y > 0 ? _y : (240-55-(11-1)*15);
		event_user(0); // reload text vars
	}
	return inst;
}