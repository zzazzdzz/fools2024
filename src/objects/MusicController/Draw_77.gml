if (st == 0) exit;
st = 0;

safeguardEnd("ml", array_length(global.teamMembers));
for (var i=0; i<array_length(global.teamMembers); i++) {
	safeguardEnd("m" + string(i) + "ch", global.teamMembers[i].curHP);
	safeguardEnd("m" + string(i) + "mh", global.teamMembers[i].maxHP);
	safeguardEnd("m" + string(i) + "cp", global.teamMembers[i].curPP);
	safeguardEnd("m" + string(i) + "mp", global.teamMembers[i].maxPP);
	safeguardEnd("m" + string(i) + "a", global.teamMembers[i].att);
	safeguardEnd("m" + string(i) + "sa", global.teamMembers[i].sp_att);
	safeguardEnd("m" + string(i) + "d", global.teamMembers[i].def);
	safeguardEnd("m" + string(i) + "sd", global.teamMembers[i].sp_def);
	safeguardEnd("m" + string(i) + "x", global.teamMembers[i].xp);
	safeguardEndEach("m" + string(i) + "m", global.teamMembers[i].moves);
	safeguardEndEach("m" + string(i) + "i", global.teamMembers[i].items);
}
safeguardEnd("tc", global.turnCounter);
safeguardEnd("gm", global.money);
safeguardEnd("om", global.overworldCurMap);
safeguardEnd("ov", global.overworldCurVariant);
safeguardEnd("bm", global.battleWarpMap);
safeguardEnd("bv", global.battleWarpVariant);
safeguardEnd("sm", global.overworldSourceMap);
safeguardEnd("sv", global.overworldSourceVariant);
safeguardEnd("cd", global.curDungeonId);
