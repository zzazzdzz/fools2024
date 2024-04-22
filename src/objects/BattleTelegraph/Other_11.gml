// snapshot a telegraph

// bring back the surface from sprite
surf = surface_create(room_width, room_height);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_sprite(spr, 0, src_x, src_y);

var snapshot = [];
var numCombatants = array_length(global.battleQueue);
	
for (var i=0; i<numCombatants; i++) {
	var obj = getBattleObjectByCombatantId(global.battleQueue[i]);
	if (obj < 0) continue;
	if (!obj.alliance) continue;
	if (obj.curHP <= 0) continue;
	if (surface_getpixel(surf, obj.x, obj.y) != 0) {
		array_push(snapshot, obj);
	}
}

// check ice
if (includeObjs) {
	var numObjs = instance_number(BattlePartIceCrystal);
	for (var i=0; i<numObjs; i++) {
		var obj = instance_find(BattlePartIceCrystal, i);
		if (surface_getpixel(surf, obj.x, obj.y) != 0) {
			obj.struck = true;	
		} else {
			obj.struck = false;
		}
	}
}

global.snapshot = snapshot;

surface_reset_target();
surface_free(surf);