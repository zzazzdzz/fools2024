// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dungeonDataBanks(){}

function dungeonDataFinal() {
	var encInfo = [
		{
			scripts: [aiGlitchLord, aiBattleFinalClear, aiInitGlitchLord, aiNull],
			adversaries: [
				{
					species: "NullSprite",
					name: "The Glitch Lord",
					maxHP: 8000,
					att: 100, def: 60, types: ["normal"],
					lv: 50, expRate: 100
				}
			],
			tilemap: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 6, 9, 9, 9, 9, 9, 32, 1, 1, 1, 1,
            1, 6, 9, 9, 10, 63, 63, 63, 63, 63, 8, 9, 9, 32, 1,
            6, 10, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 8, 32,
            10, 63, 63, 63, 62, 63, 63, 63, 63, 106, 63, 63, 63, 63, 8,
            63, 63, 63, 63, 63, 62, 63, 108, 63, 64, 63, 63, 63, 63, 63,
            63, 63, 108, 63, 63, 63, 63, 63, 63, 64, 63, 63, 63, 63, 63,
            63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 108, 63]
		},
		{
			scripts: [aiGlitchLord2, aiBattleFinalClear, aiInitGlitchLord2, aiNull],
			adversaries: [
				{
					species: "NullSprite",
					name: "The Glitch Lord",
					maxHP: 8000,
					att: 100, def: 60, types: ["normal"],
					lv: 50, expRate: 100
				}
			],
			tilemap: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 6, 9, 9, 9, 9, 9, 32, 1, 1, 1, 1,
            1, 6, 9, 9, 10, 63, 63, 63, 63, 63, 8, 9, 9, 32, 1,
            6, 10, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 8, 32,
            10, 63, 63, 63, 62, 63, 63, 63, 63, 106, 63, 63, 63, 63, 8,
            63, 63, 63, 63, 63, 62, 63, 108, 63, 64, 63, 63, 63, 63, 63,
            63, 63, 108, 63, 63, 63, 63, 63, 63, 64, 63, 63, 63, 63, 63,
            63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 108, 63]
		}
	];
	return [[], [], encInfo, chunkScriptDummyOnLoad];
}

