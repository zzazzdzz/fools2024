if (instance_exists(MusicController)) instance_destroy(MusicController);
if (instance_exists(DebugController)) instance_destroy(DebugController);
audio_stop_all();
audio_set_master_gain(0, 1);
audio_play_sound(Mus22, 1, 1);

staticSubimg = 0;
alarm[0] = 3;