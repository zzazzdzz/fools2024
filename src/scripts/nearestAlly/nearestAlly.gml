// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function nearestAlly(){
	global.scratch = [noone, 999999];
	with (BattleObject) {
		if (alliance) {
			var dist = point_distance(global.battleCurrentObj.x, global.battleCurrentObj.y, x, y);
			if (dist > 1) {
				if (dist < global.scratch[1]) {
					global.scratch[1] = dist;
					global.scratch[0] = self;
				}
			}
		}	
	}
	var result = global.scratch[0];
	global.scratch = 0;
	return result;
}

function nearestEnemy(){
	global.scratch = [noone, 999999];
	with (BattleObject) {
		if (!alliance) {
			var dist = point_distance(global.battleCurrentObj.x, global.battleCurrentObj.y, x, y);
			if (dist > 1) {
				if (dist < global.scratch[1]) {
					global.scratch[1] = dist;
					global.scratch[0] = self;
				}
			}
		}	
	}
	var result = global.scratch[0];
	global.scratch = 0;
	return result;
}