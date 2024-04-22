bgAsset = asset_get_index("Env" + global.overworldCurMap + "BG");
maskAsset = asset_get_index("Env" + global.overworldCurMap + "Mask");
mapBaseMusicId = 0;
mapMusicState = "";
bgOffset = 0;

if (bgAsset == -1 || maskAsset == -1) {
	bugcheck("LdrUnkMapAsset");
	exit;
}

var ii = instance_create(OverworldHero, global.overworldSpawnX, global.overworldSpawnY);
ii.animSpriteSetIndex = global.teamMembers[0].species;
with (ii) event_user(1);

room_width = sprite_get_width(bgAsset)*2;
room_height = sprite_get_height(bgAsset)*2;

try {
	var mapData = global.mapDb[$ global.overworldCurMap];
} catch(err) {
	bugcheck("LdrUnkMapData");
	exit;
}

var variant = "";

for (var i=0; i<array_length(mapData); i++) {
	if (mapData[i][0] == MAP_VARIANT) {
		variant = mapData[i][1];
	}
	if (variant != "") {
		if (variant != global.overworldCurVariant) continue;
	}
	if (mapData[i][0] == MAP_OBJECT) {
		var ii = instance_create(OverworldObject, mapData[i][1]*2, mapData[i][2]*2);
		if (mapData[i][3] == "DYN_PARTNER") ii.animSpriteSetIndex = global.partnerSpecies;
		else if (mapData[i][3] == "DYN_PARTNER2") ii.animSpriteSetIndex = global.partnerSpeciesSecondary;
		else ii.animSpriteSetIndex = mapData[i][3];
		ii.facing = mapData[i][4];
		ii.onInteract = mapData[i][5];
		with (ii) event_user(1);
	}
	else if (mapData[i][0] == MAP_OBJECTCOND) {
		if (global.eventFlags[mapData[i][6]] == false) {
			var ii = instance_create(OverworldObject, mapData[i][1]*2, mapData[i][2]*2);
			if (mapData[i][3] == "DYN_PARTNER") ii.animSpriteSetIndex = global.partnerSpecies;
			else if (mapData[i][3] == "DYN_PARTNER2") ii.animSpriteSetIndex = global.partnerSpeciesSecondary;
			else ii.animSpriteSetIndex = mapData[i][3];
			ii.facing = mapData[i][4];
			ii.onInteract = mapData[i][5];
			with (ii) event_user(1);
		}
	}
	else if (mapData[i][0] == MAP_LOADZONE) {
		var ii = instance_create(OverworldLoadZone, mapData[i][1]*2, mapData[i][2]*2);
		ii.x2 = mapData[i][3]*2;
		ii.y2 = mapData[i][4]*2;
		ii.sendToN = mapData[i][5][0];
		ii.sendToSN = mapData[i][5][1];
		ii.sendToX = mapData[i][6];
		ii.sendToY = mapData[i][7];
		ii.sendToF = mapData[i][8];
	}
	else if (mapData[i][0] == MAP_SCRIPT) {
		var ii = instance_create(OverworldScriptZone, mapData[i][1]*2, mapData[i][2]*2);
		ii.x2 = mapData[i][3]*2;
		ii.y2 = mapData[i][4]*2;
		ii.payload = mapData[i][5];
		ii.flag = mapData[i][6];
	}
	else if (mapData[i][0] == MAP_PART) {
		instance_create(mapData[i][1], mapData[i][2]*2, mapData[i][3]*2);
	}
	else if (mapData[i][0] == MAP_MUSICID) {
		mapBaseMusicId = mapData[i][1];
		alarm[0] = 3;
	}
	else if (mapData[i][0] == MAP_VARIANT) {}
	else {
		bugcheck("LdrUndefType<" + string(i) + ">");
		exit;
	}
}

var o = instance_create(ScreenTransitionController, 0, 0);
o.transition_type = TRANSITION_FADEFROMBLACK;

depth = -100;