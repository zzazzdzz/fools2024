#macro SECURITY_NOTICE "!!! SECURITY NOTICE !!! Save data might contain tokens used for leaderboard synchronization. They can be used to impersonate you."
#macro SECURITY_NOTICE2 "DO NOT SHARE YOUR SAVE DATA WITH THIRD PARTIES UNDER ANY CIRCUMSTANCES."

function saveLoadGame() {}

function saveGameKeystreamInit() {
	saveGenState = 483092853;
}
function saveGameKeystreamFeed(prev) {
	saveGenState ^= (saveGenState << 13) & 0xffffff;
	saveGenState ^= (saveGenState >> 17) & 0xffffff;
	saveGenState ^= (saveGenState << 5) & 0xffffff;
	return prev ^ ((saveGenState >> 15) & 0xFF);
}

function saveGame(){
	var xx = global.overworldSpawnX; //850*2;
	var yy = global.overworldSpawnY; //430*2;
	if (instance_exists(OverworldHero)) {
		xx = OverworldHero.x;
		yy = OverworldHero.y;
	}
	var saveData = [
		global.teamMembers,
		global.overworldCurMap,
		global.overworldCurVariant,
		xx, yy,
		global.playTime,
		global.completedDuties,
		global.eventFlags,
		global.roamingShopData,
		global.money,
		global.curStoryHint,
		global.onlineLeaderboardBind,
		[global.partnerSpecies, global.partnerName, global.partnerSpeciesSecondary, global.partnerNameSecondary],
		global.unlockedDungeonLists,
		global.dungeonDiscoveryProgress,
		global.compendiumData,
		[global.onlineAuto1, global.onlineAuto2],
		0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0,
		
		[irandom(9999999), irandom(9999999), irandom(9999999)]
	];
	var jsonStr = json_stringify(saveData);
	var checksum = md5_string_utf8(jsonStr + SAVE_CHECKSUM_SALT);
	
	saveGameKeystreamInit();
	var hexTbl = ["A","x","D","c","F","v","G","b","H","n","J","m","K","i","O","p"];
	var out = [];
	var prev = 0;
	for (var i=1; i<=string_length(checksum); i++) {
		var b = string_byte_at(checksum, i) ^ saveGameKeystreamFeed(prev);
		array_push(out, hexTbl[b div 16]);
		array_push(out, hexTbl[b mod 16]);
		prev = string_byte_at(checksum, i);
	}
	for (var i=1; i<=string_length(jsonStr); i++) {
		var b = string_byte_at(jsonStr, i) ^ saveGameKeystreamFeed(prev);
		array_push(out, hexTbl[b div 16]);
		array_push(out, hexTbl[b mod 16]);
		prev = string_byte_at(jsonStr, i);
	}
	
	var file = file_text_open_write(working_directory + "savefile");
	file_text_write_string(file, SECURITY_NOTICE);
    file_text_writeln(file);
	file_text_write_string(file, SECURITY_NOTICE2);
    file_text_writeln(file);
	file_text_write_string(file, SECURITY_NOTICE2);
    file_text_writeln(file);
	file_text_write_string(file, SECURITY_NOTICE2);
    file_text_writeln(file);
	file_text_write_string(file, SECURITY_NOTICE2);
    file_text_writeln(file);
	file_text_write_string(file, string_join_ext("", out));
	file_text_close(file);
}

function loadGame() {
	try {
		var file = file_text_open_read(working_directory + "savefile");
		file_text_read_string(file); // read the security notice
		file_text_readln(file);
		file_text_read_string(file); // read the security notice
		file_text_readln(file);
		file_text_read_string(file); // read the security notice
		file_text_readln(file);
		file_text_read_string(file); // read the security notice
		file_text_readln(file);
		file_text_read_string(file); // read the security notice
		file_text_readln(file);
		var out = file_text_read_string(file);
		file_text_close(file);
		
		var hexTbl = array_create(256, 0);
		hexTbl[ord("A")]=0;hexTbl[ord("x")]=1;hexTbl[ord("D")]=2;hexTbl[ord("c")]=3;
		hexTbl[ord("F")]=4;hexTbl[ord("v")]=5;hexTbl[ord("G")]=6;hexTbl[ord("b")]=7;
		hexTbl[ord("H")]=8;hexTbl[ord("n")]=9;hexTbl[ord("J")]=10;hexTbl[ord("m")]=11;
		hexTbl[ord("K")]=12;hexTbl[ord("i")]=13;hexTbl[ord("O")]=14;hexTbl[ord("p")]=15;

		var checksum = "";
		var jsonStr = "";
		var prev = 0;

		saveGameKeystreamInit();
		for (var i=1; i<=string_length(out); i+=2) {
			var b = hexTbl[string_byte_at(out, i)] * 0x10;
			b += hexTbl[string_byte_at(out, i+1)];
			b ^= saveGameKeystreamFeed(prev);
			prev = b;
			if (i <= 64) {
				checksum += chr(b);
			} else {
				jsonStr += chr(b);
			}
		}
		var checksum2 = md5_string_utf8(jsonStr + SAVE_CHECKSUM_SALT);
		if (checksum != checksum2) return false;
		
		var jsonData = json_parse(jsonStr);
		global.teamMembers = jsonData[0];
		global.overworldCurMap = jsonData[1];
		global.overworldCurVariant = jsonData[2];
		global.overworldSpawnX = jsonData[3];
		global.overworldSpawnY = jsonData[4];
		global.playTime = jsonData[5];
		global.completedDuties = jsonData[6];
		global.eventFlags = jsonData[7];
		global.roamingShopData = jsonData[8];
		global.money = jsonData[9];
		global.curStoryHint = jsonData[10];
		global.onlineLeaderboardBind = jsonData[11];
		global.partnerSpecies = jsonData[12][0];
		global.partnerName = jsonData[12][1];
		global.partnerSpeciesSecondary = jsonData[12][2];
		global.partnerNameSecondary = jsonData[12][3];
		global.unlockedDungeonLists = jsonData[13];
		global.dungeonDiscoveryProgress = jsonData[14];
		global.compendiumData = jsonData[15];
		
		return true;
	} catch(_ex) {
		return false;	
	}
}

function loadGameDefaultVars() {
	global.onlineLeaderboardBind = [];
	global.curStoryHint = 0;	
	global.money = 1000;
	global.roamingShopData = [
		[2, 300]
	];
	global.teamMembers = [
		{
			name: "Your Avatar",
			curHP: 60,
			maxHP: 60,
			curPP: 40,
			maxPP: 40,
			species: "0004",
			moves: [1],
			items: [],
			att: 23,
			sp_att: 23,
			def: 20,
			sp_def: 20,
			types: ["fire"],
			lv: 5,
			xp: 250, xp_rate: 0,
			stance: 0
		}
	];

	global.overworldCurMap = "Lab";
	global.overworldCurVariant = "FirstVisit";
	global.overworldSpawnX = 415;
	global.overworldSpawnY = 110;
	global.overworldSpawnFacing = 0;
	global.partnerSpecies = "0007";
	global.partnerSpeciesSecondary = "0001";
	global.partnerName = "???";
	global.partnerNameSecondary = "???";
	global.unlockedDungeonLists = [
		[], [], [], [], [], []
	];

	global.playTime = 0;
	global.completedDuties = 0;

	global.eventFlags = array_create(200, 0);
	global.dungeonDiscoveryProgress = [
		[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]
	];
	
	global.dungeonDiscoveredTiles = [];
	global.compendiumData = {};
	global.overworldSourceMap = "Town";
	global.overworldSourceVariant = "Standard1";
}