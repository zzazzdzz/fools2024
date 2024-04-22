if (global.recomputeBaseEncryptionHashKey != "e5bbb37aa887157f28ec7914937257c2") {
	instance_destroy();
	exit;
}

persistent = true;

alarm[0] = 1;

alwaysHighroll = false;

goto = false;
selection = 0;
pg = 0;
