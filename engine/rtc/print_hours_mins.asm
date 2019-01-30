PrintHoursMins:
; Hours in b, minutes in c
	ld a, b
	cp 12
	push af
	jr c, .AM
	jr z, .PM
	ld a, [wOptions2]
	bit MILITARY_TIME, a
	ld a, b
	jr z, .PM
	sub 12
	jr .PM
.AM:
	or a
	jr nz, .PM
	ld a, 12
	ld a, [wOptions2]
	bit MILITARY_TIME, a
	jr nz, .PM
	ld a, 24
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
	bit MILITARY_TIME, a
	jr nz, .not_24_hours
	ld de, String_24_Hours
.not_24_hours
	inc hl
	call PlaceString
	ret

String_AM: db "AM@"
String_PM: db "PM@"
String_24_Hours: db "@"
