draw_set_color(c_black);
draw_rectangle(0, 0, 640, 480, false);

draw_sprite_ext(StaticBackground, staticSubimg, 0, 0, 1, 1, 0, c_white, 0.7);
draw_sprite_ext(StaticBackground, staticSubimg, 0, 448, 1, 1, 0, c_white, 0.7);
draw_sprite_ext(StaticBackground, staticSubimg, 512, 0, 1, 1, 0, c_white, 0.7);
draw_sprite_ext(StaticBackground, staticSubimg, 512, 448, 1, 1, 0, c_white, 0.7);

gpu_set_blendmode_ext(bm_dest_colour, bm_zero);
draw_circle_color(room_width/2, room_height/2, room_width*1.6, $000000, $FFFFFF, 0);
gpu_set_blendmode(bm_normal);

draw_sprite_ext(BGIrregular, 0, 0, 0, 2, 2, 0, c_white, 0.6);


draw_set_font(TextboxFont);
draw_set_halign(fa_center);
draw_set_color(c_white);

var at = 170;
drawTextShadowed(320, at, "An irregularity has been detected.");
drawTextShadowed(320, at+30, "Please restart the game.");
drawTextShadowed(320, at+90, "If you think you're seeing this screen by mistake,");
drawTextShadowed(320, at+120, "consider filing a bug report with detailed reproduction steps.");