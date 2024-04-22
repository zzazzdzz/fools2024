// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getBattleObjectByCombatantId(cid){
	global.scratch = -cid;
	with (BattleObject) {
		if (-combatantId == global.scratch) {
			global.scratch = self;	
		}
	}
	return global.scratch;
}