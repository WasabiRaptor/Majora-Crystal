	const_def
	const INCOMPATIBLE
	const SLIGHTLY_COMPATIBLE
	const MODERATELY_COMPATIBLE
	const HIGHLY_COMPATIBLE

	const_def
	const BREEDGEN_MALE
	const BREEDGEN_FEMALE
	const BREEDGEN_GENDERLESS
	const BREEDGEN_DITTO

CheckBreedmonCompatibility: ; 16e1d
	call .CheckBreedingGroupCompatibility
	ld c, INCOMPATIBLE
	jp nc, .done
	ld a, [wBreedMon1Species]
	ld [wCurPartySpecies], a
	ld a, [wBreedMon1Gender]
	ld [wTempMonGender], a
	call .SetGenderData
	ld b, a
	ld a, [wBreedMon2Species]
	ld [wCurPartySpecies], a
	ld a, [wBreedMon2Gender]
	ld [wTempMonGender], a
	call .SetGenderData
	cp b
	ld c, INCOMPATIBLE
	jr z, .done ; both are same gender, both are dittos or both are genderless
	; Check for Ditto
	or b
	bit BREEDGEN_DITTO, a
	jr nz, .breed_ok
	; Check for genderless
	bit BREEDGEN_GENDERLESS, a
	jr nz, .done ; Any mon being genderless is incompatible with non-Ditto

.breed_ok
	ld a, [wBreedMon2Species]
	ld b, a
	ld a, [wBreedMon1Species]
	cp b
	ld c, HIGHLY_COMPATIBLE
	jr z, .compare_ids
	ld c, MODERATELY_COMPATIBLE
.compare_ids
	; Speed up
	ld a, [wBreedMon1ID]
	ld b, a
	ld a, [wBreedMon2ID]
	cp b
	jr nz, .done
	ld a, [wBreedMon1ID + 1]
	ld b, a
	ld a, [wBreedMon2ID + 1]
	cp b
	jr nz, .done
	dec c ; SLIGHTLY_COMPATIBLE

.done
	ld a, c
	ld [wd265], a
	ret
; 16ebc


.CheckBreedingGroupCompatibility: ; 16ed6
; If either mon is in the No Eggs group,
; they are not compatible.
	ld a, [wBreedMon2Species]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseEggGroups]
	cp NO_EGGS * $11
	jr z, .Incompatible

	ld a, [wBreedMon1Species]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseEggGroups]
	cp NO_EGGS * $11
	jr z, .Incompatible

; Ditto is automatically compatible with everything.
; If not Ditto, load the breeding groups into b/c and d/e.
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .Compatible
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseEggGroups]
	push af
	and $f
	ld b, a
	pop af
	and $f0
	swap a
	ld c, a

	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .Compatible
	ld [wCurSpecies], a
	push bc
	call GetBaseData
	pop bc
	ld a, [wBaseEggGroups]
	push af
	and $f
	ld d, a
	pop af
	and $f0
	swap a
	ld e, a

	ld a, d
	cp b
	jr z, .Compatible
	cp c
	jr z, .Compatible

	ld a, e
	cp b
	jr z, .Compatible
	cp c
	jr z, .Compatible

.Incompatible:
	and a
	ret

.Compatible:
	scf
	ret

.SetGenderData:
	ld a, [wCurPartySpecies]
	cp DITTO
	ld a, 1 << BREEDGEN_DITTO
	ret z
	ld a, BREEDMON
	ld [wMonType], a
	push bc
	predef GetGender
	pop bc
	ld a, 1 << BREEDGEN_GENDERLESS
	ret c
	ld a, 1 << BREEDGEN_FEMALE
	ret z
	srl a ; 1 << BREEDGEN_MALE
	ret

; 16f3e

DoEggStep:: ; 16f3e
	; Check if Flame Body/Magma Armor applies
	ld de, wPartySpecies
	ld hl, wPartyMon1Ability
.ability_loop
	ld a, [de]
	inc de
	cp -1
	jr z, .no_ability_bonus
	cp EGG
	jr z, .ability_next
	ld c, a
	ld b, [hl]
	push de
	push hl
	call GetAbility
	pop hl
	pop de
	ld a, b
	ld c, 1
	cp FLAME_BODY
	jr z, .ability_ok
	cp MAGMA_ARMOR
	jr z, .ability_ok
.ability_next
	call .nextpartymon
	jr .ability_loop
