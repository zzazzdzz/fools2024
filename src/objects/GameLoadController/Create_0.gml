bg_w = sprite_get_width(BGFullScreenMenu);
bg_h = sprite_get_height(BGFullScreenMenu);
bg_scroll = 0;

state = 0;
pause = 0;

helpTexts = [
	textToAttributed("Continue your adventure where you left off."),
	textToAttributed("Start an entirely new adventure.#Saving will erase your current data."),
	textToAttributed("Associate an event site account with your game data.#This is required to participate in the online leaderboard.")
];

var o = instance_create(ScreenTransitionController, 0, 0);
o.transition_type = TRANSITION_FADEFROMBLACK;

loadingSound = noone;
htResult = "";
htError = true;
htReady = false;