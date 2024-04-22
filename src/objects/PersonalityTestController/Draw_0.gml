
if (drawBackground) {
	draw_sprite_ext(StaticBackground, staticSubimg, 0, 0, 1, 1, 0, c_white, 0.8);
	draw_sprite_ext(StaticBackground, staticSubimg, 0, 448, 1, 1, 0, c_white, 0.8);
	draw_sprite_ext(StaticBackground, staticSubimg, 512, 0, 1, 1, 0, c_white, 0.8);
	draw_sprite_ext(StaticBackground, staticSubimg, 512, 448, 1, 1, 0, c_white, 0.8);
	gpu_set_blendmode_ext(bm_dest_colour, bm_zero);
	draw_circle_color(room_width/2, room_height/2, room_width*1.6, $000000, $FFFFFF, 0);
	gpu_set_blendmode(bm_normal);
}

if (drawFlash) {
	gpu_set_blendmode(bm_add);
	draw_set_alpha(pause/80);
	draw_circle_color(room_width/2, room_height/2, room_width+200*pause, $FFFFFF, $000000, 0);
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
}

if (drawPortrait) {
	var portraitIds = [Portrait0004, Portrait0007, Portrait0001];
	var p = 80;
	var xoffs = 10;
	drawTextboxBorder(320-p/2-sw+portraitXOffs, 240-p/2-sh+portraitYOffs, p+sw+sw-4, p+sh+sh-4);
	draw_sprite_ext(portraitIds[finalResult], 1, 320-p/2-2+portraitXOffs, 240-p/2-2+portraitYOffs, 2, 2, 0, c_white, 1);
}