.no_ability_bonus
	ld c, 0
.ability_ok
	ld de, wPartySpecies
	ld hl, wPartyMon1Happiness ; Egg cycles when not hatched
.loop
	ld a, [de]
	inc de
	cp -1
	jr z, .done
	cp EGG
	jr nz, .next
	dec [hl]
	jr z, .hatch
	ld a, c
	and a
	jr z, .next
	dec [hl]
	jr nz, .next
.hatch
	ld a, 1
	and a
.done
	ld c, 0 ; TODO: check if this is needed (was done earlier)
	ret

.next
	call .nextpartymon
	jr .loop
.nextpartymon
	push de
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop de
	ret

OverworldHatchEgg:: ; 16f5e
	call RefreshScreen
	call LoadStandardMenuDataHeader
	call HatchEggs
	call ExitAllMenus
	call RestartMapMusic
	jp CloseText
; 16f70

HatchEggs: ; 16f70 (5:6f70)
	ld de, wPartySpecies
	ld hl, wPartyMon1Happiness
	xor a
	ld [wCurPartyMon], a

.loop ; 16f7a (5:6f7a)
	ld a, [de]
	inc de
	cp -1
	ret z

	push de
	push hl
	cp EGG
	jp nz, .next
	ld a, [hl]
	and a
	jp nz, .next
	ld [hl], $78

	push de

	farcall SetEggMonCaughtData
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, [hl]
	ld [wCurPartySpecies], a
	dec a
	call SetSeenAndCaughtMon

	ld a, [wCurPartyMon]
	ld hl, wPartyMon1IsEgg
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, [hl]
	and $ff - IS_EGG_MASK
	ld [hl], a

	ld a, [wCurPartySpecies]
	cp TOGEPI
	jr nz, .nottogepi
	eventflagset EVENT_TOGEPI_HATCHED
.nottogepi

	pop de

	ld a, [wCurPartySpecies]
	dec de
	ld [de], a
	ld [wd265], a
	ld [wCurSpecies], a
	call GetPokemonName
	call GetBaseData
	ld a, [wCurPartyMon]
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	push hl
	ld bc, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	push hl
	ld bc, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [wCurPartyLevel], a
	pop hl
	push hl
	ld bc, MON_STATUS
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	pop hl
	push hl
	ld bc, MON_EVS - 1
	add hl, bc
	ld b, FALSE
	predef CalcPkmnStats
	pop bc
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_HP
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ld hl, MON_ID
	add hl, bc
	ld a, [wPlayerID]
	ld [hli], a
	ld a, [wPlayerID + 1]
	ld [hl], a
	ld a, [wCurPartyMon]
	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, wPlayerName
	rst CopyBytes
	ld hl, .Text_HatchEgg
	call PrintText
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	push de

	ld a, [wInitialOptions]
	bit NUZLOCKE_MODE, a
	jr nz, .alwaysnickname
	ld hl, .Text_NicknameHatchling
	call PrintText
	call YesNoBox
	pop de
	jr c, .nonickname
	jr .yesnickname

.alwaysnickname
	pop de
.yesnickname
	xor a
	ld [wMonType], a
	push de
	ld b, $0 ; pokemon
	farcall NamingScreen
	pop hl
	ld de, wStringBuffer1
	call InitName
	jr .next

.nonickname
	ld hl, wStringBuffer1
	ld bc, PKMN_NAME_LENGTH
	rst CopyBytes

.next ; 1707d (5:707d)
	ld hl, wCurPartyMon
	inc [hl]
	pop hl
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop de
	jp .loop
; 1708b (5:708b)

.Text_HatchEgg: ; 0x1708b
	; Huh? @ @
	text_jump UnknownText_0x1c0db0
	start_asm
	ld hl, wVramState
	res 0, [hl]
	push hl
	push de
	push bc
	ld a, [wCurPartySpecies]
	push af
	call EggHatch_AnimationSequence
	ld hl, .ClearTextbox
	call PrintText
	pop af
	ld [wCurPartySpecies], a
	pop bc
	pop de
	pop hl
	ld hl, .CameOutOfItsEgg
	ret
; 170b0 (5:70b0)

.ClearTextbox: ; 0x170b0
	;
	text_jump UnknownText_0x1c0db8
	db "@"
; 0x170b5

.CameOutOfItsEgg: ; 0x170b5
	; came out of its EGG!@ @
	text_jump UnknownText_0x1c0dba
	db "@"
