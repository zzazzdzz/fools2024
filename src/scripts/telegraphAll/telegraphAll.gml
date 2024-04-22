// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// ["rect", xpos, ypos, w, h, 0, 0, 0]
// ["circle", xpos, ypos, 0, 0, radius, 0, 0]
// ["donut", xpos, ypos, 0, 0, outer_radius, inner_radius, 0]
// ["cone", xpos, ypos, 0, 0, cone_dist, cone_width, direction]
// ["line", xpos, ypos, 0, 0, line_dist, line_width, direction]

function telegraphAll() {}

function telegraphCreate(){
	return instance_create(BattleTelegraph, 0, 0);
}

function telegraphPush(o, t, ox, oy, w, h, r, q, d) {
	o.type = t;
	o.ox = ox;
	o.oy = oy;
	o.w = w;
	o.h = h;
	o.r = r;
	o.q = q;
	o.d = d;
	with (o) event_user(0);
}
