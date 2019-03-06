Daycare_MapScriptHeader:
	db 1 ; scene scripts
	scene_script DaycareTrigger0

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, DaycareEggCheckCallback

Daycare_MapEvents:

	db 0 ; warp events
	;warp_event  0,  4, ROUTE_34, 3
	;warp_event  0,  5, ROUTE_34, 4
	;warp_event  2,  7, ROUTE_34, 5
	;warp_event  3,  7, ROUTE_34, 5

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  1, SIGNPOST_JUMPSTD, difficultbookshelf

	db 3 ; object events
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DaycareLadyScript, -1
	object_event  0,  5, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_DAYCARE
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaycareManScript_Inside, EVENT_DAYCARE_MAN_IN_DAYCARE

	const_def 1 ; object constants
	const DAYCARE_GRANNY
	const DAYCARE_LYRA

DaycareTrigger0:
	priorityjump Daycare_MeetGrandma
	end

DaycareEggCheckCallback:
	checkflag ENGINE_DAYCARE_MAN_HAS_EGG
	iftrue .PutDaycareManOutside
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	return

.PutDaycareManOutside:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	return

Daycare_MeetGrandma:
	follow DAYCARE_LYRA, PLAYER
	applymovement DAYCARE_LYRA, DaycareMovementData_LyraApproachesGrandma
	stopfollow
	turnobject PLAYER, UP
	turnobject DAYCARE_GRANNY, DOWN
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .IntroduceFemale
	writetext DaycareLyraHelloText1
	jump .Continue1
.IntroduceFemale:
	writetext DaycareLyraHelloText2
.Continue1:
	waitbutton
	closetext
	showemote EMOTE_SHOCK, DAYCARE_LYRA, 15
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .ProtestFemale
	writetext DaycareLyraProtestText1
	jump .Continue2
.ProtestFemale:
	writetext DaycareLyraProtestText2
.Continue2:
	waitbutton
	closetext
	turnobject DAYCARE_LYRA, DOWN
	showtext DaycareLyraGoodbyeText
	applymovement DAYCARE_LYRA, DaycareMovementData_LyraStartsToLeave
	showemote EMOTE_SHOCK, DAYCARE_LYRA, 15
	turnobject DAYCARE_LYRA, LEFT
	turnobject PLAYER, RIGHT
	showtext DaycareLyraForgotText
	addcellnum PHONE_LYRA
	opentext
	writetext GotLyrasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject DAYCARE_LYRA, UP
	showtext DaycareLyraEmbarassedText
	applymovement DAYCARE_LYRA, DaycareMovementData_LyraLeaves
	disappear DAYCARE_LYRA
	setscene $1
	end

DaycareManScript_Inside:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	writetext DaycareManText_GiveOddEgg
	buttonsound
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	writetext DaycareText_GotOddEgg
	playsound SFX_GET_EGG_FROM_DAYCARE_LADY
	waitsfx
	writetext DaycareText_DescribeOddEgg
	setevent EVENT_GOT_ODD_EGG
	waitendtext

.PartyFull:
	jumpopenedtext DaycareText_PartyFull

.AlreadyHaveOddEgg:
	special Special_DaycareMan
	waitendtext

DaycareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAYCARE_MAN_HAS_EGG
	iftrue_jumpopenedtext Text_GrampsLookingForYou
	checkevent EVENT_LYRA_GAVE_AWAY_EGG
	iffalse .NoLyrasEgg
	checkevent EVENT_GOT_LYRAS_EGG
	iftrue .NoLyrasEgg
	writetext DaycareLadyText_GiveLyrasEgg
	buttonsound
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .GiveCyndaquilEgg
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .GiveTotodileEgg
	;giveegg CHIKORITA, EGG_LEVEL
	jump .GotLyrasEgg

.GiveCyndaquilEgg:
	;giveegg CYNDAQUIL, EGG_LEVEL
	jump .GotLyrasEgg

.GiveTotodileEgg:
	;giveegg TOTODILE, EGG_LEVEL
