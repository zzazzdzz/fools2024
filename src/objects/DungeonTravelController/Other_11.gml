// generate chunks from queue

function slidingWindow() {
	for (var i=3; i<tH-3; i++) {
		for (var j=3; j<tW-3; j++) {
			if (consistentRandom(i*100+j, 31337005+genChunkIndex, seed) % 3 != 0) {
				if (tiles[(i-1)*tW+(j-1)] == TILE_UNPASSABLE && tiles[(i-0)*tW+(j-1)] == TILE_UNPASSABLE && tiles[(i+1)*tW+(j-1)] == TILE_UNPASSABLE) {
					if (tiles[(i-1)*tW+(j+0)] == TILE_PASSABLE && tiles[(i-0)*tW+(j+0)] == TILE_PASSABLE && tiles[(i+1)*tW+(j+0)] == TILE_PASSABLE) {
						var rnd = consistentRandom(i*100+j, 31337006+genChunkIndex, seed) % 3;
						if (rnd == 0) {
							tiles[(i-1)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i-0)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i+1)*tW+(j+0)] = TILE_PLACEHOLDER; 
						} else if (rnd == 1) {
							tiles[(i-0)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i+1)*tW+(j+0)] = TILE_PLACEHOLDER; 
						} else if (rnd == 2) {
							tiles[(i-0)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i-1)*tW+(j+0)] = TILE_PLACEHOLDER; 
						}
					}
				}
				if (tiles[(i-1)*tW+(j+1)] == TILE_UNPASSABLE && tiles[(i-0)*tW+(j+1)] == TILE_UNPASSABLE && tiles[(i+1)*tW+(j+1)] == TILE_UNPASSABLE) {
					if (tiles[(i-1)*tW+(j+0)] == TILE_PASSABLE && tiles[(i-0)*tW+(j+0)] == TILE_PASSABLE && tiles[(i+1)*tW+(j+0)] == TILE_PASSABLE) {
						var rnd = consistentRandom(i*100+j, 31337007+genChunkIndex, seed) % 3;
						if (rnd == 0) {
							tiles[(i-1)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i-0)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i+1)*tW+(j+0)] = TILE_PLACEHOLDER; 
						} else if (rnd == 1) {
							tiles[(i-0)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i+1)*tW+(j+0)] = TILE_PLACEHOLDER; 
						} else if (rnd == 2) {
							tiles[(i-0)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i-1)*tW+(j+0)] = TILE_PLACEHOLDER; 
						}
					}
				}
				if (tiles[(i-1)*tW+(j-1)] == TILE_UNPASSABLE && tiles[(i-1)*tW+(j-0)] == TILE_UNPASSABLE && tiles[(i-1)*tW+(j+1)] == TILE_UNPASSABLE) {
					if (tiles[(i-0)*tW+(j-1)] == TILE_PASSABLE && tiles[(i-0)*tW+(j+0)] == TILE_PASSABLE && tiles[(i+0)*tW+(j+1)] == TILE_PASSABLE) {
						var rnd = consistentRandom(i*100+j, 31337008+genChunkIndex, seed) % 3;
						if (rnd == 0) {
							tiles[(i-0)*tW+(j-1)] = TILE_PLACEHOLDER; tiles[(i-0)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i-0)*tW+(j+1)] = TILE_PLACEHOLDER; 
						} else if (rnd == 1) {
							tiles[(i-0)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i+0)*tW+(j+1)] = TILE_PLACEHOLDER; 
						} else if (rnd == 2) {
							tiles[(i-0)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i+0)*tW+(j-1)] = TILE_PLACEHOLDER; 
						}
					}
				}
				if (tiles[(i+1)*tW+(j-1)] == TILE_UNPASSABLE && tiles[(i+1)*tW+(j-0)] == TILE_UNPASSABLE && tiles[(i+1)*tW+(j+1)] == TILE_UNPASSABLE) {
					if (tiles[(i-0)*tW+(j-1)] == TILE_PASSABLE && tiles[(i-0)*tW+(j+0)] == TILE_PASSABLE && tiles[(i+0)*tW+(j+1)] == TILE_PASSABLE) {
						var rnd = consistentRandom(i*100+j, 31337009+genChunkIndex, seed) % 3;
						if (rnd == 0) {
							tiles[(i-0)*tW+(j-1)] = TILE_PLACEHOLDER; tiles[(i-0)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i-0)*tW+(j+1)] = TILE_PLACEHOLDER; 
						} else if (rnd == 1) {
							tiles[(i-0)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i+0)*tW+(j+1)] = TILE_PLACEHOLDER; 
						} else if (rnd == 2) {
							tiles[(i-0)*tW+(j+0)] = TILE_PLACEHOLDER; tiles[(i+0)*tW+(j-1)] = TILE_PLACEHOLDER; 
						}
					}
				}
			}
		}
	}
	for (var i=0; i<tH; i++) {
		for (var j=0; j<tW; j++) {
			if (tiles[i*tW+j] == TILE_PLACEHOLDER) tiles[i*tW+j] = TILE_UNPASSABLE;
		}
	}
}

