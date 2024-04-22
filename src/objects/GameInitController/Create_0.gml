#macro c_companion c_yellow
#macro c_hero make_color_rgb(0,255,255)

#macro ENABLE_ANTICHEAT false

#macro RESULT_NONE -1
#macro RESULT_QUIT -2
#macro TARGETS_FRIENDLY 1
#macro TARGETS_ENEMIES 2
#macro TARGETS_NONE 3

#macro IS_HTML5 (os_browser != browser_not_a_browser)

#macro MUS_PLAY 1
#macro MUS_FADEOUT 2
#macro MUS_STOP 4
#macro MUS_TEMPPLAY 8
#macro MUS_TEMPEND 16

#macro GENERIC_INTERSECTION_SCRIPT "You arrive at an intersection.\\f00"

#macro INV_NUM_MAX 6

game_set_speed(60, gamespeed_fps);
window_set_caption("TheZZAZZGlitch's April Fools Event 2024");
randomize();

global.safeguardData = {};
global.safeguardDeterminant = irandom_range(1,0x7fffffff);

global.gp0 = 0;
global.gp1 = 0;
global.gp2 = 0;
global.gp3 = 0;

global.textStack = ds_stack_create();
global.textSignal = 0;
global.active = true;
global.textStackWait = false;

draw_set_font(TextboxFont);
for (i=0; i<256; i++) {
	global.charWidths[0][i] = string_width(chr(i));
}
draw_set_font(DeliriaFont);
for (i=0; i<256; i++) {
	global.charWidths[1][i] = string_width(chr(i));
}
global.charWidths[0][0x20] += 1;
global.charWidths[1][0x20] += 3;

global.fontAssets[0] = TextboxFont;
global.fontAssets[1] = DeliriaFont;

