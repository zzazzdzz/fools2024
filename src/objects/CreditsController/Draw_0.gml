if (dispSkipMsg) {
	if (skipMessage > 0) {
		if (skipMessage < 30) {
			draw_set_alpha((30-skipMessage)/30.0);
		} else {
			draw_set_alpha(1);	
		}
		draw_set_font(HeaderFont);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_color(c_dkgray);
		draw_text(10, 10, chr(global.keybinds[0])+" or "+chr(global.keybinds[1]) + " to skip");
		//skipMessage -= 1;	
	}
}

if (creditsMode == -1) {
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}

if (creditsMode == CREDITSMODE_SINGLELINE) {
	if (tick < 30) {
		draw_set_alpha(tick/30);	
	}
	else if (tick > (creditsData[creditsIdx][2]+29)) {
		draw_set_alpha(0);
		creditsMode = 0;	
	}
	else if (tick > creditsData[creditsIdx][2]) {
		draw_set_alpha((30-(tick-creditsData[creditsIdx][2]))/30);	
	}
	else draw_set_alpha(1);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_font(TextboxFont);
	draw_set_color(c_white);
	creditsData[creditsIdx][1](320, 240);	
	draw_set_alpha(1);
}

if (creditsMode == CREDITSMODE_SCROLLING) {
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_font(TextboxFont);
	draw_set_color(c_white);
	var yy = 490-(tick div 3);
	creditsData[creditsIdx][1](320, yy);
	//draw_text(55, 55, string(yy));
	if (yy < -3250) {
		skipped = true;
		alarm[1] = 100;
		creditsMode = -1;
		dispSkipMsg = false;
	}
}

tick += 1;