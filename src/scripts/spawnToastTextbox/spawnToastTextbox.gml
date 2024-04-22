function spawnToastTextbox(tx){
	txno = instance_number(TextboxController);
	inst = instance_create_depth(10, 480-112-10, -100000-txno, TextboxController);
	with (inst) {
		x = 10;
		y = 10;
		t_text = textClearAttr(tx);
		draw_set_font(TextboxFont);
		t_w = string_width(t_text) + 100;
		t_h = 60;
		t_type = "toast";
		t_textattr = textToAttributed(tx);
		event_user(0); // reload text vars
	}
	return inst;
}