if (st == 1) exit;
st = 1;

safeguardBegin("ml", array_length(global.teamMembers));
for (var i=0; i<array_length(global.teamMembers); i++) {
	safeguardBegin("m" + string(i) + "ch", global.teamMembers[i].curHP);
	safeguardBegin("m" + string(i) + "mh", global.teamMembers[i].maxHP);
	safeguardBegin("m" + string(i) + "cp", global.teamMembers[i].curPP);
	safeguardBegin("m" + string(i) + "mp", global.teamMembers[i].maxPP);
	safeguardBegin("m" + string(i) + "a", global.teamMembers[i].att);
	safeguardBegin("m" + string(i) + "sa", global.teamMembers[i].sp_att);
	safeguardBegin("m" + string(i) + "d", global.teamMembers[i].def);
	safeguardBegin("m" + string(i) + "sd", global.teamMembers[i].sp_def);
	safeguardBegin("m" + string(i) + "x", global.teamMembers[i].xp);
	safeguardBeginEach("m" + string(i) + "m", global.teamMembers[i].moves);
	safeguardBeginEach("m" + string(i) + "i", global.teamMembers[i].items);
}
safeguardBegin("tc", global.turnCounter);
safeguardBegin("gm", global.money);
safeguardBegin("om", global.overworldCurMap);
safeguardBegin("ov", global.overworldCurVariant);
safeguardBegin("bm", global.battleWarpMap);
safeguardBegin("bv", global.battleWarpVariant);
safeguardBegin("sm", global.overworldSourceMap);
safeguardBegin("sv", global.overworldSourceVariant);
safeguardBegin("cd", global.curDungeonId);