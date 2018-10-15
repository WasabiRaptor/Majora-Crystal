	const_def 2 ; object constants

MysteryDungeonNorthSouthEastWest_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED


	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

;only the north one works properly
DungeonStepFromNorth:
	applymovement PLAYER, MovementFromNorth_NBT
	setmapscene MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, SCENE_DEFAULT
	end

;because the script seems to not be triggering
DungeonStepFromSouth:
	applymovement PLAYER, MovementFromSouth_NBT
	setmapscene MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, SCENE_DEFAULT
	end

DungeonStepFromEast:
	applymovement PLAYER, MovementFromEast_NBT
	setmapscene MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, SCENE_DEFAULT
	end

DungeonStepFromWest:
	applymovement PLAYER, MovementFromWest_NBT
	setmapscene MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, SCENE_DEFAULT
	end


MovementFromNorth_NBT:
	step DOWN
	step_end

MovementFromSouth_NBT:
	step UP
	step_end

MovementFromEast_NBT:
	step LEFT
	step_end

MovementFromWest_NBT:
	step RIGHT
	step_end


DungeonWarpNorth:
	setmapscene MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, SCENE_FINISHED
	callasm GoingNorth
	mysterydungeonwarp NorthToSouthConnections
	end

GoingNorth:
	ld a, [hMysteryDungeonY]
	inc a
	ld [hMysteryDungeonY], a
	ret

DungeonWarpSouth:
	setmapscene MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, SCENE_FINISHED
	callasm GoingSouth
	mysterydungeonwarp SouthToNorthConnections
	end

GoingSouth:
	ld a, [hMysteryDungeonY]
	dec a
	ld [hMysteryDungeonY], a
	ret

DungeonWarpEast:
	setmapscene MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, SCENE_FINISHED
	callasm GoingEast
	mysterydungeonwarp EastToWestConnections
	end

GoingEast:
	ld a, [hMysteryDungeonX]
	inc a
	ld [hMysteryDungeonX], a
	ret

DungeonWarpWest:
	setmapscene MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, SCENE_FINISHED
	callasm GoingWest
	mysterydungeonwarp WestToEastConnections
	end

GoingWest:
	ld a, [hMysteryDungeonX]
	dec a
	ld [hMysteryDungeonX], a
	ret



SouthToNorthConnections:
	db 8 ; floors
	elevfloor 0, 1, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST

	elevfloor 1, 1, MYSTERY_DUNGEON_NORTH_SOUTH_EAST
	elevfloor 2, 1, MYSTERY_DUNGEON_NORTH_SOUTH_WEST
	elevfloor 3, 1, MYSTERY_DUNGEON_NORTH_EAST_WEST

	elevfloor 4, 1, MYSTERY_DUNGEON_NORTH_SOUTH

	elevfloor 5, 1, MYSTERY_DUNGEON_NORTH_EAST
	elevfloor 6, 1, MYSTERY_DUNGEON_NORTH_WEST

	elevfloor 7, 1, MYSTERY_DUNGEON_NORTH
	db -1 ; end


NorthToSouthConnections:
	db 8 ; floors
	elevfloor 0, 3, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST

	elevfloor 1, 3, MYSTERY_DUNGEON_NORTH_SOUTH_EAST
	elevfloor 2, 3, MYSTERY_DUNGEON_NORTH_SOUTH_WEST
	elevfloor 2, 3, MYSTERY_DUNGEON_SOUTH_EAST_WEST

	elevfloor 4, 3, MYSTERY_DUNGEON_NORTH_SOUTH

	elevfloor 5, 3, MYSTERY_DUNGEON_SOUTH_EAST
	elevfloor 6, 3, MYSTERY_DUNGEON_SOUTH_WEST

	elevfloor 7, 3, MYSTERY_DUNGEON_SOUTH
	db -1 ; end

WestToEastConnections:
	db 8 ; floors
	elevfloor 0, 5, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST

	elevfloor 1, 5, MYSTERY_DUNGEON_NORTH_SOUTH_EAST
	elevfloor 2, 5, MYSTERY_DUNGEON_NORTH_EAST_WEST
	elevfloor 3, 5, MYSTERY_DUNGEON_SOUTH_EAST_WEST

	elevfloor 4, 5, MYSTERY_DUNGEON_EAST_WEST

	elevfloor 5, 5, MYSTERY_DUNGEON_NORTH_EAST
	elevfloor 6, 5, MYSTERY_DUNGEON_SOUTH_EAST

	elevfloor 7, 5, MYSTERY_DUNGEON_EAST
	db -1 ; end

EastToWestConnections:
	db 8 ; floors
	elevfloor 0, 7, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST

	elevfloor 1, 7, MYSTERY_DUNGEON_NORTH_SOUTH_WEST
	elevfloor 2, 7, MYSTERY_DUNGEON_NORTH_EAST_WEST
	elevfloor 3, 7, MYSTERY_DUNGEON_SOUTH_EAST_WEST

	elevfloor 4, 7, MYSTERY_DUNGEON_EAST_WEST

	elevfloor 5, 7, MYSTERY_DUNGEON_NORTH_WEST
	elevfloor 6, 7, MYSTERY_DUNGEON_SOUTH_WEST

	elevfloor 7, 7, MYSTERY_DUNGEON_WEST
	db -1 ; end

MysteryDungeonNorthSouthEastWest_MapEvents:

	db 0, 0 ; filler

	db 8 ; warp events
	;north warps
	warp_event  4, 1, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, -1
	warp_event  5, 0, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, -1

	;south warps
	warp_event  4, 9, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, -1
	warp_event  5, 9, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, -1

	;east warps
	warp_event  9, 4, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, -1
	warp_event  9, 5, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, -1

	;west warps
	warp_event  0, 4, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, -1
	warp_event  0, 5, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, -1

	db 16 ; coord events
	
		coord_event  4,  2, SCENE_DEFAULT, DungeonWarpNorth
		coord_event  5,  1, SCENE_DEFAULT, DungeonWarpNorth

		coord_event  4,  9, SCENE_DEFAULT, DungeonWarpSouth
		coord_event  5,  9, SCENE_DEFAULT, DungeonWarpSouth

		coord_event  9,  4, SCENE_DEFAULT, DungeonWarpEast
		coord_event  9,  5, SCENE_DEFAULT, DungeonWarpEast

		coord_event  0,  4, SCENE_DEFAULT, DungeonWarpWest
		coord_event  0,  5, SCENE_DEFAULT, DungeonWarpWest

		;upon entry from other room

		coord_event  4,  2, SCENE_FINISHED, DungeonStepFromNorth 

		;it seems only the north one is working, since you walk out of the cave onto the tile, but the other warps don't trigger the script, but that also means that they don't trigger the inc or dec script, which may lead to some inconsistency if someone went back into the door they came out of without stepping further into the room

		coord_event  5,  1, SCENE_FINISHED, DungeonStepFromNorth

		coord_event  4,  9, SCENE_FINISHED, DungeonStepFromSouth
		coord_event  5,  9, SCENE_FINISHED, DungeonStepFromSouth

		coord_event  9,  4, SCENE_FINISHED, DungeonStepFromEast
		coord_event  9,  5, SCENE_FINISHED, DungeonStepFromEast

		coord_event  0,  4, SCENE_FINISHED, DungeonStepFromWest
		coord_event  0,  5, SCENE_FINISHED, DungeonStepFromWest

	db 0 ; bg events

	db 0 ; object events
