// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instance_create(o, xx, yy){
	return instance_create_depth(xx, yy, 0, o);
}
function sound_play(ii) {
	return audio_play_sound(ii, 1, 0);	
}