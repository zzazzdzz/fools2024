if (global.battleQueueBox.xPosAnimation == 1 && anim > 0) {
	anim = -1;
}
if (global.battleQueueBox.xPosAnimation == 2 && anim > 0) {
	anim = -1;
}
if (global.battleQueueBox.xPosAnimation == 3 && anim < 0) {
	anim = 1;
}
if (global.battleQueueBox.xPosAnimation == 4 && anim < 0) {
	anim = 1;
}

if (anim == -1) {
	if (instance_exists(furret0)) {
		var dd = furret0dir;
		with (furret0) {
			animIsLooping = 1;
			animIndex = "Walk";
			animSpeed = 1;
			event_user(0);
			facing = dd;
		}
	}
	if (instance_exists(furret1)) {
		var dd = furret1dir;
		with (furret1) {
			animIsLooping = 1;
			animIndex = "Walk";
			animSpeed = 1;
			event_user(0);
			facing = dd;
		}
	}
	if (instance_exists(furret2)) {
		var dd = furret2dir;
		with (furret2) {
			animIsLooping = 1;
			animIndex = "Walk";
			animSpeed = 1;
			event_user(0);
			facing = dd;
		}
	}
	anim = -2;
}
if (anim == 1) {
	if (instance_exists(furret0)) {
		with (furret0) {
			animIsLooping = 1;
			animIndex = "Idle";
			animSpeed = 1;
			facing = FACING_D;
			event_user(0);
		}
	}
	if (instance_exists(furret1)) {
		with (furret1) {
			animIsLooping = 1;
			animIndex = "Idle";
			animSpeed = 1;
			facing = FACING_D;
			event_user(0);
		}
	}
	if (instance_exists(furret2)) {
		with (furret2) {
			animIsLooping = 1;
			animIndex = "Idle";
			animSpeed = 1;
			facing = FACING_D;
			event_user(0);
		}
	}
	anim = 2;
}

if (anim == -2) {
	if (instance_exists(furret0)) {
		if (furret0.x < 120) furret0.facing = FACING_R;
		if (furret0.x > 640-120) furret0.facing = FACING_L;
		if (furret0.facing == FACING_L) {
			furret0.x -= 3;	
		} else {
			furret0.facing = FACING_R;
			furret0.x += 3;	
		}
		furret0dir = furret0.facing;
	}
	if (instance_exists(furret1)) {
		if (furret1.x < 120) furret1.facing = FACING_R;
		if (furret1.x > 640-120) furret1.facing = FACING_L;
		if (furret1.facing == FACING_L) {
			furret1.x -= 2;	
		} else {
			furret1.facing = FACING_R;
			furret1.x += 2;	
		}
		furret1dir = furret1.facing;
	}
	if (instance_exists(furret2)) {
		if (furret2.x < 120) furret2.facing = FACING_R;
		if (furret2.x > 640-120) furret2.facing = FACING_L;
		if (furret2.facing == FACING_L) {
			furret2.x -= 3;	
		} else {
			furret2.facing = FACING_R;
			furret2.x += 3;	
		}
		furret2dir = furret2.facing;
	}
}