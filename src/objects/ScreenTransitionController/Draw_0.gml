draw_set_color(c_black);

if (transition_type == TRANSITION_RST38) {
	draw_sprite_tiled_ext(SprRst38, 0, 0, 0, 2, 2, c_white, 1);
	bepis += 1;
	if (bepis > 5) {
		draw_set_color(c_black);
		draw_rectangle(0, 0, 9999, 9999, false);
	}
}

if (transition_type == TRANSITION_JUSTBLACK) {
	draw_set_color(c_black);
	draw_rectangle(0, 0, 9999, 9999, false);
}

if (transition_type == TRANSITION_SQUARES_OUT) {
	bepis += 2;

	if (bepis > 60) instance_destroy();

	draw_set_alpha(1);
	for (var i=0; i<32; i++) {
		for (var j=0; j<24; j++) {
			draw_set_alpha(60-bepis-i-j);
			draw_rectangle(i*20, j*20, i*20+20, j*20+20, false);
		}
	}
}

if (transition_type == TRANSITION_FADETOBLACK) {
	bepis += 0.04;
	if (bepis > 1) {
		done = true; 
		bepis = 1;
	}	
	draw_set_alpha(bepis);
	draw_set_color(c_black);
	draw_rectangle(0, 0, 9999, 9999, false);
	draw_set_alpha(1);
}

if (transition_type == TRANSITION_FADEFROMBLACK) {
	bepis += 0.04;
	if (bepis > 1) {
		bepis = 1;
		instance_destroy();
	}	
	draw_set_alpha(1-bepis);
	draw_set_color(c_black);
	draw_rectangle(0, 0, 9999, 9999, false);
	draw_set_alpha(1);
}

if (transition_type == TRANSITION_FADETOWHITE) {
	bepis += 0.04;
	if (bepis > 1) {
		done = true; 
		bepis = 1;
	}
	draw_set_alpha(bepis);
	draw_set_color(c_white);
	draw_rectangle(0, 0, 9999, 9999, false);
	draw_set_alpha(1);
}

if (transition_type == TRANSITION_FADEFROMWHITE) {
	bepis += 0.04;
	if (bepis > 1) {
		bepis = 1;
		instance_destroy();
	}	
	draw_set_alpha(1-bepis);
	draw_set_color(c_white);
	draw_rectangle(0, 0, 9999, 9999, false);
	draw_set_alpha(1);
}

if (transition_type == TRANSITION_SQUARES_IN) {
	bepis += 2;
	if (bepis > 60) {
		draw_rectangle(0, 0, 640, 480, false);
	} else {
		draw_set_alpha(1);
		for (var i=0; i<32; i++) {
			for (var j=0; j<24; j++) {
				draw_set_alpha(bepis-i-j);
				draw_rectangle(i*20, j*20, i*20+20, j*20+20, false);
			}
		}
	}
}

draw_set_color(c_white);