// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ratelimitedUIWrongSound(){
	if (!instance_exists(MixedPartUIWrong)) instance_create(MixedPartUIWrong, 0, 0);
}