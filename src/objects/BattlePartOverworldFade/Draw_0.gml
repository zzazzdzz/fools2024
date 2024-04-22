ct += 1;
depth = -101;

aa += 0.01;
if (aa > 1) aa = 1;

draw_set_color(c_black);
draw_set_alpha(aa);
draw_rectangle(0,0,640,480,false);
draw_set_alpha(1);