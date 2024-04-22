ctr += 1;

var shift = sin(((ctr%52)/52) * pi);
var intr = min(ctr/10, 1);

if (destruct == 0) draw_set_alpha(intr*0.3+shift*0.1);
else draw_set_alpha((1-0.1*destruct)*0.3+shift*0.1);
if (sprite_exists(spr)) draw_sprite(spr, 0, src_x, src_y);
draw_set_alpha(1);

if (destruct != 0) {
	destruct += 1
	if (destruct > 8) instance_destroy();
}