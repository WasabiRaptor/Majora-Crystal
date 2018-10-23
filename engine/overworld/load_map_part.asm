_LoadMapPart::
	ld hl, wSurroundingTiles
	ld a, [wMetatileStandingY]
	and a
	jr z, .top_row
	ld bc, SURROUNDING_WIDTH * 2
	add hl, bc

.top_row
	ld a, [wMetatileStandingX]
	and a
	jr z, .left_column
	inc hl
	inc hl

.left_column
	decoord 0, 0
	call .copy

	ld hl, wSurroundingAttributes
	ld a, [wMetatileStandingY]
	and a
	jr z, .top_row2
	ld bc, SURROUNDING_WIDTH * 2
	add hl, bc

.top_row2
	ld a, [wMetatileStandingX]
	and a
	jr z, .left_column2
	inc hl
	inc hl

.left_column2
	decoord 0, 0, wAttrMap
	ldh a, [rSVBK]
	push af
	ld a, BANK(wSurroundingAttributes)
	ldh [rSVBK], a
	call .copy
	pop af
	ldh [rSVBK], a
	ret

.copy:
	ld b, SCREEN_HEIGHT
.loop
	ld c, SCREEN_WIDTH
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	ld a, l
	add METATILE_WIDTH
	ld l, a
	jr nc, .carry
	inc h

.carry
	dec b
	jr nz, .loop
	ret
