// push a telegraph

// bring back the surface from sprite
surf = surface_create(room_width, room_height);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_sprite(spr, 0, src_x, src_y);

// draw new telegraphs
if (type == "rect") {
	draw_set_color(c_red);
	draw_rectangle_color(ox, oy, ox+w, oy+h, c1, c2, c3, c3, false);
	draw_set_color(c_white);
}

if (type == "circle") {
	draw_circle_color(ox, oy, r, c1, c3, false);
}

if (type == "donut") {
	draw_circle_color(ox, oy, r, c1, c3, false);
	gpu_set_blendmode(bm_subtract);
	draw_circle_color(ox, oy, q, c_white, c_white, false);
	gpu_set_blendmode(bm_normal);
}

if (type == "cone") {
	// d:direction, r:cone_dist, q:cone_width
	var end_x = ox + lengthdir_x(r, d);
	var end_y = oy + lengthdir_y(r, d);
	var x2 = end_x + lengthdir_x(q, d-90);
	var y2 = end_y + lengthdir_y(q, d-90);
	var x3 = end_x + lengthdir_x(q, d+90);
	var y3 = end_y + lengthdir_y(q, d+90);
	draw_triangle_color(ox, oy, x2, y2, x3, y3, c1, c2, c3, false);
}

if (type == "line") {
	// d:direction, r:line_dist, q:line_width
	var stx1 = ox + lengthdir_x(q, d-90);
	var sty1 = oy + lengthdir_y(q, d-90);
	var stx2 = ox + lengthdir_x(q, d+90);
	var sty2 = oy + lengthdir_y(q, d+90);
	var stx3 = stx1 + lengthdir_x(r, d);
	var sty3 = sty1 + lengthdir_y(r, d);
	var stx4 = stx2 + lengthdir_x(r, d);
	var sty4 = sty2 + lengthdir_y(r, d);
	draw_triangle_color(stx2, sty2, stx1, sty1, stx3, sty3, c1, c2, c3, false);
	draw_triangle_color(stx3, sty3, stx4, sty4, stx2, sty2, c3, c2, c1, false);
}

// save surface to sprite
sprite_delete(spr);
spr = sprite_create_from_surface(surf, 0, 0, room_width, room_height, false, false, src_x, src_y);

surface_reset_target();
surface_free(surf);