// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function areEnemiesAlive(){
	global.scratch = false;
	with (BattleObject) {
		if (!alliance && !hidden) global.scratch = true;
	}
	return global.scratch;
}

function areAlliesAlive(){
	global.scratch = false;
	with (BattleObject) {
		if (alliance && curHP > 0) global.scratch = true;
	}
	return global.scratch;
}

