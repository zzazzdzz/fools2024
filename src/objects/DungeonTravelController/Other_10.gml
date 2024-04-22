// redecorate tilemap tiles

#macro T_XXXX 6
#macro T_wwww 63
#macro T_____ -1

var tileConversions = [
	[T_____, T_XXXX, T_____,
	 T_XXXX, T_XXXX, T_XXXX,
	 T_____, T_wwww, T_____, 9],
	 
	[T_____, T_wwww, T_____,
	 T_XXXX, T_XXXX, T_XXXX,
	 T_____, T_XXXX, T_____, 3],
	 
	[T_____, T_XXXX, T_____,
	 T_XXXX, T_XXXX, T_wwww,
	 T_____, T_XXXX, T_____, 7],
	 
	[T_____, T_XXXX, T_____,
	 T_wwww, T_XXXX, T_XXXX,
	 T_____, T_XXXX, T_____, 5],
	
	[T_XXXX, T_XXXX, T_XXXX,
	 T_XXXX, T_XXXX, T_XXXX,
	 T_wwww, T_XXXX, T_wwww, 27],
	 
	[T_wwww, T_XXXX, T_wwww,
	 T_XXXX, T_XXXX, T_XXXX,
	 T_XXXX, T_XXXX, T_XXXX, 30],
	 
	[T_XXXX, T_XXXX, T_XXXX,
	 T_wwww, T_wwww, T_wwww,
	 T_____, T_wwww, T_____, 60],
	 
	[T_____, T_wwww, T_____,
	 T_wwww, T_wwww, T_wwww,
	 T_XXXX, T_XXXX, T_XXXX, 66],
	 
	[T_____, T_wwww, T_XXXX,
	 T_wwww, T_wwww, T_XXXX,
	 T_____, T_wwww, T_XXXX, 64],
	 
	[T_XXXX, T_wwww, T_____,
	 T_XXXX, T_wwww, T_wwww,
	 T_XXXX, T_wwww, T_____, 62],

	[T_____, T_XXXX, T_____,
	 T_wwww, T_XXXX, T_wwww,
	 T_____, T_wwww, T_____, 22],
	 
	[T_____, T_XXXX, T_____,
	 T_XXXX, T_XXXX, T_XXXX,
	 T_wwww, T_XXXX, T_____, 32],
	
	[T_____, T_XXXX, T_____,
	 T_XXXX, T_XXXX, T_XXXX,
	 T_____, T_XXXX, T_wwww, 31],
	 
	[T_____, T_XXXX, T_____,
	 T_XXXX, T_XXXX, T_wwww,
	 T_____, T_wwww, T_____, 10],
	 
	[T_____, T_XXXX, T_____,
	 T_wwww, T_XXXX, T_XXXX,
	 T_____, T_wwww, T_____, 8],
	 
	[T_wwww, T_XXXX, T_wwww,
	 T_XXXX, T_XXXX, T_XXXX,
	 T_____, T_XXXX, T_____, 30],
	  
	[T_____, T_wwww, T_____,
	 T_wwww, T_XXXX, T_wwww,
	 T_XXXX, T_XXXX, T_XXXX, 18],
	 
	[T_____, T_wwww, T_____,
	 T_wwww, T_XXXX, T_XXXX,
	 T_____, T_XXXX, T_____, 2],
	 
	[T_____, T_wwww, T_____,
	 T_XXXX, T_XXXX, T_wwww,
	 T_____, T_XXXX, T_____, 4],
	 
	[T_____, T_wwww, T_____,
	 T_XXXX, T_XXXX, T_wwww,
	 T_____, T_XXXX, T_____, 4],
	 
	[T_wwww, T_XXXX, T_____,
	 T_XXXX, T_XXXX, T_____,
	 T_____, T_____, T_____, 34],
	
	[T_____, T_XXXX, T_wwww,
	 T_____, T_XXXX, T_XXXX,
	 T_____, T_____, T_____, 33],
];

var baktiles = [];
array_copy(baktiles, 0, tiles, 0, array_length(tiles));

for (var xi=1; xi<tW-1; xi++) {
	for (var yi=1; yi<tH-1; yi++) {
		for (var k=0; k<array_length(tileConversions); k++) {
			var match = true;
			
			if (tileConversions[k][0] != T_____) if (baktiles[(yi-1)*tW+(xi-1)] != tileConversions[k][0]) match = false;
			if (tileConversions[k][1] != T_____) if (baktiles[(yi-1)*tW+(xi+0)] != tileConversions[k][1]) match = false;
			if (tileConversions[k][2] != T_____) if (baktiles[(yi-1)*tW+(xi+1)] != tileConversions[k][2]) match = false;
			
			if (tileConversions[k][3] != T_____) if (baktiles[(yi+0)*tW+(xi-1)] != tileConversions[k][3]) match = false;
			if (tileConversions[k][4] != T_____) if (baktiles[(yi+0)*tW+(xi+0)] != tileConversions[k][4]) match = false;
			if (tileConversions[k][5] != T_____) if (baktiles[(yi+0)*tW+(xi+1)] != tileConversions[k][5]) match = false;
			
			if (tileConversions[k][6] != T_____) if (baktiles[(yi+1)*tW+(xi-1)] != tileConversions[k][6]) match = false;
			if (tileConversions[k][7] != T_____) if (baktiles[(yi+1)*tW+(xi+0)] != tileConversions[k][7]) match = false;
			if (tileConversions[k][8] != T_____) if (baktiles[(yi+1)*tW+(xi+1)] != tileConversions[k][8]) match = false;
			
			if (match) {
				tiles[yi*tW+xi] = tileConversions[k][9];
				break;
			}
		}
	}
}

