newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM

map_const: MACRO
;\1: map id
;\2: width: in blocks
;\3: height: in blocks
GROUP_\1 EQU const_value
	enum MAP_\1
\1_WIDTH EQU \2
\1_HEIGHT EQU \3
ENDM

; map group ids
; `newgroup` indexes are for:
; - MapGroupPointers (see data/maps/maps.asm)
; - MapGroupRoofs (see data/maps/roofs.asm)
; - OutdoorSprites (see data/maps/outdoor_sprites.asm)
; - RoofPals (see gfx/tilesets/roofs.pal)
; `map_const` indexes are for the sub-tables of MapGroupPointers (see data/maps/maps.asm)
; Each map also has associated data:
; - attributes (see data/maps/attributes.asm)
; - blocks (see data/maps/blocks.asm)
; - scripts and events (see data/maps/scripts.asm)
	const_def

	newgroup ;1

	map_const POKECENTER_2F,                                8,  4 ;  1
	map_const TRADE_CENTER,                                 5,  4 ;  2
	map_const COLOSSEUM,                                    5,  4 ;  3
	map_const TIME_CAPSULE,                                 5,  4 ;  4

	newgroup ;2

	map_const PLAYERS_HOUSE_1F,                             5,  4 ;  1
	map_const PLAYERS_HOUSE_2F,                             4,  3 ;  2
	map_const DAY_CARE,                                     5,  4 ;  3

	newgroup ;3

;every way crossroads
	map_const MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST,	    5,  5 ;  1

;T shape crossroads
	map_const MYSTERY_DUNGEON_NORTH_SOUTH_EAST,			    5,  5 ;  2
	map_const MYSTERY_DUNGEON_NORTH_SOUTH_WEST,			    5,  5 ;  3
	map_const MYSTERY_DUNGEON_NORTH_EAST_WEST,			    5,  5 ;  4
	map_const MYSTERY_DUNGEON_SOUTH_EAST_WEST,			    5,  5 ;  5

;straight paths
	map_const MYSTERY_DUNGEON_NORTH_SOUTH,				    5,  5 ;  6
	map_const MYSTERY_DUNGEON_EAST_WEST,				    5,  5 ;  7

;the four corners
	map_const MYSTERY_DUNGEON_NORTH_EAST,				    5,  5 ;  8
	map_const MYSTERY_DUNGEON_NORTH_WEST,				    5,  5 ;  9
	map_const MYSTERY_DUNGEON_SOUTH_EAST,				    5,  5 ;  10
	map_const MYSTERY_DUNGEON_SOUTH_WEST,				    5,  5 ;  11

;dead ends
	map_const MYSTERY_DUNGEON_NORTH,					    5,  5 ;  12
	map_const MYSTERY_DUNGEON_SOUTH,					    5,  5 ;  13
	map_const MYSTERY_DUNGEON_EAST,						    5,  5 ;  14
	map_const MYSTERY_DUNGEON_WEST,						    5,  5 ;  15

