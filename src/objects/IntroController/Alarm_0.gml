global.recomputeBaseEncryptionHashKey = md5_string_utf8("h934 mdc Z0w" + keyboard_string);
if (global.recomputeBaseEncryptionHashKey == "e5bbb37aa887157f28ec7914937257c2") {
	var ii = instance_create(DebugController, 0, 0);
}

if (file_exists(working_directory + "savefile")) {
	room_goto(LoadGameRoom);
} else {
	room_goto(PersonalityTest);
}