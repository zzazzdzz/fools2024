// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function interactBasicScripting(){
	return SCRIPT_STOP;
}

function scriptingFacePlayer() {
	with (global.interactedWith) {
		direction = point_direction(x, y, OverworldHero.x, OverworldHero.y);
		facing = (floor((direction + 22.5) / 45) + 2) % 8;	
	}
}

function scriptingWaitForTextInGP0() {
	if (!instance_exists(global.gp0)) return SCRIPT_CONTINUE_ADVANCETICK;
	if (global.gp0.hang) return SCRIPT_CONTINUE_ADVANCETICK;
	return SCRIPT_CONTINUE_NOTICK;
}

function scriptingWaitForTextInGP1() {
	if (!instance_exists(global.gp1)) return SCRIPT_CONTINUE_ADVANCETICK;
	if (global.gp1.hang) return SCRIPT_CONTINUE_ADVANCETICK;
	return SCRIPT_CONTINUE_NOTICK;
}

function scriptingWaitForLastResult() {
	if (global.lastResult != RESULT_NONE) return SCRIPT_CONTINUE_ADVANCETICK;
	else return SCRIPT_CONTINUE_NOTICK;
}

function scriptingFaceDir(d) {
	with (global.interactedWith) facing = d;
}

function scriptingPlayerFaceDir(d) {
	with (OverworldHero) facing = d;
}

function scriptingDelay(d) {
	if (globalCounter > globalCounterRef) {
		globalCounterRef = globalCounter + d;
		return SCRIPT_CONTINUE_NOTICK;
	} else {
		if (globalCounter == globalCounterRef) return SCRIPT_CONTINUE_ADVANCETICK;
		else return SCRIPT_CONTINUE_NOTICK;
	}
}

function scriptingRestoreFacing() {
	with (global.interactedWith) {
		facing = defaultFacing;	
	}
}

function scriptingSelectObj(species) {
	var n = instance_number(OverworldObject);
	for (var i=0; i<n; i++) {
		var o = instance_find(OverworldObject, i);	
		if (o.animSpriteSetIndex == species) return o.id;
	}
	bugcheck("ScrObjNotSelectable [" + species + "]");
	return OverworldObject;
}

function scriptingApplyMovement(obj, to_x, to_y, time) {
	with (obj) {
		animTargetX = to_x;
		animTargetY = to_y;
		animTargetSteps = time;
		event_user(2);
		// face coordinate
		direction = point_direction(x, y, to_x, to_y);
		facing = (floor((direction + 22.5) / 45) + 2) % 8;	
	}
}

function scriptingCreateNullSpriteAt(xx, yy, interactScript=interactBasicScripting) {
	var ii = instance_create(OverworldObject, xx*2, yy*2);
	ii.animSpriteSetIndex = "NullSprite";
	ii.facing = FACING_U;
	ii.onInteract = interactScript;
	with (ii) event_user(1);
}

function scriptingCloseAllText() {
	with (TextboxController) instance_destroy();	
}

function scriptingHealAll() {
	for (var i=0; i<array_length(global.teamMembers); i++) {
		global.teamMembers[i].curHP = global.teamMembers[i].maxHP;
		global.teamMembers[i].curPP = global.teamMembers[i].maxPP;
	}
}

function scriptingApplyAnimation(obj, n, t=0.5, l=1) {
	with (obj) {
		animIndex = n;
		animSpeed = t;
		animIsLooping = l;
		event_user(0);	
	}
}