if (instance_exists(MusicController)) instance_destroy(MusicController);
if (instance_exists(DebugController)) instance_destroy(DebugController);
audio_stop_all();
audio_set_master_gain(0, 1);
audio_play_sound(CrashSound, 1, 0);
// show_debug_overlay(true);