; 0x170ba

.Text_NicknameHatchling: ; 0x170ba
	; Give a nickname to @ ?
	text_jump UnknownText_0x1c0dd8
	db "@"
; 0x170bf

InitEggMoves: ; 170bf
	call GetHeritableMoves
	ld d, h
	ld e, l
	ld b, NUM_MOVES
.loop
	ld a, [de]
	and a
	ret z

	ld hl, wEggMonMoves
	ld c, NUM_MOVES
.next
	ld a, [de]
	cp [hl]
	jr z, .skip
	inc hl
	dec c
	jr nz, .next
	call GetEggMove
	jr nc, .skip
	call LoadEggMove

.skip
	inc de
	dec b
	jr nz, .loop
	ret
; 170e4

GetEggMove: ; 170e4

	push bc
	ld a, [wEggMonSpecies]
	dec a
	ld c, a
	ld b, 0
	ld hl, EggMovePointers
	add hl, bc
	add hl, bc
	ld a, BANK(EggMovePointers)
	call GetFarHalfword
.loop
	ld a, BANK("Egg Moves")
	call GetFarByte
	cp -1
	jr z, .reached_end
	ld b, a
	ld a, [de]
	cp b
	jr z, .done_carry
	inc hl
	jr .loop

.reached_end
	call GetBreedmonMovePointer
	ld b, NUM_MOVES
.loop2
	ld a, [de]
	cp [hl]
	jr z, .found_eggmove
	inc hl
	dec b
	jr z, .inherit_tmhm
	jr .loop2

.found_eggmove
	ld a, [wEggMonSpecies]
	dec a
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
.loop3
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr nz, .loop3
.loop4
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	and a
	jr z, .inherit_tmhm
	inc hl
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	ld b, a
	ld a, [de]
	cp b
	jr z, .done_carry
	inc hl
	jr .loop4

.inherit_tmhm
	ld hl, TMHMMoves
.loop5
	ld a, BANK(TMHMMoves)
	call GetFarByte
	inc hl
	and a
	jr z, .done
	ld b, a
	ld a, [de]
	cp b
	jr nz, .loop5
	ld [wPutativeTMHMMove], a
	predef CanLearnTMHMMove
	ld a, c
	and a
	jr z, .done

.done_carry
	pop bc
	scf
	ret

.done
	pop bc
	and a
	ret
; 17169

LoadEggMove: ; 17169
	push de
	push bc
	ld a, [de]
	ld b, a
	ld hl, wEggMonMoves
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	and a
	jr z, .done
	dec c
	jr nz, .loop
	ld de, wEggMonMoves
	ld hl, wEggMonMoves + 1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a

.done
	dec hl
	ld [hl], b
	ld hl, wEggMonMoves
	ld de, wEggMonPP
	predef FillPP
	pop bc
	pop de
	ret
; 17197

GetHeritableMoves: ; 17197
	ld hl, wBreedMon2Moves
	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .ditto1
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .ditto2
	ld a, [wBreedMotherOrNonDitto]
	and a
	ret z
	ld hl, wBreedMon1Moves
	ret

.ditto1
	ld a, [wCurPartySpecies]
	push af
	ld a, [wBreedMon2Species]
	ld [wCurPartySpecies], a
	ld a, [wBreedMon2Gender]
	ld [wTempMonGender], a
	ld a, [wBreedMon2DVs]
	ld [wTempMonDVs], a
	ld a, [wBreedMon2DVs + 1]
	ld [wTempMonDVs + 1], a
	ld a, BREEDMON
	ld [wMonType], a
	predef GetGender
	jr c, .inherit_mon2_moves
	jr nz, .inherit_mon2_moves
	jr .inherit_mon1_moves

.ditto2
	ld a, [wCurPartySpecies]
	push af
	ld a, [wBreedMon1Species]
	ld [wCurPartySpecies], a
	ld a, [wBreedMon1Gender]
	ld [wTempMonGender], a
	ld a, [wBreedMon1DVs]
	ld [wTempMonDVs], a
	ld a, [wBreedMon1DVs + 1]
	ld [wTempMonDVs + 1], a
	ld a, BREEDMON
	ld [wMonType], a
	predef GetGender
	jr c, .inherit_mon1_moves
	jr nz, .inherit_mon1_moves

