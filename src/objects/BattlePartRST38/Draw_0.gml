ct += 1;
depth = -1999990;

var ap = 1;
if (ct < 10) ap = 0.1*ct;
if (ct > 40) ap = 1-0.1*(ct-40);
if (ap < 0) ap = 0;

if (ct > 100) instance_destroy();

var qq = (ct div 10) % 2;
if (qq == 0) draw_sprite_tiled_ext(SprRst38, 0, 0, 0, 2, 2, c_white, 0.6 * ap);