
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

gscroll -= 2;
if (gscroll < -3200) gscroll += 3200;

draw_sprite_ext(BGGlitch, 0, gscroll, 0, 2, 2, 0, c_white, 0.4);
draw_sprite_ext(BGGlitch, 0, gscroll+3200, 0, 2, 2, 0, c_white, 0.4);
draw_sprite_ext(BGGlitch, 0, gscroll-1600, 288, 2, 2, 0, c_white, 0.4);
draw_sprite_ext(BGGlitch, 0, gscroll+3200-1600, 288, 2, 2, 0, c_white, 0.4);

draw_sprite_ext(StaticBackground, staticSubimg, 0, 0, 1, 1, 0, c_white, 0.2);
draw_sprite_ext(StaticBackground, staticSubimg, 0, 448, 1, 1, 0, c_white, 0.2);
draw_sprite_ext(StaticBackground, staticSubimg, 512, 0, 1, 1, 0, c_white, 0.2);
draw_sprite_ext(StaticBackground, staticSubimg, 512, 448, 1, 1, 0, c_white, 0.2);

var offs = sin(ct/40)*10;
draw_sprite_ext(SprLord, 0, 320, 110+offs, 1, 1, 0, c_white, 1);