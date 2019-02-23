
GetBaseData::
	push bc
	push de
	push hl
	ldh a, [hROMBank]
	push af

; Egg doesn't have BaseData
	ld a, [wCurSpecies]
	cp EGG
	jr z, .egg
	ld bc, BASE_DATA_SIZE
	push bc
	call GetRelevantBaseData
	pop bc
	ld a, [wCurSpecies]
	jr nc, .notaltform
	ld a, [wAltForm]
.notaltform
	call AddNTimes
	ld de, wCurBaseData
	ld bc, BASE_DATA_SIZE
	call CopyBytes
	jr .end	

.egg
; ????
	ld de, UnknownEggPic

; Sprite dimensions
	ld b, $55 ; 5x5
	ld hl, wBasePicSize

.end
; Replace Pokedex # with species
	ld a, [wCurSpecies]
	ld [wBaseDexNo], a

	pop af
	rst Bankswitch
	pop hl
	pop de
	pop bc
	ret

GetCurNick::
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames

GetNick::
; Get nickname a from list hl.

	push hl
	push bc

	call SkipNames
	ld de, wStringBuffer1

	push de
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop de

	callfar CorrectNickErrors

	pop bc
	pop hl
	ret

GetRelevantBaseData:
; given species in a, return *BaseData in hl and BANK(*BaseData) bankswitch the bank
; returns c for variants, nc for normal species
	ld hl, .BaseDataTable
	ld de, 4
	call IsInArray
	inc hl
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.BaseDataTable:
INCLUDE "data/pokemon/alt_form_base_data_table.asm"
