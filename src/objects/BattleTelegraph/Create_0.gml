/// @description Insert description here
// You can write your code in this editor
w = 200;
h = 100;
q = 40;
r = 350;
d = 12;
ox = 0;
oy = 0;

type = "line";

depth = 0;
ctr = 0;

c1 = make_color_rgb(255,0,0);
c2 = make_color_rgb(255,60,60);
c3 = make_color_rgb(200,0,0);

src_x = global.battleCurrentObj.x;
src_y = global.battleCurrentObj.y;

surf = surface_create(room_width, room_height);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
surface_reset_target();
spr = sprite_create_from_surface(surf, 0, 0, room_width, room_height, false, false, src_x, src_y);
surface_free(surf);

destruct = 0;
includeObjs = false;