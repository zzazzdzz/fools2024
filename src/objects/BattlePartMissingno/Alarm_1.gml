if (storyState == 0) {
	global.gp0 = spawnIntermissionTextbox(formatTextboxString(@"
\c41NNNQ\c30Maybe it's true.
\c41IIIJ\c30Maybe this battle truly is impossible.\d30 \c30

\c41IIIJ\c30But, if you refuse to play by the rules,
\c41HHHI\c30and give your best to forge a new path...\d30 \c30

\c41FFFH\c30If you decide to look beyond what's impossible...
\c41JJJM\c30only then can you instill change.\d30 \c30
<@
	"));
	global.gp0.depth = -9999999;
	storyState = 1;
	alarm[1] = 1;
}
else if (storyState == 1) {
	if (!instance_exists(global.gp0)) {
		storyState = 2;
	}
	alarm[1] = 1;
}
else if (storyState == 2) {
	storyState = 3;
	alarm[1] = 60;
}
else if (storyState == 3) {
	scriptingHealAll();
		
	var dungeonId = 12;
	global.curDungeonId = dungeonId;
	global.battleCurrentDutyName = global.dungeonDb[dungeonId][0];
	global.battleStats = [[0,0,0],[0,0,0],[0,0,0],[0,0,false]];
	global.battleLastBlow = "due to an unseen force";
	global.battleLastTarget = "@6Bepis@0";
	global.battleCurrentAttackerIndex = -1;
	global.dungeonData = variable_clone(global.dungeonDb[dungeonId][2]);
	global.overworldSourceMap = global.overworldCurMap;
	global.overworldSourceVariant = global.overworldCurVariant;
	global.dungeonDiscoveredTiles = [];
	global.dungeonCurrentDiscoveredTiles = [];
		
	var opponentData = global.dungeonData[2][1];
	global.battleAdversaryScript = opponentData.scripts;
	global.battleInitData = opponentData.adversaries;
	global.tileMap = opponentData.tilemap;
	global.battleType = BATTLETYPE_OVERWORLD;
	global.battleLog = [];
		
	room_goto(BattleRoom);		
}