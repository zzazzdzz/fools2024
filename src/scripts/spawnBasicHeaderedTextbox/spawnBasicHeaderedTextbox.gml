function spawnBasicHeaderedTextbox(tx, hdr, cols="0"){
	txno = instance_number(TextboxController);
	inst = instance_create_depth(10, 480-112-10, -100000-txno, TextboxController);
	with (inst) {
		if (instance_exists(global.battleChoiceBox)) {
			x = 10 + global.battleChoiceBox.x + global.battleChoiceBox.t_w;
			y = 10 + global.battleQueueBox.y + global.battleQueueBox.t_h;
		} else {
			x = 10;
			y = 10;
		}
		t_text = tx;
		t_w = 430;
		t_type = "basicheadered";
		t_header2 = hdr;
		event_user(0); // reload text vars
		t_h = 110 + (optionCount-1) * 30;
		gridChoiceCols = cols;
	}
	return inst;
}

function spawnBasicHeaderedTextboxMid(tx, hdr, cols="0"){
	txno = instance_number(TextboxController);
	inst = instance_create_depth(10, 180, -100000-txno, TextboxController);
	with (inst) {
		t_w = 550;
		x = 640/2 - t_w/2;
		t_text = tx;
		t_type = "basicheadered";
		t_header2 = hdr;
		event_user(0); // reload text vars
		t_h = 110 + (optionCount-1) * 30;
		y = 240-55-(optionCount-1)*15;
		gridChoiceCols = cols;
	}
	return inst;
}