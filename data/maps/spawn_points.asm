spawn: MACRO
; map, x, y
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants

	spawn KRISS_HOUSE_2F,           			 	3,  3
	spawn MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, 	5, 5
	spawn N_A,                     				   -1, -1
