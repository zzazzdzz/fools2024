if (fin) exit;

if (!logView) {
	draw_set_font(TextboxFont);
	drawTextboxBorder(x, y, t_w, t_h);

	draw_set_color(c_gray);
	draw_rectangle(x+24, y+55, x+t_w-24, y+56, false);
	draw_rectangle(x+24, y+164, x+t_w-24, y+165, false);
	draw_rectangle(x+24, y+310, x+t_w-24, y+311, false);
	draw_set_color(c_white);
	draw_rectangle(x+24, y+57, x+t_w-24, y+58, false);
	draw_rectangle(x+24, y+166, x+t_w-24, y+167, false);
	draw_rectangle(x+24, y+312, x+t_w-24, y+313, false);
	
	var c = "6";
	if (0 == 0) c = "3";

	draw_set_halign(fa_right);
	//drawTextShadowed(x+t_w-24, y+24, "Lv. " + string(global.teamMembers[0].lv));
	draw_set_halign(fa_center);
	draw_set_color(makeStdCol(3));
	drawTextShadowed(x+t_w/2, y+24, "The Last Outing");
	draw_set_halign(fa_left);

	drawTextAttributedExt(x+t_w/2-wts[0]/2, y+70, txs[0]);
	drawTextAttributedExt(x+t_w/2-wts[1]/2, y+100, txs[1]);
	drawTextAttributedExt(x+t_w/2-wts[2]/2, y+130, txs[2]);

	drawTextExt(x+24, y+180, "@4Member");
	drawTextExt(x+190, y+180, "@4Level");
	drawTextExt(x+270, y+180, "@4D.Dealt");
	drawTextExt(x+360, y+180, "@4D.Taken");
	drawTextExt(x+450, y+180, "@4D.Healed");

	drawTextExt(x+24, y+210, "@3" + global.teamMembers[0].name);
	drawTextExt(x+190, y+210, "@0Lv. " + string(global.teamMembers[0].lv));
	drawTextExt(x+270, y+210, "@7" + string(global.battleStats[0][0]));
	drawTextExt(x+360, y+210, "@8" + string(global.battleStats[0][1]));
	drawTextExt(x+450, y+210, "@9" + string(global.battleStats[0][2]));

	if (array_length(global.teamMembers) >= 2) {
		drawTextExt(x+24,  y+240, "@6" + global.teamMembers[1].name);
		drawTextExt(x+190, y+240, "@0Lv. " + string(global.teamMembers[1].lv));
		drawTextExt(x+270, y+240, "@7" + string(global.battleStats[1][0]));
		drawTextExt(x+360, y+240, "@8" + string(global.battleStats[1][1]));
		drawTextExt(x+450, y+240, "@9" + string(global.battleStats[1][2]));
	} else {
		drawTextExt(x+24,  y+240, "@4-");
		drawTextExt(x+190, y+240, "@4-");
		drawTextExt(x+270, y+240, "@4-");
		drawTextExt(x+360, y+240, "@4-");
		drawTextExt(x+450, y+240, "@4-");
	}

	if (array_length(global.teamMembers) >= 3) {
		drawTextExt(x+24,  y+270, "@6" + global.teamMembers[2].name);
		drawTextExt(x+190, y+270, "@0Lv. " + string(global.teamMembers[2].lv));
		drawTextExt(x+270, y+270, "@7" + string(global.battleStats[2][0]));
		drawTextExt(x+360, y+270, "@8" + string(global.battleStats[2][1]));
		drawTextExt(x+450, y+270, "@9" + string(global.battleStats[2][2]));
	} else {
		drawTextExt(x+24,  y+270, "@4-");
		drawTextExt(x+190, y+270, "@4-");
		drawTextExt(x+270, y+270, "@4-");
		drawTextExt(x+360, y+270, "@4-");
		drawTextExt(x+450, y+270, "@4-");
	}

	draw_set_color(c_white);
	drawTextExt(x+24, y+325, "@9[" + chr(global.keybinds[0]) + "]@0: Continue / @9[" + chr(global.keybinds[1]) + "]@0: Battle log");
	draw_set_halign(fa_right);
	drawTextShadowed(x+t_w-24, y+325, "Total turns: " + string(global.battleStats[3][0]));
	draw_set_halign(fa_left);
}

else {
	draw_set_font(TextboxFont);
	drawTextboxBorder(x, y, t_w, t_h);

	draw_set_color(c_gray);
	draw_rectangle(x+24, y+55, x+t_w-24, y+56, false);
	draw_set_color(c_white);
	draw_rectangle(x+24, y+57, x+t_w-24, y+58, false);
	
	draw_set_halign(fa_right);
	//drawTextShadowed(x+t_w-24, y+24, "Lv. " + string(global.teamMembers[0].lv));
	draw_set_halign(fa_center);
	draw_set_color(makeStdCol(3));
	drawTextShadowed(x+t_w/2, y+24, "The Last Outing");
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	var ct = 0;
	for (var i=LOG_ENTS_PER_SCREEN; i>=0; i--) {
		var idx = logLength-i-1-logPaging;
		if (idx < 0) continue;
		drawTextAttributedExt(x+24, y+77+30*ct, textToAttributed(global.battleLog[idx]));
		ct++;
	}
}