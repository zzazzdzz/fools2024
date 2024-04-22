if (drawCompendium) {
	var ox = camera_get_view_x(view_camera[0]);
	var oy = camera_get_view_y(view_camera[0]);
	
	var compData = getCompendiumData();
	var specList = compData[0];
	var bossList = compData[1];
	var compFound = compData[2];
	var compMax = compData[3];
	
	drawTextboxBorder(ox+15, oy+15+40, 640-30, 480-30-45);
    draw_sprite(CompendiumHeader, 0, ox+15, oy+15+40+10);
	draw_set_font(HeaderFont);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
    drawTextShadowed(ox+15+hw/2+2, oy+15+22, "Compendium: "+string(compFound)+" /"+string(compMax));
	draw_set_halign(fa_left);
	
	for (var i=0; i<array_length(specList); i++) {
		var c = c_white;
		if (!variable_struct_exists(global.compendiumData, "m"+specList[i])) c = make_color_rgb(10, 10, 10);
		var xx = 64 + (i mod 9)*64;	
		var yy = 75 + (i div 9)*64 + 40;	
		draw_sprite_ext(asset_get_index("SpriteSet"+specList[i]), 0, ox+xx, oy+yy, 2, 2, 0, c, 1);
	}
	
	for (var i=0; i<array_length(bossList); i++) {
		var idx = i;
		if (!variable_struct_exists(global.compendiumData, "m"+bossList[i])) idx = 6;
		draw_sprite_ext(BossIcons, idx, ox+375+i*34, oy+403, 2, 2, 0, c_white, 1);
	}
}