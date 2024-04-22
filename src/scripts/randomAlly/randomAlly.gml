// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function randomAlly(){
	global.scratch = [];
	with (BattleObject) {
		if (alliance) array_push(global.scratch, self);
	}
	var ch = global.scratch[irandom(array_length(global.scratch)-1)];
	global.scratch = 0;
	return ch;
}

function randomEnemy(){
	global.scratch = [];
	with (BattleObject) {
		if (!alliance) array_push(global.scratch, self);
	}
	var ch = global.scratch[irandom(array_length(global.scratch)-1)];
	global.scratch = 0;
	return ch;
}

function randomEnemyAlive(){
	global.scratch = [];
	with (BattleObject) {
		if (!alliance && curHP > 0) array_push(global.scratch, self);
	}
	var ch = global.scratch[irandom(array_length(global.scratch)-1)];
	global.scratch = 0;
	return ch;
}

function allAllies(){
	global.scratch = [];
	with (BattleObject) {
		if (alliance) array_push(global.scratch, self);
	}
	return global.scratch;
}

function allAliveAllies(){
	global.scratch = [];
	with (BattleObject) {
		if (alliance && curHP > 0) array_push(global.scratch, self);
	}
	return global.scratch;
}

function allThreeAliveAllies(){
	global.scratch = [];
	with (BattleObject) {
		if (alliance && curHP > 0) array_push(global.scratch, self);
	}
	while (array_length(global.scratch) < 3) array_push(global.scratch, noone);
	return global.scratch;
}

function allThreeAllies(){
	global.scratch = [];
	with (BattleObject) {
		if (alliance) array_push(global.scratch, self);
	}
	while (array_length(global.scratch) < 3) array_push(global.scratch, noone);
	return global.scratch;
}

function allEnemies(){
	global.scratch = [];
	with (BattleObject) {
		if (!alliance) array_push(global.scratch, self);
	}
	return global.scratch;
}

function allEnemiesAlive(){
	global.scratch = [];
	with (BattleObject) {
		if (!alliance && curHP > 0) array_push(global.scratch, self);
	}
	return global.scratch;
}

function randomListOfAllies() {
	return array_shuffle(allAllies());
}

function randomListOfThreeAllies() {
	return array_shuffle(allThreeAliveAllies());
}

function randomListOfAllThreeAllies() {
	return array_shuffle(allThreeAllies());
}

function distinguish2(o1, o2) {
	if (o1 == noone) return o2;
	if (o2 == noone) return o1;
	if (o1 == noone && o2 == noone) return randomAllyAlive();
	return choose(o1, o2);
}

function allAlliesInCircle(cx, cy, cr){
	global.scratch = [];
	with (BattleObject) {
		// why not distance_to_point? apparently it's buggy and returns wrong values. no idea why.
		var dist = point_distance(cx, cy, self.x, self.y);
		if (alliance && dist <= cr && curHP > 0) array_push(global.scratch, self);
	}
	return global.scratch;
}

function randomAllyAlive(){
	global.scratch = [];
	with (BattleObject) {
		if (alliance && curHP > 0) array_push(global.scratch, self);
	}
	var ch = global.scratch[irandom(array_length(global.scratch)-1)];
	global.scratch = 0;
	return ch;
}

function randomAllyAliveProvokable(){
	global.scratch = noone;
	with (BattleObject) {
		if (hasStatus(self, "Daredevil")) global.scratch = self;
	}
	if (global.scratch != noone) {
		return global.scratch;
	} else {
		return randomAllyAlive();
	}
}

function randomAllyProvokablePrioritizeSpecies(sp){
	global.scratch = noone;
	with (BattleObject) {
		if (hasStatus(self, "Daredevil")) global.scratch = self;
	}
	if (global.scratch != noone) {
		return global.scratch;
	} else {
		return randomAllyPrioritizeSpecies(sp);
	}
}

function allyWithEffect(sp){
	global.scratch = noone;
	with (BattleObject) {
		if (hasStatus(self, sp)) global.scratch = self;
	}
	if (global.scratch != noone) {
		return global.scratch;
	} else {
		return randomAllyAlive();
	}
}

function setLastBlow(atk) {
	global.battleLastBlow = "by " + global.battleCurrentObj.combatantNameDecorated + "'s @1" + atk + "@0";
}

