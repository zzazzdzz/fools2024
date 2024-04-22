// html5 engine has a bug (unsurprisingly), and audio loops do not work correctly
// thus they need to be done manually if html5 version is detected
if (IS_HTML5) {
	if (curSound != noone) {
		var curPoint = audio_sound_get_track_position(curSound);
		var trackLen = audio_sound_length(curSound);
		//show_debug_message(string(curPoint) + "/" + string(loopPoint) + "/" + string(trackLen));
		if (trackLen > 0) {
			if (firstLoop && curPoint > loopPoint) {
				firstLoop = false;
			}
			if (!firstLoop && !audio_is_playing(idx)) {
				if (!audio_is_playing(looper)) {
					curSound = noone;
				} else {
					curSound = audio_play_sound(idx, 0, 0);
					audio_sound_set_track_position(curSound, loopPoint);
				}
				firstLoop = true;
			}
		}
	}
	
	if (looper == noone) {
		looper = audio_play_sound(Looper, 0, 1);	
	}
	if (!audio_is_playing(looper)) {
		looper = audio_play_sound(Looper, 0, 1);
	}
}

// update framecounts (musiccontroller is persistent)
frameCount += 1.0 / game_get_speed(gamespeed_fps);
if (frameCount > 60) {
	frameCount -= 60;
	global.playTime += 1;
	global.safeguardData = {};
	global.safeguardDeterminant = irandom_range(1,0x7fffffff);
}

if (state == 0) {
	if (global.musicControl & MUS_PLAY) {
		if (global.musicIndex != curMusId) {
			curMusId = global.musicIndex;
			idx = asset_get_index("Mus" + string(global.musicIndex));
			firstLoop = true;
			loopPoint = global.loopPointDb[global.musicIndex];
			curSound = audio_play_sound(idx, 0, IS_HTML5 ? 0 : 1);
		}
	}
	if (global.musicControl & MUS_STOP) {
		curSound = noone;
		audio_stop_all();
	}
	if (global.musicControl & MUS_FADEOUT) {
		state = 1;
	}
	if (global.musicControl & MUS_TEMPPLAY) {
		audio_pause_sound(idx);
		var cid = asset_get_index("Mus" + string(global.musicIndex));
		origSound = curSound;
		tempPlay = audio_play_sound(cid, 0, IS_HTML5 ? 0 : 1);
		curSound = tempPlay;
		firstLoop = true;
		loopPoint = global.loopPointDb[global.musicIndex];
		state = 10;
	}
	global.musicControl = 0;
}
if (state == 1) {
	audio_set_master_gain(0, 1-ct/60);
	ct += 1;
	if (ct > 60) {
		ct = 0;
		audio_set_master_gain(0, 1);
		audio_stop_all();
		curSound = noone;
		state = 0;
	}
}
if (state == 2) {
	audio_set_master_gain(0, 1-ct/30);
	ct += 1;
	if (ct > 30) {
		ct = 30;
		audio_set_master_gain(0, 0);
		audio_stop_sound(tempPlay);
		curSound = origSound;
		loopPoint = global.loopPointDb[global.musicIndex];
		audio_resume_sound(idx);
		state = 3;
	}
}
if (state == 3) {
	audio_set_master_gain(0, 1-ct/30);
	ct -= 1;
	if (ct <= 0) {
		ct = 0;
		audio_set_master_gain(0, 1);
		state = 0;
	}
}
if (state == 10) {
	if (global.musicControl & MUS_TEMPEND) {
		state = 2;
	}
	global.musicControl = 0;
}