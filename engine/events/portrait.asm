Portrait::
	ld hl, PortraitMenuHeader
	call CopyMenuHeader
	call MenuBox
	call UpdateSprites
	call ApplyTilemap
	
	;this will be a scriptbyte once I know it works
	ld a, 3 
	
	;this gets overwritten with the pokemon thats needed every time it is pulled, so I'm just using it here to hold the thing for later
	ld [wCurSpecies], a 

	;stole this from the part that loads trainer frontpic palettes, its the same between polished crystal and normal crystal
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, PortraitPalettes ;changed this of course
	add hl, bc

	;this block I stole from how polished crystal loads trainer pics in its pokepic command, since that one actually has color unlike the one in base crystal

	ld a, $5
	ld de, wBGPals1 palette PAL_BG_TEXT + 2
	ld bc, 4
	call FarCopyWRAM 
	call UpdateTimePals



	;everything below here loads the pic in a similar way to how pokemon pics are loaded, but doesn't force the grayscale pal and is working as intended
	xor a
	ldh [hBGMapMode], a
	ld de, vTiles0 tile $C0
	ldh a, [rSVBK]
	push af
	push de
	ld a, $44
	and $f
	ld b, a
	push bc
	ld a, [wCurSpecies]
	ld hl, PortraitPicPointers
	ld d, BANK(PortraitPicPointers)	
	dec a
	ld bc, 3
	call AddNTimes
	ld a, d
	call GetFarByte
	push af
	inc hl
	ld a, d
	call GetFarHalfword
	pop bc
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
	ld a, b
	ld de, wDecompressScratch
	call FarDecompress	
	pop bc
	pop hl
	push hl
	ld de, wDecompressScratch
	ld c, 4 * 4
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	pop hl
	pop af
	ldh [rSVBK], a
	call CloseSRAM

	ld a, [wMenuBorderTopCoord]
	inc a
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	inc a
	ld c, a
	call Coord2Tile
	ld a, $C0
	ldh [hGraphicStartTile], a
	lb bc, 4, 4
	predef PlaceGraphic
	call WaitBGMap
	ret

.Fill:
	ld [hli], a
	dec c
	jr nz, .Fill
	ret

ClosePortrait::
	ld hl, PortraitMenuHeader
	call CopyMenuHeader
	call ClearMenuBoxInterior
	call WaitBGMap
	call GetMemSGBLayout
	xor a
	ldh [hBGMapMode], a
	call OverworldTextModeSwitch
	call ApplyTilemap
	call UpdateSprites
	call LoadStandardFont
	ret


PortraitMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 7, 5, 12
	dw NULL
	db 1 ; default option




