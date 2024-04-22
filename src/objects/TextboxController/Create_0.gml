global.lastResult = -1;

xyViewAdjusted = false;

if (!ds_stack_empty(global.textStack)){
    obj = ds_stack_top(global.textStack);
    with (obj) active = false;
}else{
	global.activeStored = global.active;
    global.active = false;
}
parentTextbox = ds_stack_top(global.textStack);

ds_stack_push(global.textStack, self.id);

t_text = "";
t_header = "";
tx_offset = 24;

t_type = "null";
t_portrait = noone;

fontXoffset = 0;
arrowBlink = false;
typeIndex = 1;
safetyMargin = 30;
waitInput = 0;
textContent = "";
textContentLen = 0;
textboxContinueProcessing = 0;
prewrapOn = false;
stepTimer = 0;
soundEnabled = 1;
headerSubimg = 0;
active = true;
writableText = "";
currentModifier = " ";
destroyMe = false;
preventDefault = false;
hang = false;
globalStepTimer = 0;
descData = noone;
xPosAnimation = 0;
xPosAnimIndicated = false;
quitStatusAllowed = true;
shakiesWhich = -1;
shakiesDuration = 0;
closeOnConfirm = true;
choiceWithoutChoice = false;
muteChoiceSound = false;
delay = 0;

sw = sprite_get_width(TextboxBorders);
sh = sprite_get_height(TextboxBorders);
hw = sprite_get_width(TextboxHeaders);
t_cw = 0;

alarm[0] = 10;
noClose = false;

gridCursorX = 0;
gridCursorY = 0;
gridChoiceCols = "";

namingResult = "";
charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-' 0123456789@";

hidden = false;

t_fontid = 0;