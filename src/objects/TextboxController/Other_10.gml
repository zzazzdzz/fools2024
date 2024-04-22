textContentLen = string_length(t_text);

if (string_char_at(t_text, 1) == "\\" && string_char_at(t_text, 2) == "p") {
	t_portrait[1] = unhex(string_char_at(t_text, 4));
}

if (!xyViewAdjusted) {
	if (room == OverworldRoom) {
		x += camera_get_view_x(view_camera[0]);
		y += camera_get_view_y(view_camera[0]);
	}
	xyViewAdjusted = true;
}

if (t_type == "choice" || t_type == "condensedchoice" || t_type == "gridchoiceheadered" || t_type == "basicheadered"){
    textContent = textToAttributed(t_text);
    optionCount = string_count("#", t_text) + 1;
	optionsSeparado = string_split(t_text, "#");
	fontXoffset = 24;
    cursorPos = 0;
}

if (t_type == "basic" || t_type == "basic_center") {
    textContent = textToAttributed(t_text);
}

if (t_type == "battlequeue") {
	global.scratch = 0;
	with (BattleObject) {
		global.scratch = max(global.scratch, array_length(effects));
	}
	if (global.scratch == 0) t_w = 300 + 20;
	else t_w = 321 + 20 + 26 * global.scratch;
	t_h = 40 + 30 * array_length(global.battleQueue);
}

draw_set_font(TextboxFont);
t_cw = string_width(textClearAttr(t_text));