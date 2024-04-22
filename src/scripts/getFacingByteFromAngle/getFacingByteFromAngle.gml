// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getFacingByteFromAngle(ang){
	return (floor((ang + 22.5) / 45) + 2) % 8;
}