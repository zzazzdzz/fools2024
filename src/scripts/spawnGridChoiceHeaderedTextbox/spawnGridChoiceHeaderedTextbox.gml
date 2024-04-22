function spawnGridChoiceHeaderedTextbox(tx, hdr, cols="0000000000000000"){
	txno = instance_number(TextboxController);
	inst = instance_create_depth(10, 480-112-10, -100000-txno, TextboxController);
	with (inst) {
		x = 10 + global.battleChoiceBox.x + global.battleChoiceBox.t_w;
		y = 10 + global.battleQueueBox.y + global.battleQueueBox.t_h;
		t_text = tx;
		t_w = 430;
		t_type = "gridchoiceheadered";
		t_header2 = hdr;
		event_user(0); // reload text vars
		t_h = 110 + floor((optionCount-1)/2) * 30;
		gridChoiceCols = cols;
	}
	return inst;
}