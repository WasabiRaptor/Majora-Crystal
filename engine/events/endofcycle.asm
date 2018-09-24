EndOfCycleStep::
	ld hl, wCycleProgress
	ld a, [hl]
	cp 0 
	jr nc, .nope
;I think this might be where the issues are?
	cp 4
	jr nc, .ItsRightNearScript
	cp 3
	jr nc, .ItsGettingCloserScript
	cp 2
	jr nc, .SomethingIsApproachingScript
	cp 1
	jr nc, .SomethingIsStirringScript

;this is how you need to call a script from a footstep and I know this is correct
.ItsRightNearScript
	ld a, BANK(ItsRightNearScript)
	ld hl, ItsRightNearScript
	jp .callscript

.ItsGettingCloserScript
	ld a, BANK(ItsGettingCloserScript)
	ld hl, ItsGettingCloserScript
	jp .callscript

.SomethingIsApproachingScript
	ld a, BANK(SomethingIsApproachingScript)
	ld hl, SomethingIsApproachingScript
	jp .callscript

.SomethingIsStirringScript
	ld a, BANK(SomethingIsStirringScript)
	ld hl, SomethingIsStirringScript
.callscript
	call CallScript
	scf
	ld hl, wCycleProgress ;set it to 0 so that the messages aren't triggered multiple times
	ld [hl], 0
.nope
	ret

SomethingIsStirringScript:
	opentext
	writetext .SomethingIsStirringtext
	waitbutton
	closetext
	end

.SomethingIsStirringtext
	text_jump SomethingIsStirringText
	db "@"

SomethingIsApproachingScript:
	opentext
	writetext .SomethingIsApproachingtext
	waitbutton
	closetext
	end

.SomethingIsApproachingtext
	text_jump SomethingIsApproachingText
	db "@"

ItsGettingCloserScript:
	opentext
	writetext .ItsGettingClosertext
	waitbutton
	closetext
	end

.ItsGettingClosertext
	text_jump ItsGettingCloserText
	db "@"

ItsRightNearScript:
	opentext
	writetext .ItsRightNeartext
	;farcall _SaveGameData
	waitbutton
	closetext
	end

.ItsRightNeartext
	text_jump ItsRightNearText
	db "@"
