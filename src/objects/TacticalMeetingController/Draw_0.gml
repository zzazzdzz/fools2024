bg_scroll += 1;
if (bg_scroll>64) bg_scroll -= 64;

for (var i=-bg_w+bg_scroll; i<room_width; i+=bg_w) {
	for (var j=-bg_h+bg_scroll; j<room_height; j+=bg_h) {
		draw_sprite(BGFullScreenMenu, 0, i, j);
	}
}