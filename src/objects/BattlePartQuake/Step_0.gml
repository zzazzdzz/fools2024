var c = ctr mod 4;
if (c == 0) BattleBackgroundController.xoffs = -8;
if (c == 2) BattleBackgroundController.xoffs = 8;
if (ctr > ctrlim) {
	BattleBackgroundController.xoffs = 0;
	instance_destroy();
}
ctr += 1;