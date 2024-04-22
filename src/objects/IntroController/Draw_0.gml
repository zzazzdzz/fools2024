ct += 1;

if (ct > 60) {
	aa += 0.03;
	if (aa > 1) aa = 1;
}

draw_set_alpha(aa);
draw_set_font(HeaderFont);
draw_set_halign(fa_middle);
draw_set_color(c_yellow);
drawTextShadowed(640/2, 150, "Disclaimer");
draw_set_color(c_white);
drawTextShadowed(640/2, 190, "Fools2024 is a non-profit fan-based project set in the Pokemon");
draw_sprite(TextAcute, 0, 552-6+1, 194);
drawTextShadowed(640/2, 220, "universe and is not an official game release.");
drawTextShadowed(640/2, 250, "Pokemon is owned by The Pokemon Company and Nintendo Co. Ltd.");
draw_sprite(TextAcute, 0, 80-6+2, 254);
draw_sprite(TextAcute, 0, 288-6+2, 254);
drawTextShadowed(640/2, 280, "Please support the official releases.");

if (ct > 200) {
	draw_set_color(c_yellow);
	if (ct mod 20 <= 10) {
		drawTextShadowed(640/2, 320, "Press any key to continue");
	}
}

draw_set_halign(fa_left);
draw_set_alpha(1);