t_w = 550;
x = (640/2 - t_w/2);
t_text = "";
t_h = 370;
y = (480-370)/2-5;
t_fontid = 0;
buttonCd = 0;

logView = false;
logPaging = 0;
logLength = array_length(global.battleLog);

#macro LOG_ENTS_PER_SCREEN 8

if (global.battleStats[3][2]) {
	// won
	global.battleEcho = 0;
	audio_play_sound(LastOutingSuccess, 1, 0);
	txs = [
		textToAttributed("@0Duty: @Q" + global.battleCurrentDutyName),
		textToAttributed("@3" + global.teamMembers[0].name + "@0 and friends"),
		textToAttributed("successfully cleared the dungeon.")
	];
} else {
	// lost
	audio_play_sound(LastOutingFailure, 1, 0);
	txs = [
		textToAttributed("@0Duty: @Q" + global.battleCurrentDutyName),
		textToAttributed(global.battleLastTarget + " was defeated"),
		textToAttributed(global.battleLastBlow + ".")
	];
}

draw_set_font(TextboxFont);
wts = [
	string_width(textUnattr(txs[0])),
	string_width(textUnattr(txs[1])),
	string_width(textUnattr(txs[2]))
];

delay = 100;
fin = false;

state = 0;