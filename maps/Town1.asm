	const_def 2 ; object constants

Town1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Town1_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3,  3, PLAYERS_HOUSE_1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
