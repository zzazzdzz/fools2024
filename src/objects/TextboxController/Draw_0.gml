/*
if (t_type == "textinput"){
    draw_set_color(c_dkgray);
    draw_rectangle(x+sw-4, y+sh+50, x+t_w-sw+4, y+sh+88, false);
    draw_set_color(c_white);
    draw_text_ext(x+sw+8, y+sh+57, writableText, 34, t_w-2*sw-15);
}
*/

if (hidden) exit;

if (t_type == "battlequeue") {
	global.scratch = 0;
	with (BattleObject) {
		global.scratch = max(global.scratch, array_length(effects));
	}
	if (global.scratch == 0) t_w = 368 + 20;
	else t_w = 380 + 20 + 26 * global.scratch;
	t_h = 40 + 30 * array_length(global.battleQueue);
}

if (t_type == "textbox" || t_type == "choice" || t_type == "battlequeue" || t_type == "condensedchoice" || t_type == "toast" || t_type == "gridchoiceheadered" || t_type == "basicheadered" || t_type == "memberstats" || t_type == "savedata") {
	drawTextboxBorder(x, y, t_w, t_h);
}

if (t_type == "basic") {
	drawTextboxBorder(x, y, t_w, t_h);
	drawTextAttributedExt(x+24+fontXoffset, y+19, textContent, 30);
}
if (t_type == "basic_center") {
	drawTextboxBorder(x, y, t_w, t_h);
	drawTextAttributedExt(x + t_w/2 - t_cw/2, y+19, textContent, 30);
}

if (t_type == "naming") {
	var splitPos = 115;
	drawTextboxBorder(x, y, t_w, splitPos);	
	drawTextboxBorder(x, y+splitPos+20, t_w, t_h-splitPos-20);
}

if (t_type == "textbox") {
	if (arrowBlink && waitInput) {
	    draw_sprite(TextboxArrow, 0, x+t_w-sw-26, y+t_h-sh-24);
	}
}

if (t_type == "intermission") {
	if (arrowBlink && waitInput) {
	    draw_sprite(TextboxArrow, 0, room_width/2-10, y+t_h-8);
	}
}

if (t_type == "choice"){
    if (!choiceWithoutChoice) draw_sprite(TextboxChoiceArrow, 0, x+sw+8-arrowBlink*2, y+sh+13+cursorPos*36+1);
}

var nldist = 36;

if (t_type == "condensedchoice"){
    draw_sprite(TextboxChoiceArrow, 0, x+sw+8-arrowBlink*2, y+sh+13+cursorPos*30);
	nldist = 30;
}

draw_set_font(TextboxFont);
draw_set_halign(fa_left);
draw_set_color(c_white);
if (t_type != "gridchoiceheadered" && t_type != "basicheadered" && t_type != "basic" && t_type != "basic_center") {
	drawTextAttributedExt(x+tx_offset+fontXoffset, y+tx_offset, textContent, nldist);
}

if (t_type == "savedata") {
	if (array_length(global.teamMembers) == 1) {
		drawTextExt(x+24, y+24, "@3" + global.teamMembers[0].name);
	} else if (array_length(global.teamMembers) == 2) {
		drawTextExt(x+24, y+24, "@3" + global.teamMembers[0].name + "@0 & @6" + global.teamMembers[1].name);
	} else {
		drawTextExt(x+24, y+24, "@3" + global.teamMembers[0].name + "@0 and friends");
	}
	draw_set_halign(fa_right);
    draw_set_color(c_white);
	drawTextShadowed(x+t_w-24, y+24, "Lv. " + string(global.teamMembers[0].lv));
	draw_set_halign(fa_left);
	draw_set_color(c_gray);
    draw_rectangle_workaround(x+24, y+55, x+t_w-24, y+56, true);
    draw_set_color(c_white);
    draw_rectangle_workaround(x+24, y+57, x+t_w-24, y+58, true);
	drawTextExt(x+24, y+70, "@4" + global.mapNames[$global.overworldCurMap]);
	draw_set_halign(fa_right);
	draw_set_color(c_white);	
	drawTextShadowed(x+t_w-24, y+120, secondsToTimestring(global.playTime));
	drawTextShadowed(x+t_w-24, y+155, string(global.completedDuties) + "");
	if (array_length(global.onlineLeaderboardBind) == 0) {
		drawTextShadowed(x+t_w-24, y+190, "Not configured");
	} else {
		if (global.onlineLeaderboardBind[0]) {
			draw_set_color(makeStdCol(2));
			drawTextShadowed(x+t_w-24, y+190, "Connected");
		} else {
			draw_set_color(makeStdCol(1));
			drawTextShadowed(x+t_w-24, y+190, "Disabled");
		}
	}
	draw_set_halign(fa_left);
	drawTextExt(x+24, y+120, "Time:");
	drawTextExt(x+24, y+155, "Compendium:");
	drawTextExt(x+24, y+190, "Leaderboard:");
}

