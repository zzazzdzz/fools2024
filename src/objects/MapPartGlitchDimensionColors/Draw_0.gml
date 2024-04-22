depth = -999999;

var tbl = [1,1,0,0,1,1,1,0,0,1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,0,0];
var r = 1;
if (ct < array_length(tbl)) r = tbl[ct];
ct += 1;
if (ct > 150) r=0;

var rect_w = 300;
var rect_h = 220;
var rect_boffs = 128;

var off_by_one = 0;
if (os_browser == browser_not_a_browser) off_by_one = 1;

if (r == 1) {
	gpu_set_blendmode_ext(bm_dest_colour, bm_zero);
	draw_set_color(make_color_rgb(55, 55, 255));
	draw_rectangle(640-rect_w, 0, 640-off_by_one, rect_h-off_by_one, false);
	draw_set_color(make_color_rgb(255, 55, 55));
	draw_rectangle(0, 480-rect_h-rect_boffs, rect_w-off_by_one, 480-rect_boffs-off_by_one, false);
	draw_rectangle(0, 480-rect_boffs, 640-off_by_one, 480-off_by_one, false);
	draw_set_color(make_color_rgb(55, 255, 55));
	draw_rectangle(0, 0, rect_w-off_by_one, 480-rect_boffs-rect_h-off_by_one, false);
	draw_rectangle(640-rect_w, rect_h, 640-off_by_one, 480-rect_boffs-off_by_one, false);
	draw_rectangle(rect_w, 0, 640-rect_w-off_by_one, 480-rect_boffs-off_by_one, false);
	gpu_set_blendmode(bm_normal);
}


if (ct > 60 && ct < 330) {
	draw_set_color(c_white);
	draw_set_alpha(min(1, (ct-60)/60));
	draw_rectangle(0, 0, 640, 480, false);
}

if (ct > 210 && ct < 280) {
	draw_sprite_ext(ResetTitle, 0, 640/2, 480/2, 3, 3, 0, c_white, 1);
}

if (ct > 329) {
	draw_set_color(c_white);
	draw_set_alpha(max(0, 1-(ct-330)/20));
	draw_rectangle(0, 0, 640, 480, false);
}

if (ct > 410) instance_destroy();
