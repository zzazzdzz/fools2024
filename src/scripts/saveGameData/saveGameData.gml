function file_bin_write_word(f, v) {
	file_bin_write_byte(f, v mod 256);
	file_bin_write_byte(f, v div 256);
}

function file_bin_write_dword(f, v) {
	file_bin_write_word(f, v mod 65536);
	file_bin_write_word(f, v div 65536);
}

function file_bin_write_string(f, s) {
	var l = string_length(s);
	for (var i=1; i<=l; i++) {
		file_bin_write_byte(f, ord(string_char_at(s, i)));
	}
	file_bin_write_byte(f, 0);
}

function saveGameData(){
	var f = file_bin_open(working_directory + "save.dat", 1);
	file_bin_write_dword(f, room);
	file_bin_write_dword(f, Hero.x);
	file_bin_write_dword(f, Hero.y);
	file_bin_write_dword(f, global.playTime);
	for (var i=0; i<1024; i++) {
		file_bin_write_byte(f, global.scriptEventFlags[i]);	
	}
	file_bin_write_string(f, global.companionName);
	file_bin_write_string(f, global.playerName);
	file_bin_write_byte(f, global.companionIsWithPlayer);
	file_bin_write_byte(f, global.playerPersonality);
	file_bin_write_word(f, global.shardsAcquired);
	file_bin_write_word(f, global.symbolsAcquired);
	file_bin_write_string(f, global.currentLocationName);
	file_bin_close(f);
	
	global.lastLoadedPlayTime = global.playTime;
	global.lastLoadedShards = global.shardsAcquired;
	global.lastLoadedSymbols = global.symbolsAcquired;
	global.lastLocationName = global.currentLocationName;
}

function loadGameData() {
	var f = file_bin_open(working_directory + "save.dat", 0);
	room = file_bin_read_dword(f);
	global.heroSpawnX = file_bin_read_dword(f);
	global.heroSpawnY = file_bin_read_dword(f);
	global.playTime = file_bin_read_dword(f);
	for (var i=0; i<1024; i++) {
		global.scriptEventFlags[i] = file_bin_read_byte(f);	
	}
	global.companionName = file_bin_read_string(f);
	global.playerName = file_bin_read_string(f);
	global.companionIsWithPlayer = file_bin_read_byte(f);
	global.playerPersonality = file_bin_read_byte(f);
	global.shardsAcquired = file_bin_read_word(f);
	global.symbolsAcquired = file_bin_read_word(f);
	global.currentLocationName = file_bin_read_string(f);
	file_bin_close(f);
	
	global.lastLoadedPlayTime = global.playTime;
	global.lastLoadedShards = global.shardsAcquired;
	global.lastLoadedSymbols = global.symbolsAcquired;
	global.lastLocationName = global.currentLocationName;
}