function dungeonDataAbyss() {
	var encInfo = [
		{
			scripts: [aiAbyss1, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0076",
					name: "Golem",
					maxHP: 246,
					att: 57, def: 59, types: ["rock"],
					lv: 29, expRate: 45
				},
				{
					species: "0000",
					name: "??????????",
					maxHP: 216,
					att: 95, def: 45, types: ["normal"],
					lv: 30, expRate: 40
				},
				{
					species: "0126",
					name: "Magmar",
					maxHP: 231,
					att: 58, def: 60, types: ["fire"],
					lv: 29, expRate: 45
				}
			],
			tilemap: [6, 6, 4, 62, 63, 63, 63, 108, 63, 63, 64, 64, 2, 6, 6,
            6, 31, 10, 63, 63, 63, 63, 63, 63, 63, 64, 64, 5, 54, 6,
            6, 7, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 8, 6, 6,
            6, 7, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 5, 6,
            6, 7, 62, 63, 63, 63, 63, 63, 63, 63, 63, 106, 63, 5, 6,
            6, 33, 4, 62, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 6, 7, 62, 63, 63, 63, 107, 63, 63, 63, 63, 67, 5, 6,
            6, 51, 7, 62, 63, 63, 63, 63, 63, 63, 63, 64, 2, 34, 6,
            6, 31, 10, 63, 63, 63, 63, 63, 63, 63, 63, 63, 8, 6, 6,
            6, 7, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 5, 6]
		},
		{
			scripts: [aiAbyss2, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0112",
					name: "Rhydon",
					maxHP: 473,
					att: 60, def: 68, types: ["ground", "rock"],
					lv: 32, expRate: 50
				},
				{
					species: "0115",
					name: "Kangaskhan",
					maxHP: 491,
					att: 60, def: 68, types: ["normal"],
					lv: 32, expRate: 50
				},
			],
			tilemap: [6, 6, 4, 62, 63, 63, 63, 108, 63, 63, 64, 64, 2, 6, 6,
            6, 31, 10, 63, 63, 63, 63, 63, 63, 63, 64, 64, 5, 54, 6,
            6, 7, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 8, 6, 6,
            6, 7, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 5, 6,
            6, 7, 62, 63, 63, 63, 63, 63, 63, 63, 63, 106, 63, 5, 6,
            6, 33, 4, 62, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 6, 7, 62, 63, 63, 63, 107, 63, 63, 63, 63, 67, 5, 6,
            6, 51, 7, 62, 63, 63, 63, 63, 63, 63, 63, 64, 2, 34, 6,
            6, 31, 10, 63, 63, 63, 63, 63, 63, 63, 63, 63, 8, 6, 6,
            6, 7, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 5, 6]
		},
		{
			scripts: [aiAbyss3, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0205",
					name: "Ilsty",
					maxHP: 492,
					att: 60, def: 68, types: ["bug", "steel"],
					lv: 33, expRate: 50
				},
			],
			tilemap: [6, 6, 4, 62, 63, 63, 63, 108, 63, 63, 64, 64, 2, 6, 6,
            6, 31, 10, 63, 63, 63, 63, 63, 63, 63, 64, 64, 5, 54, 6,
            6, 7, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 8, 6, 6,
            6, 7, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 5, 6,
            6, 7, 62, 63, 63, 63, 63, 63, 63, 63, 63, 106, 63, 5, 6,
            6, 33, 4, 62, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 6, 7, 62, 63, 63, 63, 107, 63, 63, 63, 63, 67, 5, 6,
            6, 51, 7, 62, 63, 63, 63, 63, 63, 63, 63, 64, 2, 34, 6,
            6, 31, 10, 63, 63, 63, 63, 63, 63, 63, 63, 63, 8, 6, 6,
            6, 7, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 5, 6]
		},
		{
			scripts: [aiAbyss1, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0076",
					name: "Golem",
					maxHP: 246,
					att: 57, def: 59, types: ["rock"],
					lv: 29, expRate: 45
				},
				{
					species: "0126",
					name: "Magmar",
					maxHP: 231,
					att: 58, def: 60, types: ["fire"],
					lv: 29, expRate: 45
				}
			],
			tilemap: [6, 6, 4, 62, 63, 63, 63, 108, 63, 63, 64, 64, 2, 6, 6,
            6, 31, 10, 63, 63, 63, 63, 63, 63, 63, 64, 64, 5, 54, 6,
            6, 7, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 8, 6, 6,
            6, 7, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 5, 6,
            6, 7, 62, 63, 63, 63, 63, 63, 63, 63, 63, 106, 63, 5, 6,
            6, 33, 4, 62, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 6, 7, 62, 63, 63, 63, 107, 63, 63, 63, 63, 67, 5, 6,
            6, 51, 7, 62, 63, 63, 63, 63, 63, 63, 63, 64, 2, 34, 6,
            6, 31, 10, 63, 63, 63, 63, 63, 63, 63, 63, 63, 8, 6, 6,
            6, 7, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 5, 6]
		},
	];
	return [
	    [
	        /* 00 */ [
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, abyss_IntersectionLore1],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [1, 2],
	        /* 01 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, 8, abyss_ItemLore2, 6, EVENT_ABYSS_FLAG1],
	            [CORRIDOR_X_LR, ["0076", "0126"], 3, abyss_EncounterLore3],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3],
	        /* 02 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 12, abyss_TreasureChestLore4, 4, EVENT_ABYSS_FLAG2],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3],
	        /* 03 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, abyss_IntersectionLore5],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [4, 5],
	        /* 04 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, 11, abyss_TreasureChestLore6, 10, EVENT_ABYSS_FLAG3],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 05 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 3, abyss_ItemLore7, 4, EVENT_ABYSS_FLAG4],
	            [CORRIDOR_X_LR, ["0112", "0115"], 1, abyss_EncounterLore8],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 06 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, abyss_IntersectionLore9],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [7, 8],
	        /* 07 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, 3, abyss_ItemLore10, 4, EVENT_ABYSS_FLAG5],
	            [CORRIDOR_X_LR, ["0205"], 2, abyss_EncounterLore11],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 08 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 11, abyss_TreasureChestLore12, 10, EVENT_ABYSS_FLAG6],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 09 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_KEY, abyss_IntersectionLore13],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [10, 11],
	        /* 10 */ [
	            [CORRIDOR_KEY_USED],
	            [CORRIDOR_Y_DU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, ["0076", "0000", "0126"], 0, abyss_EncounterLore14],
	            [CORRIDOR_X_LR, 12, abyss_ItemLore15, 4, EVENT_ABYSS_FLAG7],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12],
	        /* 11 */ [
	            [CORRIDOR_KEY],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12],
	        /* 12 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        []
	    ],
	    [
	        [
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            chunkScriptEncounter,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            chunkScriptEncounter,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            chunkScriptEncounter,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptKeyChamber,
	            noone,
	            noone
	        ],
	        [
	            chunkScriptKeyChamber,
	            noone,
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            chunkScriptKeyChamber,
	            noone,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            abyss_CustomLore16,
	            chunkScriptEndWarpToArea,
	            noone,
	            noone
	        ]
	    ],
	    encInfo,
	    chunkScriptDummyOnLoad
	];
}

function dungeonDataGDKeep() {
	var encInfo = [
		{
			scripts: [aiKeepGD1, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0309",
					name: "Electrike",
					maxHP: 198,
					att: 53, def: 54, types: ["electric"],
					lv: 28, expRate: 45
				},
				{
					species: "0310",
					name: "Manectric",
					maxHP: 226,
					att: 57, def: 57, types: ["electric"],
					lv: 29, expRate: 50
				},
				{
					species: "0309",
					name: "Electrike",
					maxHP: 198,
					att: 53, def: 54, types: ["electric"],
					lv: 28, expRate: 45
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiKeepGD2, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0405",
					name: "Luxray",
					maxHP: 257,
					att: 60, def: 60, types: ["electric"],
					lv: 29, expRate: 50
				},
				{
					species: "0125",
					name: "Electabuzz",
					maxHP: 285,
					att: 60, def: 60, types: ["electric"],
					lv: 29, expRate: 50
				},
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiKeepGD3, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0181",
					name: "Ampharos",
					maxHP: 434,
					att: 66, def: 65, types: ["electric"],
					lv: 30, expRate: 65
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiKeepZapdosBoss, aiBattleClear, aiKeepZapdosBossIntro, aiNull],
			adversaries: [
				{
					species: "0145",
					name: "Zapdos",
					maxHP: 2200,
					att: 70, def: 64, types: ["electric"],
					lv: 32, expRate: 180,
					returnPoint: ["KeepSafeRoom", "Bepis", 317, 100, FACING_D]
				}
			],
			tilemap: [6, 31, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 32, 6,
            6, 52, 62, 63, 62, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 68, 63, 63, 63, 63, 106, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 106, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 107, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 33, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 34, 6],
		},
	];
	return [
	    [
	        /* 00 */ [
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, 11, keepGD_TreasureChestLore1, 10, EVENT_KEEPGD_FLAG1],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, keepGD_IntersectionLore2],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [1, 2],
	        /* 01 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, keepGD_IntersectionLore3],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3, 4],
	        /* 02 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, keepGD_IntersectionLore5],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [7, 8],
	        /* 03 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, 10, keepGD_ItemLore4, 7, EVENT_KEEPGD_FLAG2],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [5],
	        /* 04 */ [
	            [INTERSECT_LUD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 05 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, ["0309", "0310", "0309"], 0, keepGD_EncounterLore6],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 06 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [5],
	        /* 07 */ [
	            [INTERSECT_LUD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 08 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, ["0181"], 2, keepGD_EncounterLore7],
	            [CORRIDOR_X_LR, -1, keepGD_TreasureChestLore8, [["0181"], 2], EVENT_KEEPGD_FLAG3],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 09 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, keepGD_IntersectionLore9],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [10, 11],
	        /* 10 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, keepGD_IntersectionLore10],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12, 13],
	        /* 11 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, keepGD_IntersectionLore12],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [16, 17],
	        /* 12 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, 3, keepGD_TreasureChestLore11, 4, EVENT_KEEPGD_FLAG4],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [14],
	        /* 13 */ [
	            [INTERSECT_LUD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [15],
	        /* 14 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, ["0405", "0125"], 1, keepGD_EncounterLore15],
	            [INTERSECT_LUD, keepGD_IntersectionLore16],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [19, 20],
	        /* 15 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, 12, keepGD_ItemLore13, 4, EVENT_KEEPGD_FLAG5],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [18],
	        /* 16 */ [
	            [INTERSECT_LUD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [15],
	        /* 17 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 11, keepGD_ItemLore14, 10, EVENT_KEEPGD_FLAG6],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [18],
	        /* 18 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [14],
	        /* 19 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, 5, keepGD_ItemLore17, 4, EVENT_KEEPGD_FLAG7],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [21],
	        /* 20 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [21],
	        /* 21 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        []
	    ],
	    [
	        [
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptEncounter,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptEncounter,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            chunkScriptBasicRandomEvent,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            keepGD_CustomLore18,
	            chunkScriptEndWarpToArea,
	            noone,
	            noone
	        ]
	    ],
	    encInfo,
	    chunkScriptDummyOnLoad
	];
}

function dungeonDataGDLabyrinth() {
	var encInfo = [
		{
			scripts: [aiLabyrinthGD1, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0093",
					name: "Haunter",
					maxHP: 192,
					att: 54, def: 50, types: ["ghost"],
					lv: 24, expRate: 45
				},
				{
					species: "0094",
					name: "Gengar",
					maxHP: 217,
					att: 54, def: 50, types: ["ghost","poison"],
					lv: 24, expRate: 50
				},
				{
					species: "0093",
					name: "Haunter",
					maxHP: 192,
					att: 54, def: 50, types: ["ghost"],
					lv: 24, expRate: 45
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiLabyrinthGD2, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0356",
					name: "Dusclops",
					maxHP: 407,
					att: 60, def: 60, types: ["ghost"],
					lv: 25, expRate: 65
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiLabyrinthGD3, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0472",
					name: "Gliscor",
					maxHP: 257,
					att: 60, def: 60, types: ["ground", "flying"],
					lv: 25, expRate: 45
				},
				{
					species: "0200",
					name: "Misdreavus",
					maxHP: 210,
					att: 55, def: 57, types: ["ghost"],
					lv: 24, expRate: 45
				},
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiLabyrinthDelirianBoss, aiLabyrinthDelirianClear, aiLabyrinthDelirianBossLore, aiNull],
			adversaries: [
				{
					species: "0151",
					name: "Mew",
					maxHP: 1700,
					att: 60, def: 60, types: ["psychic"],
					lv: 28, expRate: 160
				}
			],
			tilemap: [6, 52, 62, 63, 63, 63, 108, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 106, 63, 64, 5, 51,
            6, 33, 4, 62, 63, 63, 63, 63, 63, 63, 63, 64, 2, 34, 6,
            6, 6, 52, 62, 63, 63, 107, 63, 63, 63, 63, 67, 5, 6, 6,
            6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
            6, 6, 33, 4, 62, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
            6, 6, 6, 52, 62, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiLabyrinthMoltresBoss, aiBattleClear, aiLabyrinthMoltresBossIntro, aiNull],
			adversaries: [
				{
					species: "0146",
					name: "Moltres",
					maxHP: 2000,
					att: 64, def: 60, types: ["fire"],
					lv: 30, expRate: 180,
					returnPoint: ["LabyrinthSafeRoom", "Bepis", 317, 100, FACING_D]
				}
			],
			tilemap: [6, 31, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 32, 6,
            6, 52, 62, 63, 62, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 68, 63, 63, 63, 63, 106, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 106, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 107, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 33, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 34, 6],
		},
	];
	return [
	    [
	        /* 00 */ [
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, ["0093", "0094", "0093"], 0, labyrinthGD_EncounterLore1],
	            [INTERSECT_LUD, labyrinthGD_IntersectionLore2],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [1, 2],
	        /* 01 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, labyrinthGD_IntersectionLore3],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3, 4],
	        /* 02 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, 8, labyrinthGD_ItemLore8, 6, EVENT_LABYGD_FLAG4],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 03 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, 10, labyrinthGD_TreasureChestLore4, 7, EVENT_LABYGD_FLAG1],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, 5, labyrinthGD_TreasureChestLore5, 4, EVENT_LABYGD_FLAG2],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, ["0356"], 1, labyrinthGD_EncounterLore6],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [5],
	        /* 04 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 7, labyrinthGD_ItemLore7, 5, EVENT_LABYGD_FLAG3],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 05 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, ["0472", "0200"], 2, labyrinthGD_EncounterLore12],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [],
	        /* 06 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_KEY, labyrinthGD_IntersectionLore9],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [7, 8],
	        /* 07 */ [
	            [CORRIDOR_KEY_USED],
	            [CORRIDOR_Y_DU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, ["0151"], 3, labyrinthGD_EncounterLore10],
	            [CORRIDOR_X_LR, 1, labyrinthGD_ItemLore11, 9, EVENT_LABYGD_FLAG5],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 08 */ [
	            [CORRIDOR_KEY],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 09 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [5]
	    ],
	    [
	        [
	            noone,
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            chunkScriptEncounter,
	            chunkScriptBasicRandomEvent,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptEncounter,
	            noone,
	            noone,
	            noone,
	            labyrinthGD_CustomLore13,
	            chunkScriptEndWarpToArea,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptKeyChamber,
	            noone,
	            noone
	        ],
	        [
	            chunkScriptKeyChamber,
	            noone,
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            chunkScriptKeyChamber,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ]
	    ],
	    encInfo,
	    chunkScriptDummyOnLoad
	];
}

function dungeonDataLavaLabyrinth() {
	var encInfo = [
		{
			scripts: [aiLavaLabyrinth1, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0078",
					name: "Rapidash",
					maxHP: 550,
					att: 56, def: 63, types: ["fire"],
					lv: 25, expRate: 70
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiLavaLabyrinth2, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0219",
					name: "Magcargo",
					maxHP: 235,
					att: 56, def: 58, types: ["fire", "rock"],
					lv: 24, expRate: 45
				},
				{
					species: "0219",
					name: "Magcargo",
					maxHP: 235,
					att: 56, def: 58, types: ["fire", "rock"],
					lv: 24, expRate: 45
				},
				{
					species: "0219",
					name: "Magcargo",
					maxHP: 235,
					att: 56, def: 58, types: ["fire", "rock"],
					lv: 24, expRate: 45
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiLavaLabyrinth3, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0136",
					name: "Flareon",
					maxHP: 285,
					att: 56, def: 66, types: ["fire"],
					lv: 26, expRate: 40
				},
				{
					species: "0256",
					name: "Combusken",
					maxHP: 252,
					att: 56, def: 66, types: ["fire","fighting"],
					lv: 26, expRate: 45
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
	];
	return [
	    [
	        /* 00 */ [
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, lavaLabyrinth_IntersectionLore1],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [1, 2],
	        /* 01 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 7, lavaLabyrinth_ItemLore2, 5, EVENT_LAVALABI_FLAG1],
	            [CORRIDOR_KEY, lavaLabyrinth_IntersectionLore3],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3, 4],
	        /* 02 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, 5, lavaLabyrinth_TreasureChestLore7, 4, EVENT_LAVALABI_FLAG5],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 03 */ [
	            [CORRIDOR_KEY_USED],
	            [CORRIDOR_Y_DU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, 3, lavaLabyrinth_ItemLore4, 4, EVENT_LAVALABI_FLAG2],
	            [CORRIDOR_X_LR, 3, lavaLabyrinth_ItemLore5, 4, EVENT_LAVALABI_FLAG3],
	            [CORRIDOR_X_LR, 6, lavaLabyrinth_ItemLore6, 8, EVENT_LAVALABI_FLAG4],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [5],
	        /* 04 */ [
	            [CORRIDOR_KEY],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 05 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, lavaLabyrinth_IntersectionLore9],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [7, 8],
	        /* 06 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, ["0219", "0219", "0219"], 1, lavaLabyrinth_EncounterLore8],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [5],
	        /* 07 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, lavaLabyrinth_IntersectionLore10],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9, 10],
	        /* 08 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, 10, lavaLabyrinth_ItemLore12, 7, EVENT_LAVALABI_FLAG7],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12],
	        /* 09 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, 7, lavaLabyrinth_TreasureChestLore11, 5, EVENT_LAVALABI_FLAG6],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [11],
	        /* 10 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12],
	        /* 11 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, ["0136", "0256"], 2, lavaLabyrinth_EncounterLore14],
	            [INTERSECT_LUD, lavaLabyrinth_IntersectionLore15],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [13, 14],
	        /* 12 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, ["0078"], 0, lavaLabyrinth_EncounterLore13],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [11],
	        /* 13 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, 8, lavaLabyrinth_ItemLore16, 6, EVENT_LAVALABI_FLAG8],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [15],
	        /* 14 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [15],
	        /* 15 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        []
	    ],
	    [
	        [
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            chunkScriptKeyChamber,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            chunkScriptKeyChamber,
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            chunkScriptGenericTreasure,
	            chunkScriptGenericTreasure,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            chunkScriptKeyChamber,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptEncounter,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptEncounter,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            lavaLabyrinth_CustomLore17,
	            chunkScriptEndWarpToArea,
	            noone,
	            noone
	        ]
	    ],
	    encInfo,
	    chunkScriptDummyOnLoad
	];
}

function dungeonDataFogboundKeep() {
	var encInfo = [
		{
			scripts: [aiFogboundKeep1, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0168",
					name: "Ariados",
					maxHP: 142,
					att: 48, def: 50, types: ["bug", "poison"],
					lv: 18, expRate: 35
				},
				{
					species: "0168",
					name: "Ariados",
					maxHP: 142,
					att: 48, def: 50, types: ["bug", "poison"],
					lv: 18, expRate: 35
				},
				{
					species: "0168",
					name: "Ariados",
					maxHP: 142,
					att: 48, def: 50, types: ["bug", "poison"],
					lv: 18, expRate: 35
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiFogboundKeep2, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0371",
					name: "Bagon",
					maxHP: 142,
					att: 55, def: 49, types: ["dragon"],
					lv: 20, expRate: 40
				},
				{
					species: "0447",
					name: "Riolu",
					maxHP: 168,
					att: 57, def: 52, types: ["fighting"],
					lv: 20, expRate: 35
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiFogboundKeep3, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0105",
					name: "Marowak",
					maxHP: 225,
					att: 61, def: 59, types: ["ground"],
					lv: 23, expRate: 40,
					aiID: 1
				},
				{
					species: "0105",
					name: "Marowak",
					maxHP: 225,
					att: 61, def: 59, types: ["ground"],
					lv: 23, expRate: 40,
					aiID: 2
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiFogboundKeep4, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0531",
					name: "Audino",
					maxHP: 400,
					att: 57, def: 53, types: ["normal"],
					lv: 20, expRate: 160
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiFogboundKeep1, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0168",
					name: "Ariados",
					maxHP: 142,
					att: 48, def: 50, types: ["bug", "poison"],
					lv: 18, expRate: 30
				},
				{
					species: "0168",
					name: "Ariados",
					maxHP: 142,
					att: 48, def: 50, types: ["bug", "poison"],
					lv: 18, expRate: 30
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
	];
	return [
	    [
	        /* 00 */ [
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, ["0371", "0447"], 1, evoCave_EncounterLore1],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, 9, evoCave_ItemLore2, 6, EVENT_EVOCAVE_FLAG1],
	            [INTERSECT_LUD, evoCave_IntersectionLore3],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [1, 2],
	        /* 01 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, 8, evoCave_TreasureChestLore4, 6, EVENT_EVOCAVE_FLAG2],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_KEY, evoCave_IntersectionLore5],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3, 4],
	        /* 02 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, evoCave_IntersectionLore7],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [7, 8],
	        /* 03 */ [
	            [CORRIDOR_KEY_USED],
	            [CORRIDOR_Y_DU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, ["0531"], 3, evoCave_EncounterLore6],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [5],
	        /* 04 */ [
	            [CORRIDOR_KEY],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 05 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, ["0105", "0105"], 2, evoCave_EncounterLore11],
	            [INTERSECT_LUD, evoCave_IntersectionLore12],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [10, 11],
	        /* 06 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [5],
	        /* 07 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, 7, evoCave_ItemLore8, 5, EVENT_EVOCAVE_FLAG3],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 08 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, ["0168", "0168", "0168"], 0, evoCave_EncounterLore9],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 09 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, -1, evoCave_TreasureChestLore10, [["0168", "0168"], 4], EVENT_EVOCAVE_FLAG4],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 10 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12],
	        /* 11 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 5, evoCave_ItemLore13, 5, EVENT_EVOCAVE_FLAG5],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12],
	        /* 12 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        []
	    ],
	    [
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptEncounter,
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            noone,
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptKeyChamber,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            chunkScriptKeyChamber,
	            noone,
	            noone,
	            chunkScriptEncounter,
	            noone,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            chunkScriptKeyChamber,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptEncounter,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            evoCave_CustomLore14,
	            chunkScriptEndWarpToArea,
	            noone,
	            noone
	        ]
	    ],
	    encInfo,
	    chunkScriptDummyOnLoad
	];
}

function dungeonDataCrystalGlacierGlitchDimension() {
	var encInfo = [
		{
			scripts: [aiGlacierGlitchDimension1, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0225",
					name: "Delibird",
					maxHP: 125,
					att: 44, def: 52, types: ["ice", "flying"],
					lv: 17, expRate: 30
				},
				{
					species: "0225",
					name: "Delibird",
					maxHP: 125,
					att: 44, def: 52, types: ["ice", "flying"],
					lv: 17, expRate: 30
				},
				{
					species: "0225",
					name: "Delibird",
					maxHP: 125,
					att: 44, def: 52, types: ["ice", "flying"],
					lv: 17, expRate: 30
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiGlacierGlitchDimension2, aiBattleClear, aiGlacierGlitchDimension2HandleTele, aiNull],
			adversaries: [
				{
					species: "0238",
					name: "Smoochum",
					maxHP: 125,
					att: 43, def: 48, types: ["ice", "psychic"],
					lv: 16, expRate: 30
				},
				{
					species: "0124",
					name: "Jynx",
					maxHP: 133,
					att: 46, def: 51, types: ["ice", "psychic"],
					lv: 17, expRate: 40
				},
				{
					species: "0238",
					name: "Smoochum",
					maxHP: 125,
					att: 43, def: 48, types: ["ice", "psychic"],
					lv: 16, expRate: 30
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiGlacierGlitchDimension3, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0473",
					name: "Mamoswine",
					maxHP: 207,
					att: 47, def: 62, types: ["ice", "ground"],
					lv: 20, expRate: 45
				},
				{
					species: "0471",
					name: "Glaceon",
					maxHP: 155,
					att: 45, def: 55, types: ["ice"],
					lv: 20, expRate: 40
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiGlacierGlitchDimension4, aiBattleClear, aiGlacierGlitchDimension4Init, aiNull],
			adversaries: [
				{
					species: "0262",
					name: "Mightyena",
					maxHP: 280,
					att: 70, def: 70, types: ["dark"],
					lv: 25, expRate: 100
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiGlacierGlitchDimension1, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0225",
					name: "Delibird",
					maxHP: 125,
					att: 44, def: 52, types: ["ice", "flying"],
					lv: 17, expRate: 30
				},
				{
					species: "0225",
					name: "Delibird",
					maxHP: 125,
					att: 44, def: 52, types: ["ice", "flying"],
					lv: 17, expRate: 30
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiGlacierGlitchDimensionBoss, aiBattleClear, aiGlacierGlitchDimensionBossIntro, aiNull],
			adversaries: [
				{
					species: "0144",
					name: "Articuno",
					maxHP: 1000,
					att: 75, def: 83, types: ["ice"],
					lv: 22, expRate: 150,
					returnPoint: ["GlacierGDSafeRoom", "Bepis", 317, 100, FACING_D]
				}
			],
			tilemap: [6, 31, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 32, 6,
            6, 52, 62, 63, 62, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 68, 63, 63, 63, 63, 106, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 106, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 107, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 33, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 34, 6],
		},
	];
	return [
	    [
	        /* 00 */ [
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, mysticGD_IntersectionLore1],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [1, 2],
	        /* 01 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, 9, mysticGD_ItemLore2, 6, EVENT_MYSTICGD_FLAG1],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3],
	        /* 02 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 3, mysticGD_TreasureChestLore3, 4, EVENT_MYSTICGD_FLAG2],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, mysticGD_IntersectionLore4],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [4, 5],
	        /* 03 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, ["0473", "0471"], 2, mysticGD_EncounterLore5],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 04 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3],
	        /* 05 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, ["0225", "0225"], 4, mysticGD_EncounterLore6],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_KEY, mysticGD_IntersectionLore7],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [7, 8],
	        /* 06 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, 5, mysticGD_ItemLore9, 4, EVENT_MYSTICGD_FLAG3],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 07 */ [
	            [CORRIDOR_KEY_USED],
	            [CORRIDOR_Y_DU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, ["0262"], 3, mysticGD_EncounterLore8],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 08 */ [
	            [CORRIDOR_KEY],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, -1, mysticGD_TreasureChestLore10, [["0225", "0225"], 0], EVENT_MYSTICGD_FLAG4],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 09 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, ["0238", "0124", "0238"], 1, mysticGD_EncounterLore11],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, mysticGD_IntersectionLore12],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [10, 11],
	        /* 10 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, ["0225", "0225", "0225"], 0, mysticGD_EncounterLore13],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12],
	        /* 11 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UD],
	            [CORRIDOR_Y_UD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 7, mysticGD_ItemLore14, 5, EVENT_MYSTICGD_FLAG5],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12],
	        /* 12 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        []
	    ],
	    [
	        [
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            chunkScriptEncounter,
	            chunkScriptBasicRandomEvent,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptEncounter,
	            noone,
	            chunkScriptKeyChamber,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            chunkScriptKeyChamber,
	            noone,
	            noone,
	            chunkScriptEncounter,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            chunkScriptKeyChamber,
	            chunkScriptBasicRandomEvent,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptEncounter,
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptEncounter,
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            chunkScriptBasicRandomEvent,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            mysticGD_CustomLore15,
	            chunkScriptEndLastOuting,
	            noone,
	            noone
	        ]
	    ],
	    encInfo,
	    chunkScriptDummyOnLoad
	];
}

function dungeonDataMysticHighlands() {
	var encInfo = [
		{
			scripts: [aiMysticHighland1, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0076",
					name: "Golem",
					maxHP: 185,
					att: 41, def: 51, types: ["rock","ground"],
					lv: 15, expRate: 40
				},
				{
					species: "0232",
					name: "Donphan",
					maxHP: 156,
					att: 40, def: 42, types: ["ground"],
					lv: 14, expRate: 45
				},
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiMysticHighland2, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0330",
					name: "Flygon",
					maxHP: 205,
					att: 45, def: 52, types: ["ground"],
					lv: 18, expRate: 45
				},
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiMysticHighland3, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0057",
					name: "Primeape",
					maxHP: 103,
					att: 37, def: 35, types: ["ground"],
					lv: 13, expRate: 35
				},
				{
					species: "0057",
					name: "Primeape",
					maxHP: 106,
					att: 39, def: 36, types: ["ground"],
					lv: 14, expRate: 35
				},
				{
					species: "0057",
					name: "Primeape",
					maxHP: 103,
					att: 37, def: 35, types: ["ground"],
					lv: 13, expRate: 35
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiMysticHighlandMachamp, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0068",
					name: "Machamp",
					maxHP: 209,
					att: 55, def: 48, types: ["fighting"],
					lv: 19, expRate: 85
				},
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
	];
	return [
	    [
	        /* 00 */ [
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, mysticHighland_IntersectionLore1],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [1, 2],
	        /* 01 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, -230, mysticHighland_ItemLore2, 0, EVENT_MYSTICHIGHLAND_FLAG1],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3],
	        /* 02 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, ["0057", "0057", "0057"], 2, mysticHighland_EncounterLore3],
	            [INTERSECT_LUD, mysticHighland_IntersectionLore4],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [4, 5],
	        /* 03 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, ["0330"], 1, mysticHighland_EncounterLore5],
	            [INTERSECT_LUD, mysticHighland_IntersectionLore6],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6, 7],
	        /* 04 */ [
	            [INTERSECT_LUD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3],
	        /* 05 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 8, mysticHighland_ItemLore7, 6, EVENT_MYSTICHIGHLAND_FLAG2],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 06 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [8],
	        /* 07 */ [
	            [INTERSECT_LUD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 08 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, ["0076", "0232"], 0, mysticHighland_EncounterLore8],
	            [INTERSECT_LUD, mysticHighland_IntersectionLore9],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [10, 11],
	        /* 09 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [8],
	        /* 10 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, 7, mysticHighland_ItemLore10, 5, EVENT_MYSTICHIGHLAND_FLAG3],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12],
	        /* 11 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, -190, mysticHighland_ItemLore11, 0, EVENT_MYSTICHIGHLAND_FLAG4],
	            [INTERSECT_LUD, mysticHighland_IntersectionLore12],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [13, 14],
	        /* 12 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, ["0330"], 1, mysticHighland_EncounterLore13],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [15],
	        /* 13 */ [
	            [INTERSECT_LUD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12],
	        /* 14 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 5, mysticHighland_ItemLore14, 4, EVENT_MYSTICHIGHLAND_FLAG5],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [15],
	        /* 15 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_KEY, mysticHighland_IntersectionLore15],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [16, 17],
	        /* 16 */ [
	            [CORRIDOR_KEY_USED],
	            [CORRIDOR_Y_DU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, ["0068"], 3, mysticHighland_EncounterLore16],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [16, 17],
	        /* 17 */ [
	            [CORRIDOR_KEY],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [16, 17]
	    ],
	    [
	        [
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptEncounter,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptKeyChamber,
	            noone,
	            noone
	        ],
	        [
	            chunkScriptKeyChamber,
	            noone,
	            noone,
	            noone,
	            chunkScriptEncounter,
	            mysticHighland_CustomLore17,
	            chunkScriptEndLastOuting,
	            noone,
	            noone
	        ],
	        [
	            chunkScriptKeyChamber,
	            noone,
	            mysticHighland_CustomLore18,
	            chunkScriptEndLastOuting,
	            noone,
	            noone
	        ]
	    ],
	    encInfo,
	    chunkScriptDummyOnLoad
	];
}

function dungeonDataCrystalGlacier() {
	var encInfo = [
		{
			scripts: [aiCrystalGlacier1, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0221",
					name: "Piloswine",
					maxHP: 155,
					att: 35, def: 39, types: ["ice"],
					lv: 13, expRate: 35
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiCrystalGlacier2, aiCrystalGlacier2End, aiCrystalGlacier2Begin, aiNull],
			adversaries: [
				{
					species: "0162",
					name: "Furret",
					maxHP: 80,
					att: 26, def: 27, types: ["normal"],
					lv: 10, expRate: 18
				},
				{
					species: "0162",
					name: "Furret",
					maxHP: 80,
					att: 26, def: 27, types: ["normal"],
					lv: 10, expRate: 21
				},
				{
					species: "0162",
					name: "Furret",
					maxHP: 80,
					att: 26, def: 27, types: ["normal"],
					lv: 10, expRate: 18
				}
			],
			tilemap: [6, 52, 62, 63, 63, 63, 108, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 106, 63, 64, 5, 51,
            6, 33, 4, 62, 63, 63, 63, 63, 63, 63, 63, 64, 2, 34, 6,
            6, 6, 52, 62, 63, 63, 107, 63, 63, 63, 63, 67, 5, 6, 6,
            6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
            6, 6, 33, 4, 62, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
            6, 6, 6, 52, 62, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiCrystalGlacier3, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0361",
					name: "Snorunt",
					maxHP: 85,
					att: 27, def: 30, types: ["ice"],
					lv: 11, expRate: 28
				},
				{
					species: "0086",
					name: "Seel",
					maxHP: 100,
					att: 32, def: 37, types: ["water"],
					lv: 12, expRate: 33
				},
				{
					species: "0361",
					name: "Snorunt",
					maxHP: 85,
					att: 27, def: 30, types: ["ice"],
					lv: 11, expRate: 28
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [aiCrystalGlacier4, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0288",
					name: "Vigoroth",
					maxHP: 99,
					att: 28, def: 30, types: ["normal"],
					lv: 11, expRate: 35
				},
				{
					species: "0335",
					name: "Zangoose",
					maxHP: 86,
					att: 34, def: 29, types: ["normal"],
					lv: 11, expRate: 35
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		}
	];
	return [
	    [
	        /* 00 */ [
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, ["0221"], 0, crystalGlacier_EncounterLore1],
	            [INTERSECT_LUD, crystalGlacier_IntersectionLore2],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [1, 2],
	        /* 01 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 7, crystalGlacier_TreasureChestLore3, 5, EVENT_CRYSTALGLACIER_FLAG1],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3],
	        /* 02 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, -255, crystalGlacier_ItemLore4, 0, EVENT_CRYSTALGLACIER_FLAG2],
	            [CORRIDOR_X_LR, ["0288", "0335"], 3, crystalGlacier_EncounterLore5],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3],
	        /* 03 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, ["0162", "0162", "0162"], 1, crystalGlacier_EncounterLore6],
	            [INTERSECT_LUD, crystalGlacier_IntersectionLore7],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [4, 5],
	        /* 04 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, crystalGlacier_IntersectionLore8],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6, 7],
	        /* 05 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, -400, crystalGlacier_TreasureChestLore12, 0, EVENT_CRYSTALGLACIER_FLAG5],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 06 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, 5, crystalGlacier_ItemLore9, 4, EVENT_CRYSTALGLACIER_FLAG3],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [8],
	        /* 07 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [8],
	        /* 08 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, ["0221"], 0, crystalGlacier_EncounterLore10],
	            [CORRIDOR_X_LR, 7, crystalGlacier_ItemLore11, 5, EVENT_CRYSTALGLACIER_FLAG4],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 09 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR, ["0361", "0086", "0361"], 2, crystalGlacier_EncounterLore13],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        []
	    ],
	    [
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            chunkScriptEncounter,
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptBasicRandomEvent,
	            chunkScriptEncounter,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptEncounter,
	            noone,
	            crystalGlacier_CustomLore14,
	            chunkScriptEndWarpToArea,
	            noone,
	            noone
	        ]
	    ],
	    encInfo,
	    chunkScriptDummyOnLoad
	];
}

function dungeonDataSereneGlitchDimension() {
	var encInfo = [
		{
			scripts: [ai004GD1Fight1, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0049",
					name: "Venomoth",
					maxHP: 125,
					att: 32, def: 43, types: ["bug", "poison"],
					lv: 10, expRate: 40
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [ai004GD1Fight2, aiBattleClear, aiNull, aiNull],
			adversaries: [
				{
					species: "0021",
					name: "Spearow",
					maxHP: 50,
					att: 22, def: 20, types: ["flying"],
					lv: 7, expRate: 18
				},
				{
					species: "0022",
					name: "Fearow",
					maxHP: 75,
					att: 28, def: 26, types: ["flying"],
					lv: 8, expRate: 21
				},
				{
					species: "0021",
					name: "Spearow",
					maxHP: 50,
					att: 22, def: 20, types: ["flying"],
					lv: 7, expRate: 18
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [ai004GD1Fight3, aiBattleClear, ai004GD1Fight3Before, aiNull],
			adversaries: [
				{
					species: "0034",
					name: "Nidoking",
					maxHP: 125,
					att: 29, def: 41, types: ["ground", "poison"],
					lv: 10, expRate: 35
				}
			],
			tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
			6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
			6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
			6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
			6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
			6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
			6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
			6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
			6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
		},
		{
			scripts: [ai004GD1Boss, aiBattleClear, ai004GD1BossIntro, aiNull],
			adversaries: [
				{
					species: "0115",
					name: "Kangaskhan",
					maxHP: 350,
					att: 34, def: 35, types: ["normal"],
					lv: 12, expRate: 110
				}
			],
			tilemap: [6, 31, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 32, 6,
            6, 52, 62, 63, 62, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 68, 63, 63, 63, 63, 106, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 106, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 107, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 52, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 5, 6,
            6, 33, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 34, 6]
		}
	];
	return [
		[
	        /* 00 */ [
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, -1, sereneGlitchDimension_TreasureChestLore1, ["0049", 0], EVENT_SERENE_GLITCHDIMENSION_FLAG1],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, sereneGlitchDimension_IntersectionLore2],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [1, 2],
	        /* 01 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, -145, sereneGlitchDimension_ItemLore3, 0, EVENT_SERENE_GLITCHDIMENSION_FLAG2],
	            [INTERSECT_LUD, sereneGlitchDimension_IntersectionLore4],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [3, 4],
	        /* 02 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR],
	            [INTERSECT_LUD, sereneGlitchDimension_IntersectionLore8],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [7, 8],
	        /* 03 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, ["0021", "0022", "0021"], 1, sereneGlitchDimension_EncounterLore5],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [5],
	        /* 04 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 5, sereneGlitchDimension_ItemLore6, 4, EVENT_SERENE_GLITCHDIMENSION_FLAG3],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [5],
	        /* 05 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 2, sereneGlitchDimension_ItemLore7, 1, EVENT_SERENE_GLITCHDIMENSION_FLAG4],
	            [CORRIDOR_Y_LD],
	            [CORRIDOR_Y_UD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 06 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR, ["0034"], 2, sereneGlitchDimension_EncounterLore12],
	            [INTERSECT_LUD, sereneGlitchDimension_IntersectionLore13],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [10, 11],
	        /* 07 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, ["0021", "0022", "0021"], 1, sereneGlitchDimension_EncounterLore9],
	            [CORRIDOR_X_LR, 5, sereneGlitchDimension_ItemLore10, 4, EVENT_SERENE_GLITCHDIMENSION_FLAG5],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 08 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, 3, sereneGlitchDimension_TreasureChestLore11, 4, EVENT_SERENE_GLITCHDIMENSION_FLAG6],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [9],
	        /* 09 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [6],
	        /* 10 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DR],
	            [CORRIDOR_X_LR, -275, sereneGlitchDimension_ItemLore14, 0, EVENT_SERENE_GLITCHDIMENSION_FLAG7],
	            [CORRIDOR_Y_LD],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12],
	        /* 11 */ [
	            [INTERSECT_LUD],
	            [CORRIDOR_Y_UR],
	            [CORRIDOR_X_LR, ["0049"], 0, sereneGlitchDimension_EncounterLore15],
	            [CORRIDOR_X_LR, 5, sereneGlitchDimension_TreasureChestLore16, 4, EVENT_SERENE_GLITCHDIMENSION_FLAG8],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_Y_LU],
	            [CORRIDOR_Y_DU],
	            [INTERSECT_RUD],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        [12],
	        /* 12 */ [
	            [INTERSECT_RUD],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [CORRIDOR_X_LR],
	            [NULL_CHUNK],
	            [NULL_CHUNK]
	        ],
	        []
	    ],
	    [
	        [
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            chunkScriptGenericTreasure,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            noone,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptEncounter,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericIntersection,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptEncounter,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptBasicRandomEvent,
	            noone,
	            noone,
	            chunkScriptGenericTreasure,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            chunkScriptEncounter,
	            chunkScriptTreasureChest,
	            chunkScriptPostTreasureChest,
	            noone,
	            noone,
	            chunkScriptCoalesce,
	            noone,
	            noone
	        ],
	        [
	            noone,
	            noone,
	            sereneGlitchDimension_CustomLore17,
	            chunkScriptEndWarpToArea,
	            noone,
	            noone
	        ]
	    ],
	    encInfo,
	    chunkScriptDummyOnLoad
	];
}

function dungeonDataSereneForest() {
	return [
		[
			// chunk data, goto table
			/* 00 */ [[CORRIDOR_X_LR], [CORRIDOR_X_LR, ["0011"], 0, sereneForestLoreScript1], [CORRIDOR_X_LR], [INTERSECT_LUD, sereneForestLoreScript2], [NULL_CHUNK], [NULL_CHUNK]], [1, 2],
			/* 01 */ [[INTERSECT_LUD], [CORRIDOR_Y_DR], [CORRIDOR_X_LR, -200, sereneForestLoreScript3, 0, EVENT_SERENE_FOREST_ITEM1], [CORRIDOR_X_LR], [CORRIDOR_Y_LD], [INTERSECT_RUD], [NULL_CHUNK], [NULL_CHUNK]], [3],
			/* 02 */ [[INTERSECT_LUD], [CORRIDOR_Y_UR], [CORRIDOR_X_LR, 2, sereneForestLoreScript3, 1, EVENT_SERENE_FOREST_ITEM2], [CORRIDOR_X_LR], [CORRIDOR_Y_LU], [INTERSECT_RUD], [NULL_CHUNK], [NULL_CHUNK]], [3],
			/* 03 */ [[INTERSECT_RUD], [CORRIDOR_X_LR, ["0165", "0165"], 1, sereneForestLoreScript5], [CORRIDOR_Y_LD], [CORRIDOR_Y_UR], [CORRIDOR_X_LR, -220, sereneForestLoreScript6, 0, EVENT_SERENE_FOREST_ITEM3], [CORRIDOR_X_LR], [CORRIDOR_X_LR, ["0048", "0069"], 2, sereneForestLoreScript8], [CORRIDOR_X_LR], [CORRIDOR_X_LR], [NULL_CHUNK], [NULL_CHUNK]], []
		],
		[
			/* 00 */ [noone, chunkScriptEncounter, noone, chunkScriptGenericIntersection, noone, noone],
			/* 01 */ [chunkScriptGenericIntersection, noone, chunkScriptGenericTreasure, sereneForestLoreScript4, noone, chunkScriptCoalesce, noone, noone],
			/* 02 */ [chunkScriptGenericIntersection, noone, chunkScriptGenericTreasure, sereneForestLoreScript4, noone, chunkScriptCoalesce, noone, noone],
			/* 03 */ [noone, chunkScriptEncounter, noone, noone, chunkScriptTreasureChest, chunkScriptPostTreasureChest, chunkScriptEncounter, sereneForestLoreScript7, chunkScriptEndWarpToArea, noone, noone]
		],
		[
			// encounter information
			{
				scripts: [ai003ForestFight1, aiBattleClear, aiNull, aiNull],
				adversaries: [
					{
						species: "0011",
						name: "Metapod",
						maxHP: 83,
						att: 15, def: 32, types: ["grass"],
						lv: 8, expRate: 17
					}
				],
				tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
	            6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
	            6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
	            6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
	            6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
	            6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
	            6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
	            6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
	            6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
	            6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
			},
			{
				scripts: [ai003ForestFight2, aiBattleClear, ai003ForestFight2Lore, aiNull],
				adversaries: [
					{
						species: "0165",
						name: "Ledyba",
						maxHP: 65,
						att: 20, def: 25, types: ["bug","flying"],
						lv: 6, expRate: 20
					},
					{
						species: "0165",
						name: "Ledyba",
						maxHP: 65,
						att: 20, def: 25, types: ["bug","flying"],
						lv: 6, expRate: 20
					}
				],
				tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
	            6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
	            6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
	            6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
	            6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
	            6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
	            6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
	            6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
	            6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
	            6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
			},
			{
				scripts: [ai003ForestFight3, aiBattleClear, ai003ForestFight3Lore, aiNull],
				adversaries: [
					{
						species: "0048",
						name: "Venonat",
						maxHP: 73,
						att: 23, def: 20, types: ["bug"],
						lv: 7, expRate: 22
					},
					{
						species: "0069",
						name: "Bellsprout",
						maxHP: 55,
						att: 10, def: 25, types: ["grass"],
						lv: 5, expRate: 19
					}
				],
				tilemap: [6, 6, 6, 6, 52, 62, 108, 63, 63, 63, 64, 5, 6, 6, 6,
	            6, 6, 51, 6, 52, 62, 63, 63, 63, 63, 64, 5, 6, 51, 6,
	            6, 6, 6, 31, 10, 62, 63, 63, 63, 63, 64, 5, 6, 6, 6,
	            6, 6, 6, 52, 68, 63, 63, 63, 63, 63, 64, 8, 32, 6, 6,
	            6, 51, 6, 52, 62, 63, 63, 63, 63, 63, 106, 64, 5, 6, 51,
	            6, 6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 6,
	            6, 6, 56, 7, 62, 63, 107, 63, 63, 63, 63, 67, 50, 6, 6,
	            6, 6, 31, 10, 62, 63, 63, 63, 63, 63, 64, 2, 34, 6, 6,
	            6, 6, 52, 62, 63, 63, 63, 63, 63, 63, 64, 5, 6, 56, 6,
	            6, 6, 52, 62, 108, 63, 63, 63, 63, 107, 64, 5, 6, 6, 6]
			},
			
		],
		// start script [3]
		chunkScriptOnSereneForestLoad
	];
}