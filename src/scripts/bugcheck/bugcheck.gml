// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bugcheck(n){
	var st = debug_get_callstack(2);
	array_push(st, "[bepis]");
	array_push(st, "[bepis]");
	global.bugcheckMessage = n + ": " + st[1];
	room_goto(CrashRoom);
}