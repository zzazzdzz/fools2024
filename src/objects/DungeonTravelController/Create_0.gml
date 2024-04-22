if (global.battleResult == BATTLERESULT_LOSE) {
	room_persistent = false;
	var mapData = global.dungeonDb[global.curDungeonId][7];
	if (global.battleKnockOutMap != noone) {
		mapData = global.battleKnockOutMap;	
	}
	global.overworldCurMap = mapData[0];
	global.overworldCurVariant = mapData[1];
	global.overworldSpawnX = mapData[2];
	global.overworldSpawnY = mapData[3];
	global.overworldSpawnFacing = mapData[4];
	global.battleResult = BATTLERESULT_NONE;
	room_goto(OverworldRoom);
	exit;
}
global.battleResult = BATTLERESULT_NONE;
global.keyDoorUnlocked = false;

dutyTitleInst = instance_create(DutyTitleController, 0, 0);
loadScriptExecuted = false;

var o = instance_create(ScreenTransitionController, 0, 0);
o.transition_type = TRANSITION_FADEFROMBLACK;

bgMusicAsset = asset_get_index("Mus" + string(global.dungeonDb[global.curDungeonId][4]));
if (bgMusicAsset == -1) bgMusicAsset = Mus8;
tilesetAsset = asset_get_index("TileGroup" + string(global.dungeonDb[global.curDungeonId][8]));
if (tilesetAsset == -1) tilesetAsset = TileGroup001;

global.musicIndex = global.dungeonDb[global.curDungeonId][4];
global.musicControl = MUS_PLAY;

tW = 16;
tH = 16;

tiles = [];

currentChunk = [];
neighborChunk = [];

seed = irandom(999999999);

#macro TILE_PASSABLE 63
#macro TILE_UNPASSABLE 6
#macro TILE_PLACEHOLDER -1
#macro TILE_KEY 269

#macro CORRIDOR_X_LR 0
#macro CORRIDOR_Y_DU 1
#macro TURN_LU 2
#macro NULL_CHUNK 3
#macro INTERSECT_LUD 4
#macro CORRIDOR_Y_UD 5
#macro CORRIDOR_Y_DR 6
#macro CORRIDOR_Y_UR 7
#macro CORRIDOR_Y_LD 8
#macro CORRIDOR_Y_LU 9
#macro INTERSECT_RUD 10
#macro CORRIDOR_KEY 11
#macro CORRIDOR_KEY_USED 12

global.dungeonDataOffset = 0;

chunk_mem = noone;
chunk_script = noone;
chunk_queue = global.dungeonData[0][0];
chunk_scripts = global.dungeonData[1][0];
chunk_index = 0;
chunk_extras = [];
event_user(2);

var numMembers = array_length(global.teamMembers);
var start = (50*(numMembers-1))/2;
var step = 50;

for (var i=0; i<numMembers; i++) {
	var ii = instance_create(OverworldObject, -50, 240-start+i*step);
	ii.animSpriteSetIndex = global.teamMembers[i].species;
	ii.facing = 2;
	ii.onInteract = noone;
	ii.isHero = true;
	with (ii) event_user(1);
	ii.animTargetX = 313;
	ii.animTargetY = ii.y;
	ii.animTargetSteps = 160;
	with (ii) event_user(2);
}

global.dungeonCurrentDiscoveredTiles = [[0, 0, 1]];
global.encounterSprites = [];

travel = false;
travel_toggle = false;

fast_scroll = false;
fast_scroll_toggle = false;

locked = false;

events = ds_queue_create();

pause = 0;

chunkMapX = 0;
chunkMapY = 0;
ctr = 0;

instance_create(DungeonMinimapController, 0, 0);