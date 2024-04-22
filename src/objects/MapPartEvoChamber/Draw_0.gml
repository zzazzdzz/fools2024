
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

depth = -3999;
draw_sprite_ext(SprEvoChamberEffects, 0, 0, 90, 2, 2, 0, c_white, 0.6 * a);

var numBeams = 16;
var ang = 360/numBeams;
for (var i=0; i<numBeams; i++) {
	draw_sprite_ext(SprEvoChamberEffects, 1, 320, 90, 3, 1, ang*i + ct*0.5, c_white, 0.05 * a);
}

draw_sprite_ext(SprEvoChamberEffects, 2, 0, 300, 2, 2, 0, c_white, 1);