global.animDb[0] = ["0004", 27, "Walk", 0, 4, "Attack", 32, 11, "Kick", 120, 11, "Strike", 208, 9, "Hurt", 280, 2, "Idle", 296, 4, "Swing", 328, 9, "Faint", 400, 4, "#", 8, 11, 8, 11, 2, 2, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 8, 2, 5, 2, 2, 2, 2, 2, 2, 2, 2, 8, 2, 5, 2, 2, 2, 2, 2, 2, 11, 16, 11, 11, 11, 2, 1, 2, 2, 4, 2, 2, 1, 1, 8, 12, 4, 10];
global.animDb[1] = ["0144", 15, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "Injured", 80, 2, "#", 11, 14, 11, 14, 2, 11, 11, 14, 11, 22, 33, 28];
global.animDb[2] = ["0007", 24, "Walk", 0, 4, "Attack", 32, 10, "Shoot", 112, 11, "Hurt", 200, 2, "Idle", 216, 8, "Swing", 280, 9, "Faint", 352, 4, "#", 16, 11, 16, 11, 2, 5, 1, 1, 1, 2, 2, 2, 2, 2, 2, 8, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 42, 2, 2, 5, 5, 5, 2, 2, 2, 1, 2, 2, 4, 2, 2, 1, 1, 8, 12, 4, 10];
global.animDb[3] = ["0011", 21, "Walk", 0, 10, "Attack", 80, 10, "Shoot", 160, 13, "Hurt", 264, 2, "Idle", 280, 4, "Swing", 312, 9, "#", 5, 2, 2, 2, 2, 5, 5, 5, 5, 5, 2, 5, 1, 1, 1, 2, 2, 2, 2, 2, 5, 2, 2, 2, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 14, 19, 14, 19, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[4] = ["0001", 24, "Walk", 0, 6, "Attack", 48, 11, "Shoot", 136, 6, "Hurt", 184, 2, "Idle", 200, 3, "Swing", 224, 9, "Faint", 296, 4, "#", 5, 5, 5, 5, 5, 5, 5, 2, 5, 2, 2, 2, 2, 2, 2, 2, 5, 16, 5, 5, 5, 2, 2, 2, 11, 56, 8, 8, 2, 1, 2, 2, 4, 2, 2, 1, 1, 8, 12, 4, 10];
global.animDb[5] = ["0028", 15, "Walk", 0, 4, "Idle", 32, 4, "Pose", 64, 3, "Nod", 88, 3, "#", 11, 14, 11, 14, 35, 14, 35, 14, 16, 2, 11, 8, 11, 8];
global.animDb[6] = ["0198", 15, "Walk", 0, 6, "Idle", 48, 3, "Pose", 72, 5, "Nod", 112, 3, "#", 5, 5, 11, 5, 5, 11, 64, 5, 2, 11, 1, 4, 2, 11, 8, 11, 8];
global.animDb[7] = ["0033", 9, "Walk", 0, 4, "Idle", 32, 10, "#", 8, 16, 8, 16, 56, 14, 2, 2, 2, 2, 2, 2, 2, 8];
global.animDb[8] = ["0070", 9, "Walk", 0, 4, "Idle", 32, 4, "#", 11, 14, 11, 14, 22, 11, 22, 11];
global.animDb[9] = ["0075", 9, "Walk", 0, 4, "Idle", 32, 14, "#", 8, 14, 8, 14, 84, 14, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 14];
global.animDb[10] = ["0134", 9, "Walk", 0, 4, "Idle", 32, 2, "#", 11, 14, 11, 14, 84, 22];
global.animDb[11] = ["0155", 15, "Walk", 0, 4, "Idle", 32, 2, "Pose", 48, 3, "Nod", 72, 3, "#", 8, 11, 8, 11, 56, 22, 16, 2, 11, 8, 11, 8];
global.animDb[12] = ["0352", 9, "Walk", 0, 4, "Idle", 32, 4, "#", 11, 14, 11, 14, 56, 2, 8, 2];
global.animDb[13] = ["NullSprite", 3, "Idle", 0, 1, "#", 8];
global.animDb[14] = ["0258", 15, "Walk", 0, 6, "Idle", 48, 7, "Pose", 104, 5, "Nod", 144, 3, "#", 5, 8, 5, 8, 8, 5, 53, 2, 2, 7, 4, 4, 2, 11, 1, 4, 2, 11, 8, 11, 8];
global.animDb[15] = ["0123", 9, "Walk", 0, 4, "Idle", 32, 4, "#", 11, 14, 11, 14, 56, 14, 19, 14];
global.animDb[16] = ["0183", 9, "Walk", 0, 4, "Idle", 32, 2, "#", 14, 11, 14, 11, 36, 22];
global.animDb[17] = ["0165", 18, "Walk", 0, 6, "Attack", 48, 14, "Shoot", 160, 11, "Hurt", 248, 2, "Idle", 264, 12, "#", 5, 5, 5, 5, 5, 5, 2, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 5, 2, 1, 8, 2, 2, 2, 2, 2, 2, 11, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5];
global.animDb[18] = ["0069", 18, "Walk", 0, 4, "Attack", 32, 10, "Shoot", 112, 11, "Hurt", 200, 2, "Idle", 216, 2, "#", 11, 14, 11, 14, 2, 5, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 5, 1, 2, 2, 2, 2, 2, 2, 2, 2, 11, 28, 30];
global.animDb[19] = ["0048", 18, "Walk", 0, 5, "Attack", 40, 14, "Shoot", 152, 6, "Hurt", 200, 2, "Idle", 216, 2, "#", 11, 8, 8, 8, 11, 1, 1, 2, 4, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 1, 2, 5, 5, 2, 11, 22, 22];
global.animDb[20] = ["0049", 12, "Walk", 0, 12, "Hurt", 96, 2, "Idle", 112, 8, "#", 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 2, 11, 16, 16, 16, 16, 16, 16, 16, 16];
global.animDb[21] = ["0021", 15, "Walk", 0, 5, "Attack", 40, 14, "Hurt", 152, 2, "Idle", 168, 6, "#", 8, 5, 5, 5, 5, 2, 2, 2, 5, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 56, 2, 4, 5, 4, 2];
global.animDb[22] = ["0022", 15, "Walk", 0, 6, "Attack", 48, 15, "Hurt", 168, 2, "Idle", 184, 10, "#", 5, 7, 8, 5, 7, 8, 2, 2, 2, 2, 2, 5, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 11, 56, 28, 5, 5, 5, 5, 5, 5, 5, 5];
global.animDb[23] = ["0034", 15, "Walk", 0, 4, "Attack", 32, 13, "Hurt", 136, 2, "Idle", 152, 2, "#", 11, 19, 11, 19, 2, 2, 2, 2, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 11, 49, 16];
global.animDb[24] = ["0115", 24, "Walk", 0, 4, "Attack", 32, 13, "Strike", 136, 12, "Shoot", 232, 16, "Hurt", 360, 2, "Idle", 376, 5, "Swing", 416, 9, "#", 22, 14, 22, 14, 1, 2, 4, 2, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 5, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 8, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 42, 4, 5, 4, 28, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[25] = ["0086", 21, "Walk", 0, 7, "Attack", 56, 12, "Shoot", 152, 11, "Hurt", 240, 2, "Idle", 256, 2, "Swing", 272, 9, "#", 11, 8, 11, 14, 8, 8, 8, 2, 8, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 8, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 42, 28, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[26] = ["0162", 24, "Walk", 0, 8, "Attack", 64, 11, "Strike", 152, 13, "Shoot", 256, 11, "Hurt", 344, 2, "Idle", 360, 6, "Swing", 408, 9, "#", 8, 5, 5, 5, 5, 5, 5, 8, 2, 2, 5, 1, 2, 2, 2, 2, 2, 2, 2, 2, 8, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 8, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 56, 16, 5, 16, 5, 16, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[27] = ["0221", 21, "Walk", 0, 4, "Attack", 32, 10, "Shoot", 112, 15, "Hurt", 232, 2, "Idle", 248, 5, "Swing", 288, 9, "#", 11, 14, 11, 14, 2, 5, 1, 1, 1, 2, 2, 2, 2, 2, 5, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 56, 11, 11, 11, 11, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[28] = ["0288", 21, "Walk", 0, 4, "Attack", 32, 10, "Shoot", 112, 11, "Hurt", 200, 2, "Idle", 216, 6, "Swing", 264, 9, "#", 11, 14, 11, 14, 2, 5, 1, 1, 1, 2, 2, 2, 2, 2, 2, 8, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 56, 2, 2, 8, 5, 5, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[29] = ["0335", 24, "Walk", 0, 4, "Attack", 32, 10, "Shoot", 112, 13, "Hurt", 216, 2, "Idle", 232, 6, "Swing", 280, 9, "Faint", 352, 4, "#", 11, 14, 11, 14, 2, 5, 1, 1, 1, 2, 2, 2, 2, 2, 1, 2, 5, 2, 1, 8, 2, 2, 2, 2, 2, 2, 2, 2, 11, 42, 5, 5, 5, 5, 5, 2, 1, 2, 2, 4, 2, 2, 1, 1, 8, 12, 4, 10];
global.animDb[30] = ["0361", 24, "Walk", 0, 4, "Attack", 32, 10, "Strike", 112, 14, "Shoot", 224, 11, "Hurt", 312, 2, "Idle", 328, 4, "Swing", 360, 9, "#", 11, 14, 11, 14, 2, 8, 1, 1, 1, 2, 2, 2, 2, 2, 1, 2, 8, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 8, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 56, 8, 8, 8, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[31] = ["0057", 15, "Walk", 0, 4, "Strike", 32, 13, "Hurt", 136, 2, "Idle", 152, 8, "#", 8, 11, 8, 11, 2, 8, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 30, 5, 8, 5, 30, 5, 8, 5];
global.animDb[32] = ["0076", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 2, "#", 11, 16, 11, 16, 2, 11, 42, 35];
global.animDb[33] = ["0105", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 11, 14, 11, 14, 2, 11, 56, 8, 22, 8];
global.animDb[34] = ["0168", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 10, "#", 11, 11, 11, 11, 2, 11, 56, 16, 2, 2, 2, 2, 2, 2, 2, 11];
global.animDb[35] = ["0232", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 11, 14, 11, 14, 2, 11, 56, 11, 28, 11];
global.animDb[36] = ["0330", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 7, "#", 11, 11, 11, 11, 2, 11, 11, 12, 11, 11, 15, 11, 11];
global.animDb[37] = ["0068", 18, "Walk", 0, 4, "Kick", 32, 13, "Hurt", 136, 2, "Idle", 152, 10, "Swing", 232, 9, "#", 11, 14, 11, 14, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 56, 2, 2, 2, 2, 2, 2, 2, 2, 16, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[38] = ["0124", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 11, 16, 11, 16, 2, 11, 42, 19, 42, 19];
global.animDb[39] = ["0225", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 11, 14, 11, 14, 2, 11, 16, 16, 16, 16];
global.animDb[40] = ["0238", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 5, "#", 11, 14, 11, 14, 2, 11, 56, 8, 8, 8, 8];
global.animDb[41] = ["0262", 15, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 6, "Pose", 96, 5, "#", 14, 14, 14, 14, 2, 11, 56, 11, 7, 11, 7, 11, 11, 1, 4, 2, 51];
global.animDb[42] = ["0471", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 6, "#", 14, 14, 14, 14, 2, 11, 84, 14, 25, 14, 5, 14];
global.animDb[43] = ["0473", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 9, "#", 16, 16, 16, 16, 2, 11, 42, 2, 11, 2, 5, 2, 5, 2, 28];
global.animDb[44] = ["0336", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 11, 11, 11, 11, 2, 11, 19, 25, 19, 25];
global.animDb[45] = ["0371", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 11, 14, 11, 14, 2, 11, 56, 14, 19, 14];
global.animDb[46] = ["0447", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 8, 8, 8, 8, 2, 11, 56, 22, 16, 22];
global.animDb[47] = ["0531", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 11, 14, 11, 14, 2, 11, 56, 5, 8, 5];
global.animDb[48] = ["0002", 24, "Walk", 0, 4, "Attack", 32, 9, "Shoot", 104, 6, "Faint", 152, 2, "Hurt", 168, 2, "Idle", 184, 4, "Swing", 216, 9, "#", 11, 14, 11, 14, 5, 2, 5, 2, 2, 2, 2, 2, 5, 16, 5, 5, 5, 2, 2, 42, 49, 2, 11, 56, 16, 16, 16, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[49] = ["0003", 24, "Walk", 0, 4, "Attack", 32, 11, "Shoot", 120, 6, "Faint", 168, 2, "Hurt", 184, 2, "Idle", 200, 4, "Swing", 232, 9, "#", 11, 22, 11, 22, 5, 2, 5, 2, 2, 2, 2, 2, 2, 2, 5, 16, 5, 5, 5, 2, 2, 42, 49, 2, 11, 42, 22, 16, 22, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[50] = ["0005", 27, "Walk", 0, 4, "Attack", 32, 14, "Strike", 144, 13, "Shoot", 248, 12, "Faint", 344, 2, "Hurt", 360, 2, "Idle", 376, 6, "Swing", 424, 9, "#", 11, 14, 11, 14, 2, 2, 2, 2, 5, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 8, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 1, 1, 2, 2, 2, 2, 2, 2, 2, 42, 49, 2, 11, 56, 2, 4, 4, 4, 2, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[51] = ["0006", 27, "Walk", 0, 4, "Attack", 32, 14, "Strike", 144, 13, "Shoot", 248, 11, "Faint", 336, 2, "Hurt", 352, 2, "Idle", 368, 4, "Swing", 400, 9, "#", 11, 14, 11, 14, 2, 2, 2, 2, 5, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 8, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 8, 2, 2, 2, 2, 2, 2, 2, 2, 2, 42, 49, 2, 11, 21, 21, 21, 21, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[52] = ["0008", 24, "Walk", 0, 4, "Attack", 32, 11, "Shoot", 120, 9, "Faint", 192, 2, "Hurt", 208, 2, "Idle", 224, 4, "Swing", 256, 9, "#", 11, 14, 11, 14, 5, 2, 5, 2, 2, 2, 2, 2, 2, 2, 5, 2, 11, 2, 2, 2, 2, 2, 2, 2, 42, 49, 2, 11, 56, 2, 2, 2, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[53] = ["0009", 24, "Walk", 0, 4, "Attack", 32, 13, "Shoot", 136, 6, "Faint", 184, 2, "Hurt", 200, 2, "Idle", 216, 8, "Swing", 280, 9, "#", 11, 19, 11, 19, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 2, 2, 5, 5, 2, 8, 2, 2, 5, 42, 49, 2, 11, 44, 16, 5, 5, 5, 5, 5, 11, 2, 1, 2, 2, 4, 2, 2, 1, 1];
global.animDb[54] = ["0078", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 14, "#", 11, 14, 11, 14, 2, 11, 84, 14, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 14];
global.animDb[55] = ["0136", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 11, 11, 11, 11, 2, 11, 16, 22, 16, 22];
global.animDb[56] = ["0219", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 2, "#", 11, 16, 11, 16, 2, 11, 42, 16];
global.animDb[57] = ["0256", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 5, "#", 11, 14, 11, 14, 2, 11, 56, 5, 8, 8, 5];
global.animDb[58] = ["0323", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 11, 14, 11, 14, 2, 11, 11, 28, 11, 28];
global.animDb[59] = ["0093", 12, "Walk", 0, 10, "Hurt", 80, 2, "Idle", 96, 4, "#", 8, 8, 8, 14, 8, 8, 8, 8, 14, 8, 2, 11, 19, 11, 19, 11];
global.animDb[60] = ["0094", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 8, "#", 11, 14, 11, 14, 2, 11, 56, 5, 4, 4, 4, 4, 4, 5];
global.animDb[61] = ["0200", 12, "Walk", 0, 8, "Hurt", 64, 2, "Idle", 80, 8, "#", 8, 8, 8, 8, 8, 8, 8, 8, 2, 11, 14, 14, 14, 14, 14, 14, 14, 14];
global.animDb[62] = ["0356", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 11, 16, 11, 16, 2, 11, 56, 11, 16, 11];
global.animDb[63] = ["0472", 12, "Walk", 0, 8, "Hurt", 64, 2, "Idle", 80, 4, "#", 8, 5, 5, 5, 11, 5, 5, 5, 2, 11, 11, 14, 11, 14];
global.animDb[64] = ["0151", 15, "Walk", 0, 6, "Attack", 48, 14, "Hurt", 160, 2, "Idle", 176, 4, "#", 11, 11, 11, 11, 11, 11, 2, 2, 1, 4, 1, 4, 2, 1, 1, 2, 2, 2, 2, 2, 2, 11, 16, 11, 16, 11];
global.animDb[65] = ["0151D", 9, "Idle", 0, 4, "Hop", 32, 10, "#", 16, 11, 16, 11, 2, 1, 2, 4, 5, 5, 4, 2, 1, 2];
global.animDb[66] = ["0146", 15, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "Injured", 80, 2, "#", 11, 14, 11, 14, 2, 11, 11, 16, 11, 16, 33, 28];
global.animDb[67] = ["0125", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 11, 14, 11, 14, 2, 11, 39, 25, 39, 25];
global.animDb[68] = ["0181", 15, "Walk", 0, 4, "Attack", 32, 12, "Hurt", 128, 2, "Idle", 144, 7, "#", 11, 14, 11, 14, 2, 2, 8, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 11, 11, 5, 8, 5, 11, 11];
global.animDb[69] = ["0309", 15, "Walk", 0, 4, "Shock", 32, 19, "Hurt", 184, 2, "Idle", 200, 14, "#", 11, 14, 11, 14, 7, 1, 1, 5, 2, 1, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 84, 14, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 14];
global.animDb[70] = ["0310", 15, "Walk", 0, 4, "Shock", 32, 16, "Hurt", 160, 2, "Idle", 176, 14, "#", 11, 14, 11, 14, 11, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 84, 14, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 14];
global.animDb[71] = ["0405", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 8, "#", 14, 14, 14, 14, 2, 11, 42, 16, 2, 2, 2, 2, 2, 16];
global.animDb[72] = ["0145", 15, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "Injured", 80, 2, "#", 8, 8, 8, 8, 2, 11, 11, 14, 11, 14, 33, 28];
global.animDb[73] = ["0000", 9, "Hurt", 0, 2, "Idle", 16, 9, "#", 2, 11, 44, 11, 1, 1, 4, 5, 4, 1, 1];
global.animDb[74] = ["0126", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 4, "#", 11, 14, 11, 14, 2, 11, 56, 8, 16, 8];
global.animDb[75] = ["0112", 12, "Walk", 0, 4, "Hurt", 32, 2, "Idle", 48, 2, "#", 11, 16, 11, 16, 2, 11, 56, 36];
global.animDb[76] = ["0205", 12, "Walk", 0, 8, "Hurt", 64, 2, "Idle", 80, 4, "#", 8, 8, 8, 8, 8, 8, 8, 8, 2, 11, 56, 11, 28, 11];

global.statusDb = {
	// 0name, 1color, 2desc, 3script, 4persist_eff_if_dead, 5persist_status_if_dead, [6tick_type]
	"DamageDown": ["Damage Down", "1", "You have taken an avoidable attack#straight to your face, yet you survived. You#are an absolute king, and you deserve this#commemorative crown as a reward.#Damage dealt is reduced.", noone, false, false],
	"VulnerabilityUp": ["Vulnerability Up", "1", "Highly vulnerable to attacks.#Taking damage will likely be lethal.", noone, false, false],
	"Hardened": ["Hardened", "2", "A defensive manuever is reducing all#incoming damage.", noone, false, false],
	"Poisoned": ["Poisoned", "1", "Suffering from poison.#Sustaining damage over time.", effect007Dot, false, false],
	"PlotArmor": ["Plot Armor", "2", "This unit is teaching game mechanics.#Damage taken is significantly reduced.#How did you get this status anyway?", noone, false, true],
	"Prey": ["Prey", "1", "Marked as a target of a powerful attack.", noone, true, true],
	"Daredevil": ["Daredevil", "2", "Drawing attention of all enemies.#Foes will prioritize attacking this party#member if possible.", noone, false, false],
	"Concentrate": ["Concentrate", "2", "Damage dealt is highly increased.", noone, false, true],
	"Bind": ["Bind", "1", "This unit is bound and unable to move.", noone, false, false],
	"Barrier": ["Barrier", "2", "A defensive manuever is reducing#incoming damage.", noone, false, false],
	"ScorchMark": ["Scorch Mark", "1", "This unit was marked by @1Scorching Sands@0.#Damage to this party member, as well as#those nearby, will occur once the effect#expires.", effectSpreadMark, true, true],
	"Abandonment": ["Abandonment", "1", "An area-of-effect attack will occur once#this effect expires. Damage will be severely#reduced if shared with other allies.", effectAbandonment, true, true],
	"Isolation": ["Isolation", "1", "An area-of-effect attack will occur once#this effect expires. Damage will be severely#reduced if separated from allies.", effectIsolation, true, true],
	"FrigidIce": ["Frigid Ice", "1", "Soon to be on receiving end of @1Frigid Ice@0.#This unit will explode, dealing damage to all#allies. Damage will increase with proximity#to the target.", noone, true, true],
	"GoodBoy": ["Good Boy's Charm", "2", "Influenced by dog-type magic.#This unit can only execute @1Pet@0.", noone, true, true],
	"SpreadingCold": ["Spreading Cold", "1", "Body heat is rapidly escaping, making this#unit more vulnerable to @1Absolute Zero@0.#Receiving damage from @1Absolute Zero@0 will#cause this effect to spread and strike#the two closest units in target's reach, be#it allies or other objects.", noone, true, true],
	"TwiceComeRuin": ["Twice-come Ruin", "1", "Bearing signs that the end may be nigh.#Receiving another attack will result in#lethal damage.", noone, true, true],
	"MisdirectionL": ["Misdirection: Left", "1", "All area-of-effect attacks intended for#this unit will become shifted in a certain#direction.", noone, true, true],
	"MisdirectionR": ["Misdirection: Right", "1", "All area-of-effect attacks intended for#this unit will become shifted in a certain#direction.", noone, true, true],
	"MisdirectionU": ["Misdirection: Up", "1", "All area-of-effect attacks intended for#this unit will become shifted in a certain#direction.", noone, true, true],
	"MisdirectionD": ["Misdirection: Down", "1", "All area-of-effect attacks intended for#this unit will become shifted in a certain#direction.", noone, true, true],
	"InfernalClose": ["Close Inferno", "1", "@1Infernal Chains@0 are in effect.#This unit will take increased damage if#standing too far from allies affected by#@1True Inferno@0.", noone, true, true],
	"InfernalFar": ["Far Inferno", "1", "@1Infernal Chains@0 are in effect.#This unit will take increased damage if#standing too close to allies affected by#@1True Inferno@0.", noone, true, true],
	"InfernalTarget": ["True Inferno", "1", "@1Infernal Chains@0 are in effect.#This unit is affecting other allies, depending#on their proximity.", noone, true, true],
	"LightScreen": ["Light Screen", "2", "Special damage taken is reduced.", noone, false, false],
	"Line1": ["First-in-Line", "1", "Chosen as the first target of an attack.", noone, true, true],
	"Line2": ["Second-in-Line", "1", "Chosen as the second target of an attack.", noone, true, true],
	"Line3": ["Third-in-Line", "1", "Chosen as the third target for an attack.", noone, true, true],
	"HealBlock": ["Infirmity", "1", "All HP recovery is severely reduced.", noone, true, true],
	"Pausing": ["Pausing", "1", "Cannot use moves.", noone, true, true],
	"Burning": ["Burning", "1", "Sustaining damage over time.", effect025Dot, false, false],
	"Intemperate": ["Intemperate", "1", "Affected by a sudden temperature change,#which will deal high damage once this effect#expires. Effect can be removed by getting#hit by a certain action.", effectIntemperate, true, true],
	"LingeringFlame": ["Lingering Flame", "1", "Affected by @1Blazing Strike@0.#A small area of effect explosion will occur#upon this effect's expiration, hurting the#target and all allies in proximity.", effectLingeringFlame, true, true],
	"DesireOut": ["Inner Fire", "1", "Fulfilling @7Moltres@0's @1Burning Desire@0.#This unit will execute @1Inner Fire@0 once this#effect expires.", effectDesireInnerFire, true, true],
	"DesireIn": ["Thrown Flames", "1", "Fulfilling @7Moltres@0's @1Burning Desire@0.#This unit will execute @1Thrown Flames@0 once#this effect expires.", effectDesireThrownFlames, true, true],
	"Charged": ["Charged", "2", "Damage from special moves is reduced.#Next electric-type attack will deal double#damage.", noone, false, false],
	"Exhausted": ["Exhausted", "1", "Vulnerable to attacks.#All damage to this unit will be doubled.", noone, false, false],
	"ChainLightning": ["Chain Lightning", "1", "Once this effect expires, this unit will#receive damage and pass this effect#to nearby unaffected units. Failure to keep#the chain going will result in punishment.", effectChainLightning, false, false],
	"ElectricTerrain": ["Electric Terrain", "1", "Static electricity is generated upon every#movement. Once this effect ticks down,#charge will be expended depending on the#distance moved on that turn. Moving too#far will result in massive damage.#No damage will be dealt if not moving.", effectCharge, false, false],
	"PhysVuln": ["Weakness", "1", "Highly vulnerable to physical damage.", noone, false, false],
	"Frozen": ["Frozen", "1", "This unit is frozen solid.", effectFrozenSolid, false, false],
	"SaveStateX": ["Save State X", "1", "This unit has its X position recorded.#Position data will be saved upon execution#of @1Save State@0 and restored upon execution#of @1Load State@0, in exact order.", noone, false, false],
	"SaveStateY": ["Save State Y", "1", "This unit has its Y position recorded.#Position data will be saved upon execution#of @1Save State@0 and restored upon execution#of @1Load State@0, in exact order.", noone, false, false],
	"SaveStateXY": ["Save State XY", "1", "This unit has its X and Y positions recorded.#Position data will be saved upon execution#of @1Save State@0 and restored upon execution#of @1Load State@0, in exact order.", noone, false, false],
	"NullPointer": ["Null-Pointed", "1", "This unit is a @7Null Pointer@0's pointee.#A dereference will occur upon this effect's#expiration.", effectDesireNullPointer, false, false],
	"VoidPointer": ["Void-Pointed", "1", "This unit is a @7Void Pointer@0's pointee.#A dereference will occur upon this effect's#expiration.", effectDesireVoidPointer, false, false],
	"Abandonment2": ["Abandonment", "1", "An area-of-effect attack will occur once#this effect expires. Damage will be severely#reduced if shared with other allies.", noone, true, true],
	"Isolation2": ["Isolation", "1", "An area-of-effect attack will occur once#this effect expires. Damage will be severely#reduced if separated from allies.", noone, true, true],
	"ThrownFlames2": ["Thrown Flames", "1", "This unit will execute @1Thrown Flames@0 once#this effect expires.", noone, true, true],
	"Bleeding": ["Corrupted", "1", "Corruption of this unit's internal memory#structures causes heavy damage over time.", effect025Dot2, false, false],
	"WildPointer": ["Wild-Pointed", "1", "This unit is a @7Wild Pointer@0's pointee.#A dereference will occur upon this effect's#expiration.", noone, false, false],
	"Brilliancy": ["Brilliancy", "2", "Empowered by arbitrary code execution.#Damage dealt is tripled.#Damage taken is halved.", noone, false, false],
};

// name0, script1, desc2, range3, targets4, long desc5, move type str6, pp cost7, stance req8
global.movesDb[0] = ["Bepis", attack002Bepis, "You shouldn't have this.", -1, TARGETS_ENEMIES, textToAttributed("You shouldn't have this."), "Event move", 0, STANCE_NONE];
global.movesDb[1] = ["Tackle", attack001Tackle, "Weak short-range physical attack.", 120, TARGETS_ENEMIES, textToAttributed("Delivers a physical attack with 20 base power.#Short range, targets one enemy. No PP cost."), "Standard move", 0, STANCE_NONE];
global.movesDb[2] = ["Scratch", attack003Scratch, "Weak short-range physical attack.", 120, TARGETS_ENEMIES, textToAttributed("Delivers a physical attack with 20 base power.#Short range, targets one enemy. No PP cost."), "Standard move", 0, STANCE_NONE];
global.movesDb[3] = ["Ember", attack004Ember, "Short-range fire attack.", 150, TARGETS_ENEMIES, textToAttributed("Delivers a fire attack with 30 base power.#Short range, targets one enemy. No PP cost."), "Standard move", 0, STANCE_NONE];
global.movesDb[4] = ["Myriad Truths", noone, "Insanely strong threefold strike.", -1, TARGETS_ENEMIES, textToAttributed("Delivers a threefold typeless attack with 100 base power.#No range requirements. Doesn't work in some encounters."), "Event move", 0, STANCE_NONE];
global.movesDb[5] = ["Concentrate", attack010Concentrate, "Deal more damage next turn.", -1, TARGETS_NONE, textToAttributed("Your next attack will deal 220~ damage.#Stacks with other damage bonuses. Costs 10 PP."), "Specialist move", 10, STANCE_OFF];
global.movesDb[6] = ["Water Gun", attack008WaterGun, "Short-range water attack.", 150, TARGETS_ENEMIES, textToAttributed("Delivers a water attack with 30 base power.#Short range, targets one enemy. No PP cost."), "Standard move", 0, STANCE_NONE];
global.movesDb[7] = ["Vine Whip", attack006VineWhip, "Short-range grass attack.", 150, TARGETS_ENEMIES, textToAttributed("Delivers a grass attack with 30 base power.#Short range, targets one enemy. No PP cost."), "Standard move", 0, STANCE_NONE];
global.movesDb[8] = ["Heal Pulse", attack008HealPulse, "Restore small amount of HP.", -1, TARGETS_FRIENDLY, textToAttributed("Restores HP equivalent to an attacking move of 25 base power.#Targets one ally. Costs 5 PP."), "Specialist move", 5, STANCE_SUPP];
global.movesDb[9] = ["Taunt", attack009Taunt, "Make yourself the target.", -1, TARGETS_NONE, textToAttributed("Causes the user to be targeted by opponent's next attack.#No effect on certain moves. Lasts one turn only. Costs 5 PP."), "Specialist move", 5, STANCE_DEF];
global.movesDb[10] = ["Revenge", attack011RevengeBlast, "Power increases when low health.", -1, TARGETS_ENEMIES, textToAttributed("Delivers a typeless attack with 25 base power.#Power increases to 70 if used below 30~ HP. Costs 15 PP."), "Specialist move", 15, STANCE_OFF];
global.movesDb[11] = ["Barrier", attack012Barrier, "Reduce damage taken by 20~.", -1, TARGETS_FRIENDLY, textToAttributed("Reduce damage taken by 30~ for three turns.#Targets one ally. Costs 20 PP."), "Specialist move", 20, STANCE_DEF];
global.movesDb[12] = ["Rejuvenate", attack013Rejuvenate, "Strengthen a healthy party member.", -1, TARGETS_FRIENDLY, textToAttributed("Overheal target party member by 25~ of their maximum HP.#Only works if the target's HP is full. Costs 10 PP."), "Specialist move", 10, STANCE_SUPP];
global.movesDb[13] = ["Heal Wave", attack014HealWave, "Small HP restoration to all allies.", -1, TARGETS_NONE, textToAttributed("Restores HP equivalent to an attacking move of 15 base power.#Targets all allies. Costs 20 PP."), "Specialist move", 20, STANCE_SUPP];
global.movesDb[14] = ["Heat Wave", attack015HeatWave, "Fire-type damage to all enemies.", -1, TARGETS_NONE, textToAttributed("Delives a fire attack with 20 base power to all enemies.#Not to be confused with @1Heal Wave@0. Costs 10 PP."), "Standard move", 10, STANCE_NONE];
global.movesDb[15] = ["Bite", attack016Bite, "Short-range dark attack.", 150, TARGETS_ENEMIES, textToAttributed("Delivers a dark attack with 40 base power.#Short range, targets one enemy. Costs 5 PP."), "Standard move", 5, STANCE_NONE];
global.movesDb[16] = ["Poisonpowder", attack007Poisonpowder, "Inflicts poison.", -1, TARGETS_ENEMIES, textToAttributed("Inflicts poison, causing constant damage over time.#Targets one enemy. Costs 5 PP."), "Standard move", 5, STANCE_NONE];
global.movesDb[17] = ["Pet", attackPet, "Pets the dog.", 120, TARGETS_ENEMIES, textToAttributed("bepisssssssssss"), "Standard move", 0, STANCE_NONE];
global.movesDb[18] = ["Venoshock", attack018Venoshock, "Double damage on poisoned targets.", -1, TARGETS_ENEMIES, textToAttributed("Delivers a poison attack with 30 base power.#Double damage on poisoned target. Costs 10 PP."), "Standard move", 10, STANCE_NONE];
global.movesDb[19] = ["Aqua Tail", attack019Aquatail, "High damage water attack.", -1, TARGETS_ENEMIES, textToAttributed("Delivers a water attack with 60 base power.#Targets one enemy at any range. Costs 15 PP."), "Standard move", 15, STANCE_NONE];
global.movesDb[20] = ["Flamethrower", attack020Flamethrower, "High damage fire attack.", -1, TARGETS_ENEMIES, textToAttributed("Delivers a fire attack with 60 base power.#Targets one enemy at any range. Costs 15 PP."), "Standard move", 15, STANCE_NONE];
global.movesDb[21] = ["Light Screen", attack021LightScreen, "Reduce damage to everyone.", -1, TARGETS_NONE, textToAttributed("Reduces damage from all moves by 15~ for 3 turns.#Targets all party members. Costs 20 PP."), "Specialist move", 20, STANCE_DEF];
global.movesDb[22] = ["Take Down", attack022TakeDown, "High typeless damage with recoil.", 100, TARGETS_ENEMIES, textToAttributed("Delivers a typeless attack with 80 base power.#Short range, causes recoil. Costs 10 PP."), "Specialist move", 10, STANCE_OFF];
global.movesDb[23] = ["Blizzard", attack023Blizzard, "Ice attack with damage reduction.", -1, TARGETS_ENEMIES, textToAttributed("Delivers an ice attack with 65 power and reduces the target's#damage for 2 turns. No range requirements. Costs 20 PP."), "Standard move", 20, STANCE_NONE];
global.movesDb[24] = ["Petal Dance", attack024PetalDance, "Threefold attack, requires recharge.", -1, TARGETS_NONE, textToAttributed("Threefold grass attack with 60 power. Costs 20 PP.#Targets chosen randomly, cannot use attacking moves next turn."), "Standard move", 20, STANCE_NONE];
global.movesDb[25] = ["Blast Burn", attack025BlastBurn, "Fire attack, causes burn.", -1, TARGETS_ENEMIES, textToAttributed("Delivers a fire attack with 50 power. Causes burn for 4 turns.#No range requirements. Costs 20 PP."), "Standard move", 20, STANCE_NONE];
global.movesDb[26] = ["Moonlight", attack026Recover, "Fully restore HP of one target.", -1, TARGETS_FRIENDLY, textToAttributed("Restores all HP.#Targets one ally. Costs 15 PP."), "Specialist move", 15, STANCE_SUPP];
global.movesDb[27] = ["Skill Swap", attack027SkillSwap, "Swap types with an ally.", -1, TARGETS_FRIENDLY, textToAttributed("Swap types with an ally.#Effect lasts until end of battle. Costs 20 PP."), "Specialist move", 20, STANCE_DEF];
global.movesDb[28] = ["Focus Blast", attack028FocusBlast, "Strong, but leaves you vulnerable.", -1, TARGETS_ENEMIES, textToAttributed("Delivers a fighting attack with 80 power. Costs 15 PP.#Leaves the user highly vulnerable on the next turn."), "Specialist move", 15, STANCE_OFF];

// name, desc, out of battle script, in battle script, long desc, targets
global.itemDb[0] = ["Nothing", "Absolutely nothing.", itemNotUsableOverworld, itemNotUsableBattle, textToAttributed("Absilutuly! This is nothing.#Meiicc drop!"), TARGETS_NONE];
global.itemDb[1] = ["Pearl of Delirium", "A legendary artifact.", itemNotUsableOverworld, itemUsePearl, textToAttributed("@FA@0A legendary artifact bearing an inscribed ancient text:#@FB@0this iten .. GOOD! VERY !!@FA@0"), TARGETS_NONE];
global.itemDb[2] = ["Oran Berry", "Restores small amount of HP.", itemNotUsableOverworld, itemUsePotion, textToAttributed("Restores 50 HP to a single party member."), TARGETS_FRIENDLY];
global.itemDb[3] = ["Reviver Seed", "Revives holder upon fainting.", itemNotUsableOverworld, itemNotUsableBattle, textToAttributed("Revives the holder with half HP upon fainting.#Used automatically. Turns into a @1Plain Seed@0 after use."), TARGETS_NONE];
global.itemDb[4] = ["Plain Seed", "An ordinary seed.", itemNotUsableOverworld, itemNotUsableBattle, textToAttributed("An ordinary seed.#Eating it has no particular effect."), TARGETS_NONE];
global.itemDb[5] = ["Blast Seed", "Deals constant damage based on level.", itemNotUsableOverworld, itemUseBlastSeed, textToAttributed("Deals constant damage depending on the user's level.#Maximum of 100 HP of damage."), TARGETS_ENEMIES];
global.itemDb[6] = ["Key", "Opens locked doors in dungeons.", itemNotUsableOverworld, itemNotUsableBattle, textToAttributed("A key which unlocks locked chambers inside dungeons.#Will crumble upon use."), TARGETS_NONE];
global.itemDb[7] = ["Sitrus Berry", "Fully restores HP.", itemNotUsableOverworld, itemUseSitrusBerry, textToAttributed("Fully restores HP of a single party member."), TARGETS_FRIENDLY];
global.itemDb[8] = ["Max Elixir", "Fully restores PP.", itemNotUsableOverworld, itemUseMaxElixir, textToAttributed("Fully restores PP of a single party member."), TARGETS_FRIENDLY];
global.itemDb[9] = ["Elixir", "Restores some PP.", itemNotUsableOverworld, itemUseElixir, textToAttributed("Restores 50~ of a single party member's PP."), TARGETS_FRIENDLY];
global.itemDb[10] = ["Apple Juice", "Restore some HP to all members.", itemNotUsableOverworld, itemUseJuice1, textToAttributed("Delicious juice made from fresh Apples.#Restores 70 HP to all party members."), TARGETS_NONE];
global.itemDb[11] = ["Golden Juice", "Fully restore HP to all members.", itemNotUsableOverworld, itemUseJuice2, textToAttributed("Delicious juice made from Golden Apples.#Restores all HP to all party members."), TARGETS_NONE];
global.itemDb[12] = ["Life Seed", "Fully restore HP and overheal by half.", itemNotUsableOverworld, itemUseLifeSeed, textToAttributed("Restores all HP to a single party member, then overheals them#for 50~ of their maximum HP."), TARGETS_FRIENDLY];

global.levelDb = [
	[4, 8, 8],
	[17, 32, 25],
	[44, 80, 52],
	[109, 178, 106],
	[236, 352, 204],
	[449, 528, 403],
	[772, 1032, 750],
	[1229, 1590, 932],
	[1844, 2328, 1376],
	[2641, 3272, 1949],
	[3644, 4448, 2668],
	[4877, 5882, 3550],
	[6364, 7600, 4612],
	[8129, 9628, 5871],
	[10703, 12023, 7390],
	[13241, 14842, 9232],
	[16214, 18142, 11460],
	[19673, 21980, 14137],
	[23669, 26413, 17326],
	[28253, 31498, 21090],
	[33476, 37292, 25492],
	[39389, 43852, 30595],
	[46043, 51235, 36462],
	[53489, 59498, 43156],
	[61778, 68698, 50740],
	[70961, 78892, 59277],
	[81089, 90137, 68830],
	[92213, 102490, 79462],
	[104384, 116008, 91236],
	[117653, 130748, 104215],
	[132071, 146767, 118462],
	[147689, 164122, 134040],
	[164558, 182870, 151012],
	[182729, 203068, 169441],
	[202270, 224789, 189442],
	[223249, 248106, 211130],
	[245734, 273092, 234620],
	[269793, 299820, 260027],
	[295494, 328363, 287466],
	[322905, 358794, 317052],
	[352094, 391186, 348900],
	[383129, 425612, 383125],
	[416078, 462145, 419842],
	[451009, 500858, 459166],
	[487990, 541824, 501212],
	[527089, 585116, 546095],
	[568374, 630807, 593930],
	[611913, 678970, 644832],
	[657774, 729678, 698916],
	[706025, 783004, 756297]
];

global.battleQueue = [];
global.battleTurn = 0;
global.battleChoiceBox = noone;
global.battleQueueBox = noone;
global.battleToastBox = noone;
global.battleItemsUsable = true;
global.battleWhichId = 0;
global.battleStoredDirection = 1;

#macro STANCE_OFF 0
#macro STANCE_DEF 1
#macro STANCE_SUPP 2
#macro STANCE_NONE -1
global.stanceDb = [
	// name, +att, +def, +spatt, +spdef, +hp, +pp
	["Offense", 2, 0, 2, 0, 0, 2],
	["Defense", 0, 2, 0, 2, 1, 0],
	["Support", 0, 0, 3, 3, 0, 1]
];

global.speciesNames = {
	"m0001": "Bulbasaur",
	"m0002": "Ivysaur",
	"m0003": "Venusaur",
	"m0004": "Charmander",
	"m0005": "Charmeleon",
	"m0006": "Charizard",
	"m0007": "Squirtle",
	"m0008": "Wartortle",
	"m0009": "Blastoise",
	"m0049": "Venomoth",
	"m0225": "Delibird",
	"m0168": "Ariados",
	"m0181": "Ampharos"
};
global.evoData = {
	// 0lv, 1newspecies, 2newtypes, 3newspecname, 4statincreases[att,def,spatt,spdef,maxhp,maxpp]
	"m0001": [16, "0002", ["grass", "poison"], "Ivysaur", [6, 5, 6, 5, 10, 15]],
	"d0002": [16, "0002", ["grass", "poison"], "Ivysaur", [6, 5, 6, 5, 10, 15]],
	"m0002": [36, "0003", ["grass", "poison"], "Venusaur", [6, 5, 6, 5, 10, 15]],
	"d0003": [0, 0, 0, 0, [8, 6, 8, 6, 10, 20]],
	"m0004": [16, "0005", ["fire"], "Charmeleon", [7, 4, 7, 4, 10, 10]],
	"d0005": [16, "0005", ["fire"], "Charmeleon", [7, 4, 7, 4, 10, 10]],
	"m0005": [36, "0006", ["fire", "flying"], "Charizard", [9, 5, 9, 5, 15, 10]],
	"d0006": [0, 0, 0, 0, [9, 5, 9, 5, 15, 10]],
	"m0007": [16, "0008", ["water"], "Wartortle", [4, 7, 4, 7, 10, 10]],
	"d0008": [16, "0008", ["water"], "Wartortle", [4, 7, 4, 7, 10, 10]],
	"m0008": [36, "0009", ["water"], "Blastoise", [5, 9, 5, 9, 20, 10]],
	"d0009": [0, 0, 0, 0, [5, 9, 5, 9, 20, 10]],
}

global.speciesLearnList = {
	// move, lvl
	"m0004": [
		[2, 1],
		[3, 7],
		[14, 14],
		[20, 19],
		[25, 25]
	],
	"m0007": [
		[1, 1],
		[6, 7],
		[15, 14],
		[19, 19],
		[23, 25]
	],
	"m0001": [
		[1, 1],
		[7, 7],
		[16, 14],
		[18, 19],
		[24, 25]
	]
};
global.speciesLearnList[$"m0002"] = global.speciesLearnList[$"m0001"];
global.speciesLearnList[$"m0003"] = global.speciesLearnList[$"m0001"];
global.speciesLearnList[$"m0005"] = global.speciesLearnList[$"m0004"];
global.speciesLearnList[$"m0006"] = global.speciesLearnList[$"m0004"];
global.speciesLearnList[$"m0008"] = global.speciesLearnList[$"m0007"];
global.speciesLearnList[$"m0009"] = global.speciesLearnList[$"m0007"];

global.specialistLearnList = {
	"m0": [
		[5, 6],
		[10, 10],
		[22, 20],
		[28, 27],
	],
	"m1": [
		[9, 6],
		[11, 10],
		[21, 18],
		[27, 25],
	],
	"m2": [
		[8, 6],
		[13, 10],
		[12, 14],
		[26, 24],
	]
};
global.unlockedDungeonLists = [
	[], [], [], [], [], []
];

// move ai, knockout ai, turn start script, end script
// tutorial battle data in comment

/*
global.battleAdversaryScript = [ai001Test, aiBattleClear, ai001Intro, aiNull];
global.battleInitData = [
	{
		species: "0011",
		name: "Hooked Metapod",
		maxHP: 50,
		att: 10, def: 25, types: ["grass"],
		lv: 5
	}
];

global.tileMap = [
	6, 6, 6, 6, 6, 56, 6, 6, 6, 6, 6, 6, 6, 6, 6,
	6, 6, 51, 6, 6, 6, 6, 6, 56, 6, 6, 6, 51, 6, 6,
	6, 6, 6, 6, 31, 9, 9, 9, 53, 9, 32, 6, 6, 6, 6,
	6, 6, 6, 31, 10, 68, 60, 60, 60, 61, 8, 32, 6, 6, 6,
	6, 51, 6, 7, 59, 63, 63, 63, 63, 106, 64, 5, 6, 56, 6,
	6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 64, 5, 6, 6, 6,
	6, 6, 6, 7, 62, 107, 63, 63, 63, 63, 64, 50, 6, 6, 6,
	6, 6, 56, 33, 4, 65, 66, 66, 66, 67, 2, 34, 6, 51, 6,
	6, 6, 6, 6, 33, 3, 3, 3, 3, 3, 34, 6, 56, 6, 6,
	6, 6, 6, 51, 6, 6, 6, 6, 6, 6, 56, 6, 6, 6, 6
];
*/
global.battleAdversaryScript = [ai001Test, aiNull, aiNull, aiNull];
global.battleInitData = [
	{
		species: "0004",
		name: "Demon",
		maxHP: 9999,
		att: 399, def: 399, types: ["normal"],
		lv: 0,
		expRate: 1
	}
];
global.tileMap = [
	63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 
	63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63
];

#macro BATTLETYPE_OVERWORLD 1
#macro BATTLETYPE_DUNGEON 2
#macro BATTLETYPE_INSTANCED 3
#macro BATTLETYPE_TUTORIAL 4

#macro BATTLERESULT_WIN 1
#macro BATTLERESULT_LOSE 2
#macro BATTLERESULT_NONE 0

#macro MARKER_NONE 0
#macro MARKER_STACK 1
#macro MARKER_SPREAD 2
#macro MARKER_FLARE 3
#macro MARKER_LC1 4
#macro MARKER_LC2 5
#macro MARKER_LC3 6

#macro ASSET_PARTNER_PORTRAIT asset_get_index("Portrait" + global.partnerSpecies)
#macro ASSET_PARTNER2_PORTRAIT asset_get_index("Portrait" + global.partnerSpeciesSecondary)

global.battleStats = [[0,0,0],[0,0,0],[0,0,0],[0,0,false]];
global.battleLastBlow = "due to an unseen force";
global.battleLastTarget = "@6Bepis@0";
global.battleCurrentDutyName = "Bepis Valley";
global.battleCurrentAttackerIndex = -1;

global.battleType = BATTLETYPE_OVERWORLD;
global.battleResult = BATTLERESULT_NONE;
global.battleEcho = 0;

global.battleLog = [];

// todo - allow player to change keybinds
global.keybinds = [
	ord("Z"), ord("S"), vk_left, vk_right, vk_up, vk_down
];

/*
	{
		name: "Snow",
		curHP: 56,
		maxHP: 78,
		species: "0007",
		moves: [0],
		att: 15,
		def: 20,
		types: ["water"]
	}
*/

global.musicIndex = 0;
global.musicControl = 0;

if (!IS_HTML5) {
	audio_sound_loop_start(Mus1, 3.2819);
	audio_sound_loop_start(Mus7, 8.005);
	audio_sound_loop_start(Mus9, 8.005);
	audio_sound_loop_start(Mus12, 40.889);
	audio_sound_loop_start(Mus13, 1.156);
	audio_sound_loop_start(Mus14, 2.742);
	audio_sound_loop_start(Mus18, 2.348);
	audio_sound_loop_start(Mus19, 7.109);
	audio_sound_loop_start(Mus20, 2.054);
	audio_sound_loop_start(Mus21, 32.331);
	audio_sound_loop_start(Mus22, 4.358);
	audio_sound_loop_start(Mus24, 7.723);
	audio_sound_loop_start(Mus27, 55.511);
	audio_sound_loop_start(Mus28, 7.196);
	audio_sound_loop_start(Mus31, 21.207);
}

global.loopPointDb = [
	0, 3.2819, 0, 0, 0, 0, 0, 8.005, 0, 8.005,
	0, 0, 40.889, 1.156, 2.742, 0, 0, 0, 2.348,
	7.109, 2.054, 32.331, 4.358, 0, 7.723, 0, 0, 55.511, 7.196,
	0, 0, 21.207
];

audio_sound_gain(Mus1, 0.7, 0);
audio_sound_gain(Mus2, 0.7, 0);
audio_sound_gain(Mus3, 0.7, 0);
audio_sound_gain(Mus4, 0.9, 0);
audio_sound_gain(Mus5, 0.7, 0);
audio_sound_gain(Mus6, 0.7, 0);
audio_sound_gain(Mus7, 0.9, 0);
audio_sound_gain(Mus8, 0.8, 0);
audio_sound_gain(Mus9, 0.7, 0);
audio_sound_gain(Mus10, 0.8, 0);
audio_sound_gain(Mus14, 0.9, 0);
audio_sound_gain(Mus20, 0.9, 0);
audio_sound_gain(Mus21, 0.8, 0);
audio_sound_gain(Mus22, 0.6, 0);
audio_sound_gain(Mus23, 0.7, 0);
audio_sound_gain(Mus24, 0.5, 0);
audio_sound_gain(Mus27, 0.6, 0);
audio_sound_gain(Mus28, 0.7, 0);
audio_sound_gain(SFXGeneral1, 0.6, 0);
audio_sound_gain(SFXGeneral2, 0.6, 0);
audio_sound_gain(SFXGeneral7, 0.7, 0);
audio_sound_gain(SFXGeneral8, 0.2, 0);
audio_sound_gain(SFXGeneral10, 0.7, 0);
audio_sound_gain(SFXGeneral11, 0.9, 0);
audio_sound_gain(FightSFXChargeAttack, 0.8, 0);
audio_sound_gain(FightSFXPeck, 0.4, 0);
audio_sound_gain(GlitchDimension, 0.65, 0);
audio_sound_gain(SoundGlitch2, 0.55, 0);
audio_sound_gain(SoundGlitch3, 0.55, 0);

#macro MAP_OBJECT 0
#macro MAP_LOADZONE 1
#macro MAP_SCRIPT 2
#macro MAP_META 3
#macro MAP_VARIANT 4
#macro MAP_PART 5
#macro MAP_OBJECTCOND 6
#macro MAP_MUSICID 7

#macro TRANSITION_SQUARES_IN 0
#macro TRANSITION_FADETOBLACK 1
#macro TRANSITION_FADEFROMBLACK 2
#macro TRANSITION_SQUARES_OUT 3
#macro TRANSITION_JUSTBLACK 4
#macro TRANSITION_FADETOWHITE 5
#macro TRANSITION_FADEFROMWHITE 6
#macro TRANSITION_RST38 7

#macro SCRIPT_CONTINUE_NOTICK -10000
#macro SCRIPT_CONTINUE_ADVANCETICK -10001
#macro SCRIPT_STOP -10002

#macro FACING_D 0
#macro FACING_DR 1
#macro FACING_R 2
#macro FACING_UR 3
#macro FACING_U 4
#macro FACING_UL 5
#macro FACING_L 6
#macro FACING_DL 7

global.emulatedInput = 0;

global.bugcheckMessage = "bepis";

#macro EVENT_ALWAYS 0
#macro EVENT_LAB_EXITING_DOOR 1
#macro EVENT_MET_PARTNER_FRONT_OF_HOUSE 2
#macro EVENT_LAB_EXPLAINED_MISSION1 3
#macro EVENT_SERENE_FOREST_ITEM1 4
#macro EVENT_SERENE_FOREST_ITEM2 5
#macro EVENT_SERENE_FOREST_ITEM3 6
#macro EVENT_TUTORIALTEXT_ITEMS 7
#macro EVENT_TUTORIALTEXT_SPEED 8
#macro EVENT_TUTORIALTEXT_MOVE 9
#macro EVENT_TUTORIALTEXT_TELEGRAPHS 10
#macro EVENT_TUTORIALTEXT_STATUS 11
#macro EVENT_TUTORIALTEXT_MATCHUPS 12
#macro EVENT_SERENE_FOREST_FIRST_CLEAR 13
#macro EVENT_LAB_EXPLAINED_MISSION2 14
#macro EVENT_SERENE_FOREST_CLEARING_FIRST_VISIT 15
#macro EVENT_TUTORIALTEXT_EXPLORE 16
#macro EVENT_SERENEGD_ITEM1 17
#macro EVENT_TUTORIAL_STACKSPREAD 18
#macro EVENT_SERENE_GLITCHDIMENSION_FLAG1 19
#macro EVENT_SERENE_GLITCHDIMENSION_FLAG2 20
#macro EVENT_SERENE_GLITCHDIMENSION_FLAG3 21
#macro EVENT_SERENE_GLITCHDIMENSION_FLAG4 22
#macro EVENT_SERENE_GLITCHDIMENSION_FLAG5 23
#macro EVENT_SERENE_GLITCHDIMENSION_FLAG6 24
#macro EVENT_SERENE_GLITCHDIMENSION_FLAG7 25
#macro EVENT_SERENE_GLITCHDIMENSION_FLAG8 26
#macro EVENT_SERENE_GLITCHDIMENSION_CLEAR 27
#macro EVENT_LAB_EXPLAINED_MISSION3 28
#macro EVENT_CRYSTALGLACIER_FLAG1 29
#macro EVENT_CRYSTALGLACIER_FLAG2 30
#macro EVENT_CRYSTALGLACIER_FLAG3 31
#macro EVENT_CRYSTALGLACIER_FLAG4 32
#macro EVENT_CRYSTALGLACIER_FLAG5 33
#macro EVENT_CRYSTALGLACIER_CLEAR 34
#macro EVENT_LAB_EXPLAINED_MISSION4 35
#macro EVENT_MYSTICHIGHLAND_FLAG1 36
#macro EVENT_MYSTICHIGHLAND_FLAG2 37
#macro EVENT_MYSTICHIGHLAND_FLAG3 38
#macro EVENT_MYSTICHIGHLAND_FLAG4 39
#macro EVENT_MYSTICHIGHLAND_FLAG5 40
#macro EVENT_MYSTICHIGHLAND_CLEAR 41
#macro EVENT_MYSTICHIGHLAND_MACHAMP 42
#macro EVENT_LAB_EXPLAINED_MISSION4LOOP 43
#macro EVENT_LAB_EXPLAINED_MISSION5 44
#macro EVENT_CRYSTAL_GLACIER_CLEARING_FIRST_VISIT 45
#macro EVENT_MYSTICGD_FLAG1 46
#macro EVENT_MYSTICGD_FLAG2 47
#macro EVENT_MYSTICGD_FLAG3 48
#macro EVENT_MYSTICGD_FLAG4 49
#macro EVENT_MYSTICGD_FLAG5 50
#macro EVENT_LAB_EXPLAINED_MISSION6 51
#macro EVENT_ARTICUNO_DEFEATED 52
#macro EVENT_EVOCAVE_FLAG1 53
#macro EVENT_EVOCAVE_FLAG2 54
#macro EVENT_EVOCAVE_FLAG3 55
#macro EVENT_EVOCAVE_FLAG4 56
#macro EVENT_EVOCAVE_FLAG5 57
#macro EVO_CHAMBER_FIRST 58
#macro EVENT_LAB_EXPLAINED_MISSION7 59
#macro EVENT_LAVALABI_FLAG1 60
#macro EVENT_LAVALABI_FLAG2 61
#macro EVENT_LAVALABI_FLAG3 62
#macro EVENT_LAVALABI_FLAG4 63
#macro EVENT_LAVALABI_FLAG5 64
#macro EVENT_LAVALABI_FLAG6 65
#macro EVENT_LAVALABI_FLAG7 66
#macro EVENT_LAVALABI_FLAG8 67
#macro EVENT_LAVALABY_CLEAR 68
#macro EVENT_LAB_EXPLAINED_MISSION8 69
#macro EVENT_LABYGD_FLAG1 70
#macro EVENT_LABYGD_FLAG2 71
#macro EVENT_LABYGD_FLAG3 72
#macro EVENT_LABYGD_FLAG4 73
#macro EVENT_LABYGD_FLAG5 74
#macro EVENT_LABYGD_FIRSTVISIT 75
#macro EVENT_MOLTRES_DEFEATED 76
#macro EVENT_LAB_EXPLAINED_MISSION9 77
#macro EVENT_EVOCAVE_COINCASE 78
#macro EVENT_KEEPGD_FLAG1 79
#macro EVENT_KEEPGD_FLAG2 80
#macro EVENT_KEEPGD_FLAG3 81
#macro EVENT_KEEPGD_FLAG4 82
#macro EVENT_KEEPGD_FLAG5 83
#macro EVENT_KEEPGD_FLAG6 84
#macro EVENT_KEEPGD_FLAG7 85
#macro EVENT_ZAPDOS_DEFEATED 86
#macro EVENT_LAB_EXPLAINED_MISSIONL 87
#macro EVENT_ABYSSPRE_INTRO 88
#macro EVENT_ABYSS_FLAG1 89
#macro EVENT_ABYSS_FLAG2 90
#macro EVENT_ABYSS_FLAG3 91
#macro EVENT_ABYSS_FLAG4 92
#macro EVENT_ABYSS_FLAG5 93
#macro EVENT_ABYSS_FLAG6 94
#macro EVENT_ABYSS_FLAG7 95
#macro EVENT_ABYSSPRE_INTRO2 96
#macro EVENT_ABYSSPRE_FAILEDFIGHT 97
#macro EVENT_ABYSSPRE_COINCASEUSED 98
#macro EVENT_MISSINGNO_DEFEATED 99
#macro EVENT_LAVALABI_FIRST 100
#macro EVENT_ACHIEVEMENT_UNSET1 101
#macro EVENT_ACHIEVEMENT_999DMG 102
#macro EVENT_ACHIEVEMENT_UNSET2 103
#macro EVENT_ACHIEVEMENT_10STAT 104
#macro EVENT_ACHIEVEMENT_TMTRAINER 105
#macro EVENT_ACHIEVEMENT_UNSET3 106
#macro EVENT_ACHIEVEMENT_OFFONLY 107
#macro EVENT_ACHIEVEMENT_DEFONLY 108
#macro EVENT_ACHIEVEMENT_SUPONLY 109

#macro SAVE_CHECKSUM_SALT "9i4Tmvp5KRlKtU8QvHCL"
#macro SAVE_CHECKSUM_KEY "UFYc1WYSRliRPDQXcG5F"

global.dungeonDb = [
	// name0, restriction list1, dungeon data2, subtitle3, musicId4,
	// entryMapLocation5, whenGo6, deathMapLocation7, tilesetId8
	[
		"Test", [], [], "bepis", 1,
		noone, 0, noone, "001"
	],
	[
		"Serene Forest", [], dungeonDataSereneForest(), "The eastern land", 7,
		noone, 1, ["Town", "BeforeMission1", 1000*2, 486*2, FACING_L], "001"
	],
	[
		"Glitch Dimension: Forest", [], dungeonDataSereneGlitchDimension(), "The corrupted realm", 9,
		["SereneEnd", "Mission2", (156-15)*2, 220*2, FACING_U], 2, ["Town", "Standard1", 1000*2, 486*2, FACING_L], "002"
	],
	[
		"Crystal Glacier", [], dungeonDataCrystalGlacier(), "The eastern land", 11,
		noone, 3, ["Town", "Standard1", 1000*2, 486*2, FACING_L], "003"
	],
	[
		"Mystic Highlands", [], dungeonDataMysticHighlands(), "The northern land", 13,
		noone, 4, ["Town", "Standard2", 640*2, 220*2, FACING_D], "004"
	],
	[
		"Glitch Dimension: Glacier", [], dungeonDataCrystalGlacierGlitchDimension(), "The corrupted realm", 14,
		["GlacierEnd", "Return", 156*2, 130*2, FACING_U], 5, ["Town", "Standard2", 1000*2, 486*2, FACING_L], "005"
	],
	[
		"Fogbound Keep", [], dungeonDataFogboundKeep(), "The northern relic", 17,
		noone, 6, ["Town", "Standard2", 640*2, 220*2, FACING_D], "006"
	],
	[
		"Evolution Chamber", [], dungeonDataFogboundKeep(), "The northern relic", 17,
		["EvoChamber", "Main", -200, -200, FACING_D], 9, ["Town", "Standard2", 640*2, 220*2, FACING_D], "006"
	],
	[
		"Lava Labyrinth", [], dungeonDataLavaLabyrinth(), "The eastern relic", 19,
		noone, 7, ["Town", "Standard2", 1000*2, 486*2, FACING_L], "007"
	],
	[ //9
		"Glitch Dimension: Labyrinth", [], dungeonDataGDLabyrinth(), "The corrupted realm", 20,
		["LabyrinthEnd", "Return", 156*2, 130*2, FACING_U], 8, ["Town", "Standard2", 1000*2, 486*2, FACING_L], "008"
	],
	[
		"Glitch Dimension: Keep", [], dungeonDataGDKeep(), "The corrupted realm", 23,
		noone, 8, ["Town", "Standard2", 640*2, 220*2, FACING_D], "009"
	],
	[
		"Unending Abyss", [], dungeonDataAbyss(), "The corrupted realm", 25,
		noone, 10, ["AbyssPre", "Bepis", 147*2, 35*2, FACING_D], "010"
	],
	[
		"Unending Abyss", [], dungeonDataFinal(), "The corrupted realm", 25,
		noone, 10, ["AbyssPost", "Bepis", 160*2, 124*2, FACING_D], "010"
	],
];

// get species data? 
/*
var xx = [];
for (var i=1; i<array_length(global.dungeonDb); i++) {
	for (var j=0; j<array_length(global.dungeonDb[i][2][2]); j++) {
		for (var k=0; k<array_length(global.dungeonDb[i][2][2][j].adversaries); k++) {
			array_push(xx, global.dungeonDb[i][2][2][j].adversaries[k].species);
		}
	}
}
show_message(array_unique(xx));
*/

global.mapDb = {
	"Lab": [
		// shared for all maps
		[MAP_PART, MapPartLabSlidingDoor, 208, 14],
		
		[MAP_OBJECT, 28, 105, "0070", FACING_DR, labNPC4Interact],
		[MAP_OBJECT, 241, 163, "0033", FACING_R, labNPC2Interact],
		[MAP_OBJECT, 272, 164, "0075", FACING_L, labNPC3Interact],
		[MAP_OBJECT, 123, 94, "0134", FACING_U, labNPC1Interact],
		[MAP_MUSICID, 6],
		
		// variant: Standard1
		[MAP_VARIANT, "Standard1"],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "FirstVisit"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 268, 94, "0028", FACING_U, labNPCSandslashInteract],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: Standard2
		[MAP_VARIANT, "Standard2"],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "Standard1"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 268, 94, "0028", FACING_U, labNPCSandslashInteract],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: Standard3
		[MAP_VARIANT, "Standard3"],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "Standard2"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 268, 94, "0028", FACING_U, labNPCSandslashInteract],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: FirstVisit
		[MAP_VARIANT, "FirstVisit"],
		[MAP_SCRIPT, 178, 30, 242, 62, interactScriptLabDoor, EVENT_LAB_EXITING_DOOR],
		[MAP_OBJECT, 268, 95, "0028", FACING_U, labNPCSandslashInteract],
		[MAP_OBJECT, -1000, -1000, "DYN_PARTNER", FACING_U, interactError],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "FirstVisit"], 193*2, 422*2, FACING_D],
		
		// variant: Mission1
		[MAP_VARIANT, "Mission1"],
		[MAP_OBJECTCOND, 174, 147, "DYN_PARTNER", FACING_U, interactError, EVENT_LAB_EXPLAINED_MISSION1],
		[MAP_OBJECT, 159, 117, "0028", FACING_D, labSandslashMission1Interact],
		[MAP_SCRIPT, 0, 0, 1000, 1000, interactScriptExplainMission1, EVENT_LAB_EXPLAINED_MISSION1],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "BeforeMission1"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: Mission2
		[MAP_VARIANT, "Mission2"],
		[MAP_OBJECTCOND, 174, 147, "DYN_PARTNER", FACING_U, interactError, EVENT_LAB_EXPLAINED_MISSION2],
		[MAP_OBJECT, 159, 117, "0028", FACING_D, labSandslashMission2Interact],
		[MAP_SCRIPT, 0, 0, 1000, 1000, interactScriptExplainMission2, EVENT_LAB_EXPLAINED_MISSION2],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "Standard1"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: Mission3
		[MAP_VARIANT, "Mission3"],
		[MAP_OBJECTCOND, 174, 147, "DYN_PARTNER", FACING_U, interactError, EVENT_LAB_EXPLAINED_MISSION3],
		[MAP_OBJECT, 159, 117, "0028", FACING_D, labSandslashMission3Interact],
		[MAP_SCRIPT, 0, 0, 1000, 1000, interactScriptExplainMission3, EVENT_LAB_EXPLAINED_MISSION3],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "Standard1"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: Mission4
		[MAP_VARIANT, "Mission4"],
		[MAP_OBJECTCOND, 174, 147, "DYN_PARTNER", FACING_U, interactError, EVENT_LAB_EXPLAINED_MISSION4],
		[MAP_OBJECTCOND, -1000, -1000, "DYN_PARTNER2", FACING_U, interactError, EVENT_LAB_EXPLAINED_MISSION4],
		[MAP_OBJECT, 159, 117, "0028", FACING_D, labSandslashMission4Interact],
		[MAP_SCRIPT, 0, 0, 1000, 1000, interactScriptExplainMission4, EVENT_LAB_EXPLAINED_MISSION4],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "Standard2"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: Mission4Loop
		[MAP_VARIANT, "Mission4Loop"],
		[MAP_OBJECTCOND, 174, 147, "DYN_PARTNER", FACING_U, interactError, EVENT_LAB_EXPLAINED_MISSION4LOOP],
		[MAP_OBJECT, 159, 117, "0028", FACING_D, labSandslashMission4LoopInteract],
		[MAP_SCRIPT, 0, 0, 1000, 1000, interactScriptExplainMission4Loop, EVENT_LAB_EXPLAINED_MISSION4LOOP],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "Standard2"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: Mission5
		[MAP_VARIANT, "Mission5"],
		[MAP_OBJECTCOND, 174, 147, "DYN_PARTNER", FACING_U, interactError, EVENT_LAB_EXPLAINED_MISSION5],
		[MAP_OBJECT, 159, 117, "0028", FACING_D, labSandslashMission5Interact],
		[MAP_SCRIPT, 0, 0, 1000, 1000, interactScriptExplainMission5, EVENT_LAB_EXPLAINED_MISSION5],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "Standard2"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: Mission6
		[MAP_VARIANT, "Mission6"],
		[MAP_OBJECTCOND, 174, 147, "DYN_PARTNER", FACING_U, interactError, EVENT_LAB_EXPLAINED_MISSION6],
		[MAP_OBJECT, 159, 117, "0028", FACING_D, labSandslashMission6Interact],
		[MAP_SCRIPT, 0, 0, 1000, 1000, interactScriptExplainMission6, EVENT_LAB_EXPLAINED_MISSION6],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "Standard2"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: Mission7
		[MAP_VARIANT, "Mission7"],
		[MAP_OBJECTCOND, 174, 147, "DYN_PARTNER", FACING_U, interactError, EVENT_LAB_EXPLAINED_MISSION7],
		[MAP_OBJECT, 159, 117, "0028", FACING_D, labSandslashMission7Interact],
		[MAP_SCRIPT, 0, 0, 1000, 1000, interactScriptExplainMission7, EVENT_LAB_EXPLAINED_MISSION7],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "Standard2"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: Mission8
		[MAP_VARIANT, "Mission8"],
		[MAP_OBJECTCOND, 174, 147, "DYN_PARTNER", FACING_U, interactError, EVENT_LAB_EXPLAINED_MISSION8],
		[MAP_OBJECT, 159, 117, "0028", FACING_D, labSandslashMission8Interact],
		[MAP_SCRIPT, 0, 0, 1000, 1000, interactScriptExplainMission8, EVENT_LAB_EXPLAINED_MISSION8],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "Standard2"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: Mission9
		[MAP_VARIANT, "Mission9"],
		[MAP_OBJECTCOND, 174, 147, "DYN_PARTNER", FACING_U, interactError, EVENT_LAB_EXPLAINED_MISSION9],
		[MAP_OBJECT, 159, 117, "0028", FACING_D, labSandslashMission9Interact],
		[MAP_SCRIPT, 0, 0, 1000, 1000, interactScriptExplainMission9, EVENT_LAB_EXPLAINED_MISSION9],
		[MAP_LOADZONE, 108, 211, 208, 248, ["Town", "Standard2"], 193*2, 422*2, FACING_D],
		[MAP_OBJECT, 196, 50, "NullSprite", FACING_D, interactBasicScripting],
		[MAP_OBJECT, 215, 50, "NullSprite", FACING_D, interactBasicScripting],
		
		// variant: MissionL
		[MAP_VARIANT, "MissionL"],
		[MAP_OBJECTCOND, 174, 147, "DYN_PARTNER", FACING_U, interactError, EVENT_LAB_EXPLAINED_MISSIONL],
		[MAP_OBJECT, 159, 117, "0028", FACING_D, interactError],
		[MAP_SCRIPT, 0, 0, 1000, 1000, interactScriptExplainMissionL, EVENT_LAB_EXPLAINED_MISSIONL],
	],
	"Town": [
		[MAP_OBJECT, 79, 462, "0155", FACING_R, townCyndaquilInteract],
		[MAP_OBJECT, 105, 462, "0258", FACING_L, townMudkipInteract],
		[MAP_OBJECT, 289, 383, "0123", FACING_U, townScytherInteract],
		[MAP_OBJECT, 753, 355, "0183", FACING_D, townMarillInteract],
		[MAP_MUSICID, 6],
		
		// variant: FirstVisit
		[MAP_VARIANT, "FirstVisit"],
		[MAP_LOADZONE, 170, 378, 215, 399, ["Lab", "Standard1"], 159*2, 190*2, FACING_U],
		[MAP_LOADZONE, 818, 376, 882, 409, ["House", "FirstVisit"], 162*2, 206*2, FACING_U],
		[MAP_OBJECT, 523, 366, "0352", FACING_DR, townKecleonInteract],
		[MAP_OBJECTCOND, 850, 455, "DYN_PARTNER", FACING_L, interactError, EVENT_MET_PARTNER_FRONT_OF_HOUSE],
		[MAP_SCRIPT, 805, 356, 900, 600, townPartnerFirstVisitScript1, EVENT_MET_PARTNER_FRONT_OF_HOUSE],
		
		[MAP_VARIANT, "BeforeMission1"],
		[MAP_LOADZONE, 170, 378, 215, 399, ["Lab", "Mission1"], 159*2, 190*2, FACING_U],
		[MAP_LOADZONE, 818, 376, 882, 409, ["House", "BeforeMission1"], 162*2, 206*2, FACING_U],
		[MAP_OBJECT, 523, 366, "0352", FACING_DR, townKecleonShopInteract],
		[MAP_SCRIPT, 1031, 414, 1060, 550, interactDungeonWarpZone1, EVENT_ALWAYS],
		[MAP_OBJECT, 980, 432, "DYN_PARTNER", FACING_DR, interactPartnerBeforeMission1],
		
		[MAP_VARIANT, "Standard1"],
		[MAP_LOADZONE, 170, 378, 215, 399, ["Lab", "Standard2"], 159*2, 190*2, FACING_U],
		[MAP_LOADZONE, 818, 376, 882, 409, ["House", "Standard1"], 162*2, 206*2, FACING_U],
		[MAP_OBJECT, 523, 366, "0352", FACING_DR, townKecleonShopInteract],
		[MAP_SCRIPT, 1031, 414, 1060, 550, interactDungeonWarpZone1, EVENT_ALWAYS],
		
		[MAP_VARIANT, "Standard2"],
		[MAP_LOADZONE, 170, 378, 215, 399, ["Lab", "Standard3"], 159*2, 190*2, FACING_U],
		[MAP_LOADZONE, 818, 376, 882, 409, ["House", "Standard2"], 162*2, 206*2, FACING_U],
		[MAP_OBJECT, 523, 366, "0352", FACING_DR, townKecleonShopInteract],
		[MAP_OBJECT, 684, 200, "DYN_PARTNER2", FACING_DL, townPartnerDungeonEntry],
		[MAP_SCRIPT, 1031, 414, 1060, 550, interactDungeonWarpZone1, EVENT_ALWAYS]
	],
	"House": [
		[MAP_MUSICID, 6],
		
		[MAP_VARIANT, "FirstVisit"],
		[MAP_LOADZONE, 136, 218, 189, 239, ["Town", "FirstVisit"], 850*2, 424*2, FACING_D],
		[MAP_OBJECT, 57, 111, "DYN_PARTNER", FACING_D, interactPartnerStartMission1],
		
		[MAP_VARIANT, "BeforeMission1"],
		[MAP_LOADZONE, 136, 218, 189, 239, ["Town", "BeforeMission1"], 850*2, 424*2, FACING_D],
		
		[MAP_VARIANT, "Standard1"],
		[MAP_LOADZONE, 136, 218, 189, 239, ["Town", "Standard1"], 850*2, 424*2, FACING_D],
		[MAP_OBJECT, 57, 111, "DYN_PARTNER", FACING_D, interactPartnerTacticalMeeting],
		
		[MAP_VARIANT, "Standard2"],
		[MAP_LOADZONE, 136, 218, 189, 239, ["Town", "Standard2"], 850*2, 424*2, FACING_D],
		[MAP_OBJECT, 57, 111, "DYN_PARTNER", FACING_D, interactPartnerTacticalMeeting],
	],
	"SereneEnd": [
		[MAP_MUSICID, 8],
		[MAP_OBJECT, 156+15, 220, "DYN_PARTNER", FACING_U, interactError],
		
		[MAP_VARIANT, "Mission1"],
		[MAP_SCRIPT, 0, 0, 999, 999, dungeonSereneEndScript1, EVENT_ALWAYS],
		
		[MAP_VARIANT, "Mission2"],
		[MAP_SCRIPT, 0, 0, 999, 999, sereneForestClearingRevisitLore1, EVENT_ALWAYS],
	],
	"SereneGDEnd": [
		[MAP_MUSICID, 8],
		
		[MAP_VARIANT, "Encounter"],
		[MAP_SCRIPT, 0, 0, 999, 999, sereneGlitchDimension_Encounter, EVENT_ALWAYS],
		[MAP_OBJECT, 156+15, 220, "DYN_PARTNER", FACING_U, interactError],
		[MAP_OBJECT, -1000, -1000, "0115", FACING_D, interactError],
		
		[MAP_VARIANT, "EncounterFinished"],
		[MAP_SCRIPT, 0, 0, 999, 999, sereneGlitchDimension_Encounter2, EVENT_ALWAYS],
		[MAP_OBJECT, 156+15, 128, "DYN_PARTNER", FACING_U, interactError]
	],
	"GlacierEnd": [
		[MAP_MUSICID, 8],
		
		[MAP_VARIANT, "First"],
		[MAP_SCRIPT, 0, 0, 999, 999, crystalGlacier_FirstLore, EVENT_ALWAYS],
		[MAP_OBJECT, 156+15, 220, "DYN_PARTNER", FACING_U, interactError],
		
		[MAP_VARIANT, "Return"],
		[MAP_SCRIPT, 0, 0, 999, 999, crystalGlacier_ReturnLore, EVENT_ALWAYS],
		[MAP_OBJECT, 156+15, 160, "DYN_PARTNER2", FACING_U, interactError],
		[MAP_OBJECT, 156-15, 160, "DYN_PARTNER", FACING_U, interactError],
	],
	"GlacierGDSafeRoom": [
		[MAP_MUSICID, 15],
		
		[MAP_PART, MapPartSaveStatue, 160, 120],
		[MAP_OBJECT, 160, 120, "NullSprite", FACING_D, interactSaveStatue],
		[MAP_OBJECT, 160, 126, "NullSprite", FACING_D, interactSaveStatue],
		[MAP_OBJECT, 259, 50, "DYN_PARTNER2", FACING_DL, interactSaveRoomPartner2],
		[MAP_OBJECT, 56, 50, "DYN_PARTNER", FACING_DR, interactSaveRoomPartner],
		[MAP_SCRIPT, 0, 220, 999, 240, interactGoBackToTown, EVENT_ALWAYS],
		[MAP_SCRIPT, 0, 0, 999, 20, mysticGD_GoOn, EVENT_ALWAYS],
	],
	"GlacierGDBossRoom": [
		[MAP_MUSICID, 15],
		
		[MAP_VARIANT, "Bepis"],
		[MAP_SCRIPT, 0, 0, 999, 999, mysticGD_BeforeBoss, EVENT_ALWAYS],
		[MAP_OBJECT, 156+15, 160, "DYN_PARTNER2", FACING_U, interactError],
		[MAP_OBJECT, 156-15, 160, "DYN_PARTNER", FACING_U, interactError],
		[MAP_OBJECT, -1000, -1000, "0144", FACING_D, interactError],
		
		[MAP_VARIANT, "EncounterFinished"],
		[MAP_SCRIPT, 0, 0, 999, 999, mysticGD_AfterBoss, EVENT_ALWAYS],
		[MAP_OBJECT, 156+15, 160, "DYN_PARTNER2", FACING_U, interactError],
		[MAP_OBJECT, 156-15, 160, "DYN_PARTNER", FACING_U, interactError],
		[MAP_OBJECT, 156, 80, "0144", FACING_D, interactError],
	],
	"EvoChamber": [
		[MAP_MUSICID, 15],
		
		[MAP_VARIANT, "Main"],
		[MAP_OBJECT, 160, 220, "0001", FACING_U, interactError],
		[MAP_SCRIPT, -2000, -2000, 2000, 2000, evoCave_Script, EVENT_ALWAYS],
		[MAP_PART, MapPartEvoChamber, 0, 0],
	],
	"LabyrinthEnd": [
		[MAP_MUSICID, 8],
		
		[MAP_VARIANT, "First"],
		[MAP_SCRIPT, 0, 0, 999, 999, lavaLabyrinth_FirstLore, EVENT_ALWAYS],
		[MAP_OBJECT, 156+15, 160, "DYN_PARTNER2", FACING_U, interactError],
		[MAP_OBJECT, 156-15, 160, "DYN_PARTNER", FACING_U, interactError],
		
		[MAP_VARIANT, "Return"],
		[MAP_SCRIPT, 0, 0, 999, 999, lavaLabyrinth_ReturnLore, EVENT_ALWAYS],
		[MAP_OBJECT, 156+15, 160, "DYN_PARTNER2", FACING_U, interactError],
		[MAP_OBJECT, 156-15, 160, "DYN_PARTNER", FACING_U, interactError],
	],
	"LabyrinthSafeRoom": [
		[MAP_MUSICID, 15],
		
		[MAP_PART, MapPartSaveStatue, 160, 120],
		[MAP_OBJECT, 160, 120, "NullSprite", FACING_D, interactSaveStatue],
		[MAP_OBJECT, 160, 126, "NullSprite", FACING_D, interactSaveStatue],
		[MAP_OBJECT, 259, 50, "DYN_PARTNER2", FACING_DL, interactSaveRoomPartner2],
		[MAP_OBJECT, 56, 50, "DYN_PARTNER", FACING_DR, interactSaveRoomPartner],
		[MAP_SCRIPT, 0, 220, 999, 240, interactGoBackToTown, EVENT_ALWAYS],
		[MAP_SCRIPT, 0, 0, 999, 20, labyrinthGD_GoOn, EVENT_ALWAYS],
	],
	"LabyrinthGDBossRoom": [
		[MAP_MUSICID, 15],
		
		[MAP_VARIANT, "Bepis"],
		[MAP_SCRIPT, 0, 0, 999, 999, labyrinthGD_BeforeBoss, EVENT_ALWAYS],
		[MAP_OBJECT, 156+15, 160, "DYN_PARTNER2", FACING_U, interactError],
		[MAP_OBJECT, 156-15, 160, "DYN_PARTNER", FACING_U, interactError],
		[MAP_OBJECT, -1000, -1000, "0146", FACING_D, interactError],
		
		[MAP_VARIANT, "EncounterFinished"],
		[MAP_SCRIPT, 0, 0, 999, 999, labyrinthGD_AfterBoss, EVENT_ALWAYS],
		[MAP_OBJECT, 156+15, 160, "DYN_PARTNER2", FACING_U, interactError],
		[MAP_OBJECT, 156-15, 160, "DYN_PARTNER", FACING_U, interactError],
		[MAP_OBJECT, 156, 80, "0146", FACING_D, interactError],
	],
	"KeepSafeRoom": [
		[MAP_MUSICID, 15],
		
		[MAP_PART, MapPartSaveStatue, 160, 120],
		[MAP_OBJECT, 160, 120, "NullSprite", FACING_D, interactSaveStatue],
		[MAP_OBJECT, 160, 126, "NullSprite", FACING_D, interactSaveStatue],
		[MAP_OBJECT, 259, 50, "DYN_PARTNER2", FACING_DL, interactSaveRoomPartner2],
		[MAP_OBJECT, 56, 50, "DYN_PARTNER", FACING_DR, interactSaveRoomPartner],
		[MAP_SCRIPT, 0, 220, 999, 240, interactGoBackToTown2, EVENT_ALWAYS],
		[MAP_SCRIPT, 0, 0, 999, 20, keepGD_GoOn, EVENT_ALWAYS],
	],
	"KeepBossRoom": [
		[MAP_MUSICID, 15],
		
		[MAP_VARIANT, "Bepis"],
		[MAP_SCRIPT, 0, 0, 999, 999, keepGD_BeforeBoss, EVENT_ALWAYS],
		[MAP_OBJECT, 156+15, 160, "DYN_PARTNER2", FACING_U, interactError],
		[MAP_OBJECT, 156-15, 160, "DYN_PARTNER", FACING_U, interactError],
		[MAP_OBJECT, -1000, -1000, "0145", FACING_D, interactError],
		
		[MAP_VARIANT, "EncounterFinished"],
		[MAP_SCRIPT, 0, 0, 999, 999, keepGD_AfterBoss, EVENT_ALWAYS],
		[MAP_OBJECT, 156+15, 160, "DYN_PARTNER2", FACING_U, interactError],
		[MAP_OBJECT, 156-15, 160, "DYN_PARTNER", FACING_U, interactError],
		[MAP_OBJECT, 156, 80, "0145", FACING_D, interactError],
	],
	"Dream": [
		[MAP_SCRIPT, -999, -999, 999, 999, dreamSequence, EVENT_ALWAYS],
		[MAP_OBJECT, 160, 120, "0001", FACING_D, interactError],
		[MAP_PART, MapPartDreamSequence, 0, 0],
	],
	"AbyssPre": [
		[MAP_MUSICID, 25],
		[MAP_SCRIPT, -999, -999, 999, 999, dreamSequence2, EVENT_ABYSSPRE_INTRO],
		[MAP_PART, MapPartSaveStatue, 268, 88],
		[MAP_OBJECT, 268, 88, "NullSprite", FACING_D, interactSaveStatue],
		[MAP_OBJECT, 268, 88+6, "NullSprite", FACING_D, interactSaveStatue],
		[MAP_OBJECT, 73, 66, "DYN_PARTNER2", FACING_DR, interactSaveRoomPartner2],
		[MAP_OBJECT, 210, 80, "DYN_PARTNER", FACING_DL, interactSaveRoomPartner],
		[MAP_SCRIPT, 0, 0, 999, 20, abyssPre_GoOn, EVENT_ALWAYS],
	],
	"AbyssPost": [
		[MAP_MUSICID, 15],
		[MAP_SCRIPT, -999, -999, 999, 999, dreamSequence3, EVENT_ABYSSPRE_INTRO2],
		[MAP_PART, MapPartSaveStatue, 243, 45],
		[MAP_OBJECT, 243, 45, "NullSprite", FACING_D, interactSaveStatue],
		[MAP_OBJECT, 243, 45+6, "NullSprite", FACING_D, interactSaveStatue],
		[MAP_OBJECT, 160-15, 154, "DYN_PARTNER", FACING_U, interactSaveRoomPartner],
		[MAP_OBJECT, 160+15, 154, "DYN_PARTNER2", FACING_U, interactSaveRoomPartner2],
		[MAP_OBJECT, 61, 61, "0352", FACING_DR, glitchKecleonInteract],
		[MAP_SCRIPT, 0, 0, 999, 20, abyssPost_GoOn, EVENT_ALWAYS],
		
		[MAP_VARIANT, "Returnable"],
		[MAP_SCRIPT, 0, 220, 999, 240, interactGoBackToTown, EVENT_ALWAYS],
	],
	"AbyssBossRoom": [
		[MAP_MUSICID, 26],
		
		[MAP_VARIANT, "Bepis"],
		[MAP_PART, MapPartMissingno, 0, 0],
		[MAP_OBJECT, 160+15, 520, "DYN_PARTNER2", FACING_U, interactError],
		[MAP_OBJECT, 160-15, 520, "DYN_PARTNER", FACING_U, interactError],
		[MAP_SCRIPT, 0, 0, 1999, 1999, abyss_BeforeBoss, EVENT_ALWAYS],
		
		[MAP_VARIANT, "EncounterFinished"],
		[MAP_SCRIPT, 0, 0, 1999, 1999, abyss_AfterBoss, EVENT_ALWAYS],
		[MAP_OBJECT, 160+15, 150, "DYN_PARTNER2", FACING_U, interactError],
		[MAP_OBJECT, 160-15, 150, "DYN_PARTNER", FACING_U, interactError],
	]
};
global.mapNames = {
	"Lab": "Glitch Research Laboratory",
	"Town": "Glitchtopia Southern District",
	"House": "Home Sweet Home",
	"GlacierGDSafeRoom": "Safe Room: Glacier Glitch Dimension",
	"LabyrinthSafeRoom": "Safe Room: Labyrinth Glitch Dimension",
	"KeepSafeRoom": "Safe Room: Keep Glitch Dimension",
	"AbyssPre": "Unending Abyss Entrance",
	"AbyssPost": "Unending Abyss"
}

global.backTextbox = noone;
global.curDungeonId = 0;
global.dungeonCurrentDiscoveredTiles = [];

global.turnCounter = 0;
global.battleWarpMap = "";
global.battleWarpVariant = "";

global.onlineAuthKey = "NULL";
global.onlineAuto1 = "<!AK1>";
global.onlineAuto2 = "<!AK2>"; 

#macro API_URL "https://fools2024.online/"

MusicController.persistent = true;
if (instance_exists(DebugController)) {
	DebugController.persistent = true;
}

global.currentWindowWidth = 640;
global.recomputeBaseEncryptionHashKey = "";

loadGameDefaultVars();

draw_set_valign(fa_top);
draw_set_halign(fa_left);

room_goto(IntroRoom);