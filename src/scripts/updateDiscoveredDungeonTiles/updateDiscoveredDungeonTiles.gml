// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function updateDiscoveredDungeonTiles(){
	var discoveredTiles = [];
	var keys = {};

	for (var i=0; i<array_length(global.dungeonDiscoveredTiles); i++) {
		var t = global.dungeonDiscoveredTiles[i];
		var k = string(t[0]) + "," + string(t[1]) + "," + string(t[2]);
		if (!variable_struct_exists(keys, k)) {
			array_push(discoveredTiles, t);
			variable_struct_set(keys, k, 1);
		}
	}
	for (var i=0; i<array_length(global.dungeonCurrentDiscoveredTiles); i++) {
		var t = global.dungeonCurrentDiscoveredTiles[i];
		var k = string(t[0]) + "," + string(t[1]) + "," + string(t[2]);
		if (!variable_struct_exists(keys, k)) {
			array_push(discoveredTiles, t);
			variable_struct_set(keys, k, 1);
		}
	}
	global.dungeonDiscoveryProgress[global.curDungeonId] = discoveredTiles;
}