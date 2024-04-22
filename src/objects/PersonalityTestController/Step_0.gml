if (pause > 0) {
	pause -= 1;
	if (pause <= 0) event_user(0);
	exit;
}

if (instance_number(TextboxController) < lastNumTextboxes) {
	curStage += 1;
	event_user(0);	
}

lastNumTextboxes = instance_number(TextboxController);

topmostTextbox = ds_stack_top(global.textStack);
if (topmostTextbox) {
	if (topmostTextbox.hang) {
		curStage += 1;
		event_user(0);
	}
}
