if (global.currentWindowWidth < 1000) {
	window_set_size(640*2, 480*2);
	alarm[1] = 1;
	global.currentWindowWidth = 640*2;
} else {
	window_set_size(640, 480);
	alarm[1] = 1;
	global.currentWindowWidth = 640;
}