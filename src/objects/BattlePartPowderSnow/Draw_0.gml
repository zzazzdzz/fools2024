ct += 1;
depth = -1999990;

var ap = 1;
if (ct < 10) ap = 0.1*ct;
if (ct > 40) ap = 1-0.1*(ct-40);
if (ap < 0) ap = 0;

if (ct > 100) instance_destroy();

draw_sprite_tiled_ext(SprPowderSnow, (ct div 3) mod sprite_get_number(SprPowderSnow), 0, 0, 2, 2, c_white, 1 * ap);