function spawnCondensedChoiceTextbox(tx, xx = -1, yy = -1){
	txno = instance_number(TextboxController);
	inst = instance_create_depth(10, 480-112-10, -100000-txno, TextboxController);
	with (inst) {
		x = 10;
		y = 10;
		t_w = 620;
		t_h = 112;
		t_type = "condensedchoice";
		t_text = tx;
		event_user(0); // reload text vars
		draw_set_font(TextboxFont);
		t_w = string_width(textConvertNewlines(tx)) + 75;
		t_h = 40 + optionCount * 30;
		if (xx == -1) xx = 640 - t_w - 10;
		if (yy == -1) yy = 480-112-10-10-32-optionCount*40;
		x = xx;
		y = yy;
	}
	return inst;
}