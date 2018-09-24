EndOfCycleStep::
	ld a, BANK(CheckCycleEvents)
	ld hl, CheckCycleEvents
	call CallScript
	scf
	ret

CheckCycleEvents:
	checkevent EVENT_ITS_RIGHT_NEAR
	iftrue .ItsRightNearScript

	checkevent EVENT_ITS_GETTING_CLOSER
	iftrue .ItsGettingCloserScript

	checkevent EVENT_SOMETHING_IS_APPROACHING
	iftrue .SomethingIsApproachingScript

	checkevent EVENT_SOMETHING_IS_STIRRING
	iftrue .SomethingIsStirringScript
	end


.SomethingIsStirringScript
	clearevent EVENT_SOMETHING_IS_STIRRING
	opentext
	writetext .SomethingIsStirringtext
	waitbutton
	closetext
	end

.SomethingIsStirringtext
	text_jump SomethingIsStirringText
	db "@"

.SomethingIsApproachingScript
	clearevent EVENT_SOMETHING_IS_STIRRING
	clearevent EVENT_SOMETHING_IS_APPROACHING
	opentext
	writetext .SomethingIsApproachingtext
	waitbutton
	closetext
	end

.SomethingIsApproachingtext
	text_jump SomethingIsApproachingText
	db "@"

.ItsGettingCloserScript
	clearevent EVENT_SOMETHING_IS_STIRRING
	clearevent EVENT_SOMETHING_IS_APPROACHING
	clearevent EVENT_ITS_GETTING_CLOSER
	opentext
	writetext .ItsGettingClosertext
	waitbutton
	closetext
	end

.ItsGettingClosertext
	text_jump ItsGettingCloserText
	db "@"

.ItsRightNearScript
	clearevent EVENT_SOMETHING_IS_STIRRING
	clearevent EVENT_SOMETHING_IS_APPROACHING
	clearevent EVENT_ITS_GETTING_CLOSER
	clearevent EVENT_ITS_RIGHT_NEAR
	opentext
	writetext .ItsRightNeartext
	waitbutton
	farcall _SaveGameData
	closetext
	end

.ItsRightNeartext
	text_jump ItsRightNearText
	db "@"
