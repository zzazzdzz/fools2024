function consistentRandom(p1, p2, p3){
	var md = md5_string_utf8(string(p1) + "x0Eo3" + string(p2) + "oLz7n" + string(p3));
	return unhex(string_copy(md, 1, 4));
}

function consistentRandomFlag(p1, p2, p3, bit) {
	var v = consistentRandom(p1, p2, p3);
	return (v & (1 << bit)) != 0;
}