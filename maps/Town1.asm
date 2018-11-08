	const_def 2 ; object constants

Town1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MysteryDungeonEnterScript:
	callasm MysteryDungeonSetup
	special WarpToSpawnPoint
	newloadmap MAPSETUP_TELEPORT
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	end
MysteryDungeonSetup:
	ld a, 5
	ld [hMysteryDungeonX], a
	ld [hMysteryDungeonY], a
	ld a, 8
	call RandomRange
	add 8
	ld [hMysteryDungeonSeed], a
	ld a, SPAWN_MYSTERY_DUNGEON
	ld [wDefaultSpawnpoint], a
	ret

Town1_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3,  3, PLAYERS_HOUSE_1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  4, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MysteryDungeonEnterScript, -1

