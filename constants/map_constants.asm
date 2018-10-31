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

	map_const TOWN_1,                             	20,  18 ;  1
	map_const BRIDGE,                             	15,  9  ;  2
	map_const TOWN_2,                             	10,  18 ;  3

	map_const ROUTE_NE_1,                         	20,  9  ;  4
	map_const CREVASSE,                           	30,  27 ;  5
	map_const ROUTE_NE_2,                         	10,  9  ;  6

	map_const TOWN_3,                             	20,  9  ;  7

	map_const ROUTE_W_1,                           	25,  9  ;  8
	map_const ROUTE_W_2,                           	30,  18 ;  9

	map_const ASH_PLAINS_1,                         50,  13 ;  10
	map_const ASH_PLAINS_2,                         50,  14 ;  11

	map_const TOWN_4,                             	20,  18 ;  12

	map_const ROUTE_S,                            	10,  18 ;  13
	map_const SWAMP,                            	30,  27 ;  14
	map_const ROUTE_SW,                         	60,  9  ;  15

	map_const TOWN_5,                             	20,  9  ;  16

	map_const ROUTE_SE,                         	80,  9  ;  17

	map_const TOWN_6,                             	30,  9  ;  18

	map_const LAKE_1,                             	30,  27 ;  19
	map_const LAKE_2,                             	30,  27 ;  20
	map_const LAKE_3,                             	10,  45 ;  21

	map_const ROUTE_FAKE_EXIT,                    	10,  18 ;  22
	map_const ROUTE_FAKE_EXIT_LOOP,               	10,  9  ;  23



	newgroup ;4

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

