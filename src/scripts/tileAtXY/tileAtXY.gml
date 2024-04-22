// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tileAtXY(tx, ty){
	if (tx < 0) return -1;
	if (ty < 0) return -1;
	if (tx > room_width) return -1;
	if (ty > room_height) return -1;
	var x_idx = floor((tx-8+48) / 48);
	var y_idx = floor(ty / 48);
	var idx = y_idx*15+x_idx;
	if (idx >= array_length(global.tileMap)) return -1;
	else return global.tileMap[idx];
}