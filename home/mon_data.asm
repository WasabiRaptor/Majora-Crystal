Unreferenced_GetNthMove::
	ld hl, wListMoves_MoveIndicesBuffer
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ret

GetBaseData::
	predef GetFormData
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

	cp VULPIX
	jr z, .vulpix
	cp NINETALES
	jr z, .ninetales


	ld a, BANK(BaseData)
	rst Bankswitch
; Get BaseData
	dec a
	ld hl, BaseData
.got_base_data
	call AddNTimes
	ld de, wCurBaseData
	ld bc, BASE_DATA_SIZE
	call CopyBytes
	jr .end	

.vulpix
	ld a, BANK(VulpixBaseData)
	rst Bankswitch
	ld a, [wFormVariable]
	dec a
	ld hl, VulpixBaseData
	jr .got_base_data
.ninetales
	ld a, BANK(NinetalesBaseData)
	rst Bankswitch
	ld a, [wFormVariable]
	dec a
	ld hl, NinetalesBaseData
	jr .got_base_data

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
