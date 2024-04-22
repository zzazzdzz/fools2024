/// @description perform animation in animIndex

if (animIndex == "Hurt" && animSpriteSetIndex == "NullSprite") {
	BattlePartMissingno.hurt = 15;
	exit;	
}

animDurOffs = 0;
animLen = 0;
animStartIndex = 0;
animCurIndex = 0;
animFrameCounter = 0;

// preprocess animation data array
var i = 2;

while (animData[i] != "#") {
	if (animData[i] == animIndex) {
		animStartIndex = animData[i+1];
		animLen = animData[i+2];
		animCurIndex = 0;
		animDurOffs += animData[1];
		animFrameCounter = max(1, round(animData[animDurOffs] * animSpeed));
		break;
	} else {
		animDurOffs += animData[i+2];
	}
	i += 3;
}
if (animData[i] == "#") {
	show_debug_message("couldn't load animation " + animIndex + " for spriteset " + animSpriteSetIndex + ". things might get fucky wucky"); 
}

animIdleAfterEndFrame = 1;