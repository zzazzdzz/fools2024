// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function colorPercentage(x, min_map, max_map, lightness){
        if (x > max_map) x = max_map;
        if (x < min_map) x = min_map;
        x = (x - min_map) / max_map;
		return make_color_hsv(x*0.33*255, 205, 0.96*255);
}