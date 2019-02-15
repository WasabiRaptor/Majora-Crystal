BugContestantPointers:
; there are NUM_BUG_CONTESTANTS + 1 entries
	dw BugContestant_BugCatcherDon ; this reverts back to the player
	dw BugContestant_BugCatcherDon
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_PokefanMWilliam
	dw BugContestant_BugCatcherBenny
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherJosh
	dw BugContestant_YoungsterSamuel
	dw BugContestant_SchoolboyKipp

; contestant format:
;   db class, id
;   dbw 1st-place mon, score
;   dbw 2nd-place mon, score
;   dbw 3rd-place mon, score

BugContestant_BugCatcherDon:
	db BUG_CATCHER, DON
	dbw MIMIKYU,     300
	dbw ZOROARK,    285
	dbw ZORUA,   226

BugContestant_BugCatcherEd:
	db BUG_CATCHER, ED
	dbw ROCKRUFF, 286
	dbw ROCKRUFF, 251
	dbw ZORUA,   237

BugContestant_CooltrainerMNick:
	db COOLTRAINERM, NICK
	dbw SCYTHER,    357
	dbw ROCKRUFF, 349
	dbw PINSIR,     368

BugContestant_PokefanMWilliam:
	db POKEFANM, WILLIAM
	dbw PINSIR,     332
	dbw ROCKRUFF, 324
	dbw SWABLU,    321

BugContestant_BugCatcherBenny:
	db BUG_CATCHER, BUG_CATCHER_BENNY
	dbw ROCKRUFF, 318
	dbw LYCANROC,     295
	dbw ZORUA,   285

BugContestant_CamperBarry:
	db CAMPER, BARRY
	dbw PINSIR,     366
	dbw SWABLU,    329
	dbw MIMIKYU,     314

BugContestant_PicnickerCindy:
	db PICNICKER, CINDY
	dbw ROCKRUFF, 341
	dbw ZOROARK,    301
	dbw ZORUA,   264

BugContestant_BugCatcherJosh:
	db BUG_CATCHER, JOSH
	dbw SCYTHER,    326
	dbw ROCKRUFF, 292
	dbw ZOROARK,    282

BugContestant_YoungsterSamuel:
	db YOUNGSTER, SAMUEL
	dbw LYCANROC,     270
	dbw PINSIR,     282
	dbw ZORUA,   251

BugContestant_SchoolboyKipp:
	db SCHOOLBOY, KIPP
	dbw SWABLU,    267
	dbw SENTRET,      254
	dbw MIMIKYU,     259