if (t_type == "memberstats") {
	draw_set_color(c_gray);
    draw_rectangle_workaround(x+24, y+55, x+t_w-24, y+56, true);
    draw_rectangle_workaround(x+24, y+270, x+t_w-24, y+271, true);
    draw_set_color(c_white);
    draw_rectangle_workaround(x+24, y+57, x+t_w-24, y+58, true);
    draw_rectangle_workaround(x+24, y+272, x+t_w-24, y+273, true);
	
	var c = "6";
	if (global.gp1 == 0) c = "3";
	draw_set_halign(fa_right);
	drawTextShadowed(x+t_w-24, y+24, "Lv. " + string(global.teamMembers[global.gp1].lv));
	draw_set_halign(fa_left);
	drawTextExt(x+24, y+24, "@" + c + global.teamMembers[global.gp1].name);
	
	drawTextExt(x+24, y+80, "Species:");
	drawTextExt(x+24, y+110, "Attack:");
	drawTextExt(x+24, y+140, "Defense:");
	drawTextExt(x+24, y+170, "Max HP:");
	drawTextExt(x+24, y+200, "Exp.:");
	
	if (global.eventFlags[EVO_CHAMBER_FIRST]) {
		if (variable_struct_exists(global.evoData, "m" + global.teamMembers[global.gp1].species)) {
			var evoInfo = global.evoData[$("m"+global.teamMembers[global.gp1].species)];
			if (global.teamMembers[global.gp1].lv < evoInfo[0]) {
				drawTextExt(x+24, y+230, "Evolution: Requirements not met");
			} else {
				drawTextExt(x+24, y+230, "Evolution: Available");	
			}
		} else {
			drawTextExt(x+24, y+230, "Evolution: Can't evolve");
		}
	} else {
		drawTextExt(x+24, y+230, "Evolution not yet available");
	}
	
	drawTextExt(x+24+t_w/2, y+80, "Stance:");
	drawTextExt(x+24+t_w/2, y+110, "Sp. Att:");
	drawTextExt(x+24+t_w/2, y+140, "Sp. Def:");
	drawTextExt(x+24+t_w/2, y+170, "Max PP:");
	
	var stinfo = global.stanceDb[global.teamMembers[global.gp1].stance];
	var statattrs = [];
	var statcolor = string(7 + global.teamMembers[global.gp1].stance);
	for (var i=1; i<7; i++) {
		array_push(statattrs, stinfo[i] > 0 ? statcolor : "0");
	}
	
	drawTextExt(x+110, y+80, "@2" + global.speciesNames[$("m" + global.teamMembers[global.gp1].species)]);
	drawTextExt(x+110, y+110, "@" + statattrs[0] + string(global.teamMembers[global.gp1].att));
	drawTextExt(x+110, y+140, "@" + statattrs[1] + string(global.teamMembers[global.gp1].def));
	drawTextExt(x+110, y+170, "@" + statattrs[4] + string(global.teamMembers[global.gp1].maxHP));
	drawTextExt(x+110+t_w/2, y+80, "@" + statcolor + stinfo[0]);
	drawTextExt(x+110+t_w/2, y+110, "@" + statattrs[2] + string(global.teamMembers[global.gp1].sp_att));
	drawTextExt(x+110+t_w/2, y+140, "@" + statattrs[3] + string(global.teamMembers[global.gp1].sp_def));
	drawTextExt(x+110+t_w/2, y+170, "@" + statattrs[5] + string(global.teamMembers[global.gp1].maxPP));
	
	// calc exp until next level
	var remainingExp = levelUpGetExpRemaining(global.teamMembers[global.gp1].xp_rate, global.teamMembers[global.gp1].xp);
	if (global.teamMembers[global.gp1].lv >= 50) {
		drawTextExt(x+110, y+200, string(global.teamMembers[global.gp1].xp) + " points");
	} else {
		drawTextExt(x+110, y+200, string(global.teamMembers[global.gp1].xp) + " points, " + string(remainingExp) + " to level " + string(global.teamMembers[global.gp1].lv + 1));
	}
	
	var stringifiedMoves = [];
	for (var i=0; i<6; i++) {
		if (i >= array_length(global.teamMembers[global.gp1].moves)) array_push(stringifiedMoves, "@4----");
		else array_push(stringifiedMoves, "@1" + global.movesDb[global.teamMembers[global.gp1].moves[i]][0]);
	}
	drawTextExt(x+24, y+296, stringifiedMoves[0]);
	drawTextExt(x+24+t_w/2, y+296, stringifiedMoves[1]);
	drawTextExt(x+24, y+326, stringifiedMoves[2]);
	drawTextExt(x+24+t_w/2, y+326, stringifiedMoves[3]);
	drawTextExt(x+24, y+356, stringifiedMoves[4]);
	drawTextExt(x+24+t_w/2, y+356, stringifiedMoves[5]);
}

