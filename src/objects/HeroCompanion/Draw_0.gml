gpu_set_blendmode(bm_add);
for (var i=7; i>=5; i--) {
	draw_sprite_ext(
		CompanionGlow, image_index,
		coordHistory[i, 0], coordHistory[i, 1],
		2, 2, image_angle,
		image_blend, image_alpha*0.3
	);
}
gpu_set_blendmode(bm_normal);

draw_sprite_ext(Companion, image_index, x, y, 2, 2, image_angle, image_blend, image_alpha);