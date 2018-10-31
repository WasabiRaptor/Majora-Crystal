map_attributes: MACRO
;\1: map name
;\2: map id
;\3: border block
;\4: connections: combo of NORTH, SOUTH, WEST, and/or EAST, or 0 for none
CURRENT_MAP_WIDTH = \2_WIDTH
CURRENT_MAP_HEIGHT = \2_HEIGHT
\1_MapAttributes::
	db \3
	db CURRENT_MAP_HEIGHT, CURRENT_MAP_WIDTH
	db BANK(\1_Blocks)
	dw \1_Blocks
	db BANK(\1_MapScripts) ; BANK(\1_MapEvents)
	dw \1_MapScripts
	dw \1_MapEvents
	db \4
ENDM

; Connections go in order: north, south, west, east
connection: MACRO
;\1: direction
;\2: map name
;\3: map id
;\4: x offset for east/west, y offset for north/south
;\5: distance offset?
;\6: strip length
if "\1" == "north"
	map_id \3
	dw \2_Blocks + \3_WIDTH * (\3_HEIGHT - 3) + \5
	dw wOverworldMapBlocks + \4 + 3
	db \6
	db \3_WIDTH
	db \3_HEIGHT * 2 - 1
	db (\4 - \5) * -2
	dw wOverworldMapBlocks + \3_HEIGHT * (\3_WIDTH + 6) + 1
elif "\1" == "south"
	map_id \3
	dw \2_Blocks + \5
	dw wOverworldMapBlocks + (CURRENT_MAP_HEIGHT + 3) * (CURRENT_MAP_WIDTH + 6) + \4 + 3
	db \6
	db \3_WIDTH
	db 0
	db (\4 - \5) * -2
	dw wOverworldMapBlocks + \3_WIDTH + 7
elif "\1" == "west"
	map_id \3
	dw \2_Blocks + (\3_WIDTH * \5) + \3_WIDTH - 3
	dw wOverworldMapBlocks + (CURRENT_MAP_WIDTH + 6) * (\4 + 3)
	db \6
	db \3_WIDTH
	db (\4 - \5) * -2
	db \3_WIDTH * 2 - 1
	dw wOverworldMapBlocks + \3_WIDTH * 2 + 6
elif "\1" == "east"
	map_id \3
	dw \2_Blocks + (\3_WIDTH * \5)
	dw wOverworldMapBlocks + (CURRENT_MAP_WIDTH + 6) * (\4 + 3 + 1) - 3
	db \6
	db \3_WIDTH
	db (\4 - \5) * -2
	db 0
	dw wOverworldMapBlocks + \3_WIDTH + 7