if (t_type == "gridchoiceheadered") {
	draw_set_halign(fa_center);
	draw_set_color(makeStdCol(string_char_at(gridChoiceCols, 1)));
	drawTextShadowed(x+t_w/2, y+16, t_header2);
	draw_set_halign(fa_left);
	draw_set_color(make_color_rgb(136,144,144));
    draw_rectangle_workaround(x+6, y+44, x+t_w-7, y+45, false);
    draw_rectangle_workaround(x+6, y+49, x+t_w-7, y+50, false);
    draw_set_color(make_color_rgb(240,240,240));
    draw_rectangle_workaround(x+6, y+46, x+t_w-7, y+47, false);
    draw_rectangle_workaround(x+6, y+47, x+t_w-7, y+48, false);
	var positions = [
		[x+40, y+65], [x+40+t_w/2, y+65],
		[x+40, y+95], [x+40+t_w/2, y+95],
		[x+40, y+125], [x+40+t_w/2, y+125],
		[x+40, y+155], [x+40+t_w/2, y+155],
		[x+40, y+185], [x+40+t_w/2, y+185]
	];
	for (var i=0; i<array_length(optionsSeparado); i++) {
		draw_set_color(makeStdCol(string_char_at(gridChoiceCols, i+2)));
		drawTextShadowed(positions[i][0], positions[i][1], optionsSeparado[i]);
	}
	draw_set_color(c_white);
    draw_sprite(TextboxChoiceArrow, 0, x+4+sw-arrowBlink*2+(t_w/2)*gridCursorX, y+65+30*gridCursorY);
	
	if (descData != noone) {
		var yy = y+t_h+8;
		if (yy > 400) {
			yy = 400;
			drawTextboxBorder(x, yy, t_w, 60);	
			draw_sprite_stretched(TextboxBordersOpaque, 5, x, 390, sw, 20);
			draw_sprite_stretched(TextboxBordersOpaque, 5, x+t_w-sw, 390, sw, 20);
			draw_set_color(make_color_rgb(136,144,144));
		    draw_rectangle_workaround(x+6, 402, x+t_w-7, 403, false);
		    draw_rectangle_workaround(x+6, 407, x+t_w-7, 408, false);
		    draw_set_color(make_color_rgb(240,240,240));
		    draw_rectangle_workaround(x+6, 404, x+t_w-7, 405, false);
		    draw_rectangle_workaround(x+6, 405, x+t_w-7, 406, false);
			draw_set_color(c_white);
			drawTextAttributedExt(x+24, yy+19, descData[gridCursorX + gridCursorY*2]);
		} else {
			drawTextboxBorder(x, yy, t_w, 60);	
			drawTextAttributedExt(x+24, yy+19, descData[gridCursorX + gridCursorY*2]);
		}
	}
}

if (t_type == "basicheadered") {
	draw_set_halign(fa_center);
	draw_set_color(makeStdCol(string_char_at(gridChoiceCols, 1)));
	drawTextShadowed(x+t_w/2, y+16, t_header2);
	draw_set_halign(fa_left);
	draw_set_color(make_color_rgb(136,144,144));
    draw_rectangle_workaround(x+6, y+44, x+t_w-7, y+45, false);
    draw_rectangle_workaround(x+6, y+49, x+t_w-7, y+50, false);
    draw_set_color(make_color_rgb(240,240,240));
    draw_rectangle_workaround(x+6, y+46, x+t_w-7, y+47, false);
    draw_rectangle_workaround(x+6, y+47, x+t_w-7, y+48, false);
	drawTextAttributedExt(x+23, y+65, textContent, 30);
	draw_set_color(c_white);
}

