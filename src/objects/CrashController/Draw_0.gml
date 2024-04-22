draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_font(MonospaceFontSmall);
draw_text_ext(320, 240+40, global.bugcheckMessage, 10, 550);

draw_sprite(CrashDecal, 0, 320, 240-40);