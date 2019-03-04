treemon_map: macro
	map_id \1
	db  \2 ; treemon set
endm

TreeMonMaps:
	;treemon_map ROUTE_26, 4
	db -1

RockMonMaps:
	;treemon_map ROUTE_19, 7
	db -1
