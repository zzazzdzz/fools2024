function spawnChoiceTextbox(tx, xx = -1, yy = -1, woverride = 0){
	global.lastResult = RESULT_NONE;
	txno = instance_number(TextboxController);
	inst = instance_create_depth(10, 480-112-10, -100000-txno, TextboxController);
	with (inst) {
		x = 10;
		y = 10;
		t_w = 620;
		t_h = 112;
		t_type = "choice";
		t_text = tx;
		event_user(0); // reload text vars
		draw_set_font(TextboxFont);
		t_w = string_width(textConvertNewlines(tx)) + 75;
		if (woverride > 0) t_w = woverride;
		t_h = 34 + optionCount * 36;
		if (xx == -1) xx = 640 - t_w - 10;
		if (yy == -1) yy = 480-112-10-6-34-optionCount*36;
		x = xx;
		y = yy;
		xyViewAdjusted = false
		event_user(0); // reload text vars again
	}
	return inst;
}