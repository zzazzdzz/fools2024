if (animAsset == AnimHeal || animAsset == AnimFeint) {
	depth = 999;	
} else {
	depth = -999999;
}

var offs = round((ct div 2) * animSpeed);
if (maxFrames == 0) maxFrames = sprite_get_number(animAsset);
if (offs >= maxFrames) {
	instance_destroy();	
} else {
	draw_sprite_ext(animAsset, offs, x, y, 2, 2, 0, animRenderColor, 1);
}
ct += 1;