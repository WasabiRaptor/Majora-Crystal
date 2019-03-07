InitClock: ; 90672 (24:4672)
; Ask the player to set the time.
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a

	xor a
	ld [wSpriteUpdatesEnabled], a
	ld a, $10
	ld [wMusicFade], a
	ld a, MUSIC_NONE % $100
	ld [wMusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [wMusicFadeIDHi], a
	ld c, 8
	call DelayFrames
	call RotateFourPalettesLeft
	call ClearTileMap
	call ClearSprites
	ld b, CGB_DIPLOMA
	call GetCGBLayout
	xor a
	ld [hBGMapMode], a
	call LoadStandardFont
	ld de, TimesetBackgroundGFX
	ld hl, VTiles2 tile $00
	lb bc, BANK(TimesetBackgroundGFX), 1
	call Request1bpp
	call .ClearScreen
	call ApplyTilemapInVBlank
	call RotateFourPalettesRight
if !DEF(DEBUG)
	ld hl, Text_WokeUpOak
	call PrintText
endc
	ld hl, wTimesetBuffer
	ld bc, 50
	xor a
	call ByteFill
	ld a, $a
	ld [wInitHourBuffer], a

.loop
	ld hl, Text_WhatTimeIsIt
	call PrintText
	hlcoord 3, 7
	lb bc, 2, 15
	call TextBox
	hlcoord 11, 7
	ld [hl], "▲"
	hlcoord 11, 10
	ld [hl], "▼"
	hlcoord 4, 9
	call DisplayHourOClock
	ld c, 10
	call DelayFrames

.SetHourLoop:
	call JoyTextDelay
	call SetHour
	jr nc, .SetHourLoop

	ld a, [wInitHourBuffer]
	ld [wStringBuffer2 + 1], a
	call .ClearScreen
	ld hl, Text_WhatHrs
	call PrintText
	call YesNoBox
	jr nc, .HourIsSet
	call .ClearScreen
	jr .loop

.HourIsSet:
	ld hl, Text_HowManyMinutes
	call PrintText
	hlcoord 11, 7
	lb bc, 2, 7
	call TextBox
	hlcoord 15, 7
	ld [hl], "▲"
	hlcoord 15, 10
	ld [hl], "▼"
	hlcoord 12, 9
	call DisplayMinutesWithMinString
	ld c, 10
	call DelayFrames

.SetMinutesLoop:
	call JoyTextDelay
	call SetMinutes
	jr nc, .SetMinutesLoop

	ld a, [wInitMinuteBuffer]
	ld [wStringBuffer2 + 2], a
	call .ClearScreen
	ld hl, Text_WhoaMins
	call PrintText
	call YesNoBox
	jr nc, .MinutesAreSet
	call .ClearScreen
	jr .HourIsSet

.MinutesAreSet:
	ld hl, OakText_ResponseToSetTime
	call PrintText
	call WaitPressAorB_BlinkCursor
	pop af
	ld [hInMenu], a
	ret

.ClearScreen: ; 90783 (24:4783)
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ld a, $1
	ld [hBGMapMode], a
	ret

SetHour: ; 90795 (24:4795)
	ld a, [hJoyPressed]
	and A_BUTTON
	jr nz, .Confirm

	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	call DelayFrame
	and a
	ret

.down
	ld hl, wInitHourBuffer
	ld a, [hl]
	and a
	jr nz, .DecreaseThroughMidnight
	ld a, 23 + 1
.DecreaseThroughMidnight:
	dec a
	ld [hl], a
	jr .okay

.up
	ld hl, wInitHourBuffer
	ld a, [hl]
	cp 23
	jr c, .AdvanceThroughMidnight
	ld a, -1
.AdvanceThroughMidnight:
	inc a
	ld [hl], a

.okay
	hlcoord 4, 9
	ld a, " "
	ld bc, 15
	call ByteFill
	hlcoord 4, 9
	call DisplayHourOClock
	call ApplyTilemapInVBlank
	and a
	ret

.Confirm:
	scf
	ret

DisplayHourOClock: ; 907de (24:47de)
	push hl
	ld a, [wInitHourBuffer]
	ld c, a
	ld e, l
	ld d, h
	call PrintHour
	inc hl
	ld de, String_oclock
	call PlaceString
	pop hl
	ret
; 907f1 (24:47f1)

SetMinutes: ; 90810 (24:4810)
	ld a, [hJoyPressed]
	and A_BUTTON
	jr nz, .a_button
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	call DelayFrame
	and a
	ret

.d_down
	ld hl, wInitMinuteBuffer
	ld a, [hl]
	and a
	jr nz, .decrease
	ld a, 59 + 1
.decrease
	dec a
	ld [hl], a
	jr .finish_dpad

.d_up
	ld hl, wInitMinuteBuffer
	ld a, [hl]
	cp 59
	jr c, .increase
	ld a, -1
.increase
	inc a
	ld [hl], a
.finish_dpad
	hlcoord 12, 9
	ld a, " "
	ld bc, 7
	call ByteFill
	hlcoord 12, 9
	call DisplayMinutesWithMinString
	call ApplyTilemapInVBlank
	and a
	ret
.a_button
	scf
	ret

DisplayMinutesWithMinString: ; 90859 (24:4859)
	ld de, wInitMinuteBuffer
	call PrintTwoDigitNumberRightAlign
	inc hl
	ld de, String_min
	jp PlaceString

PrintTwoDigitNumberRightAlign: ; 90867 (24:4867)
	push hl
	ld a, " "
	ld [hli], a
	ld [hl], a
	pop hl
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	jp PrintNum
; 90874 (24:4874)

Text_WokeUpOak: ; 0x90874
	; Zzz… Hm? Wha…? You woke me up! Will you check the clock for me?
	text_jump UnknownText_0x1bc29c
	db "@"
; 0x90879

Text_WhatTimeIsIt: ; 0x90879
	; What time is it?
	text_jump UnknownText_0x1bc2eb
	db "@"
; 0x9087e

String_oclock:
	db "o'clock@"
; 90886

Text_WhatHrs: ; 0x90886
	; What?@ @
	text_jump UnknownText_0x1bc2fd
	start_asm
	hlcoord 1, 16
	call DisplayHourOClock
	ld hl, .QuestionMark
	ret
; 90895 (24:4895)

.QuestionMark: ; 0x90895
	; ?
	text_jump UnknownText_0x1bc305
	db "@"
; 0x9089a

Text_HowManyMinutes: ; 0x9089a
	; How many minutes?
	text_jump UnknownText_0x1bc308
	db "@"
; 0x9089f

String_min:
	db "min.@"
; 908a4

Text_WhoaMins: ; 0x908a4
	; Whoa!@ @
	text_jump UnknownText_0x1bc31b
	start_asm
	hlcoord 7, 14
	call DisplayMinutesWithMinString
	ld hl, .QuestionMark
	ret
; 908b3 (24:48b3)

.QuestionMark: ; 0x908b3
	; ?
	text_jump UnknownText_0x1bc323
	db "@"
; 0x908b8

OakText_ResponseToSetTime: ; 0x908b8
	start_asm
	decoord 1, 14
	ld a, [wInitHourBuffer]
	ld c, a
	call PrintHour
	ld [hl], ":"
	inc hl
	ld de, wInitMinuteBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld b, h
	ld c, l
	ld a, [wInitHourBuffer]
	cp MORN_HOUR
	jr c, .NITE
	cp DAY_HOUR
	jr c, .MORN
	cp NITE_HOUR
	jr c, .DAY
.NITE:
	ld hl, .sodark
	ret
.MORN:
	ld hl, .overslept
	ret
.DAY:
	ld hl, .yikes
	ret
; 908ec (24:48ec)

.overslept ; 0x908ec
	; ! I overslept!
	text_jump UnknownText_0x1bc326
	db "@"
; 0x908f1

.yikes ; 0x908f1
	; ! Yikes! I over- slept!
	text_jump UnknownText_0x1bc336
	db "@"
; 0x908f6

.sodark ; 0x908f6
	; ! No wonder it's so dark!
	text_jump UnknownText_0x1bc34f
	db "@"
; 0x908fb

TimesetBackgroundGFX: ; 908fb
INCBIN "gfx/new_game/timeset_bg.1bpp"

PrintHour: ; 90b3e (24:4b3e)
	ld l, e
	ld h, d
	push bc
	call GetTimeOfDayString
	call PlaceString
	ld l, c
	ld h, b
	inc hl
	pop bc
	call AdjustHourForAMorPM
	ld [wd265], a
	ld de, wd265
	jp PrintTwoDigitNumberRightAlign

GetTimeOfDayString: ; 90b58 (24:4b58)
	ld a, c
	cp MORN_HOUR
	jr c, .nite
	cp DAY_HOUR
	jr c, .morn
	cp NITE_HOUR
	jr c, .day
.nite
	ld de, .NITE
	ret
.morn
	ld de, .MORN
	ret
.day
	ld de, .DAY
	ret
; 90b71 (24:4b71)

.NITE: db "Nite@"
.MORN: db "Morn@"
.DAY: db "Day@"
; 90b7f

AdjustHourForAMorPM:
; Convert the hour stored in c (0-23) to a 1-12 value
	ld a, [wOptions2]
	bit CLOCK_FORMAT, a
	ld a, c
	ret nz
	or a
	jr z, .midnight
	cp 12
	ret c
	ret z
	sub 12
	ret

.midnight
	ld a, 12
	ret

PrintHoursMins ; 1dd6bb (77:56bb)
; Hours in b, minutes in c
	ld a, [wOptions2]
	bit CLOCK_FORMAT, a
	ld a, b
	jr nz, .h24
	cp 12
	push af
	jr c, .AM
	jr z, .PM
	sub 12
	jr .PM
.AM:
	or a
	jr nz, .PM
	ld a, 12
.PM:
	ld b, a
.h24:
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
	ld a, [wOptions2]
	bit CLOCK_FORMAT, a
	ret nz
	ld de, .String_AM
	pop af
	jr c, .place_am_pm
	ld de, .String_PM
.place_am_pm
	inc hl
	jp PlaceString

.String_AM: db "AM@" ; 1dd6fc
.String_PM: db "PM@" ; 1dd6ff
