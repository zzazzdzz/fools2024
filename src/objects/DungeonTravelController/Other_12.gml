function decorate() {
	for (var i=0; i<tH; i++) {
		for (var j=0; j<tW; j++) {
			var r = consistentRandom(i*100+j, 31337110+genChunkIndex, seed) % 70;
			if (r == 0 && tiles[i*tW+j] == 6) {
				tiles[i*tW+j] = 51;
			}
			if (r == 1 && tiles[i*tW+j] == 6) {
				tiles[i*tW+j] = 56;
			}
			if (r == 2 && tiles[i*tW+j] == 63) {
				tiles[i*tW+j] = 106;
			}
			if (r == 3 && tiles[i*tW+j] == 63) {
				tiles[i*tW+j] = 107;
			}
			if (r == 4 && tiles[i*tW+j] == 63) {
				tiles[i*tW+j] = 108;
			}
		}
	}
}

// draw current chunk queue

genChunkType = chunk_queue[0][0];
genChunkIndex = chunk_index;
event_user(1);
event_user(0);
decorate();
if (!global.keyDoorUnlocked && genChunkType == CORRIDOR_KEY) tiles[5*tW+7] = TILE_KEY;
array_copy(currentChunk, 0, tiles, 0, array_length(tiles));

genChunkType = chunk_queue[1][0];
genChunkIndex = chunk_index+1;
event_user(1);
event_user(0);
decorate();
if (!global.keyDoorUnlocked && genChunkType == CORRIDOR_KEY) tiles[5*tW+7] = TILE_KEY;
array_copy(neighborChunk, 0, tiles, 0, array_length(tiles));

scrollX = 48;
scrollY = 48*3;

chunk_script = chunk_scripts[0];
chunk_extras = chunk_queue[0];
chunk_mem = [0,0,0,0];