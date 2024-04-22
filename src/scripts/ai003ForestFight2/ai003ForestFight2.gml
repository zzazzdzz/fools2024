// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ai003ForestFight2Lore(){
	if (!global.eventFlags[EVENT_TUTORIALTEXT_TELEGRAPHS]) {
		if (global.turnCounter == 1) {
			ds_queue_enqueue(animations, ["wait", 20]);
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
{PARTNER}: It looks like they're charging an attack!
We should probably move out of the way!<@
			"), [ASSET_PARTNER_PORTRAIT, 0]]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			ds_queue_enqueue(animations, ["lore_msg", formatTextboxString(@"
\m08Use the \c32Move\c30 command to avoid telegraphed attacks readied
by opponents!

Getting hit by avoidable attacks might deal massive damage
and cause detrimental effects. Red equals dead!<@
			"), noone]);
			ds_queue_enqueue(animations, ["wait_msg"]);
			ds_queue_enqueue(animations, ["wait", 30]);
			global.eventFlags[EVENT_TUTORIALTEXT_TELEGRAPHS] = 1;
		}
	}
}

function ai003ForestFight2(){
	if (global.battleCurrentObj.curHP <= 0) return;
	
	if (global.turnCounter % 2 == 0) {
		global.battleTargetObj = randomAllyAliveProvokable();		
		ds_queue_enqueue(animations, ["wait", 15]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " readies @1Psybeam@0."]);
		
		ds_queue_enqueue(animations, ["wait", 15]);
		
		var dr = point_direction(global.battleCurrentObj.x, global.battleCurrentObj.y-20, global.battleTargetObj.x, global.battleTargetObj.y);
		
		ds_queue_enqueue(animations, ["snd", FightSFXChargeAttack]);
		ds_queue_enqueue(animations, ["mktelegraph", [
			["line", global.battleCurrentObj.x, global.battleCurrentObj.y-20, 0, 0, 500, 33, dr]
		]]);
	
		ds_queue_enqueue(animations, ["wait", 35]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["wait", 20]);
	} else {
		setLastBlow("Psybeam");
		ds_queue_enqueue(animations, ["snapshot"]);
		ds_queue_enqueue(animations, ["wait", 20]);
		ds_queue_enqueue(animations, ["msg", "" + global.battleCurrentObj.combatantNameDecorated + " used @1Psybeam@0!"]);
		ds_queue_enqueue(animations, ["wait", 35]);
		ds_queue_enqueue(animations, ["rmtelegraph"]);
		ds_queue_enqueue(animations, ["nomsg"]);
		ds_queue_enqueue(animations, ["snd", FightSFXUse]);
		ds_queue_enqueue(animations, ["anim_spin", -1]);
		ds_queue_enqueue(animations, ["wait", 20]);
	
		ds_queue_enqueue(animations, ["dmgmulti", "psychic", 30, noone]);
	
		ds_queue_enqueue(animations, ["wait", 20]);	
	}
}