
function unhex(v){
	var tbl, pow, _i, len, res;
	tbl = "0123456789abcdef";
	pow = 1;
	len = string_length(v);
	res = 0;
	for (_i=len-1; _i>=0; _i-=1){
	    res += pow * (string_pos(string_char_at(v, _i+1), tbl)-1);
	    pow *= 16;
	}
	return res;
}

function hex(v) {
    var dec = argument[0],
    var len = (argument_count > 1) ? argument[1] : 1,
    var hex = "";
    if (dec < 0) {
        len = max(len, ceil(logn(16, 2*abs(dec))));
    }
    var dig = "0123456789ABCDEF";
    while (len-- || dec) {
        hex = string_char_at(dig, (dec & $F) + 1) + hex;
        dec = dec >> 4;
    }
    return hex;
}