PlayImportedSoundClip::
    ld a, e
    ld a, a
    ld d, $0
    ld hl, ImportedSoundsPointerTable
    add hl, de
    add hl, de
    add hl, de
    ld b, [hl]
    inc hl
    ld a, [hli]
    ld h, [hl]
    ld l, a
    ld c, $4
.loop
    dec c
    jr z, .done_delay
    call DelayFrame
    jr .loop

.done_delay
    di
    push bc
    push hl
    ld a, $80
    ld [rNR52], a
    ld a, $77
    ld [rNR50], a
    xor a
    ld [rNR30], a
    ld hl, $ff30
    ld de, wRedrawRowOrColumnSrcTiles
.saveWaveDataLoop
    ld a, [hl]
    ld [de], a
    inc de
    ld a, $ff
    ld [hli], a
    ld a, l
    cp $40
    jr nz, .saveWaveDataLoop
    ld a, $80
    ld [rNR30], a
    ld a, [rNR51]
    or $44
    ld [rNR51], a
	ld a, $ff
	ld [rNR31], a
	ld a, $20
	ld [rNR32], a
	ld a, $ff
	ld [rNR33], a
	ld a, $87
	ld [rNR34], a
	pop hl
	pop bc
	call PlayImportedSoundPCM
	xor a
	ld [wc0f3], a
	ld [wc0f4], a
	ld a, $80
	ld [rNR52], a
	xor a
	ld [rNR30], a
	ld hl, $ff30
	ld de, wRedrawRowOrColumnSrcTiles
.reloadWaveDataLoop
	ld a, [de]
	inc de
	ld [hli], a
	ld a, l
	cp $40 ; end of wave data
	jr nz, .reloadWaveDataLoop
	ld a, $80
	ld [rNR30], a
	ld a, [rNR51]
	and $bb
	ld [rNR51], a
	xor a
	ld [wChannels+CH4], a
	ld [wChannels+CH5], a
	ld [wChannels+CH6], a
	ld [wChannels+CH7], a
	ld a, [hROMBank]
	ei
	ret

ImportedSoundsPointerTable:
; format:
; db bank
; dw pointer to cry

; bank ??
    importsound_def HMSLaugh