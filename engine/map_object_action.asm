Pointers445f: ; 445f
	dw SetFacingStanding,              SetFacingStanding          ; OBJECT_ACTION_00
	dw SetFacingStandAction,           SetFacingCurrent           ; OBJECT_ACTION_STAND
	dw SetFacingStepAction,            SetFacingCurrent           ; OBJECT_ACTION_STEP
	dw SetFacingBumpAction,            SetFacingCurrent           ; OBJECT_ACTION_BUMP
	dw SetFacingCounterclockwiseSpin,  SetFacingCurrent           ; OBJECT_ACTION_SPIN
	dw SetFacingCounterclockwiseSpin2, SetFacingStanding          ; OBJECT_ACTION_SPIN_FLICKER
	dw SetFacingFish,                  SetFacingFish              ; OBJECT_ACTION_FISHING
	dw SetFacingShadow,                SetFacingStanding          ; OBJECT_ACTION_SHADOW
	dw SetFacingEmote,                 SetFacingEmote             ; OBJECT_ACTION_EMOTE
	dw SetFacingBigDollSym,            SetFacingBigDollSym        ; OBJECT_ACTION_BIG_SNORLAX
	dw SetFacingBounce,                SetFacingFreezeBounce      ; OBJECT_ACTION_BOUNCE
	dw SetFacingWeirdTree,             SetFacingCurrent           ; OBJECT_ACTION_WEIRD_TREE
	dw SetFacingBigDoll,               SetFacingBigDoll           ; OBJECT_ACTION_BIG_DOLL
	dw SetFacingBoulderDust,           SetFacingStanding          ; OBJECT_ACTION_BOULDER_DUST
	dw SetFacingGrassShake,            SetFacingStanding          ; OBJECT_ACTION_GRASS_SHAKE
	dw SetFacingPuddleSplash,          SetFacingStanding          ; OBJECT_ACTION_PUDDLE_SPLASH
	dw SetFacingCutTree,               SetFacingCutTree           ; OBJECT_ACTION_CUT_TREE
	dw SetFacingSkyfall,               SetFacingCurrent           ; OBJECT_ACTION_SKYFALL
	dw SetFacingBigGyarados,           SetFacingFreezeBigGyarados ; OBJECT_ACTION_BIG_GYARADOS
	dw SetFacingStandFlip,             SetFacingStandFlip         ; OBJECT_ACTION_STAND_FLIP
	dw SetFacingPokecomNews,           SetFacingPokecomNews       ; OBJECT_ACTION_POKECOM_NEWS
	dw SetFacingArchTree,              SetFacingArchTree          ; OBJECT_ACTION_ARCH_TREE
	dw SetFacingRun,                   SetFacingCurrent           ; OBJECT_ACTION_RUN
	dw SetFacingSailboatTop,           SetFacingSailboatTop       ; OBJECT_ACTION_SAILBOAT_TOP
	dw SetFacingSailboatBottom,        SetFacingSailboatBottom    ; OBJECT_ACTION_SAILBOAT_BOTTOM
; 44a3

SetFacingStanding: ; 44a3
	ld a, STANDING
	jr SetFixedFacing
; 44aa

SetFacingCurrent: ; 44aa
	call GetSpriteDirection
	jr SetFixedFacing
; 44b5

SetFacingShadow: ; 457b
	ld a, FACING_SHADOW
	jr SetFixedFacing
; 4582

SetFacingEmote: ; 4582 emote
	ld a, FACING_EMOTE
	jr SetFixedFacing
; 4589

SetFacingCutTree:
	ld a, FACING_CUT_TREE
	jr SetFixedFacing

SetFacingPokecomNews:
	ld a, FACING_POKECOM_NEWS
	jr SetFixedFacing

SetFacingSailboatTop:
	ld a, FACING_SAILBOAT_TOP
	jr SetFixedFacing

SetFacingSailboatBottom:
	ld a, FACING_SAILBOAT_BOTTOM
	jr SetFixedFacing

SetFacingBigDoll: ; 45c5
	ld a, [wVariableSprites + SPRITE_BIG_DOLL - SPRITE_VARS]
	cp SPRITE_BIG_ONIX
	ld a, FACING_BIG_DOLL_ASYM
	jr z, SetFixedFacing