tiles = [
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
	6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
];


if (genChunkType == CORRIDOR_KEY) {
	for (var i=0; i<tW; i++) {
		for (var j=5; j<11; j++) {
			tiles[j*tW+i] = TILE_PASSABLE;
		}
	}
	slidingWindow();
	tiles[5*tW+0] = TILE_PASSABLE;
	tiles[5*tW+tW-1] = TILE_PASSABLE;
	tiles[5*tW+1] = TILE_PASSABLE;
	tiles[5*tW+tW-2] = TILE_PASSABLE;
	tiles[10*tW+0] = TILE_PASSABLE;
	tiles[10*tW+tW-1] = TILE_PASSABLE;
	tiles[10*tW+1] = TILE_PASSABLE;
	tiles[10*tW+tW-2] = TILE_PASSABLE;
	tiles[5*tW+6] = TILE_UNPASSABLE;
	tiles[5*tW+7] = TILE_UNPASSABLE;
	tiles[5*tW+8] = TILE_UNPASSABLE;
}

if (genChunkType == CORRIDOR_KEY_USED) {
	for (var i=0; i<tW; i++) {
		for (var j=5; j<11; j++) {
			tiles[j*tW+i] = TILE_PASSABLE;
		}
	}
	slidingWindow();
	for (var i=0; i<tH/2; i++) {
		for (var j=5; j<10; j++) {
			tiles[i*tW+j] = TILE_PASSABLE;
		}
	}
	tiles[5*tW+0] = TILE_PASSABLE;
	tiles[5*tW+tW-1] = TILE_PASSABLE;
	tiles[5*tW+1] = TILE_PASSABLE;
	tiles[5*tW+tW-2] = TILE_PASSABLE;
	tiles[10*tW+0] = TILE_PASSABLE;
	tiles[10*tW+tW-1] = TILE_PASSABLE;
	tiles[10*tW+1] = TILE_PASSABLE;
	tiles[10*tW+tW-2] = TILE_PASSABLE;
	tiles[0*tW+4] = TILE_PASSABLE;
	tiles[0*tW+10] = TILE_PASSABLE;
	tiles[1*tW+4] = TILE_PASSABLE;
	tiles[1*tW+10] = TILE_PASSABLE;
}

