depth = -10 - y;

if (del) {
	aa -= 0.035;
	if (aa < 0) instance_destroy();
}

ct += 1;
var offs1 = ((ct div 4) % 2);
var offs2 = (((ct div 4)+1) % 2);
if (struck) draw_sprite_ext(SprIce, 0, x + offs1*2, y, 2, 2, 0, c_white, aa);
else draw_sprite_ext(SprIce, 0, x, y, 2, 2, 0, c_white, aa);