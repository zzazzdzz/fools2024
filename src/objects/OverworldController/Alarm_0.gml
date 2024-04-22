// if in a scripted event, skip music playing
if (global.active == false) {
	mapMusicState = "scripted";
	exit;	
}

if (mapBaseMusicId != 0) {
	mapMusicState = "played";
	global.musicIndex = mapBaseMusicId;
	global.musicControl = MUS_PLAY;
}