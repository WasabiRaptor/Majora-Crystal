BugContestantPointers:
	dw BugContestant_BugCatcherDon ; This reverts back to the player
	dw BugContestant_BugCatcherDon
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_PokefanMWilliam
	dw BugContestant_BugCatcherBenny
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherJosh
	dw BugContestant_SchoolboyJohnny
	dw BugContestant_SchoolboyKipp

BugContestant_BugCatcherDon:
	db BUG_CATCHER, DON
	;dbw KAKUNA,     300
	;dbw METAPOD,    285
	;dbw CATERPIE,   226

BugContestant_BugCatcherEd:
	db BUG_CATCHER, ED

BugContestant_CooltrainerMNick:
	db COOLTRAINERM, NICK

BugContestant_PokefanMWilliam:
	db POKEFANM, WILLIAM

BugContestant_BugCatcherBenny:
	db BUG_CATCHER, BENNY

BugContestant_CamperBarry:
	db CAMPER, BARRY

BugContestant_PicnickerCindy:
	db PICNICKER, CINDY

BugContestant_BugCatcherJosh:
	db BUG_CATCHER, JOSH

BugContestant_SchoolboyJohnny:
	db SCHOOLBOY, JOHNNY

BugContestant_SchoolboyKipp:
	db SCHOOLBOY, KIPP
