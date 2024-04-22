bg_w = sprite_get_width(BGFullScreenMenu);
bg_h = sprite_get_height(BGFullScreenMenu);
bg_scroll = 0;

state = 0;
pause = 0;

helpTexts = [
	textToAttributed("Examine details about this member, such as stats, abilities,#experience and traits."),
	textToAttributed("Learn new combat moves, including moves that have been#previously forgotten."),
	textToAttributed("Learn or recall advanced techniques unique to this member's#chosen specialization."),
	textToAttributed("Order this member to specialize in offense, defense or support.#Only one specialization may be active at a time."),
	textToAttributed("Change the name of this member.")
];

specNames = [
	"Offense", "Defense", "Support"
];

nameDecorator = "0";
specDecorator = "0";

var o = instance_create(ScreenTransitionController, 0, 0);
o.transition_type = TRANSITION_FADEFROMBLACK;