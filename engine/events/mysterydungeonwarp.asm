MysteryDungeonWarp::
	call .LoadPointer

	;temp just random for testing
	ld a, 8
	call RandomRange

	call Elevator_GoToFloor
	and a
	ret

.LoadPointer:
	ld a, b
	ld [wElevatorPointerBank], a
	ld a, e
	ld [wElevatorPointer], a
	ld a, d
	ld [wElevatorPointer + 1], a
	call .LoadFloors
	ret

.LoadFloors:
	ld de, wCurElevator
	ld bc, 4
	ld hl, wElevatorPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wElevatorPointerBank]
	call GetFarByte
	inc hl
	ld [de], a
	inc de
.loop
	ld a, [wElevatorPointerBank]
	call GetFarByte
	ld [de], a
	inc de
	add hl, bc
	cp -1
	jr nz, .loop
	ret