.inherit_mon2_moves
	ld hl, wBreedMon2Moves
	pop af
	ld [wCurPartySpecies], a
	ret

.inherit_mon1_moves
	ld hl, wBreedMon1Moves
	pop af
	ld [wCurPartySpecies], a
	ret
; 1720b

GetBreedmonMovePointer: ; 1720b
	ld hl, wBreedMon1Moves
	ld a, [wBreedMon1Species]
	cp DITTO
	ret z
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .ditto
	ld a, [wBreedMotherOrNonDitto]
	and a
	ret z

.ditto
	ld hl, wBreedMon2Moves
	ret
; 17224


GetEggFrontpic: ; 17224 (5:7224)
	push de
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Form
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	predef GetVariant
	pop de
	predef_jump GetFrontpic

GetHatchlingFrontpic: ; 1723c (5:723c)
	push de
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Form
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	predef GetVariant
	pop de
	predef_jump FrontpicPredef

Hatch_UpdateFrontpicBGMapCenter: ; 17254 (5:7254)
	push af
	call WaitTop
	push hl
	push bc
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	pop bc
	pop hl
	ld a, b
	ld [hBGMapAddress + 1], a
	ld a, c
	ld [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	pop af
	call Hatch_LoadFrontpicPal
	call SetPalettes
	jp ApplyAttrAndTilemapInVBlank

EggHatch_DoAnimFrame: ; 1727f (5:727f)
	push hl
	push de
	push bc
	farcall PlaySpriteAnimations
	call DelayFrame
	pop bc
	pop de
	pop hl
	ret

EggHatch_AnimationSequence: ; 1728f (5:728f)
	ld a, [wd265]
	ld [wJumptableIndex], a
	ld a, [wCurSpecies]
	push af
	ld de, MUSIC_NONE
	call PlayMusic
	farcall BlankScreen
	call DisableLCD
	ld hl, EggHatchGFX
	ld de, VTiles0 tile $00
	ld bc, $20
	ld a, BANK(EggHatchGFX)
	call FarCopyBytes
	farcall ClearSpriteAnims
	ld de, VTiles2 tile $00
	ld a, [wJumptableIndex]
	call GetHatchlingFrontpic
	ld de, VTiles2 tile $31
	ld a, EGG
	call GetEggFrontpic
	ld de, MUSIC_EVOLUTION
	call PlayMusic
	call EnableLCD
	hlcoord 7, 4
	lb bc, VBGMap0 / $100, $31 ; Egg tiles start at c
	ld a, EGG
	call Hatch_UpdateFrontpicBGMapCenter
	ld c, 80
	call DelayFrames
	xor a
	ld [wcf64], a
	ld a, [hSCX]
	ld b, a
.outerloop
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp 8
	jr nc, .done
	ld e, [hl]
.loop
; wobble e times
	ld a, 2
	ld [hSCX], a
	ld a, -2
	ld [wGlobalAnimXOffset], a
	call EggHatch_DoAnimFrame
	ld c, 2
	call DelayFrames
	ld a, -2
	ld [hSCX], a
	ld a, 2
	ld [wGlobalAnimXOffset], a
	call EggHatch_DoAnimFrame
	ld c, 2
	call DelayFrames
	dec e
	jr nz, .loop
	ld c, 16
	call DelayFrames
	call EggHatch_CrackShell
	jr .outerloop

.done
	ld de, SFX_EGG_HATCH
	call PlaySFX
	xor a
	ld [hSCX], a
	ld [wGlobalAnimXOffset], a
	call ClearSprites
	call Hatch_InitShellFragments
	hlcoord 6, 3
	lb bc, VBGMap0 / $100, $00 ; Hatchling tiles start at c
	ld a, [wJumptableIndex]
	call Hatch_UpdateFrontpicBGMapCenter
	call Hatch_ShellFragmentLoop
	call WaitSFX
	ld a, [wJumptableIndex]
	ld [wCurPartySpecies], a
	hlcoord 6, 3
	lb de, $0, ANIM_MON_HATCH
	predef AnimateFrontpic
	pop af
	ld [wCurSpecies], a
	ret

Hatch_LoadFrontpicPal: ; 17363 (5:7363)
	ld [wPlayerHPPal], a
	lb bc, CGB_EVOLUTION, $0
	jp GetCGBLayout

EggHatch_CrackShell: ; 1736d (5:736d)
	ld a, [wcf64]
	dec a
	and $7
	cp $7
	ret z
	srl a
	ret nc
	swap a
	srl a
	add 9 * 8 + 4
	ld d, a
	ld e, 11 * 8
	ld a, SPRITE_ANIM_INDEX_EGG_CRACK
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $0
	ld de, SFX_EGG_CRACK
	jp PlaySFX
; 17393 (5:7393)

EggHatchGFX: ; 17393
INCBIN "gfx/evo/egg_hatch.2bpp"
; 173b3

Hatch_InitShellFragments: ; 173b3 (5:73b3)
	farcall ClearSpriteAnims
	ld hl, .SpriteData
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	push hl
	push bc

	ld a, SPRITE_ANIM_INDEX_EGG_HATCH
	call _InitSpriteAnimStruct

	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $0

	pop de
	ld a, e
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	add [hl]
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], d

	pop hl
	jr .loop
