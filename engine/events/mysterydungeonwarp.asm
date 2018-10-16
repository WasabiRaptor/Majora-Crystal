MysteryDungeonWarp::
	call .LoadPointer

	;choose which dungeon room to enter 
	ld a, [hMysteryDungeonX] 
	add [hMysteryDungeonSeed]
	ld c, a
	ld a, [hMysteryDungeonY]
	add [hMysteryDungeonSeed]
	call SimpleMultiply
	ld c, 3
	call SimpleMultiply
	ld b, a
	ld a, [hMysteryDungeonSeed]
	ld c, a

.divideloop ;loop until you get something below 8 to have a valid floor pointer for the dungeon
	ld a, b
	call SimpleDivide ;a is the remainder 
	cp 11
	jr nc, .divideloop

	call Elevator_GoToFloor ;just needs to get the remainder between 0-10
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
