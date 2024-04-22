if (exitState == 0) {
	audio_stop_all();
	audio_play_sound(SFXGeneral7, 1, 0);
	crashed = true;
	alarm[2] = 160;
	exitState = 1;
}
else if (exitState == 1) {
	global.gp0 = instance_create(ScreenTransitionController, 0, 0);
	global.gp0.transition_type = TRANSITION_JUSTBLACK;
	alarm[2] = 80;
	exitState = 2;
} 
else if (exitState == 2) {
	global.battleAdversaryScript = [ai002IntroFight, aiBattleClear, ai001Intro, aiNull];
	global.battleInitData = [
		{
			species: "0011",
			name: "Hooked Metapod",
			maxHP: 50,
			att: 10, def: 25, types: ["grass"],
			lv: 5, expRate: 60
		}
	];
	global.battleType = BATTLETYPE_TUTORIAL;
	global.tileMap = [
		6, 6, 6, 6, 6, 56, 6, 6, 6, 6, 6, 6, 6, 6, 6,
		6, 6, 51, 6, 6, 6, 6, 6, 56, 6, 6, 6, 51, 6, 6,
		6, 6, 6, 6, 31, 9, 9, 9, 53, 9, 32, 6, 6, 6, 6,
		6, 6, 6, 31, 10, 68, 60, 60, 60, 61, 8, 32, 6, 6, 6,
		6, 51, 6, 7, 59, 63, 63, 63, 63, 106, 64, 5, 6, 56, 6,
		6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 64, 5, 6, 6, 6,
		6, 6, 6, 7, 62, 107, 63, 63, 63, 63, 64, 50, 6, 6, 6,
		6, 6, 56, 33, 4, 65, 66, 66, 66, 67, 2, 34, 6, 51, 6,
		6, 6, 6, 6, 33, 3, 3, 3, 3, 3, 34, 6, 56, 6, 6,
		6, 6, 6, 51, 6, 6, 6, 6, 6, 6, 56, 6, 6, 6, 6
	];
	audio_play_sound(GenericEncounterSound, 1, 0);
	alarm[2] = 60;
	exitState = 3;
}
else if (exitState == 3) {	
	global.battleLog = [];
	room_goto(BattleRoom);
}