SetFacingBigDollSym: ; 4589
	ld a, FACING_BIG_DOLL_SYM
	jr SetFixedFacing
; 4590

SetFacingFish: ; 456e
	call GetSpriteDirection
	rrca
	rrca
	add FACING_FISH_DOWN
	jr SetFixedFacing
; 457b

SetFacingArchTree:
	call GetSpriteDirection
	rrca
	rrca
	add FACING_ARCH_TREE_DOWN
	jr SetFixedFacing

SetFacingStandFlip:
	call GetSpriteDirection
	rrca
	rrca
	add FACING_STEP_DOWN_FLIP
SetFixedFacing:
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret
; 44b5

SetFacingStandAction:
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld a, [hl]
	and 1
	jr z, SetFacingCurrent
	; fallthrough

SetFacingStepAction:
SetFacingBumpAction:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit SLIDING, [hl]
	jr nz, SetFacingCurrent

	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	inc [hl]
	ld a, [hl]
	rrca
	rrca
	rrca
	and %11
	ld d, a
	call GetSpriteDirection
	or d
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret

SetFacingSkyfall:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit SLIDING, [hl]
	jr nz, SetFacingCurrent

	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	add 2
	ld [hl], a
	rrca
	rrca
	rrca
	and %11
	ld d, a

	call GetSpriteDirection
	or d
	jr SetFixedFacing

SetFacingCounterclockwiseSpin: ; 4529
	call CounterclockwiseSpinAction
	ld hl, OBJECT_FACING
	add hl, bc
	ld a, [hl]
	jr SetFixedFacing
; 4539

SetFacingCounterclockwiseSpin2: ; 4539
	call CounterclockwiseSpinAction
	jp SetFacingStanding
; 453f

CounterclockwiseSpinAction:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	and %11110000
	ld e, a

	ld a, [hl]
	inc a
	and %00001111
	ld d, a
	cp 2
	jr c, .ok

	ld d, 0
	ld a, e
	add $10
	and %00110000
	ld e, a

.ok
	ld a, d
	or e
	ld [hl], a

	swap e
	ld d, 0
	ld hl, .Directions
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
	ret

.Directions
	db OW_DOWN, OW_RIGHT, OW_UP, OW_LEFT

SetFacingBounce: ; 4590
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	inc a
	and %00001111
	ld [hl], a
	and %00001000
	ld a, FACING_STEP_UP_0
	jp nz, SetFixedFacing
SetFacingFreezeBounce: ; 45a4
	xor a ; FACING_STEP_DOWN_0
	jp SetFixedFacing
; 45ab

SetFacingBigGyarados:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	inc a
	and %00001111
	ld [hl], a
	and %00001000
	ld a, FACING_BIG_GYARADOS_2
	jp nz, SetFixedFacing
SetFacingFreezeBigGyarados:
	ld a, FACING_BIG_GYARADOS_1
	jp SetFixedFacing

SetFacingWeirdTree: ; 45ab
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	and %00001100
	rrca
	rrca
	add FACING_WEIRD_TREE_0
	jp SetFixedFacing
; 45be

SetFacingBoulderDust: ; 45da
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	inc [hl]
	ld a, [hl]
	and 2
	ld a, FACING_BOULDER_DUST_1
	jr z, .ok
	inc a ; FACING_BOULDER_DUST_2
.ok
	jp SetFixedFacing
; 45ed

SetFacingGrassShake:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	inc [hl]
	ld a, [hl]
	and 4
	ld a, FACING_GRASS_1
	jr z, .ok
	inc a ; FACING_GRASS_2
.ok
	jp SetFixedFacing
; 4600

SetFacingPuddleSplash:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	inc [hl]
	ld a, [hl]
	and 4
	ld a, FACING_SPLASH_1
	jr z, .ok
	inc a ; FACING_SPLASH_2
.ok
	jp SetFixedFacing

SetFacingRun:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit SLIDING, [hl]
	jp nz, SetFacingCurrent

	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	inc [hl]
	ld a, [hl]
	rrca
	rrca
	and %11
	ld d, a
	call GetSpriteDirection
	or d
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret
