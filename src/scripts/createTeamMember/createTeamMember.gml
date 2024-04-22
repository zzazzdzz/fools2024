
function createTeamMember(spec){
	var finalResult = 0;
	var base = {
		name: "bepis",
		curHP: 60,
		maxHP: 60,
		curPP: 40,
		maxPP: 40,
		species: "0004",
		moves: [1],
		items: [],
		att: 23,
		sp_att: 23,
		def: 20,
		sp_def: 20,
		types: ["fire"],
		lv: 5,
		xp: 250, xp_rate: 0,
		stance: 0
	};
	if (spec == "0007") finalResult = 1;
	if (spec == "0001") finalResult = 2;
	var speciesIds = ["0004","0007","0001"];
	var typeNames = ["fire","water","grass"];
	var rates = [1,0,2];
	
	base.species = speciesIds[finalResult];
	base.types = [typeNames[finalResult]];
	base.moves = [finalResult == 0 ? 2 : 1];
	base.xp_rate = rates[finalResult];
	return base;
}