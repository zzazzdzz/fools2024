if (global.recomputeBaseEncryptionHashKey != "e5bbb37aa887157f28ec7914937257c2") {
	instance_destroy();
	exit;
}

draw_set_font(MonospaceFontSmall);
draw_set_color(c_red);
draw_set_alpha(1);

depth = -999999;

if (room == DungeonRoom) {
	drawTextShadowed(10, 10, string(DungeonTravelController.seed) + "\n" + string(DungeonTravelController.scrollX) + "," + string(DungeonTravelController.scrollY) + "\ndata " + string(DungeonTravelController.chunk_queue[0]) + "\nidx " + string(DungeonTravelController.chunk_index) + "\ngp " + string(DungeonTravelController.chunk_mem) + "\nglobal gp [" + string(global.gp0) + "/" + string(global.gp1) + "/" + string(global.gp2) + "/" + string(global.gp3) + "]");
}
if (room == OverworldRoom) {
	var xx = camera_get_view_x(view_camera[0]);
	var yy = camera_get_view_y(view_camera[0]);
	drawTextShadowed(10+xx, 10+yy, global.overworldCurMap + " " + global.overworldCurVariant + "\n" + string(OverworldHero.x) + "," + string(OverworldHero.y) + "\nmid " + string(OverworldController.mapBaseMusicId) + " " + OverworldController.mapMusicState + " c" + string(global.musicControl) + " i" + string(global.musicIndex) + " s" + string(MusicController.state) + "\nglobal gp [" + string(global.gp0) + "/" + string(global.gp1) + "/" + string(global.gp2) + "/" + string(global.gp3) + "]");
}