.done
	ld de, SFX_EGG_HATCH
	call PlaySFX
	jp EggHatch_DoAnimFrame
; 173ef (5:73ef)

.SpriteData: ; 173ef
; Probably OAM.
	dsprite 10, 4,  9, 0, $00, $4 | X_FLIP
	dsprite 11, 4,  9, 0, $01, $4
	dsprite 10, 4, 10, 0, $00, $0 | X_FLIP
	dsprite 11, 4, 10, 0, $01, $0
	dsprite 10, 4, 11, 0, $02, $4 | X_FLIP
	dsprite 11, 4, 11, 0, $03, $4
	dsprite 10, 0,  9, 4, $00, $6 | X_FLIP
	dsprite 12, 0,  9, 4, $01, $2
	dsprite 10, 0, 10, 4, $02, $2 | X_FLIP
	dsprite 12, 0, 10, 4, $03, $6
	db -1
; 17418

Hatch_ShellFragmentLoop: ; 17418 (5:7418)
	ld c, 129
.loop
	call EggHatch_DoAnimFrame
	dec c
	jr nz, .loop
	ret

Special_DaycareMon1: ; 17421
	ld hl, DaycareMon1Text
	call PrintText
	ld a, [wBreedMon1Species]
	call PlayCry
	ld a, [wDaycareLady]
	bit 0, a
	jr z, DaycareMonCursor
	call ButtonSound
	ld hl, wBreedMon2Nick
	call DaycareMonCompatibilityText
	jp PrintText

Special_DaycareMon2: ; 17440
	ld hl, DaycareMon2Text
	call PrintText
	ld a, [wBreedMon2Species]
	call PlayCry
	ld a, [wDaycareMan]
	bit 0, a
	jr z, DaycareMonCursor
	call ButtonSound
	ld hl, wBreedMon1Nick
	call DaycareMonCompatibilityText
	jp PrintText

DaycareMonCursor: ; 1745f
	jp WaitPressAorB_BlinkCursor
; 17462

DaycareMon2Text: ; 0x17462
	; It's @ that was left with the DAY-CARE LADY.
	text_jump UnknownText_0x1c0df3
	db "@"
; 0x17467

DaycareMon1Text: ; 0x17467
	; It's @ that was left with the DAY-CARE MAN.
	text_jump UnknownText_0x1c0e24
	db "@"
; 0x1746c

DaycareMonCompatibilityText: ; 1746c
	push bc
	ld de, wStringBuffer1
	ld bc, NAME_LENGTH
	rst CopyBytes
	call CheckBreedmonCompatibility
	pop bc
	ld a, [wd265]

	ld hl, .Incompatible
	and a
	ret z

	ld hl, .SlightCompatibility
	dec a
	ret z

	ld hl, .ModerateCompatibility
	dec a
	ret z

	ld hl, .HighCompatibility
	ret
; 1749c

.Incompatible: ; 0x174a1
	; It has no interest in @ .
	text_jump UnknownText_0x1c0e6f
	db "@"
; 0x174a6

.HighCompatibility: ; 0x174a6
	; It appears to care for @ .
	text_jump UnknownText_0x1c0e8d
	db "@"
; 0x174ab

.ModerateCompatibility: ; 0x174ab
	; It's friendly with @ .
	text_jump UnknownText_0x1c0eac
	db "@"
; 0x174b0

.SlightCompatibility: ; 0x174b0
	; It shows interest in @ .
	text_jump UnknownText_0x1c0ec6
	db "@"
; 0x174b5
