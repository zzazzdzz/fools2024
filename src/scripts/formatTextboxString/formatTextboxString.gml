// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function formatTextboxString(x){
	// trim the beginning and end
	for (var i=0; i<30; i++) {
		while (string_char_at(x, 1) == "\n") x = string_delete(x, 1, 1);
		while (string_char_at(x, 1) == "\r") x = string_delete(x, 1, 1);
		while (string_char_at(x, 1) == "\t") x = string_delete(x, 1, 1);
		while (string_char_at(x, string_length(x)) == "\n") x = string_delete(x, string_length(x), 1);
		while (string_char_at(x, string_length(x)) == "\r") x = string_delete(x, string_length(x), 1);
		while (string_char_at(x, string_length(x)) == "\t") x = string_delete(x, string_length(x), 1);
	}
	// double newlines are full line feeds
	for (var i=0; i<30; i++) {
		// dirty workaround
		x = string_replace(x, "~\n", "<~");
		x = string_replace(x, "~\r\n", "<~");
		x = string_replace(x, "\n\n", "<@");
		x = string_replace(x, "\r\n\r\n", "<@");
	}
	var names = [];
	for (var i=0; i<array_length(global.teamMembers); i++) array_push(names, global.teamMembers[i].name);
	array_push(names, "Bepis1");
	array_push(names, "Bepis2");
	array_push(names, "Bepis3");
	x = string_replace(x, "{PLAYER}", "\\c33" + names[0] + "\\c30");
	x = string_replace(x, "{HERO2}", "\\c33" + names[1] + "\\c30");
	x = string_replace(x, "{HERO3}", "\\c33" + names[2] + "\\c30");
	x = string_replace(x, "{TEAM0}", "\\c33" + names[0] + "\\c30");
	x = string_replace(x, "{TEAM1}", "\\c36" + names[1] + "\\c30");
	x = string_replace(x, "{TEAM2}", "\\c36" + names[2] + "\\c30");
	x = string_replace(x, "{PARTNER}", "\\c36" + global.partnerName + "\\c30");
	x = string_replace(x, "{PARTNER2}", "\\c36" + global.partnerNameSecondary + "\\c30");
	return x;
}