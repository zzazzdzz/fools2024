depth = 1000;
ctr += 1;
ctr %= 65536;

var numObjs = instance_number(BattleObject);
for (var q=0; q<numObjs; q++) {
	var obj = instance_find(BattleObject, q);
	if (obj.markersClear) {
		obj.markerAlpha -= 0.05;
		if (obj.markerAlpha < 0) {
			obj.markerAlpha = 0;
			obj.radiusMarker = 0;
			obj.personalMarker = MARKER_NONE;
			obj.markerOwner = noone;
			if (hasStatus(obj, "Prey")) {
				removeEffect(obj, "Prey");	
			}
			if (hasStatus(obj, "FrigidIce")) {
				removeEffect(obj, "FrigidIce");	
			}
			obj.markersClear = false;
		}
	} else {
		if (obj.markerAlpha < 1) obj.markerAlpha += 0.05;
		if (obj.markerAlpha > 1) obj.markerAlpha = 1;
		obj.markerAlphaExcess -= 0.01;
		if (obj.markerAlphaExcess < 1) obj.markerAlphaExcess = 1;
	}
	var a = obj.markerAlpha * obj.markerAlphaExcess;
	if (obj.radiusMarker) {
		for (var i=0; i<360; i+=12) {
			var ang = ((ctr div 2)+i) % 360;
			var ld_x = obj.x + lengthdir_x(obj.radiusMarker, ang);
			var ld_y = obj.y + lengthdir_y(obj.radiusMarker, ang);
			draw_sprite_ext(BattleAttackRadius, 0, ld_x, ld_y, 1, 1, ang+90+180, c_white, 0.3 * a);	
		}
	}
	if (obj.personalMarker == MARKER_STACK) {
		var dist = 40+4*sin(ctr/6);
		var rot = 0;
		var ld_x = obj.x + lengthdir_x(dist, rot);
		var ld_y = obj.y + lengthdir_y(dist, rot);
		draw_sprite_ext(BattleAttackArrow, 0, ld_x, ld_y, 2, 2, rot+90+180, c_white, 0.5 * a);
		ld_x = obj.x + lengthdir_x(dist, rot+90);
		ld_y = obj.y + lengthdir_y(dist, rot+90);
		draw_sprite_ext(BattleAttackArrow, 0, ld_x, ld_y, 2, 2, rot+180+180, c_white, 0.5 * a);
		ld_x = obj.x + lengthdir_x(dist, rot+180);
		ld_y = obj.y + lengthdir_y(dist, rot+180);
		draw_sprite_ext(BattleAttackArrow, 0, ld_x, ld_y, 2, 2, rot+90+180+180, c_white, 0.5 * a);
		ld_x = obj.x + lengthdir_x(dist, rot+180+90);
		ld_y = obj.y + lengthdir_y(dist, rot+180+90);
		draw_sprite_ext(BattleAttackArrow, 0, ld_x, ld_y, 2, 2, rot+180, c_white, 0.5 * a);
	}
	if (obj.personalMarker == MARKER_FLARE) {
		var dist = 40+4*sin(ctr/6);
		var rot = 45;
		var ld_x = obj.x + lengthdir_x(dist, rot);
		var ld_y = obj.y + lengthdir_y(dist, rot);
		draw_sprite_ext(BattleFlareArrow, 0, ld_x, ld_y, 2, 2, rot+90+180+180, c_white, 0.5 * a);
		ld_x = obj.x + lengthdir_x(dist, rot+90);
		ld_y = obj.y + lengthdir_y(dist, rot+90);
		draw_sprite_ext(BattleFlareArrow, 0, ld_x, ld_y, 2, 2, rot+180+180+180, c_white, 0.5 * a);
		ld_x = obj.x + lengthdir_x(dist, rot+180);
		ld_y = obj.y + lengthdir_y(dist, rot+180);
		draw_sprite_ext(BattleFlareArrow, 0, ld_x, ld_y, 2, 2, rot+90+180+180+180, c_white, 0.5 * a);
		ld_x = obj.x + lengthdir_x(dist, rot+180+90);
		ld_y = obj.y + lengthdir_y(dist, rot+180+90);
		draw_sprite_ext(BattleFlareArrow, 0, ld_x, ld_y, 2, 2, rot+180+180, c_white, 0.5 * a);
	}
	if (obj.personalMarker == MARKER_SPREAD) {
		var dist = 50+4*sin(ctr/6);
		draw_sprite_ext(BattleAttackArrow, 0, obj.x, obj.y-dist, 2, 2, 0, c_white, 0.5 * a);
	}
}

if (ffwd) {
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(SprFFWD, (ctr div 4) % 18, 320, 240, 2.2, 1.25, 0, c_white, 0.3);
	gpu_set_blendmode(bm_normal);
}