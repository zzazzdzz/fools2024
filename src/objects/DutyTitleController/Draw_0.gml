draw_set_halign(fa_center);
draw_set_font(HeaderFont);

var c1 = make_color_rgb(255, 255, 255);
var c2 = make_color_rgb(255, 255, 120);
var c3 = make_color_rgb(255, 255, 120);
var c4 = make_color_rgb(255, 255, 120);

draw_set_color(c_black);
draw_set_alpha(0.3);
draw_rectangle(0+rp, 167, 640+rp, 307, false);
draw_set_alpha(1);

draw_set_color(c_black);
draw_set_alpha(a1);
draw_text(322, 197, "- " + global.dungeonDb[global.curDungeonId][3] + " -");
draw_set_alpha(1);
draw_set_color(c_white);
draw_text_color(320, 195, "- " + global.dungeonDb[global.curDungeonId][3] + " -", c1, c2, c3, c4, a1);

draw_set_font(DutyTitleFont);

draw_set_color(c_black);
draw_set_alpha(a2);
draw_text(322, 242, global.dungeonDb[global.curDungeonId][0]);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text_color(320, 240, global.dungeonDb[global.curDungeonId][0], c1, c2, c3, c4, a2);

draw_set_halign(fa_left);