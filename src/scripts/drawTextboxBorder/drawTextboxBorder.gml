function drawTextboxBorder(tx, ty, tw, th){
	var sw = sprite_get_width(TextboxBorders);
	var sh = sprite_get_height(TextboxBorders);
	var hw = sprite_get_width(TextboxHeaders);

	draw_set_color(make_color_rgb(16,16,16));
	draw_set_alpha(0.9);
	draw_rectangle(tx+sw-4, ty+sh-4, tx+tw-sw+4, ty+th-sh+4, false);
	draw_set_alpha(1);

	draw_sprite_stretched(TextboxBordersOpaque, 4, tx+sw-2, ty, tw-2*sw+4, sh);
	draw_sprite_stretched(TextboxBordersOpaque, 4, tx+sw-2, ty+th-sh, tw-2*sw+4, sh);
	draw_sprite_stretched(TextboxBordersOpaque, 5, tx, ty+sh-2, sw, th-2*sh+4);
	draw_sprite_stretched(TextboxBordersOpaque, 5, tx+tw-sw, ty+sh-2, sw, th-2*sh+4);

	draw_sprite(TextboxBorders, 0, tx, ty);
	draw_sprite(TextboxBorders, 1, tx+tw-sw, ty);
	draw_sprite(TextboxBorders, 2, tx, ty+th-sh);
	draw_sprite(TextboxBorders, 3, tx+tw-sw, ty+th-sh);
}