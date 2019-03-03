ViridianPokeCenter1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  5,  7, VIRIDIAN_CITY, 5
	warp_event  6,  7, VIRIDIAN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10,  1, SIGNPOST_READ, PokemonJournalBlueScript

	db 4 ; object events
	pc_nurse_event  5, 1
	object_event  2,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ViridianPokeCenter1FCooltrainermScript, -1
	object_event  8,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_COMMAND, jumptextfaceplayer, ViridianPokeCenter1FCooltrainerfText, -1
	object_event  3,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_COMMAND, jumptextfaceplayer, ViridianPokeCenter1FBugCatcherText, -1

PokemonJournalBlueScript:
	setflag ENGINE_READ_BLUE_JOURNAL
	thistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Blue!"

	para "Blue supposedly"
	line "visits his cher-"
	cont "ished #mon"

	para "every year in the"
	line "House of Souls."
	done

ViridianPokeCenter1FCooltrainermScript:
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue_jumptextfaceplayer .BlueText
	thistextfaceplayer

	text "Where in the world"
	line "is Viridian's Gym"

	para "Leader? I wanted"
	line "to challenge him."
	done

.BlueText:
	text "There are strong"
	line "Gym Trainers at"
	cont "the Viridian Gym."

	para "Someday I'm going"
	line "to join them!"
	done

ViridianPokeCenter1FCooltrainerfText:
	text "I heard that the"
	line "Gym in Cinnabar is"
	cont "gone."

	para "I wonder what be-"
	line "came of Blaine,"
	cont "the Gym Leader."
	done

ViridianPokeCenter1FBugCatcherText:
	text "My dream is to be-"
	line "come a Gym Leader."
	done
