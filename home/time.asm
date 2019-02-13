; Functions relating to the timer interrupt and the real-time-clock.
TimeOfDayPals::
	callfar _TimeOfDayPals
	ret

UpdateTimePals::
	callfar _UpdateTimePals
	ret

GetTimeOfDay::
; get time of day based on the current hour
	ldh a, [hHours] ; hour
	ld hl, TimesOfDay

.check
; if we're within the given time period,
; get the corresponding time of day
	cp [hl]
	jr c, .match
; else, get the next entry
	inc hl
	inc hl
; try again
	jr .check

.match
; get time of day
	inc hl
	ld a, [hl]
	ld [wTimeOfDay], a
	ret

TimesOfDay:
; hours for the time of day
; 0400-0959 morn | 1000-1759 day | 1800-0359 nite
	db MORN_HOUR, NITE_F
	db DAY_HOUR,  MORN_F
	db NITE_HOUR, DAY_F
	db MAX_HOUR,  NITE_F
	db -1, MORN_F

AskTimer::
	push af
	ldh a, [hMobile]
	and a
	jr z, .not_mobile
	;call Timer

.not_mobile
	pop af
	reti

InitDayOfWeek::
	farcall GetTimeOfDay
	ldh a, [hHours]
	ld [wStringBuffer2 + 1], a
	ldh a, [hMinutes]
	ld [wStringBuffer2 + 2], a
	ldh a, [hSeconds]
	ld [wStringBuffer2 + 3], a
	ret