.GotLyrasEgg
	farwritetext UnknownText_0x1bdfa5
	playsound SFX_GET_EGG_FROM_DAYCARE_LADY
	waitsfx
	writetext DaycareLadyText_DescribeLyrasEgg
	setevent EVENT_GOT_LYRAS_EGG
	waitendtext

.PartyFull:
	jumpopenedtext DaycareText_PartyFull

.NoLyrasEgg:
	special Special_DaycareLady
	waitendtext

DaycareMovementData_LyraApproachesGrandma:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

DaycareMovementData_LyraStartsToLeave:
	step_right
	step_down
	step_end

DaycareMovementData_LyraLeaves:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

DaycareLyraHelloText1:
	text "Lyra: Grandma!"

	para "Let me introduce"
	line "my friend."

	para "This is <PLAYER>!"

	para "Grandma: Ah ha."

	para "This is your"
	line "boy… friend."

	para "I see. Hmm."
	done

DaycareLyraHelloText2:
	text "Lyra: Grandma!"

	para "Let me introduce"
	line "my friend."

	para "This is <PLAYER>!"

	para "Grandma: Ah ha."

	para "This is your"
	line "girl… friend."

	para "I see. Hmm."
	done

DaycareLyraProtestText1:
	text "Lyra: What?"
	line "Grandma…!"

	para "What are you"
	line "talking about?"

	para "He just lives"
	line "nearby…"

	para "Grandma: Hahaha."
	line "I know, I know."

	para "You must be sure"
	line "he's talented."

	para "Right, <PLAYER>?"
	line "Come and see us"
	cont "anytime!"
	done

DaycareLyraProtestText2:
	text "Lyra: What?"
	line "Grandma…!"

	para "What are you"
	line "talking about?"

	para "She just lives"
	line "nearby…"

	para "Grandma: Hahaha."
	line "I know, I know."

	para "You must be sure"
	line "she's talented."

	para "Right, <PLAYER>?"
	line "Come and see us"
	cont "anytime!"
	done

DaycareLyraGoodbyeText:
	text "Lyra: Well, I'd"
	line "better go now…"
	cont "See ya!"
	done

DaycareLyraForgotText:
	text "Lyra: Oh!"
	line "I almost forgot!"

	para "Here! This is my"
	line "#gear number!"
	done

GotLyrasNumberText:
	text "<PLAYER> got Lyra's"
	line "phone number."
	done

DaycareLyraEmbarassedText:
	text "Lyra: Grandma!"

	para "Don't you say"
	line "anything."

	para "We're both train-"
	line "ers, and we're"

	para "supposed to ex-"
	line "change numbers."
	cont "That's all."
	done

Text_GrampsLookingForYou:
	text "Gramps was looking"
	line "for you."
	done

DaycareManText_GiveOddEgg:
	text "I'm the Day-Care"
	line "Man."

	para "Do you know about"
	line "Eggs?"

	para "I was raising"
	line "#mon with my"
	cont "wife, you see."

	para "We were shocked to"
	line "find an Egg!"

	para "How incredible is"
	line "that?"

	para "Well, wouldn't you"
	line "like this Egg?"

	para "Then fine, this is"
	line "yours to keep!"
	done

DaycareText_GotOddEgg:
	text "<PLAYER> received"
	line "the Odd Egg!"
	done

DaycareText_DescribeOddEgg:
	text "I found that when"
	line "I was caring for"

	para "someone's #mon"
	line "before."

	para "But the trainer"
	line "didn't want the"

	para "Egg, so I'd kept"
	line "it around."
	done

DaycareLadyText_GiveLyrasEgg:
	text "Hello, dear."

	para "Lyra told me this"
	line "Egg was a gift for"
	cont "you. Here you go!"
	done

DaycareLadyText_DescribeLyrasEgg:
	text "That Egg came from"
	line "her first #mon."

	para "She must really"
	line "trust you as a"
	cont "trainer."
	done

DaycareText_PartyFull:
	text "You've no room for"
	line "this."
	done
