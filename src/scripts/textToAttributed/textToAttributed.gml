// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function textToAttributed(tx){
	var len = string_length(tx);
	var out = "";
	var attr = " ";
	for (var i=1; i<=len; i++) {
		var cur = string_char_at(tx, i);
		if (cur == "#") cur = "\n";
		if (cur == "@") {
			attr = string_char_at(tx, i+1);
			i++;
			continue;
		}
		out += attr + cur;
	}
	return out;
}

function textConvertNewlines(tx){
	var len = string_length(tx);
	var out = "";
	for (var i=1; i<=len; i++) {
		var cur = string_char_at(tx, i);
		if (cur == "#") cur = "\n";
		out += cur;
	}
	return out;
}

function textClearAttr(tx) {
	var len = string_length(tx);
	var out = "";
	for (var i=1; i<=len; i++) {
		var cur = string_char_at(tx, i);
		if (cur == "@") {
			i+=1;
			continue;
		}
		out += cur;
	}
	return out;
}

function textUnattr(tx) {
	var len = string_length(tx);
	var out = "";
	for (var i=2; i<=len; i+=2) {
		var cur = string_char_at(tx, i);
		out += cur;
	}
	return out;
}