if (genChunkType == CORRIDOR_X_LR) {
	for (var i=0; i<tW; i++) {
		for (var j=5; j<11; j++) {
			tiles[j*tW+i] = TILE_PASSABLE;
		}
	}
	slidingWindow();
	tiles[5*tW+0] = TILE_PASSABLE;
	tiles[5*tW+tW-1] = TILE_PASSABLE;
	tiles[5*tW+1] = TILE_PASSABLE;
	tiles[5*tW+tW-2] = TILE_PASSABLE;
	tiles[10*tW+0] = TILE_PASSABLE;
	tiles[10*tW+tW-1] = TILE_PASSABLE;
	tiles[10*tW+1] = TILE_PASSABLE;
	tiles[10*tW+tW-2] = TILE_PASSABLE;
}
if (genChunkType == CORRIDOR_Y_DU || genChunkType == CORRIDOR_Y_UD) {
	for (var i=0; i<tH; i++) {
		for (var j=4; j<11; j++) {
			tiles[i*tW+j] = TILE_PASSABLE;
		}
	}
	slidingWindow();
	tiles[0*tW+4] = TILE_PASSABLE;
	tiles[0*tW+10] = TILE_PASSABLE;
	tiles[1*tW+4] = TILE_PASSABLE;
	tiles[1*tW+10] = TILE_PASSABLE;
	tiles[(tH-1)*tW+4] = TILE_PASSABLE;
	tiles[(tH-1)*tW+10] = TILE_PASSABLE;
	tiles[(tH-2)*tW+4] = TILE_PASSABLE;
	tiles[(tH-2)*tW+10] = TILE_PASSABLE;
}
if (genChunkType == TURN_LU) {
	for (var i=0; i<tW*0.66; i++) {
		for (var j=5; j<11; j++) {
			tiles[j*tW+i] = TILE_PASSABLE;
		}
	}
	for (var i=0; i<tH*0.66; i++) {
		for (var j=4; j<11; j++) {
			tiles[i*tW+j] = TILE_PASSABLE;
		}
	}
	// do some sliding window beautifications
	slidingWindow();
	tiles[5*tW+0] = TILE_PASSABLE;
	tiles[10*tW+0] = TILE_PASSABLE;
	tiles[5*tW+1] = TILE_PASSABLE;
	tiles[10*tW+1] = TILE_PASSABLE;
	tiles[0*tW+4] = TILE_PASSABLE;
	tiles[0*tW+10] = TILE_PASSABLE;
	tiles[1*tW+4] = TILE_PASSABLE;
	tiles[1*tW+10] = TILE_PASSABLE;
}
if (genChunkType == INTERSECT_LUD) {
	for (var i=0; i<tW*0.66; i++) {
		for (var j=5; j<11; j++) {
			tiles[j*tW+i] = TILE_PASSABLE;
		}
	}
	for (var i=0; i<tH; i++) {
		for (var j=4; j<11; j++) {
			tiles[i*tW+j] = TILE_PASSABLE;
		}
	}
	// do some sliding window beautifications
	slidingWindow();
	tiles[5*tW+0] = TILE_PASSABLE;
	tiles[10*tW+0] = TILE_PASSABLE;
	tiles[5*tW+1] = TILE_PASSABLE;
	tiles[10*tW+1] = TILE_PASSABLE;
	tiles[0*tW+4] = TILE_PASSABLE;
	tiles[0*tW+10] = TILE_PASSABLE;
	tiles[1*tW+4] = TILE_PASSABLE;
	tiles[1*tW+10] = TILE_PASSABLE;
	tiles[(tH-1)*tW+4] = TILE_PASSABLE;
	tiles[(tH-1)*tW+10] = TILE_PASSABLE;
	tiles[(tH-2)*tW+4] = TILE_PASSABLE;
	tiles[(tH-2)*tW+10] = TILE_PASSABLE;
}
if (genChunkType == CORRIDOR_Y_DR) {
	for (var i=5; i<tW; i++) {
		for (var j=5; j<11; j++) {
			tiles[j*tW+i] = TILE_PASSABLE;
		}
	}
	for (var i=5; i<tH; i++) {
		for (var j=4; j<11; j++) {
			tiles[i*tW+j] = TILE_PASSABLE;
		}
	}
	// do some sliding window beautifications
	slidingWindow();
	tiles[5*tW+tW-2] = TILE_PASSABLE;
	tiles[10*tW+tW-2] = TILE_PASSABLE;
	tiles[5*tW+tW-1] = TILE_PASSABLE;
	tiles[10*tW+tW-1] = TILE_PASSABLE;
	tiles[(tH-1)*tW+4] = TILE_PASSABLE;
	tiles[(tH-1)*tW+10] = TILE_PASSABLE;
	tiles[(tH-2)*tW+4] = TILE_PASSABLE;
	tiles[(tH-2)*tW+10] = TILE_PASSABLE;
}
if (genChunkType == CORRIDOR_Y_UR) {
	for (var i=5; i<tW; i++) {
		for (var j=5; j<11; j++) {
			tiles[j*tW+i] = TILE_PASSABLE;
		}
	}
	for (var i=0; i<tH*0.66; i++) {
		for (var j=4; j<11; j++) {
			tiles[i*tW+j] = TILE_PASSABLE;
		}
	}
	// do some sliding window beautifications
	slidingWindow();
	tiles[5*tW+tW-2] = TILE_PASSABLE;
	tiles[10*tW+tW-2] = TILE_PASSABLE;
	tiles[5*tW+tW-1] = TILE_PASSABLE;
	tiles[10*tW+tW-1] = TILE_PASSABLE;
	tiles[0*tW+4] = TILE_PASSABLE;
	tiles[0*tW+10] = TILE_PASSABLE;
	tiles[1*tW+4] = TILE_PASSABLE;
	tiles[1*tW+10] = TILE_PASSABLE;
}
if (genChunkType == CORRIDOR_Y_LD) {
	for (var i=0; i<tW*0.66; i++) {
		for (var j=5; j<11; j++) {
			tiles[j*tW+i] = TILE_PASSABLE;
		}
	}
	for (var i=6; i<tH; i++) {
		for (var j=4; j<11; j++) {
			tiles[i*tW+j] = TILE_PASSABLE;
		}
	}
	// do some sliding window beautifications
	slidingWindow();
	tiles[5*tW+0] = TILE_PASSABLE;
	tiles[10*tW+0] = TILE_PASSABLE;
	tiles[5*tW+1] = TILE_PASSABLE;
	tiles[10*tW+1] = TILE_PASSABLE;
	tiles[(tH-1)*tW+4] = TILE_PASSABLE;
	tiles[(tH-1)*tW+10] = TILE_PASSABLE;
	tiles[(tH-2)*tW+4] = TILE_PASSABLE;
	tiles[(tH-2)*tW+10] = TILE_PASSABLE;
}
if (genChunkType == CORRIDOR_Y_LU) {
	for (var i=0; i<tW*0.66; i++) {
		for (var j=5; j<11; j++) {
			tiles[j*tW+i] = TILE_PASSABLE;
		}
	}
	for (var i=0; i<tH*0.66; i++) {
		for (var j=4; j<11; j++) {
			tiles[i*tW+j] = TILE_PASSABLE;
		}
	}
	// do some sliding window beautifications
	slidingWindow();
	tiles[5*tW+0] = TILE_PASSABLE;
	tiles[10*tW+0] = TILE_PASSABLE;
	tiles[5*tW+1] = TILE_PASSABLE;
	tiles[10*tW+1] = TILE_PASSABLE;
	tiles[0*tW+4] = TILE_PASSABLE;
	tiles[0*tW+10] = TILE_PASSABLE;
	tiles[1*tW+4] = TILE_PASSABLE;
	tiles[1*tW+10] = TILE_PASSABLE;
}
if (genChunkType == INTERSECT_RUD) {
	for (var i=6; i<tW; i++) {
		for (var j=5; j<11; j++) {
			tiles[j*tW+i] = TILE_PASSABLE;
		}
	}
	for (var i=0; i<tH; i++) {
		for (var j=4; j<11; j++) {
			tiles[i*tW+j] = TILE_PASSABLE;
		}
	}
	// do some sliding window beautifications
	slidingWindow();
	tiles[5*tW+tW-2] = TILE_PASSABLE;
	tiles[10*tW+tW-2] = TILE_PASSABLE;
	tiles[5*tW+tW-1] = TILE_PASSABLE;
	tiles[10*tW+tW-1] = TILE_PASSABLE;
	tiles[0*tW+4] = TILE_PASSABLE;
	tiles[0*tW+10] = TILE_PASSABLE;
	tiles[1*tW+4] = TILE_PASSABLE;
	tiles[1*tW+10] = TILE_PASSABLE;
	tiles[(tH-1)*tW+4] = TILE_PASSABLE;
	tiles[(tH-1)*tW+10] = TILE_PASSABLE;
	tiles[(tH-2)*tW+4] = TILE_PASSABLE;
	tiles[(tH-2)*tW+10] = TILE_PASSABLE;
}

