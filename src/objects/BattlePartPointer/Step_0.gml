
anim_angle += anim_angle_step;
if (anim_angle > 360) anim_angle -= 360;

if (anim_angle_step > 1) {
	anim_angle_step -= 0.4;
} else {
	anim_angle_step = 1;	
}

anim_counter += 1;

if (anim_counter == 8) anim_yoffset -= 1;
if (anim_counter == 16) anim_yoffset -= 1;
if (anim_counter == 24) anim_yoffset -= 1;
if (anim_counter == 32) anim_yoffset -= 1;
if (anim_counter == 40) anim_yoffset -= 1;
if (anim_counter == 48) anim_yoffset -= 1;
if (anim_counter == 56) anim_yoffset -= 1;
if (anim_counter == 64) anim_yoffset -= 1;
if (anim_counter == 72) anim_yoffset += 1;
if (anim_counter == 80) anim_yoffset += 1;
if (anim_counter == 88) anim_yoffset += 1;
if (anim_counter == 96) anim_yoffset += 1;
if (anim_counter == 104) anim_yoffset += 1;
if (anim_counter == 112) anim_yoffset += 1;
if (anim_counter == 120) anim_yoffset += 1;
if (anim_counter == 128) {
	anim_yoffset += 1;
	anim_counter = 0;
}