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

