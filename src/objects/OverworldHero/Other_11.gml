/// @description change spriteset to animSpriteSetIndex

var i = 0;

while (true) {
	if (global.animDb[i][0] == animSpriteSetIndex) {
		spriteSet = asset_get_index("SpriteSet" + animSpriteSetIndex);
		animData = global.animDb[i];
		break;
	}
	i += 1;
}

animIndex = "Idle";
event_user(0);