ResetGameTime::
	xor a
	ld [wGameTimeCap], a
	ld [wGameTimeHours], a
	ld [wGameTimeHours + 1], a
	ld [wGameTimeMinutes], a
	ld [wGameTimeSeconds], a
	ld [wGameTimeFrames], a
	ret

GameTimer::
	nop

	ldh a, [rSVBK]
	push af
	ld a, BANK(wGameTime)
	ldh [rSVBK], a

	call UpdateGameTimer

	pop af
	ldh [rSVBK], a
	ret

UpdateGameTimer::
; Increment the game timer by one frame.
; The game timer is capped at 999:59:59.00.

; Don't update if game logic is paused.
	ld a, [wGameLogicPaused]
	and a
	ret nz

; Is the timer paused?
	ld hl, wGameTimerPause
	bit GAMETIMERPAUSE_TIMER_PAUSED_F, [hl]
	ret z

;check if out of time and skip if time is up
	ld hl, wCurDay
	ld a, [hl]

	cp 7 ;about 2.8 hours/ingame week 
	jr nc, .SkipAcceleratingTime

;accelerate the ingame time
	ld hl, hSeconds
	ld a, [hl]
	inc a

	cp 60 ; frames/ingame minute
	jr nc, .ingameMinute
	ld [hl], a

.SkipAcceleratingTime
; Is the timer already capped?
	ld hl, wGameTimeCap
	bit 0, [hl]
	ret nz

; +1 frame
	ld hl, wGameTimeFrames
	ld a, [hl]
	inc a

	cp 60 ; frames/second
	jr nc, .second

	ld [hl], a
	ret

.ingameMinute
	xor a
	ld [hl], a

	ld hl, hMinutes
	ld a, [hl]
	inc a

	;just add some more 'inc a' here if you need to speed up the clock for testing purposes but make sure its a factor of 60

	cp 60 ;seconds/ingame hour
	jr nc, .ingameHour
	ld [hl], a
	ret

.ingameHour
	xor a
	ld [hl], a

	ld hl, hHours
	ld a, [hl]
	inc a

	cp 24 ;minutes/ingame day
	jr nc, .ingameDay
	ld [hl], a

	;check some time based things hopefully, this might be where the issues are
	ld hl, wCurDay
	ld a, [hl]

	cp SATURDAY 
	jr z, .FinalDay	
	ret

.FinalDay
	ld hl, hHours
	ld a, [hl]
	cp 18
	jr z, .ItsGettingCloser 

	cp 12
	jr z, .SomethingIsApproaching

	cp 6
	jr z, .SomethingIsStirring
	ret

.ingameDay
	xor a
	ld [hl], a

	ld hl, wCurDay
	ld a, [hl]
	inc a
	ld [hl], a
	call DayCheck
	ret

.second
	xor a
	ld [hl], a

; +1 second
	ld hl, wGameTimeSeconds
	ld a, [hl]
	inc a

	cp 60 ; seconds/minute
	jr nc, .minute

	ld [hl], a
	ret

.minute
	xor a
	ld [hl], a

; +1 minute
	ld hl, wGameTimeMinutes
	ld a, [hl]
	inc a

	cp 60 ; minutes/hour
	jr nc, .hour

	ld [hl], a
	ret

.hour
	xor a
	ld [hl], a

; +1 hour
	ld a, [wGameTimeHours]
	ld h, a
	ld a, [wGameTimeHours + 1]
	ld l, a
	inc hl

; Cap the timer after 1000 hours.
	ld a, h
	cp HIGH(1000)
	jr c, .ok

	ld a, l
	cp LOW(1000)
	jr c, .ok

	ld hl, wGameTimeCap
	set 0, [hl]

	ld a, 59 ; 999:59:59.00
	ld [wGameTimeMinutes], a
	ld [wGameTimeSeconds], a
	ret

.ok
	ld a, h
	ld [wGameTimeHours], a
	ld a, l
	ld [wGameTimeHours + 1], a
	ret

.SomethingIsStirring
	ld hl, wCycleProgress
	ld [hl], 4
	ret
.SomethingIsApproaching
	ld hl, wCycleProgress
	ld [hl], 3
	ret
.ItsGettingCloser
	ld hl, wCycleProgress
	ld [hl], 2
	ret

DayCheck:
	cp 7 ;use weekdays in allcaps or 0-6 here to test for actual days, if its 7 that means time is up
	jr nc, .ItsRightNear

	cp MONDAY
	jr z, .SecondDay

	cp TUESDAY
	jr z, .ThirdDay

	cp WEDNESDAY
	jr z, .FourthDay

	cp THURSDAY
	jr z, .FifthDay

	cp FRIDAY
	jr z, .SixthDay

	cp SATURDAY
	jr z, .SeventhDay
	ret
;these should correspond to things in endofcycle.asm that get checked upon a footstep
.SecondDay
	ld hl, wCycleProgress
	ld [hl], 10
	ret
.ThirdDay
	ld hl, wCycleProgress
	ld [hl], 9
	ret
.FourthDay
	ld hl, wCycleProgress
	ld [hl], 8
	ret
.FifthDay
	ld hl, wCycleProgress
	ld [hl], 7
	ret
.SixthDay
	ld hl, wCycleProgress
	ld [hl], 6
	ret
.SeventhDay
	ld hl, wCycleProgress
	ld [hl], 5
	ret

.ItsRightNear
	ld hl, wCycleProgress
	ld [hl], 1
	ret
