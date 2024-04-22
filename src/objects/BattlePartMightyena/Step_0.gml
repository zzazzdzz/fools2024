if (phase == 0) exit;

var sp = 2;
if (phase == 1) sp = 5;
if (phase == 2) sp = 10;
if (phase == 3) sp = 20;
if (phase == 4) sp = 40;
if (phase == 5) sp = 80;
if (phase >= 6) sp = 120;
if (phase >= 7) sp = 160;

/*
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
}*/

if (instance_exists(BattleSelectorAnimation) || BattleController.turnState == 50 || BattleController.turnState == 51 || BattleController.turnState == 52 || BattleController.isPetting) {
	if (phase < 7) {
		if (anim < 0) anim = 1;
	} else if (anim > 0) anim = -1;	
} else {
	if (anim > 0) anim = -1;	
}

if (anim == -1) {
	if (instance_exists(furret0)) {
		var dd = furret0dir;
		with (furret0) {
			animIsLooping = 1;
			animIndex = "Walk";
			animSpeed = 1.0/sp;
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
	anim = 2;
}

if (anim == -2) {
	if (instance_exists(furret0)) {
		if (furret0.x < 240) furret0.facing = FACING_R;
		if (furret0.x > 640-240) furret0.facing = FACING_L;
		if (furret0.facing == FACING_L) {
			furret0.x -= sp;	
		} else {
			furret0.facing = FACING_R;
			furret0.x += sp;	
		}
		furret0dir = furret0.facing;
	}
}