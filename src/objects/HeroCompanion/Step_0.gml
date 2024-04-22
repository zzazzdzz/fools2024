depth = OverworldObject.depth - 1;

animCounter += 1;
uncappedAnimCounter += 1;

targetX = OverworldObject.x + 35;
targetY = OverworldObject.y - 40;

var target_dist = point_distance(x, y, targetX, targetY);
if (target_dist > 5) {
	x += lengthdir_x(target_dist / 15, point_direction(x, y, targetX, targetY));
	y += lengthdir_y(target_dist / 15, point_direction(x, y, targetX, targetY));
}

if (animCounter == 2) y -= 1;
if (animCounter == 6) y -= 1;
if (animCounter == 12) y -= 1;
if (animCounter == 20) y -= 1;
if (animCounter == 22) y += 1;
if (animCounter == 26) y += 1;
if (animCounter == 32) y += 1;
if (animCounter == 40) {
	animCounter = 0;
	y += 1;
}

for (var i=0; i<7; i++) {
	coordHistory[i, 0] = coordHistory[i+1, 0];
	coordHistory[i, 1] = coordHistory[i+1, 1];
}

coordHistory[7, 0] = x;
coordHistory[7, 1] = y;