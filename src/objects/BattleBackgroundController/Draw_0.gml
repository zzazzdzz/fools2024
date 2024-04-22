draw_set_alpha(1);

bepis += 0.1;

for (var j=0; j<10; j++) {
	for (var i=0; i<15; i++) {
		draw_set_color(c_white);
		draw_tile(tilesetAsset, global.tileMap[j*15+i]-1, 0, i*48+8-48+xoffs, j*48+yoffs);
		
		/*
		var al = (sin((i+j+bepis)*0.3)+1)/2;
		draw_set_color(c_white);
		draw_set_alpha(0.2*al);
		draw_rectangle(i*48+8-48, j*48, i*48+8-48+48, j*48+48, false);
		draw_set_alpha(0.15*al);
		draw_rectangle(i*48+8-48, j*48, i*48+8-48+48, j*48+48, true);
		draw_rectangle(i*48+8-48+1, j*48+1, i*48+8-48+48-1, j*48+48-1, true);
		*/
		draw_set_alpha(1);
	}
}

draw_set_color(c_white);