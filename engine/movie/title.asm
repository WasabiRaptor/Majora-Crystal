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
	ld de, SFX_TITLE_SCREEN_ENTRANCE
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

Title_DecompressRequest2bpp_255Tiles:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $ff
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

Title_SetCGBPalUpdate:
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

TitleSuicuneRunGFX:
INCBIN "gfx/intro/suicune_run.2bpp.lz"

TitlePichuWooperGFX:
INCBIN "gfx/intro/pichu_wooper.2bpp.lz"

TitleBackgroundGFX:
INCBIN "gfx/intro/background.2bpp.lz"

TitleShrineTilemap:
INCBIN "gfx/title/shrine.tilemap.lz"

TitleShrinePalsTilemap:
INCBIN "gfx/title/shrinepals.tilemap.lz"

TitlePalette1:
INCLUDE "gfx/intro/intro_1.pal"

