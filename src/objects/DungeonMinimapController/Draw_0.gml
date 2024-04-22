
// draw minimap
ctr += 1;
if ((ctr mod 16) < 8) {
	draw_sprite_ext(MiniMapTiles, 0, 20+DungeonTravelController.chunkMapX*10, 150+DungeonTravelController.chunkMapY*10, 2, 2, 0, c_white, 1);
}
for (var i=0; i<array_length(global.dungeonDiscoveredTiles); i++) {
	var t = global.dungeonDiscoveredTiles[i];
	draw_sprite_ext(MiniMapTiles, t[2], 20+t[0]*10, 150+t[1]*10, 2, 2, 0, c_white, 0.4);
}
for (var i=0; i<array_length(global.dungeonCurrentDiscoveredTiles); i++) {
	var t = global.dungeonCurrentDiscoveredTiles[i];
	draw_sprite_ext(MiniMapTiles, t[2], 20+t[0]*10, 150+t[1]*10, 2, 2, 0, c_white, 1);
}
