function drawTextAttributedExt(tx, ty, text, nldist=40){
	// 40 dist nl
	draw_set_font(global.fontAssets[t_fontid]);
	len = string_length(text);
	xoffset = 0;
	yoffset = 0;
	text_color = c_white;
	for (_i=1; _i<=len; _i+=2) {
		attr = string_char_at(text, _i);
		char = string_char_at(text, _i+1);		
		char_code = ord(char);
		should_draw = true;
		if (char == "\n") {
			yoffset += nldist;
			xoffset = 0;
			continue;
		}
		//0white, 1move blue, 2npc yellow, 3leader blue, 4gray, 5enemy light red, 6partner pink, 7atkred, 8defblue, 9supgreen
		if (attr == "0") {
			text_color = c_white;
		}
		if (attr == "1") {
			text_color = c_hero;
		}
		if (attr == "2") {
			text_color = c_companion;
		}
		if (attr == "3") {
			text_color = make_color_rgb(0,136,255);
		}
		if (attr == "4") {
			text_color = make_color_rgb(122,122,122);
		}
		if (attr == "5") {
			text_color = make_color_rgb(255,80,80);
		}
		if (attr == "6") {
			text_color = make_color_rgb(255,128,192);
		}
		if (attr == "7") {
			text_color = make_color_rgb(255,98,98);
		}
		if (attr == "8") {
			text_color = make_color_rgb(98,98,255);
		}
		if (attr == "9") {
			text_color = make_color_rgb(98,255,98);
		}
		if (attr == "Q") {
			text_color = make_color_rgb(255,198,98);
		}
		if (attr == "A") {
			xoffset += (char_code - 0x41) * 4;
			should_draw = false;
		}
		if (attr == "C") {
			xoffset += 26;
			should_draw = false;
		}
		if (attr == "B") {
			yoffset += (char_code - 0x41) * 4;
			should_draw = false;
		}
		if (attr == "T") {
			xoffset = (char_code - 0x41) * 80;
			should_draw = false;
		}
		if (attr == "F") {
			t_fontid = char_code - 0x41;
			draw_set_font(global.fontAssets[t_fontid]);
			should_draw = false;
		}
		if (attr == "I") {
			draw_sprite(TextGoIcon, 0, tx + xoffset, ty + yoffset + 3);
			xoffset += 26;
			should_draw = false;
		}
		if (attr == "P") {
			draw_sprite(TextMoneyIcon, 0, tx + xoffset + 2, ty + yoffset + 1);
			xoffset += 28;
			should_draw = false;
		}
		if (attr == "G") {
			draw_set_color(c_dkgray);
			draw_rectangle(tx + xoffset + 2, ty + yoffset + 4, tx + xoffset + 18, ty + yoffset + 20, false);
			draw_set_color(c_companion);	
			draw_rectangle(tx + xoffset, ty + yoffset + 2, tx + xoffset + 16, ty + yoffset + 18, false);
			xoffset += 20;
			should_draw = false;
		}
		if (attr == "L") {
			draw_set_color(c_dkgray);
			draw_rectangle(tx + xoffset + 2, ty + yoffset + 4, tx + xoffset + 18, ty + yoffset + 20, false);
			draw_set_color(c_hero);	
			draw_rectangle(tx + xoffset, ty + yoffset + 2, tx + xoffset + 16, ty + yoffset + 18, false);
			xoffset += 20;
			should_draw = false;
		}
		if (should_draw) {
			if (char == "%") {
				char = "e";
				char_code = ord(char);
				draw_sprite(TextAcute, 0, tx + xoffset - 1, ty + yoffset + 7);
			}
			if (char == "`") {
				char = "A";
				char_code = ord(char);
				draw_sprite(TextAcute, 0, tx + xoffset + 1, ty + yoffset + 3);
			}
			if (char == "~") char = "%";
			draw_set_color(c_dkgray);
			draw_text(tx + xoffset + 2, ty + yoffset + 2, char);
			draw_set_color(text_color);	
			draw_text(tx + xoffset, ty + yoffset, char);
			xoffset += global.charWidths[t_fontid][char_code];
		}
	}
}