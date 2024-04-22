function drawTextExt(tx, ty, text, nldist=40){
	return drawTextAttributedExt(tx, ty, textToAttributed(text), nldist);	
}

function drawTextShadowed(tx, ty, text) {
	var c = draw_get_color();
	draw_set_color(c_dkgray);
	draw_text(tx+2, ty+2, text);
	draw_set_color(c);
	draw_text(tx, ty, text);
}