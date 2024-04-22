if (!global.active) exit;

var forward_x = x + lengthdir_x(60, direction);
var forward_y = y + lengthdir_y(60, direction);

var target = collision_line(x, y, forward_x, forward_y, OverworldObject, false, false);

if (target != noone) {
	global.interactedWith = target;
	with (target) {
		defaultFacing = facing;
		var ii = instance_create(ScriptingController, 0, 0);
		ii.payload = onInteract;
	}
}
