; Functions relating to the timer interrupt and the real-time-clock.

LatchClock::
; latch clock counter data
	ld a, 0
	ld [MBC3LatchClock], a
	ld a, 1
	ld [MBC3LatchClock], a
	ret

UpdateTime::
	;call FixDays
	;call FixTime
	farcall GetTimeOfDay
	ret




InitTimeOfDay::
	xor a
	ld [wStringBuffer2], a
	ld a, $0 ; useless
	ld [wStringBuffer2 + 3], a
	jr InitTime

InitDayOfWeek::
	call UpdateTime
	ldh a, [hHours]
	ld [wStringBuffer2 + 1], a
	ldh a, [hMinutes]
	ld [wStringBuffer2 + 2], a
	ldh a, [hSeconds]
	ld [wStringBuffer2 + 3], a
	jr InitTime ; useless

InitTime::
	farcall _InitTime
	ret

PanicResetClock::
	call .ClearhRTC
	call SetClock
	ret

.ClearhRTC:
	xor a
	ldh [hRTCSeconds], a
	ldh [hRTCMinutes], a
	ldh [hRTCHours], a
	ldh [hRTCDayLo], a
	ldh [hRTCDayHi], a
	ret

SetClock::
; set clock data from hram

; enable clock r/w
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a

; set clock data
; stored 'backwards' in hram

	call LatchClock
	ld hl, MBC3SRamBank
	ld de, MBC3RTC

; seems to be a halt check that got partially commented out
; this block is totally pointless
	ld [hl], RTC_DH
	ld a, [de]
	bit 6, a ; halt
	ld [de], a

; seconds
	ld [hl], RTC_S
	ldh a, [hSeconds]
	ld [de], a
; minutes
	ld [hl], RTC_M
	ldh a, [hMinutes]
	ld [de], a
; hours
	ld [hl], RTC_H
	ldh a, [hHours]
	ld [de], a
; day lo
	ld [hl], RTC_DL
	ldh a, [hRTCDayLo]
	ld [de], a
; day hi
	ld [hl], RTC_DH
	ldh a, [hRTCDayHi]
	res 6, a ; make sure timer is active
	ld [de], a

; cleanup
	call CloseSRAM ; unlatch clock, disable clock r/w
	ret

ClearRTCStatus::
; clear sRTCStatusFlags
	xor a
	push af
	ld a, BANK(sRTCStatusFlags)
	call GetSRAMBank
	pop af
	ld [sRTCStatusFlags], a
	call CloseSRAM
	ret

RecordRTCStatus::
; append flags to sRTCStatusFlags
	ld hl, sRTCStatusFlags
	push af
	ld a, BANK(sRTCStatusFlags)
	call GetSRAMBank
	pop af
	or [hl]
	ld [hl], a
	call CloseSRAM
	ret

CheckRTCStatus::
; check sRTCStatusFlags
	ld a, BANK(sRTCStatusFlags)
	call GetSRAMBank
	ld a, [sRTCStatusFlags]
	call CloseSRAM
	ret
