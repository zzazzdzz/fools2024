ct += 1;
depth = -1999990;

var ap = 1;
if (ct < 10) ap = 0.1*ct;
if (ct > 40) ap = 1-0.1*(ct-40);
if (ap < 0) ap = 0;

if (ct > 100) instance_destroy();

draw_set_color(c_black);
draw_set_alpha(0.6*ap);
draw_rectangle(0,0,640,480,false);
draw_set_alpha(1);
gpu_set_blendmode(bm_add);
draw_sprite_tiled_ext(SprPsychic, (ct div 3) mod sprite_get_number(SprPsychic), -ct, 0, 2, 2, c_white, 1 * ap);
gpu_set_blendmode(bm_normal);