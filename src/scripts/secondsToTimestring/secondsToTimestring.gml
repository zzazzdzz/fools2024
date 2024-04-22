// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function doubleDigits(s) {
	if (s < 10) {
		return "0" + string(s);	
	}
	return string(s);
}

function secondsToTimestring(s){
	var mins = s div 60;
	var secs = s mod 60;
	if (mins < 60) {
		return string(mins) + ":" + doubleDigits(secs);
	}
	var hrs = mins div 60;
	var mins_cut = mins mod 60;
	return string(hrs_cut) + ":" + doubleDigits(mins_cut) + ":" + doubleDigits(secs);
}