PrintHoursMins:
; Hours in b, minutes in c
	ld a, b
	cp 12
	push af
	jr c, .AM
	jr z, .PM
	ld a, [wOptions2]
	bit CLOCK_FORMAT, a
	ld a, b
	jr nz, .PM
	sub 12
	jr .PM
.AM:
	or a
	jr nz, .PM
	ld a, [wOptions2]
	bit CLOCK_FORMAT, a
	ld a, 12
	jr z, .PM
	ld a, 0
.PM:
	ld b, a
; Crazy stuff happening with the stack
	push bc
	ld hl, sp+$1
	push de
	push hl
	pop de
	pop hl
	ld [hl], " "
	lb bc, 1, 2
	call PrintNum
	ld [hl], ":"
	inc hl
	ld d, h
	ld e, l
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop bc
	ld de, String_AM
	pop af
	jr c, .place_am_pm
	ld de, String_PM
.place_am_pm
	ld a, [wOptions2]
	bit CLOCK_FORMAT, a
	jr z, .not_24_hours
	ld de, String_24_Hours
.not_24_hours
	inc hl
	call PlaceString
	ret

String_AM: db "AM@"
String_PM: db "PM@"
String_24_Hours: db "@"
