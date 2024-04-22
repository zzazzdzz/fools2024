// draw_rectangle on html5 has an off-by-one bug, so i need to make a helper function to avoid nuking the whole code
function draw_rectangle_workaround(x1, y1, x2, y2, dummy){
	draw_line(x1, y1, x2, y1);
	draw_line(x1, y2, x2, y2);
}