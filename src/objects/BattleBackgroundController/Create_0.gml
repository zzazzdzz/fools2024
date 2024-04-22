depth = 10000;

tilesetAsset = asset_get_index("TileGroup" + string(global.dungeonDb[global.curDungeonId][8]));
if (tilesetAsset == -1) tilesetAsset = TileGroup001;

bepis = 0;
xoffs = 0;
yoffs = 0;