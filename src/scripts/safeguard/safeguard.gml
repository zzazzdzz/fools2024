
function safeguard(){}

function safeguardBegin(ind, value){
	var valueNum = value;
	if (is_string(value)) valueNum = string_length(value); 
	var idxV = "q" + string(int64(id)) + "_" + ind;
	if (!variable_struct_exists(global.safeguardData, idxV)) return;
	var idxK = "k" + string(int64(id)) + "_" + ind;
	var indHash = variable_struct_get(global.safeguardData, idxK);
	var r = variable_struct_get(global.safeguardData, idxV);
	if (r != valueNum ^ indHash ^ global.safeguardDeterminant) {
		if (ENABLE_ANTICHEAT) {
			show_debug_message(ind);
			room_goto(IrregularityRoom);
		}
	}
}

function safeguardBeginEach(ind, arr){
	var l = array_length(arr);
	safeguardBegin(ind + "L", l);
	for (var i=0; i<l; i++) {
		if (is_array(arr[i])) {
			safeguardBeginEach(ind + "X" + string(i) + "_", arr[i]);
		} else {
			safeguardBegin(ind + "X" + string(i), arr[i]);
		}
	}
}

function safeguardEnd(ind, value){
	var valueNum = value;
	if (is_string(value)) valueNum = string_length(value); 
	var idxV = "q" + string(int64(id)) + "_" + ind;
	var idxK = "k" + string(int64(id)) + "_" + ind;
	var indHash = irandom_range(1,0x7fffffff);
	variable_struct_set(global.safeguardData, idxK, indHash);
	variable_struct_set(global.safeguardData, idxV, valueNum ^ indHash ^ global.safeguardDeterminant);
}

function safeguardEndEach(ind, arr){
	var l = array_length(arr);
	safeguardEnd(ind + "L", l);
	for (var i=0; i<l; i++) {
		if (is_array(arr[i])) {
			safeguardEndEach(ind + "X" + string(i) + "_", arr[i]);
		} else {
			safeguardEnd(ind + "X" + string(i), arr[i]);
		}
	}
}