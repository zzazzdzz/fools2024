
extra_alpha = 0.05 * ((anim_angle_step - 0.5)/32);

if (del) {
	anim_globalpha -= 0.02;
	if (anim_globalpha <= 0) instance_destroy();
}

gpu_set_blendmode(bm_add);
for (var c=0; c<360; c+=9){
	draw_sprite_ext(
		SprCrystal, 0,
		x + lengthdir_x(16, c),
		y + lengthdir_y(16, c) + anim_yoffset,
		2, 2,
		anim_angle, image_blend, (image_alpha*0.03 + extra_alpha) * anim_globalpha
	);
}
for (var c=0; c<360; c+=9){
	draw_sprite_ext(
		SprCrystal, 0,
		x + lengthdir_x(32, c),
		y + lengthdir_y(32, c) + anim_yoffset,
		2, 2,
		anim_angle, image_blend, (image_alpha*0.02 + extra_alpha) * anim_globalpha
	);
}
gpu_set_blendmode(bm_normal);

draw_sprite_ext(
	SprHole, ct, 
	x, y,
	2, 2, 
	0, image_blend, (image_alpha*0.9) * anim_globalpha
);