rot += 2;
rot %= 360;
cnt += 1;

if (type == 0) {
	var rad = global.movesDb[global.battleMoveIndex][3];
	draw_set_color(c_red);
	var base = 0.6; //0.6-0.15*sin(cnt/12);
	if (locked) base = 0.6;
	
	for (var i=0; i<360; i+=24) {
		var ang = (cnt+i) % 360;
		var ld_x = global.battleCurrentObj.x + lengthdir_x(rad, ang);
		var ld_y = global.battleCurrentObj.y + lengthdir_y(rad, ang);
		draw_sprite_ext(BattleTargetRadius, 0, ld_x, ld_y, 1, 1, ang+90+180, c_white, base);	
	}
	
	draw_set_color(c_white);
	draw_set_alpha(1);
}

if (type == 0 || type == 2) {
	// depth = -10000;
	var dist = 36+5*sin(cnt/6);

	var ld_x = x + lengthdir_x(dist, rot);
	var ld_y = y + lengthdir_y(dist, rot);
	draw_sprite_ext(BattleTargetSelector, 0, ld_x, ld_y, 1, 1, rot+90+180, c_white, 1);

	ld_x = x + lengthdir_x(dist, rot+90);
	ld_y = y + lengthdir_y(dist, rot+90);
	draw_sprite_ext(BattleTargetSelector, 0, ld_x, ld_y, 1, 1, rot+180+180, c_white, 1);

	ld_x = x + lengthdir_x(dist, rot+180);
	ld_y = y + lengthdir_y(dist, rot+180);
	draw_sprite_ext(BattleTargetSelector, 0, ld_x, ld_y, 1, 1, rot+90+180+180, c_white, 1);

	ld_x = x + lengthdir_x(dist, rot+180+90);
	ld_y = y + lengthdir_y(dist, rot+180+90);
	draw_sprite_ext(BattleTargetSelector, 0, ld_x, ld_y, 1, 1, rot+180, c_white, 1);
}

if (type == 1) {
	var dist = 26+2*sin(cnt/6);
	
	draw_sprite_ext(BattleMoveSelector, 0, x-dist, y-dist, 1, 1, 0, c_white, 1);
	draw_sprite_ext(BattleMoveSelector, 0, x-dist, y+dist, 1, 1, 90, c_white, 1);
	draw_sprite_ext(BattleMoveSelector, 0, x+dist, y+dist, 1, 1, 180, c_white, 1);
	draw_sprite_ext(BattleMoveSelector, 0, x+dist, y-dist, 1, 1, 270, c_white, 1);
	
	var test_dist = 0;
	var test_dir = 360-45;
	
	while (true) {
		// test if collision's good
		var test_x = x + lengthdir_x(test_dist, test_dir);
		var test_y = y + lengthdir_y(test_dist, test_dir);
		
		var collObj = collision_rectangle(test_x-20, test_y-20, test_x+20, test_y+20, BattleTangible, false, true);
		var coll = collObj;
		
		// >57 ground tiles
		if (tileAtXY(test_x-20, test_y-20) <= 57) { coll = true; collObj = noone; }
		if (tileAtXY(test_x+20, test_y-20) <= 57) { coll = true; collObj = noone; }
		if (tileAtXY(test_x-20, test_y+20) <= 57) { coll = true; collObj = noone; }
		if (tileAtXY(test_x+20, test_y+20) <= 57) { coll = true; collObj = noone; }
		
		if (test_x < 0) { coll = true; collObj = noone; }
		if (test_y < 0) { coll = true; collObj = noone; }
		if (test_x > room_width) { coll = true; collObj = noone; }
		if (test_y > room_height) { coll = true; collObj = noone; }
		//draw_text(100, 100, string(tileAtXY(x-20, y-20)) + "," +string(tileAtXY(x+20, y-20)) + "," +string(tileAtXY(x-20, y+20)) + "," +string(tileAtXY(x+20, y+20)));
		
		if (coll && keyboard_check(vk_enter)) {
			// find a new candidate
			test_dir += 45;
			if (test_dir == 360) {
				test_dir = 0;
				test_dist += 5;
			}
		} else {
			x = test_x;
			y = test_y;
			break;	
		}
	}
	
	draw_set_color(c_white);
	draw_rectangle(x-20,y-20,x-20+2,y-20+2, false);
	draw_rectangle(x+20,y-20,x+20+2,y-20+2, false);
	draw_rectangle(x-20,y+20,x-20+2,y+20+2, false);
	draw_rectangle(x+20,y+20,x+20+2,y+20+2, false);
	
	draw_set_alpha(0.3);
	if (coll) {
		if (collObj != noone) {
			if (collObj.combatantIndex != global.battleCurrentObj.combatantIndex) {
				draw_set_color(c_red); obstructed = true;
			} else {
				draw_set_color(c_green); obstructed = false;
			}
		} else {
			draw_set_color(c_red); obstructed = true;
		}
	} else {
		draw_set_color(c_green); obstructed = false;
	}
	
	draw_rectangle(x-28,y-28,x+28,y+28,false);
	draw_set_alpha(1);
	draw_set_color(c_white);
}
