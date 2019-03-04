LoadBlindingFlashPalette:: ; 49409
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT
	ld hl, BlindingFlashPalette
	ld bc, 1 palettes
	jp FarCopyWRAM
; 49418

BlindingFlashPalette: ; 49418
	RGB 31, 31, 31
	RGB 08, 19, 28
	RGB 05, 05, 16
	RGB 00, 00, 00

; 49420

LoadSpecialMapPalette: ; 494ac
	GLOBAL GenericMart_BlockData
	call GetMapHeaderTimeOfDayNybble
	cp PALETTE_DARK
	jr nz, .not_dark
	ld a, [wStatusFlags]
	bit 2, a ; Flash
	jp z, .do_nothing
.not_dark

	ld a, [wTileset]

	call GetOvercastIndex
	and a
	ld hl, OvercastBGPalette
	jp .load_eight_time_of_day_bg_palettes

.do_nothing
	and a
	ret
; 494f2

.load_eight_bg_palettes:
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 8 palettes
	call FarCopyWRAM

; replace green with Poké Mart blue for maps using Mart.ablk
	ld a, [wMapBlockDataBank]
	cp BANK(GenericMart_BlockData)
	jr nz, .not_mart
	ld a, [wMapBlockDataPointer]
	cp GenericMart_BlockData % $100
	jr nz, .not_mart
	ld a, [wMapBlockDataPointer + 1]
	cp GenericMart_BlockData / $100
	jr nz, .not_mart
	ld hl, MartBluePalette
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_GREEN
	ld bc, 1 palettes
	call FarCopyWRAM
.not_mart

	scf
	ret

.load_eight_time_of_day_bg_palettes:
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret

OvercastBGPalette:
INCLUDE "gfx/tilesets/bg_tiles_overcast.pal"

OvercastOBPalette:
INCLUDE "gfx/overworld/npc_sprites_overcast.pal"

MartBluePalette:
if !DEF(MONOCHROME)
	RGB 20, 27, 28
	RGB 06, 22, 25
	RGB 04, 17, 19
	RGB 07, 07, 07
else
	MONOCHROME_RGB_FOUR
endc

LinkTrade_Layout_FillBox: ; 49336
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; 49346

InitLinkTradePalMap: ; 49856
	hlcoord 0, 0, wAttrMap
	lb bc, 16, 2
	ld a, $4
	call LinkTrade_Layout_FillBox
	ld a, $3
	ldcoord_a 0, 1, wAttrMap
	ldcoord_a 0, 14, wAttrMap
	hlcoord 2, 0, wAttrMap
	lb bc, 8, 18
	ld a, $5
	call LinkTrade_Layout_FillBox
	hlcoord 2, 8, wAttrMap
	lb bc, 8, 18
	ld a, $6
	call LinkTrade_Layout_FillBox
	hlcoord 0, 16, wAttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $2
	hlcoord 2, 16, wAttrMap
	ld [hli], a
	ld a, $7
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $2
	ld [hl], a
	hlcoord 2, 17, wAttrMap
	ld a, $3
	ld bc, 6
	jp ByteFill
; 49811

LoadLinkTradePalette: ; 49811
	ld a, $5
	ld de, wUnknBGPals palette 2
	ld hl, LinkTradePalette
	ld bc, 6 palettes
	call FarCopyWRAM
	farjp ApplyPals
; 49826

LinkTradePalette:
if !DEF(MONOCHROME)
INCLUDE "gfx/tilesets/link_trade.pal"
else
rept 8
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_LIGHT
	RGB_MONOCHROME_WHITE
endr
endc

LoadSpecialMapOBPalette:
	call GetOvercastIndex
	and a
	jr z, .load_bg_rock_palette
	ld hl, OvercastOBPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknOBPals
	ld bc, 8 palettes
	jp FarCopyWRAM

.load_single_palette:
	ld bc, 1 palettes
.load_ob_palettes:
	ld a, $5
	jp FarCopyWRAM

.load_bg_rock_palette
	ld hl, wUnknBGPals palette PAL_BG_BROWN
.load_rock_palette
	ld de, wUnknOBPals palette PAL_OW_ROCK
	jp .load_single_palette

.get_timeofday_party_mon_palettes:
	ld hl, OverworldPartyMonPalettes
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 3 palettes
	rst AddNTimes
	ret

.load_gray_party_mon_palette:
	call .get_timeofday_party_mon_palettes
	ld de, wUnknOBPals palette PAL_OW_ROCK
	ld bc, 1 palettes
	ld a, $5
	jp FarCopyWRAM

.load_party_mon_palettes:
	call .get_timeofday_party_mon_palettes
	ld de, wUnknOBPals palette PAL_OW_SILVER
	ld bc, 3 palettes
	ld a, $5
	jp FarCopyWRAM


OverworldPartyMonPalettes:
; morn
	RGB 28,31,16, 31,22,10, 13,13,13, 00,00,00 ; gray
	RGB 28,31,16, 31,22,10, 31,10,11, 00,00,00 ; pink
	RGB 28,31,16, 31,22,10, 03,23,21, 00,00,00 ; teal
; day
	RGB 27,31,27, 31,19,10, 13,13,13, 00,00,00 ; gray
	RGB 27,31,27, 31,19,10, 31,10,11, 00,00,00 ; pink
	RGB 27,31,27, 31,19,10, 03,23,21, 00,00,00 ; teal
; nite
	RGB 15,14,24, 16,09,09, 07,07,10, 00,00,00 ; gray
	RGB 15,14,24, 16,09,09, 17,07,08, 00,00,00 ; pink
	RGB 15,14,24, 16,09,09, 02,12,16, 00,00,00 ; teal