function setLastBlowEffect(n) {
	global.battleLastBlow = "due to effect of @1" + n + "@0";
}

function allyBySpecies(sp) {
	global.scratch = noone;
	with (BattleObject) {
		if (alliance && animSpriteSetIndex == sp && curHP > 0) global.scratch = self;
	}
	return global.scratch;
}

function byAiID(sp) {
	global.scratch = noone;
	with (BattleObject) {
		if (!alliance && aiID == sp && curHP > 0) global.scratch = self;
	}
	return global.scratch;
}

function allBySpecies(sp) {
	global.scratch = noone;
	with (BattleObject) {
		if (animSpriteSetIndex == sp && curHP > 0) global.scratch = self;
	}
	return global.scratch;
}

function markedAllyOrRandom() {
	global.scratch = noone;
	with (BattleObject) {
		if (personalMarker != MARKER_NONE && curHP > 0) global.scratch = self;
	}
	if (global.scratch != noone) return global.scratch;
	else return randomAllyAlive();
}

function preyAllyOrRandom() {
	global.scratch = noone;
	with (BattleObject) {
		if (hasStatus(self, "Prey") && curHP > 0) global.scratch = self;
	}
	if (global.scratch != noone) return global.scratch;
	else return randomAllyAlive();
}

function randomAllyPrioritizeSpecies(sp) {
	global.scratch = noone;
	with (BattleObject) {
		if (alliance && animSpriteSetIndex == sp && curHP > 0) global.scratch = self;
	}
	if (global.scratch != noone) return global.scratch;
	else return randomAllyAlive();
}

function hasStatus(tgt, n) {
	for (var i=0; i<array_length(tgt.effects); i++) {
		if (tgt.effects[i][0] == n) return i+1;
	}
	return false;
}

function hasStatusAndLength(tgt, n, l) {
	for (var i=0; i<array_length(tgt.effects); i++) {
		if (tgt.effects[i][0] == n && tgt.effects[i][1] == l) return true;
	}
	return false;
}

function removeEffect(tgt, n) {
	var new_effs = [];
	for (var i=0; i<array_length(tgt.effects); i++) {
		if (tgt.effects[i][0] != n) array_push(new_effs, tgt.effects[i]);
	}
	tgt.effects = new_effs;
}

function facingToDir(f) {
	var r = [270, 315, 0, 45, 90, 135, 180, 225];
	return r[f];
}
function dirWrap(f) {
	if (f < 0) f += 360;
	if (f > 360) f -= 360;
	return f;
}
function facingOpposite(f) {
	if (f == FACING_U) return FACING_D;
	if (f == FACING_D) return FACING_U;
	if (f == FACING_L) return FACING_R;
	if (f == FACING_R) return FACING_L;
	if (f == FACING_DL) return FACING_UR;
	if (f == FACING_DR) return FACING_UL;
	if (f == FACING_UL) return FACING_DR;
	if (f == FACING_UR) return FACING_DL;
	return FACING_D;
}

function allyNthNearest(pointx, pointy, n){
    var list,nearest;
    n = min(max(1,n),instance_number(BattleObject));
    list = ds_priority_create();
    nearest = noone;
    with (BattleObject) {
		if (alliance) ds_priority_add(list,id,distance_to_point(pointx,pointy));
	}
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}

function allyNthFurthest(pointx, pointy, n){
    var list,nearest;
    n = min(max(1,n),instance_number(BattleObject));
    list = ds_priority_create();
    nearest = noone;
    with (BattleObject) {
		if (alliance) ds_priority_add(list,id,-distance_to_point(pointx,pointy));
	}
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}

function allyNthNearestAlive(pointx, pointy, n){
    var list,nearest;
    n = min(max(1,n),instance_number(BattleObject));
    list = ds_priority_create();
    nearest = noone;
    with (BattleObject) {
		if (alliance && curHP > 0) ds_priority_add(list,id,distance_to_point(pointx,pointy));
	}
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}

function allyNthFurthestAlive(pointx, pointy, n){
    var list,nearest;
    n = min(max(1,n),instance_number(BattleObject));
    list = ds_priority_create();
    nearest = noone;
    with (BattleObject) {
		if (alliance && curHP > 0) ds_priority_add(list,id,-distance_to_point(pointx,pointy));
	}
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}