/*
var p = 4;
var w = 6;
var l = 0;

if (genChunkType == CORRIDOR_X) {
	for (var i=0; i<tW; i++) {
		for (var j=0; j<tH; j++) {
			if (j > p && j < p+w) tiles[j*tW+i] = TILE_PASSABLE;	
		}
		l += 1;
		if (l>1) {
			p = 4 + consistentRandom(i, 313371001, seed) % 2;
			w = 6 + consistentRandom(i, 313371000, seed) % 2;
			l = 0;
		}
	}
}

if (genChunkType == CORRIDOR_Y) {
	for (var i=0; i<tH; i++) {
		for (var j=0; j<tW; j++) {
			if (j > p && j < p+w) tiles[i*tW+j] = TILE_PASSABLE;	
		}
		l += 1;
		if (l>1) {
			p = 3 + consistentRandom(i, 313371001, seed) % 2;
			w = 6 + consistentRandom(i, 313371000, seed) % 2;
			l = 0;
		}
	}
}

if (genChunkType == TURN_WL) {
	for (var i=0; i<tW/2; i++) {
		for (var j=0; j<tH; j++) {
			if (j > p && j < p+w) tiles[j*tW+i] = TILE_PASSABLE;	
		}
		l += 1;
		if (l>1) {
			p = 4 + consistentRandom(i, 313371001, seed) % 2;
			w = 6 + consistentRandom(i, 313371000, seed) % 2;
			l = 0;
		}
	}
	for (var i=0; i<tH/2; i++) {
		for (var j=0; j<tW; j++) {
			if (j > p && j < p+w) tiles[i*tW+j] = TILE_PASSABLE;	
		}
		l += 1;
		if (l>1) {
			p = 3 + consistentRandom(i, 313371001, seed) % 2;
			w = 6 + consistentRandom(i, 313371000, seed) % 2;
			l = 0;
		}
	}
	var thirdW = tW div 3;
	var thirdH = tH div 3;
	for (var i=thirdH; i<2*thirdH; i++) {
		for (j=thirdW; j<2*thirdW; j++) {
			tiles[i*tW+j] = TILE_PASSABLE;
		}
	}
}

------------------------------


	var last = 0;
	for (var i=2; i<tW-2; i++) {
		var t = consistentRandom(i, 31337001, seed) % 2 == 0 ? TILE_PASSABLE : TILE_UNPASSABLE;
		tiles[5*tW+i] = t;
	}
	for (var i=1; i<tW-1; i++) {
		if (tiles[5*tW+i] == TILE_UNPASSABLE && tiles[5*tW+i-1] == TILE_PASSABLE && tiles[5*tW+i+1] == TILE_PASSABLE) {
			var offs = consistentRandom(i, 31337002, seed) % 2 ? -1 : 1;
			tiles[5*tW+i-offs] = TILE_UNPASSABLE;
		}
	}
	for (var i=2; i<tW-2; i++) {
		var t = consistentRandom(i, 31337003, seed) % 2 == 0 ? TILE_PASSABLE : TILE_UNPASSABLE;
		tiles[10*tW+i] = t;
	}
	for (var i=1; i<tW-1; i++) {
		if (tiles[10*tW+i] == TILE_UNPASSABLE && tiles[10*tW+i-1] == TILE_PASSABLE && tiles[10*tW+i+1] == TILE_PASSABLE) {
			var offs = consistentRandom(i, 31337004, seed) % 2 ? -1 : 1;
			tiles[10*tW+i-offs] = TILE_UNPASSABLE;
		}
	}
	
*/