draw_set_alpha(1);
draw_set_color(c_white);

function draw_tile_or_keyhole(ts, tid, fr, xx, yy) {
	if (tid == TILE_KEY-1) {
		draw_tile(ts, 8, fr, xx, yy);
		draw_sprite_ext(SprKeyhole, 0, xx, yy, 2, 2, 0, c_white, 1);
	}
	else draw_tile(ts, tid, fr, xx, yy);
}

// draw current chunk
for (var j=1; j<tW-1; j++) {
	for (var i=1; i<tH-1; i++) {
		draw_tile_or_keyhole(tilesetAsset, currentChunk[j*tW+i]-1, 0, i*48 - scrollX, j*48 - scrollY);
	}
}

// draw neighbor chunk
var xoff = (tW - 2)*48;
var yoff = (tH - 2)*48;
for (var j=1; j<tW-1; j++) {
	for (var i=1; i<tH-1; i++) {
		draw_tile_or_keyhole(tilesetAsset, neighborChunk[j*tW+i]-1, 0, xoff + i*48 - scrollX, j*48 - scrollY);
		draw_tile_or_keyhole(tilesetAsset, neighborChunk[j*tW+i]-1, 0, -xoff + i*48 - scrollX, j*48 - scrollY);
		draw_tile_or_keyhole(tilesetAsset, neighborChunk[j*tW+i]-1, 0, i*48 - scrollX, yoff + j*48 - scrollY);
		draw_tile_or_keyhole(tilesetAsset, neighborChunk[j*tW+i]-1, 0, i*48 - scrollX, -yoff + j*48 - scrollY);
	}
}
