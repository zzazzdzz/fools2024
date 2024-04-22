
if (a < targetA) {
	a += 0.03;	
}
if (a >= targetA) {
	a -= 0.03;	
}

ct += 1;

/*
if (textSound) {
	if (ct mod 3 == 0) {
		var t = audio_play_sound(TextboxSoundDef, 1, 0);	
		audio_sound_gain(t, 0.4, 0);
	}
}
*/

depth = -22;

draw_sprite_ext(StaticBackground, staticSubimg, 0, 0, 1, 1, 0, c_white, 0.8);
draw_sprite_ext(StaticBackground, staticSubimg, 0, 448, 1, 1, 0, c_white, 0.8);
draw_sprite_ext(StaticBackground, staticSubimg, 512, 0, 1, 1, 0, c_white, 0.8);
draw_sprite_ext(StaticBackground, staticSubimg, 512, 448, 1, 1, 0, c_white, 0.8);
gpu_set_blendmode_ext(bm_dest_colour, bm_zero);
draw_circle_color(room_width/2, room_height/2, room_width*2.5, $000000, $FFFFFF, 0);
gpu_set_blendmode(bm_normal);