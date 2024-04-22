/// @description Insert description here
// You can write your code in this editor

var digs = abs(amount);
tick += 1;

var eff_y = y-28-tick/3;
//draw_set_alpha(1.4 - tick/34);

if (amount >= 0) {
	if (digs < 10) {
		draw_sprite(SprDmgNumbers, 10, x-6, eff_y);
		draw_sprite(SprDmgNumbers, (digs), x+7, eff_y);
	}
	else if (digs < 100) {
		draw_sprite(SprDmgNumbers, 10, x-13, eff_y);
		draw_sprite(SprDmgNumbers, (floor(digs/10)), x, eff_y);
		draw_sprite(SprDmgNumbers, (digs%10), x+14, eff_y);
	}
	else {
		draw_sprite(SprDmgNumbers, 10, x-21, eff_y);
		draw_sprite(SprDmgNumbers, (floor(digs/100)%10), x-6, eff_y);
		draw_sprite(SprDmgNumbers, (floor(digs/10)%10), x+7, eff_y);
		draw_sprite(SprDmgNumbers, (digs%10), x+21, eff_y);
	}
	draw_set_alpha(1);
} else {
	if (digs < 10) {
		draw_sprite(SprDmgNumbers, 21, x-6, eff_y);
		draw_sprite(SprDmgNumbers, 11+(digs), x+7, eff_y);
	}
	else if (digs < 100) {
		draw_sprite(SprDmgNumbers, 21, x-13, eff_y);
		draw_sprite(SprDmgNumbers, 11+(floor(digs/10)), x, eff_y);
		draw_sprite(SprDmgNumbers, 11+(digs%10), x+14, eff_y);
	}
	else {
		draw_sprite(SprDmgNumbers, 21, x-21, eff_y);
		draw_sprite(SprDmgNumbers, 11+(floor(digs/100)%10), x-6, eff_y);
		draw_sprite(SprDmgNumbers, 11+(floor(digs/10)%10), x+7, eff_y);
		draw_sprite(SprDmgNumbers, 11+(digs%10), x+21, eff_y);
	}
	draw_set_alpha(1);
}