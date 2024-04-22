ct += 1;

depth = -9;

if (ct < 30) {
	alpha = ct/30;
}
if (ct > 130) {
	alpha = (30-(ct-130))/30;
	beamAlpha = (30-(ct-130))/30;
}
if (ct > 160) instance_destroy();

draw_set_color(c_black);
draw_set_alpha(max(0, min(1, alpha)));
draw_rectangle(0, 0, 640, 480, false);

var xoffs = 0//lengthdir_x(15, pdir);
var yoffs = 0//lengthdir_y(15, pdir);

var shakiesX = ((ct div 2)%2) * lengthdir_x(6, pdir+90);
var shakiesY = ((ct div 2)%2) * lengthdir_y(6, pdir+90);

if (ct == 50) {
	sound_play(FightSFXHyperBeam);
	beamAlpha = 1;
}

draw_sprite_ext(AnimHyperBeam, 0, x+xoffs+shakiesX, y+yoffs+shakiesY, 5, 3, pdir, c_white, beamAlpha);