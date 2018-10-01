_TitleScreen:
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1



	xor a
	ldh [hBGMapMode], a

	ld a, $1
	ldh [rVBK], a
	ld hl, TitleShrinePalsTilemap
	debgcoord 0, 0
	call Title_DecompressRequest2bpp_64Tiles

	ld a, $0
	ldh [rVBK], a

	ld hl, TitleBackgroundGFX
	ld de, vTiles2 tile $00
	call Title_DecompressRequest2bpp_128Tiles

	ld hl, TitleShrineTilemap
	debgcoord 0, 0
	call Title_DecompressRequest2bpp_64Tiles

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, TitlePalette1
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes

	ld hl, TitlePalette1
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes

	pop af
	ldh [rSVBK], a

	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	call Title_ResetLYOverrides
	call Title_SetCGBPalUpdate
	xor a


; Reset audio


; Play starting sound effect
	ld de, SFX_INTRO_SUICUNE_2
	call PlaySFX

	ret

Title_DecompressRequest2bpp_128Tiles:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $80
	call Request2bpp

	pop af
	ldh [rSVBK], a
	ret

Title_DecompressRequest2bpp_64Tiles:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $40
	call Request2bpp

	pop af
	ldh [rSVBK], a
	ret

Title_ResetLYOverrides:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a

	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	xor a
	call ByteFill

	pop af
	ldh [rSVBK], a
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	ret


Title_RustleGrass:
	ld a, [wIntroSceneFrameCounter]
	cp 36
	ret nc
	and $c     ;$c is 12
	srl a
	ld e, a
	ld d, $0
	ld hl, .TitleRustlingGrassPointers
	add hl, de
	ld a, [hli]
	ld [wRequested2bppSource], a
	ld a, [hli]
	ld [wRequested2bppSource + 1], a
	ld a, LOW(vTiles2 tile $09)
	ld [wRequested2bppDest], a
	ld a, HIGH(vTiles2 tile $09)
	ld [wRequested2bppDest + 1], a
	ld a, 4
	ld [wRequested2bppSize], a
	ret

.TitleRustlingGrassPointers:
	dw TitleGrass1GFX
	dw TitleGrass2GFX
	dw TitleGrass3GFX
	dw TitleGrass2GFX

Title_SetCGBPalUpdate:
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

TwinkleTitleStars::
	;call Title_RustleGrass
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp 20
	jr z, .next
	cp 40
	jr z, .next
	cp 60
	jr z, .next
	cp 80
	ret nz
	ld hl, wIntroSceneFrameCounter
	xor a
	ld [hl], a
.next
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	call choosetwinkle

	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

choosetwinkle:
	ld a, 9
	call RandomRange
	cp 0
	jr z, .StarsPalette1
	cp 1
	jr z, .StarsPalette2
	cp 2
	jr z, .StarsPalette3
	cp 3
	jr z, .StarsPalette4
	cp 4
	jr z, .StarsPalette5
	cp 5
	jr z, .StarsPalette6
	ret
.StarsPalette1
	ld hl, TitleStarsPalette1
	ld de, wBGPals1
	ld bc, 1 palettes
	call CopyBytes

	ld hl, TitleStarsPalette1
	ld de, wBGPals2
	ld bc, 1 palettes
	call CopyBytes
	ret

.StarsPalette2
	ld hl, TitleStarsPalette2
	ld de, wBGPals1
	ld bc, 1 palettes
	call CopyBytes

	ld hl, TitleStarsPalette2
	ld de, wBGPals2
	ld bc, 1 palettes
	call CopyBytes
	ret

.StarsPalette3
	ld hl, TitleStarsPalette3
	ld de, wBGPals1
	ld bc, 1 palettes
	call CopyBytes

	ld hl, TitleStarsPalette3
	ld de, wBGPals2
	ld bc, 1 palettes
	call CopyBytes
	ret

.StarsPalette4
	ld hl, TitleStarsPalette4
	ld de, wBGPals1
	ld bc, 1 palettes
	call CopyBytes

	ld hl, TitleStarsPalette4
	ld de, wBGPals2
	ld bc, 1 palettes
	call CopyBytes
	ret

.StarsPalette5
	ld hl, TitleStarsPalette5
	ld de, wBGPals1
	ld bc, 1 palettes
	call CopyBytes

	ld hl, TitleStarsPalette5
	ld de, wBGPals2
	ld bc, 1 palettes
	call CopyBytes
	ret

.StarsPalette6
	ld hl, TitleStarsPalette6
	ld de, wBGPals1
	ld bc, 1 palettes
	call CopyBytes

	ld hl, TitleStarsPalette6
	ld de, wBGPals2
	ld bc, 1 palettes
	call CopyBytes
	ret

TitleBackgroundGFX:
INCBIN "gfx/intro/background.2bpp.lz"

TitleShrineTilemap:
INCBIN "gfx/title/shrine.tilemap.lz"

TitleShrinePalsTilemap:
INCBIN "gfx/title/shrinepals.tilemap.lz"

TitlePalette1:
INCLUDE "gfx/title/intro_1.pal"

TitleStarsPalette1:
	RGB 31, 31, 31
	RGB 25, 25, 25
	RGB 20, 20, 20
	RGB  4,  1, 12 

TitleStarsPalette2:
	RGB 20, 20, 20
	RGB 31, 31, 31
	RGB 25, 25, 25
	RGB  4,  1, 12 	

TitleStarsPalette3:
	RGB 25, 25, 25
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB  4,  1, 12 	

TitleStarsPalette4:
	RGB 20, 20, 20
	RGB 31, 31, 31
	RGB 25, 25, 25
	RGB  4,  1, 12 

TitleStarsPalette5:
	RGB 20, 20, 20
	RGB 25, 25, 25
	RGB 31, 31, 31
	RGB  4,  1, 12 	

TitleStarsPalette6:
	RGB 20, 20, 20
	RGB 20, 20, 20
	RGB 20, 20, 20
	RGB  4,  1, 12 	

TitleGrass1GFX:
INCBIN "gfx/title/grass1.2bpp"
TitleGrass2GFX:
INCBIN "gfx/title/grass2.2bpp"
TitleGrass3GFX:
INCBIN "gfx/title/grass3.2bpp"
TitleGrass4GFX:
INCBIN "gfx/title/grass4.2bpp"

