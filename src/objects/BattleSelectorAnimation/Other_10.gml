if (type == 0 || type == 2) {
	if (array_length(global.potentialTargetList) <= 0) {
		locked = true;
		x = -999;
		y = -999;
		global.gp2 = spawnToastTextbox("No valid targets!");
		ratelimitedUIWrongSound();
		alarm[0] = 50;
	} else {
		x = global.potentialTargetList[0].x;
		y = global.potentialTargetList[0].y;
		var tag = global.potentialTargetList[targetListIdx].alliance ? "3" : "5";
		global.gp2 = spawnToastTextbox("To " + keyword + ": @" + tag + global.potentialTargetList[targetListIdx].combatantName + "@0");
	}
}