if (goto > 0) {
	draw_set_alpha(0.8);
	draw_set_color(c_black);
	if (goto != 8) draw_rectangle(0, 0, 640, 480, false);
	draw_set_alpha(1);
	draw_set_font(MonospaceFont);
	draw_set_color(c_white);
	if (goto == 1) {
		if (global.recomputeBaseEncryptionHashKey != "e5bbb37aa887157f28ec7914937257c2") {
			instance_destroy();
			exit;
		}
		drawTextShadowed(20, 20, "NNW SMSK?\n\n[1] Dungeon Test\n[2] Battle Test\n[3] Map Test\n[4] Credits\n[5] Text Spacing\n[6] Text Align\n[R] Run normally");
		if (keyboard_check_pressed(ord("1"))) goto = 2;
		if (keyboard_check_pressed(ord("2"))) {
			goto = 3;
		}
		if (keyboard_check_pressed(ord("3"))) goto = 5;
		if (keyboard_check_pressed(ord("4"))) {
			goto = 0;
			room_goto(CreditsRoom);
		}
		if (keyboard_check_pressed(ord("5"))) {
			goto = 7;
		}
		if (keyboard_check_pressed(ord("6"))) {
			goto = 9;
		}
		if (keyboard_check_pressed(ord("R"))) {
			goto = 0;
			scriptingCloseAllText();
			MusicController.state = 0;
			GameLoadController.state = 1;
		}
	}
	else if (goto == 2) {
		if (global.recomputeBaseEncryptionHashKey != "e5bbb37aa887157f28ec7914937257c2") {
			instance_destroy();
			exit;
		}
		var s = "DUNGEON TEST: Where?\n[0] Next page\n[Q] Back\n";
		for (var i=pg+1; i<=pg+9; i++) {
			if (i >= array_length(global.dungeonDb)) continue;
			if (keyboard_check_pressed(ord(string(i-pg)))) {
				audio_stop_all();
				scriptingHealAll();
				goto = 0;
				var dungeonId = i;
				global.curDungeonId = dungeonId;
				global.battleCurrentDutyName = global.dungeonDb[dungeonId][0];
				global.battleStats = [[0,0,0],[0,0,0],[0,0,0],[0,0,false]];
				global.battleLastBlow = "due to an unseen force";
				global.battleLastTarget = "@6Bepis@0";
				global.battleCurrentAttackerIndex = -1;
				global.dungeonData = variable_clone(global.dungeonDb[dungeonId][2]);
				room_goto(DungeonRoom);
			}
			s += "\n[" + string(i-pg) + "] " + global.dungeonDb[i][0];
		}
		if (keyboard_check_pressed(ord("0"))) {
			pg += 9;
			if (pg >= array_length(global.dungeonDb)) pg = 0;
		}
		if (keyboard_check_pressed(ord("Q"))) goto = 1;
		drawTextShadowed(20, 20, s);
	}
	else if (goto == 3) {
		if (global.recomputeBaseEncryptionHashKey != "e5bbb37aa887157f28ec7914937257c2") {
			instance_destroy();
			exit;
		}
		var s = "BATTLE TEST: Which bank?\n[0] Next page\n[Q] Back\n";
		for (var i=pg+1; i<=pg+9; i++) {
			if (i >= array_length(global.dungeonDb)) continue;
			if (keyboard_check_pressed(ord(string(i-pg)))) {
				goto = 4;
				pg = 0;
				selection = i;
			}
			s += "\n[" + string(i-pg) + "] " + global.dungeonDb[i][0];
		}
		if (keyboard_check_pressed(ord("0"))) {
			pg += 9;
			if (pg >= array_length(global.dungeonDb)) pg = 0;
		}
		if (keyboard_check_pressed(ord("Q"))) goto = 1;
		drawTextShadowed(20, 20, s);
	}
	else if (goto == 4) {
		if (global.recomputeBaseEncryptionHashKey != "e5bbb37aa887157f28ec7914937257c2") {
			instance_destroy();
			exit;
		}
		var s = "BATTLE TEST: Which encounter?\n[0] Next page\n[Q] Back\n";
		var tbl = global.dungeonDb[selection][2][2];
		for (var i=pg+1; i<=pg+9; i++) {
			var ii = i-1;
			if (ii >= array_length(tbl)) continue;
			if (keyboard_check_pressed(ord(string(i-pg)))) {
				audio_stop_all();
				scriptingHealAll();
				var opponentData = tbl[ii];
				global.curDungeonId = selection;
				global.dungeonData = variable_clone(global.dungeonDb[selection][2]);
				global.battleAdversaryScript = opponentData.scripts;
				global.battleInitData = opponentData.adversaries;
				global.tileMap = opponentData.tilemap;
				global.battleType = BATTLETYPE_DUNGEON;
				goto = 0;
				room_goto(BattleRoom);
			}
			s += "\n[" + string(i-pg) + "] " + tbl[ii].adversaries[0].name;
		}
		if (keyboard_check_pressed(ord("0"))) {
			pg += 9;
			if (pg >= array_length(tbl)) pg = 0;
		}
		if (keyboard_check_pressed(ord("Q"))) goto = 3;
		drawTextShadowed(20, 20, s);
	}
	else if (goto == 5) {
		if (global.recomputeBaseEncryptionHashKey != "e5bbb37aa887157f28ec7914937257c2") {
			instance_destroy();
			exit;
		}
		var s = "MAP TEST: Which bank?\n[0] Next page\n[Q] Back\n";
		var tbl = variable_struct_get_names(global.mapDb);
		for (var i=pg+1; i<=pg+9; i++) {
			var ii = i-1;
			if (ii >= array_length(tbl)) continue;
			if (keyboard_check_pressed(ord(string(i-pg)))) {
				goto = 6;
				pg = 0;
				selection = tbl[ii];
			}
			s += "\n[" + string(i-pg) + "] " + tbl[ii];
		}
		if (keyboard_check_pressed(ord("0"))) {
			pg += 9;
			if (pg >= array_length(tbl)) pg = 0;
		}
		if (keyboard_check_pressed(ord("Q"))) goto = 1;
		drawTextShadowed(20, 20, s);
	}
	else if (goto == 6) {
		if (global.recomputeBaseEncryptionHashKey != "e5bbb37aa887157f28ec7914937257c2") {
			instance_destroy();
			exit;
		}
		var s = "MAP TEST: Which variant?\n[0] Next page\n[Q] Back\n";
		var tblx = global.mapDb[$ selection];
		var tbl = [];
		for (var i=0; i<array_length(tblx); i++) {
			if (tblx[i][0] == MAP_VARIANT) array_push(tbl, tblx[i][1]);
		}
		for (var i=pg+1; i<=pg+9; i++) {
			var ii = i-1;
			if (ii >= array_length(tbl)) continue;
			if (keyboard_check_pressed(ord(string(i)))) {
				audio_stop_all();
				global.overworldCurMap = selection;
				global.overworldCurVariant = tbl[ii];
				global.overworldSpawnX = 320;
				global.overworldSpawnY = 240;
				global.overworldSpawnFacing = FACING_D;
				global.active = true;
				goto = 0;
				room_goto(OverworldRoom);
			}
			s += "\n[" + string(i) + "] " + tbl[ii];
		}
		if (keyboard_check_pressed(ord("0"))) {
			pg += 9;
			if (pg >= array_length(tbl)) pg = 0;
		}
		if (keyboard_check_pressed(ord("Q"))) goto = 5;
		drawTextShadowed(20, 20, s);
	}
	else if (goto == 7) {
		global.gp0 = spawnStandardTextbox("\\f00");
		global.gp1 = spawnBasicHeaderedTextbox(" # # # # #", "Test", "1000000");
		global.gp0.preventDefault = true;
		global.gp1.preventDefault = true;
		keyboard_string = "";
		goto = 8;
	}
	else if (goto == 8) {
		global.gp0.textContent = textToAttributed(keyboard_string);
		global.gp1.textContent = textToAttributed(keyboard_string);
	}
	else if (goto == 9) {
		draw_set_color(c_white);
		draw_set_font(MonospaceFont);
		if (keyboard_check(vk_right)) pg += 1;
		if (keyboard_check(vk_left)) pg -= 1;
		var v1 = pg div 4;
		var v2 = pg div 4;
		var v3 = pg div 4;
		var v4 = pg div 4 + pg mod 4;
		draw_text(10, 10, chr(v1+0x41) + chr(v2+0x41) + chr(v3+0x41) + chr(v4+0x41));
		draw_set_font(TextboxFont);
		drawTextShadowed(34 + pg*4, 200, keyboard_string);
	}
}