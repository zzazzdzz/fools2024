global.battleResult = BATTLERESULT_NONE;
var o = instance_create(ScreenTransitionController, 0, 0);
o.transition_type = TRANSITION_FADEFROMBLACK;

instance_create(BattleBackgroundController, 0, 0);

if (global.battleType == BATTLETYPE_DUNGEON) {
	global.musicIndex = global.dungeonDb[global.curDungeonId][4];
	global.musicControl = MUS_PLAY;
}

global.initBattleQueue = [];
global.battleQueue = [];
global.battleTurn = 0;
global.petCounter = 0;
global.battleSelectBox = noone;
global.battleChoiceBox = noone;
global.battleEffectQueue = [];
global.isCorrupted = false;

turnState = 100;
afterDecr = false;
ctr = 0;

var numMembers = array_length(global.teamMembers);
var start = (80*(numMembers-1))/2;
var step = 80;

var numEnemyMembers = array_length(global.battleInitData);
var en_start = (80*(numEnemyMembers-1))/2;
var en_step = 80;

for (var i=0; i<numMembers; i++) {
	ii = instance_create(BattleObject, 320-start + i*step, 300);
	ii.animSpriteSetIndex = global.teamMembers[i].species;
	ii.species = global.teamMembers[i].species;
	ii.facing = 4;
	ii.combatantId = 100+i;
	ii.combatantIndex = i;
	ii.combatantName = global.teamMembers[i].name;
	ii.combatantNameDecorated = "@" + string(i==0 ? 3 : 6) + global.teamMembers[i].name + "@0";
	ii.lv = global.teamMembers[i].lv;
	ii.curHP = global.teamMembers[i].curHP;
	ii.maxHP = global.teamMembers[i].maxHP;
	ii.curPP = global.teamMembers[i].curPP;
	ii.maxPP = global.teamMembers[i].maxPP;
	ii.displayHP = ii.curHP;
	ii.effects = []; // ["VulnerabilityUp", choose(2,1)], ["DamageDown", 91], ["DamageDown", 92], ["DamageDown", 93], ["DamageDown", 94]
	ii.alliance = true;
	ii.att = int64(global.teamMembers[i].att * (1+global.battleEcho/100));
	ii.def = int64(global.teamMembers[i].def * (1+global.battleEcho/100));
	ii.sp_att = int64(global.teamMembers[i].sp_att * (1+global.battleEcho/100));
	ii.sp_def = int64(global.teamMembers[i].sp_def * (1+global.battleEcho/100));
	ii.types = global.teamMembers[i].types;
	ii.moves = global.teamMembers[i].moves;
	ii.team_index = i;
	ii.stance = global.teamMembers[i].stance;
	array_push(global.initBattleQueue, ii.combatantId);
	with (ii) event_user(1);
}

for (var i=0; i<array_length(global.battleInitData); i++) {
	var yCreateOffs = 0;
	if (global.battleInitData[i].species == "0145") yCreateOffs = 30;
	if (global.battleInitData[i].species == "NullSprite") yCreateOffs = 130;
	ii = instance_create(BattleObject, 320-en_start + i*en_step, 230 - yCreateOffs);
	ii.animSpriteSetIndex = global.battleInitData[i].species;
	ii.species = global.battleInitData[i].species;
	ii.facing = 0;
	ii.combatantId = 200+i;
	ii.combatantIndex = -1;
	ii.combatantName = global.battleInitData[i].name;
	ii.combatantNameDecorated = "@5" + global.battleInitData[i].name + "@0";
	ii.curPP = 999;
	ii.maxPP = 999;
	ii.curHP = global.battleInitData[i].maxHP;
	ii.maxHP = global.battleInitData[i].maxHP;
	ii.displayHP = global.battleInitData[i].maxHP;
	ii.alliance = false;
	ii.att = global.battleInitData[i].att;
	ii.def = global.battleInitData[i].def;
	ii.sp_att = global.battleInitData[i].att;
	ii.sp_def = global.battleInitData[i].def;
	ii.types = global.battleInitData[i].types;
	ii.lv = global.battleInitData[i].lv;
	
	// scale for post-game
	if (global.eventFlags[EVENT_MISSINGNO_DEFEATED]) {
		var hpPart = (ii.maxHP*1.1) / (ii.lv*1.1);
		var attPart = (ii.att*1.1) / (ii.lv*1.1);
		var diff = 50-ii.lv;
		ii.lv = 50;
		ii.maxHP = round(ii.lv * hpPart);
		ii.curHP = ii.maxHP;
		ii.displayHP = ii.curHP;
		ii.att = round(ii.lv * attPart * ((30+diff*1.5)/30.0));
		ii.sp_att = ii.att;
	}
	
	ii.stance = STANCE_NONE;
	if (variable_struct_exists(global.battleInitData[i], "vfx")) {
		ii.vfx = global.battleInitData[i].vfx;	
	}
	if (variable_struct_exists(global.battleInitData[i], "aiID")) {
		ii.aiID = global.battleInitData[i].aiID;	
	}
	if (variable_struct_exists(global.battleInitData[i], "effects")) {
		ii.effects = variable_clone(global.battleInitData[i].effects);	
	}
	if (variable_struct_exists(global.battleInitData[i], "returnPoint")) {
		global.battleKnockOutMap = variable_clone(global.battleInitData[i].returnPoint);	
	} else {
		global.battleKnockOutMap = noone;
	}
	array_push(global.initBattleQueue, ii.combatantId);
	if (i == 0) global.battleMainAdversary = ii;
	with (ii) event_user(1);
}

array_copy(global.battleQueue, 0, global.initBattleQueue, 0, array_length(global.initBattleQueue));

animating = false;
animations = ds_queue_create();
pause = 0;
whichEffectTick = 0;
isPetting = false;

ffwd = false;
ffwdPrevious = false;
ffwdPermit = false;

queuePeakSize = 0;

global.turnCounter = 0;
global.battleQueueBox = noone;