if (t_type == "battlequeue") {
	draw_set_font(TextboxFont);
	
	var numCombatants = array_length(global.battleQueue);
	var drawOrder = 0;
	
	for (var i=0; i<numCombatants; i++) {
		var obj = getBattleObjectByCombatantId(global.battleQueue[i]);
		if (obj < 0) continue;
		if (global.battleTurn == i) {
			if ((globalStepTimer % 32) < 16) draw_set_color(c_red);
			else draw_set_color(c_yellow);
		} else {
			if (obj.curHP <= 0) draw_set_color(c_gray);
			else draw_set_color(c_white);	
		}
		drawTextShadowed(x+24, y+24+i*30, obj.combatantName);
		if (obj.lv > 0) {
			drawTextShadowed(x+200, y+24+i*30, "Lv. " + string(obj.lv));
		}
		draw_set_color(colorPercentage(obj.displayHP, 0, obj.maxHP, 1));
		if (obj.curHP <= 0) draw_set_color(c_gray);
		draw_set_halign(fa_right);
		drawTextShadowed(x+365, y+24+i*30, string(obj.displayHP) + "/" + string(obj.maxHP));
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		for (var j=0; j<array_length(obj.effects); j++) {
			var xoffs = 0;
			var yoffs = 0;
			if (drawOrder == shakiesWhich && shakiesDuration > 0) {
				xoffs = choose(-4, -2, 0, 2, 4);
				yoffs = choose(-4, -2, 0, 2, 4);
				shakiesDuration -= 1;
			}
			var spr = asset_get_index("Spr" + obj.effects[j][0]);
			if (spr == -1) {
				bugcheck("BLNoStatusIcon " + string(obj.effects[j]));
			} else {
				draw_sprite(spr, 0, x+380+j*26+xoffs, y+26+i*30+yoffs);
			}
			var subim = obj.effects[j][1];
			if (subim > 8) subim = 9;
			draw_sprite_ext(SprEffDuration, subim, x+380+j*26+18+xoffs, y+26+i*30+16-6+yoffs, 2, 2, 0, c_ltgray, 1);
			drawOrder += 1;
		}
	}
	draw_set_color(c_white);
	draw_set_font(TextboxFont);
}

if (t_type == "toast") {
	depth = -1999999;
	draw_set_font(TextboxFont);
	drawTextAttributedExt(x + t_w/2 - t_cw/2, y+19, t_textattr);
}

if (t_type == "naming") {
	draw_set_font(TextboxFont);
	draw_set_color(makeStdCol("3"));
	drawTextShadowed(x + t_w/2 - t_cw/2, y+24, t_text);
    draw_set_halign(fa_center);
	draw_set_color(c_white);
	var textLen = maxLen;
	var textWidth = 18 * (textLen - 1);
	var inputLen = string_length(namingResult);
	var firstEmpty = true;
	for (var i=0; i<textLen; i++) {
		if (i < inputLen) {
			var c = string_char_at(namingResult, i+1);
			drawTextShadowed(x + t_w/2 - textWidth/2 + i*18, y+64, c);
		} else {
			if (firstEmpty) {
				draw_set_color(c_yellow);
				if (arrowBlink) drawTextShadowed(x + t_w/2 - textWidth/2 + i*18, y+64, "_");
				firstEmpty = false;
			} else {
				draw_set_color(c_gray);
				drawTextShadowed(x + t_w/2 - textWidth/2 + i*18, y+64, "_");
			}
		}
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	for (var i=0; i<string_length(charset); i++) {
		var c = string_char_at(charset, i+1);
		if (c != "@") drawTextShadowed(x + 52 + (i mod 11)*45, y + 160 + 40 * (i div 11), c);
		else draw_sprite(InputEndChr, 0, x + 52 + (i mod 11)*45, y + 160 + 40 * (i div 11) + 3);
		
	}
	draw_sprite(TextboxChoiceArrow, 0, x+22-arrowBlink*2+45*gridCursorX, y+160+40*gridCursorY);
	
}

if (t_header != ""){
    draw_set_font(HeaderFont);
    draw_set_color(c_white);
    draw_sprite(TextboxHeaders, headerSubimg, x, y+sh);
    draw_set_halign(fa_center);
    drawTextShadowed(x+hw/2+2, y-sh-9, t_header);
    draw_set_halign(fa_left);
}

if (t_portrait != noone) {
	drawTextboxBorder(x, y-105, 80+sw+sw-4, 80+sh+sh-4);
	draw_sprite_ext(t_portrait[0], t_portrait[1], x+sw-2, y-105+sh-2, 2, 2, 0, c_white, 1);
}