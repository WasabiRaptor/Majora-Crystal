map_id: MACRO
;\1: map id
	db GROUP_\1, MAP_\1
ENDM

scene_script: MACRO
;\1: script pointer
	dw \1
ENDM

callback: MACRO
;\1: type: a MAPCALLBACK_* constant
;\2: script pointer
	dbw \1, \2
ENDM

warp_event: MACRO
;\1: x: left to right, starts at 0
;\2: y: top to bottom, starts at 0
;\3: map id: from constants/map_constants.asm
;\4: warp destination: starts at 1
	db \2, \1, \4
	map_id \3
ENDM

coord_event: MACRO
;\1: x: left to right, starts at 0
;\2: y: top to bottom, starts at 0
;\3: scene id: a SCENE_* constant; controlled by setscene/setmapscene
;\4: script pointer
	db \3, \2, \1
	dw \4
ENDM

bg_event: MACRO
;\1: x: left to right, starts at 0
;\2: y: top to bottom, starts at 0
;\3: function: a BGEVENT_* constant
;\4: script pointer
	db \2 ; y
	db \1 ; x
	db \3 ; function
if \3 == SIGNPOST_JUMPSTD
if _NARG == 5
	db \4, \5 ; stdscript
else
	db \4, 0 ; stdscript
endc
else
	dw \4 ; pointer
endc
ENDM

object_event: MACRO
PERSON_EVENT_NARG = _NARG

;\1: x: left to right, starts at 0
;\2: y: top to bottom, starts at 0
;\3: sprite: a SPRITE_* constant
;\4: movement function: a SPRITEMOVEDATA_* constant
;\5, \6: movement radius: x, y
;\7, \8: hour limits: h1, h2 (0-23)
;  * if h1 < h2, the object_event will only appear from h1 to h2
;  * if h1 > h2, the object_event will not appear from h2 to h1
;  * if h1 == h2, the object_event will always appear
;  * if h1 == -1, h2 is treated as a time-of-day value:
;    a combo of MORN, DAY, and/or NITE, or -1 to always appear
;\9: color: a PAL_NPC_* constant, or 0 for sprite default
;\10: function: a OBJECTTYPE_* constant
;\11: sight range: applies to OBJECTTYPE_TRAINER
;\12: script pointer
;\13: event flag: an EVENT_* constant, or -1 to always appear
	db \3 ; sprite
	db \2 + 4 ; y
	db \1 + 4 ; x
	db \4 ; movement function
	dn \5, \6 ; radius: y, x
	db \7 ; clock_hour
	db \8 ; clock_daytime
	shift
	dn \8, \9 ; color, persontype
	shift
if \8 == PERSONTYPE_COMMAND
	db \9_command ; command id
else
	db \9 ; sight_range || cry id
endc
if PERSON_EVENT_NARG == 14
	shift
	db \9 ; itemball contents
	shift
	db \9 ; itemball quantity
else
	shift
	dw \9 ; pointer || byte, 0
endc
	shift
	dw \9 ; event flag
ENDM

trainer: MACRO
;\1: trainer group
;\2: trainer id
;\3: flag: an EVENT_BEAT_* constant
;\4: seen text
;\5: win text
;\6: loss text
;\7: after-battle text
	dw \3
	db \1, \2
	dw \4, \5, \6, \7
ENDM

generictrainer: MACRO
	; flag, group, id, seen text, win text
	dw \3
	db \1, \2
	dw \4, \5
ENDM


itemball_event: MACRO
	object_event \1, \2, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_POKEBALL, PLAYEREVENT_ITEMBALL, \3, \4, \5
ENDM

tmhmball_event: MACRO
	object_event \1, \2, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_POKEBALL, PLAYEREVENT_TMHMBALL, \3, \4
ENDM

cuttree_event: MACRO
	object_event \1, \2, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumpstd, cuttree, \3
ENDM

fruittree_event: MACRO
if _NARG == 4
	object_event \1, \2, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, fruittree, \3, \4, -1
else
	object_event \1, \2, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, fruittree, \3, \4, \5
endc
ENDM

strengthboulder_event: MACRO
if _NARG == 2
	object_event \1, \2, SPRITE_BOULDER_ROCK_FOSSIL, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumpstd, strengthboulder, -1
else
	object_event \1, \2, SPRITE_BOULDER_ROCK_FOSSIL, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumpstd, strengthboulder, \3
endc
ENDM

smashrock_event: MACRO
if _NARG == 2
	object_event \1, \2, SPRITE_BOULDER_ROCK_FOSSIL, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumpstd, smashrock, 0, -1
else
	object_event \1, \2, SPRITE_BOULDER_ROCK_FOSSIL, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumpstd, smashrock, 0, \3
endc
ENDM

pc_nurse_event: MACRO
	object_event \1, \2, SPRITE_BOWING_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumpstd, pokecenternurse, -1
ENDM

mart_clerk_event: MACRO
	object_event \1, \2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, pokemart, \3, \4, -1
ENDM

hiddenitem: MACRO
;\1: item: from constants/item_constants.asm
;\2: flag: an EVENT_* constant
	dwb \2, \1
ENDM

elevfloor: MACRO
;\1: floor: a FLOOR_* constant
;\2: warp destination: starts at 1
;\3: map id
	db \1, \2
	map_id \3
ENDM

conditional_event: MACRO
;\1: flag: an EVENT_* constant
;\2: script pointer
	dw \1, \2
ENDM

cmdqueue: MACRO
;\1: type: a CMDQUEUE_* constant
;\2: data pointer
	dbw \1, \2
	dw 0 ; filler
ENDM

stonetable: MACRO
;\1: warp id
;\2: object_event id
;\3: script pointer
	dbbw \1, \2, \3
ENDM
