
global.active = true;

if (global.battleStats[3][2]) {
	room_goto(OverworldRoom);
} else {
	alarm[1] = 1;
}