function spawnBattleQueueTextbox(){
	txno = instance_number(TextboxController);
	inst = instance_create_depth(10, 480-112-10, -100000-txno, TextboxController);
	with (inst) {
		x = -500;
		y = 10;
		
		t_type = "battlequeue";
		event_user(0); // reload text vars
	}
	return inst;
}