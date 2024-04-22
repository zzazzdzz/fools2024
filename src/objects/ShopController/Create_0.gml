bg_w = sprite_get_width(BGFullScreenMenu);
bg_h = sprite_get_height(BGFullScreenMenu);
bg_scroll = 0;

state = 0;
pause = 0;

boughtItemID = 0;
boughtItemPrice = 0;
holderChoiceTextbox = noone;
moneyTextbox = noone;

var o = instance_create(ScreenTransitionController, 0, 0);
o.transition_type = TRANSITION_FADEFROMBLACK;