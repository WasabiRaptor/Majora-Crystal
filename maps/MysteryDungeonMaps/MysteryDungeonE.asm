	const_def 2 ; object constants

MysteryDungeonE_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MysteryDungeonE_MapEvents:

	db 0, 0 ; filler

	db 8 ; warp events
	;north warps
	warp_event  4, 1, MYSTERY_DUNGEON_NSEW, 3
	warp_event  5, 0, MYSTERY_DUNGEON_NSEW, 4

	;south warps
	warp_event  4, 9, MYSTERY_DUNGEON_NSEW, 1
	warp_event  5, 9, MYSTERY_DUNGEON_NSEW, 2

	;east warps
	warp_event  9, 4, MYSTERY_DUNGEON_NSEW, 7
	warp_event  9, 5, MYSTERY_DUNGEON_NSEW, 8

	;west warps
	warp_event  0, 4, MYSTERY_DUNGEON_NSEW, 5
	warp_event  0, 5, MYSTERY_DUNGEON_NSEW, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
