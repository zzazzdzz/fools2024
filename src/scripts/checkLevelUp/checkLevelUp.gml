function checkLevelUp() {}

function levelUpGetExpRemaining(_class, _xp) {
	// find current level
	for (_i = 49; _i >= 0; _i -= 1){
	    if (global.levelDb[_i][_class] < _xp) break;
	}
	_i += 1;
	
	if (_i >= 50) return 0;
	else return global.levelDb[_i][_class] - _xp;
}

function levelUpAddExp(party_data, _xp){
	// stolen from my old project lol
	var _i, _j;
	_class = party_data.xp_rate;

	// find current level
	for (_i = 49; _i >= 0; _i -= 1){
	    if (global.levelDb[_i][_class] < party_data.xp) break;
	}
	_i += 1;

	// add exp
	party_data.xp += _xp;
	
	// bail out if beyond leveling curve
	if (_i >= 50) return 0;

	// check for levelup
	if (party_data.xp > global.levelDb[_i][_class]){
	    // how many levels?
	    for (_j = 49; _j >= 0; _j -= 1){
	        if (global.levelDb[_j][_class] < party_data.xp) break;
	    }
	    _j += 1;
		party_data.lv = _j;
	    return _j - _i;
	}else{
	    return 0;
	}
}

function levelUpAddStats(party_data, start_lv, iter) {
	var lcg = party_data.xp_rate * 17;
	for (var i=0; i<start_lv; i++) {
		for (var j=0; j<6; j++) {
			lcg *= 75; lcg += 74; lcg %= 65537;
		}
	}
	var growth = [
		// atk, def, spatk, spdef, hp, pp
		// squirtle line
		[2, 3, 2, 3, 5, 4],
		// charmander line
		[3, 2, 3, 2, 4, 5],
		// bulba line
		[2, 2, 3, 2, 3, 6]
	];
	var result = [0,0,0,0,0,0];
	for (var i=0; i<iter; i++) {
		for (var j=0; j<6; j++) {
			var mult = ((lcg div 64) % 256) / 256;
			mult += 0.5;
			mult *= growth[party_data.xp_rate][j];
			mult /= 2;
			mult = round(mult);
			result[j] += mult;
			lcg *= 75; lcg += 74; lcg %= 65537;
		}
	}
	party_data.att += result[0];
	party_data.def += result[1];
	party_data.sp_att += result[2];
	party_data.sp_def += result[3];
	party_data.curHP += result[4];
	party_data.maxHP += result[4];
	party_data.curPP += result[5];
	party_data.maxPP += result[5];
	
	return result;
}