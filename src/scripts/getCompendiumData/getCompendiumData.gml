// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getCompendiumData(){
	var specList = [
		"0011","0165","0048","0069","0049","0021","0022","0034","0115",
		"0221","0162","0361","0086","0288","0335","0076","0232","0330",
		"0057","0068","0225","0238","0124","0473","0471","0262","0168",
		"0371","0447","0105","0531","0078","0219","0136","0256","0093",
		"0094","0356","0472","0200","0151","0309","0310","0405","0125",
		"0181","0000","0126","0112","0205"
	];
	var bossList = [
		"0115", "0144", "0146", "0145", "0151", "NullSprite"
	];
	var compFound = 0;
	var compMax = 0;
	for (var i=0; i<array_length(specList); i++) {
		compMax += 1;
		if (variable_struct_exists(global.compendiumData, "m"+specList[i])) compFound += 1;
	}
	for (var i=0; i<array_length(bossList); i++) {
		if (bossList[i] == "0151") continue;
		compMax += 1;
		if (variable_struct_exists(global.compendiumData, "m"+bossList[i])) compFound += 1;
	}
	global.completedDuties = compFound;
	return [specList, bossList, compFound, compMax];
}