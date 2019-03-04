; Functions relating to the timer interrupt and the real-time-clock.

TimeOfDayPals:: ; 47e
	farjp _TimeOfDayPals
; 485

UpdateTimePals:: ; 485
	farjp _UpdateTimePals
; 48c

UpdateTime:: ; 5a7
	call GetClock ; read the clock hardware
	farjp GetTimeOfDay
; 5b7

GetClock:: ; 5b7
; store clock data in hRTCDayHi-hRTCSeconds
	ld hl, wNoRTC
	ld de, hRTCDayHi
	ld bc, 5
	rst CopyBytes
	ret
; 5e8

SetTimeOfDay:: ; 658
	xor a
	ld [wStringBuffer2], a
	ld [wStringBuffer2 + 3], a
	jr InitTime

SetDayOfWeek:: ; 663
	call UpdateTime
	ld a, [hHours]
	ld [wStringBuffer2 + 1], a
	ld a, [hMinutes]
	ld [wStringBuffer2 + 2], a
	ld a, [hSeconds]
	ld [wStringBuffer2 + 3], a

InitTime:: ; 677
	farjp _InitTime
; 67e

