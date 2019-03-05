	const_def 2 ; object constants
	const TEMP_MYSTERY_DUNGEON_NPC
	const TEMP_BUGSY

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
	ld [wMysteryDungeonX], a
	ld [wMysteryDungeonY], a
	ld a, 8
	call RandomRange
	add 8
	ld [wMysteryDungeonSeed], a
	ld a, SPAWN_MYSTERY_DUNGEON
	ld [wDefaultSpawnpoint], a
	ret

; TEMP
TempBugsyScript:
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	reloadmapafterbattle
	end

Town1_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3,  3, KRISS_HOUSE_1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 7, 6, SPRITE_KRIS,  SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MysteryDungeonEnterScript, -1
	object_event 7, 7, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TempBugsyScript, -1