endc
ENDM
	map_attributes Town1, TOWN_1, $05, SOUTH | WEST | EAST
	connection south, RouteS, ROUTE_S, 5, 0, 10
	connection west, RouteW1, ROUTE_W1, 9, 0, 9
	connection east, Bridge, BRIDGE, 9, 0, 9

	map_attributes Bridge, BRIDGE, $05, WEST | EAST
	connection west, Town1, TOWN_1, -9, 0, 16
	connection east, Town2, TOWN_2, 0, 0, 16

	map_attributes Town2, TOWN_2, $05, NORTH | WEST | EAST
	connection north, RouteNE1, ROUTE_NE_1, 0, 0, 16
	connection west, Bridge, BRIDGE, 0, 0, 9
	connection east, Lake2, LAKE_2, 9, 0, 15

	map_attributes RouteNE1, ROUTE_NE_1, $05, SOUTH | EAST
	connection South, Town2, TOWN_2, 0, 0, 10
	connection east, Crevasse, CREVASSE, -18, 0, 15

	map_attributes Crevasse, CREVASSE, $05, NORTH | SOUTH | WEST
	connection north, RouteNE2, ROUTE_NE_2, 10, 0, 15
	connection south, Lake3, LAKE_3, 0, 0, 30
	connection west, RouteNE1, ROUTE_NE_1, 20, 0, 16

	map_attributes RouteNE2, ROUTE_NE_2, $05, NORTH | SOUTH
	connection north, Town3, TOWN_3, 5, 0, 16
	connection south, Crevasse, CREVASSE, -10, 0, 16

	map_attributes Town3, TOWN_3, $05, SOUTH
	connection south, RouteNE2, ROUTE_NE_2, -5, 0, 16

	map_attributes RouteW1, ROUTE_W_1, $05, WEST | EAST
	connection west, RouteW2, ROUTE_W_2, -9, 0, 15
	connection east, Town1, TOWN_1, -9, 0, 15

	map_attributes RouteW2, ROUTE_W_2, $05, NORTH | EAST
	connection north, AshPlains1, ASH_PLAINS_1, -10, 0, 36
	connection east, RouteW1, ROUTE_W_1, 9, 0, 15
	
	map_attributes AshPlains1, ASH_PLAINS_1, $05, NORTH | SOUTH
	connection north, AshPlains2, ASH_PLAINS_2, 0, 0, 50
	connection south, RouteW2, ROUTE_W_2, 10, 0, 30

	map_attributes AshPlains2, ASH_PLAINS_2, $05, SOUTH | WEST
	connection south, AshPlains1, ASH_PLAINS_1, 0, 0, 50
	connection west, Town4, TOWN_4, -9, 0, 15

	map_attributes Town4, TOWN_4, $05, EAST
	connection east, AshPlains2, ASH_PLAINS_2, 9, 0, 15

	map_attributes RouteS, ROUTE_S, $05, NORTH | SOUTH
	connection north, Town1, TOWN_1, -5, 0, 16
	connection south, Swamp, SWAMP, -10, 0, 16

	map_attributes Swamp, SWAMP, $05, NORTH | SOUTH | WEST
	connection north, RouteS, ROUTE_S, 10, 0, 10
	connection south, RouteSE1, ROUTE_SE_1, 20, 0, 16
	connection west, RouteSW, ROUTE_SW, 20, 0, 9

	map_attributes RouteSW, ROUTE_SW, $05, SOUTH | EAST
	connection south, Town5, TOWN_5, -10, 0, 16
	connection east, Swamp, SWAMP, -20, 0, 16

	map_attributes Town5, TOWN_5, $05, NORTH
	connection north, RouteSW, ROUTE_SW, 10, 0, 16

	map_attributes RouteSE1, ROUTE_SE_1, $05, NORTH | EAST | SOUTH
	connection north, Swamp, SWAMP, -20, 0, 16
	connection south, RouteFakeExit, ROUTE_FAKE_EXIT, 10, 0, 10
	connection east, RouteSE2, ROUTE_SE_2, 0, 0, 9

	map_attributes RouteSE2, ROUTE_SE_2, $05, NORTH | WEST | EAST
	connection north, Lake1, LAKE_1, 10, 0, 30
	connection west, RouteSE1, ROUTE_SE_1, 0, 0, 9
	connection east, RouteSE3, ROUTE_SE_3, 0, 0, 9

	map_attributes RouteSE3, ROUTE_SE_3, $05, NORTH | WEST
	connection north, Town6, TOWN_6, 10, 0, 30
	connection west, RouteSE2, ROUTE_SE_2, 0, 0, 9

	map_attributes Town6, TOWN_6, $05, SOUTH | WEST
	connection south, RouteSE3, ROUTE_SE_3, -10, 0, 30
	connection west, Lake1, LAKE_1, -18, 0, 9

	map_attributes Lake1, LAKE_1, $05, NORTH | SOUTH | EAST
	connection north, Lake2, LAKE_2, 0, 0, 36
	connection south, RouteSE2, ROUTE_SE_2, -10, 0, 30
	connection east, Town6, TOWN_6, 18, 0, 9

	map_attributes Lake2, LAKE_2, $05, NORTH | SOUTH | WEST
	connection north, Lake3, LAKE_3, 10, 0, 30
	connection south, Lake1, LAKE_1, 0, 0, 30
	connection west, Town2, TOWN_2, -9, 0, 15

	map_attributes Lake3, LAKE_3, $05, NORTH | SOUTH 
	connection north, Crevasse, CREVASSE, 0, 0, 30
	connection south, Lake2, LAKE_2, -10, 0, 36

	map_attributes RouteFakeExit, ROUTE_FAKE_EXIT, $05, NORTH | SOUTH 
	connection north, RouteSE1, ROUTE_SE_1, -10, 0, 10
	connection south, RouteFakeExitLoop, ROUTE_FAKE_EXIT_LOOP, 0, 0, 10

	map_attributes RouteFakeExitLoop, ROUTE_FAKE_EXIT_LOOP, $05, NORTH | SOUTH 
	connection north, RouteFakeExitLoop, ROUTE_FAKE_EXIT_LOOP, 0, 0, 10
	connection south, RouteFakeExitLoop, ROUTE_FAKE_EXIT_LOOP, 0, 0, 10


	map_attributes DayCare, DAY_CARE, $00, 0

	map_attributes Pokecenter2F, POKECENTER_2F, $00, 0
	map_attributes TradeCenter, TRADE_CENTER, $00, 0
	map_attributes Colosseum, COLOSSEUM, $00, 0
	map_attributes TimeCapsule, TIME_CAPSULE, $00, 0

	map_attributes PlayersHouse1F, PLAYERS_HOUSE_1F, $00, 0
	map_attributes PlayersHouse2F, PLAYERS_HOUSE_2F, $00, 0

	map_attributes MysteryDungeonNorthSouthEastWest, MYSTERY_DUNGEON_NORTH_SOUTH_EAST_WEST, $05, 0

	map_attributes MysteryDungeonNorthSouthEast, MYSTERY_DUNGEON_NORTH_SOUTH_EAST, $05, 0
	map_attributes MysteryDungeonNorthSouthWest, MYSTERY_DUNGEON_NORTH_SOUTH_WEST, $05, 0
	map_attributes MysteryDungeonNorthEastWest, MYSTERY_DUNGEON_NORTH_EAST_WEST, $05, 0
	map_attributes MysteryDungeonSouthEastWest, MYSTERY_DUNGEON_SOUTH_EAST_WEST, $05, 0

	map_attributes MysteryDungeonNorthSouth, MYSTERY_DUNGEON_NORTH_SOUTH, $05, 0
	map_attributes MysteryDungeonEastWest, MYSTERY_DUNGEON_EAST_WEST, $05, 0

	map_attributes MysteryDungeonNorthEast, MYSTERY_DUNGEON_NORTH_EAST, $05, 0
	map_attributes MysteryDungeonNorthWest, MYSTERY_DUNGEON_NORTH_WEST, $05, 0
	map_attributes MysteryDungeonSouthEast, MYSTERY_DUNGEON_SOUTH_EAST, $05, 0
	map_attributes MysteryDungeonSouthWest, MYSTERY_DUNGEON_SOUTH_WEST, $05, 0

	map_attributes MysteryDungeonNorth, MYSTERY_DUNGEON_NORTH, $05, 0
	map_attributes MysteryDungeonSouth, MYSTERY_DUNGEON_SOUTH, $05, 0
	map_attributes MysteryDungeonEast, MYSTERY_DUNGEON_EAST, $05, 0
	map_attributes MysteryDungeonWest, MYSTERY_DUNGEON_WEST, $05, 0

