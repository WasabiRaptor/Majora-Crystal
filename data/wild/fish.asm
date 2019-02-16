time_group EQUS "0," ; use the nth TimeFishGroups entry

fishgroup: MACRO
; chance, old rod, good rod, super rod
	dbwww \1, \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	fishgroup 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super
	fishgroup 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	fishgroup 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	fishgroup 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super
	fishgroup 50 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super
	fishgroup 50 percent + 1, .Piloswine_Swarm_Old,   .Piloswine_Swarm_Good,   .Piloswine_Swarm_Super
	fishgroup 50 percent + 1, .Bronzor_Swarm_Old,   .Bronzor_Swarm_Good,   .Bronzor_Swarm_Super
	fishgroup 50 percent + 1, .Anorith_Old,         .Anorith_Good,         .Anorith_Super
	fishgroup 50 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super
	fishgroup 50 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super
	fishgroup 50 percent + 1, .Piloswine_Old,         .Piloswine_Good,         .Piloswine_Super
	fishgroup 50 percent + 1, .Bronzor_Old,         .Bronzor_Good,         .Bronzor_Super
	fishgroup 50 percent + 1, .Piloswine_NoSwarm_Old, .Piloswine_NoSwarm_Good, .Piloswine_NoSwarm_Super

.Shore_Old:
	db  70 percent + 1, LAPRAS,   10
	db  85 percent + 1, LAPRAS,   10
	db 100 percent,     KRABBY,     10
.Shore_Good:
	db  35 percent,     LAPRAS,   20
	db  70 percent,     KRABBY,     20
	db  90 percent + 1, KRABBY,     20
	db 100 percent,     time_group 0
.Shore_Super:
	db  40 percent,     KRABBY,     40
	db  70 percent,     time_group 1
	db  90 percent + 1, KRABBY,     40
	db 100 percent,     KINGLER,    40

.Ocean_Old:
	db  70 percent + 1, LAPRAS,   10
	db  85 percent + 1, LAPRAS,   10
	db 100 percent,     DEERLING,  10
.Ocean_Good:
	db  35 percent,     LAPRAS,   20
	db  70 percent,     DEERLING,  20
	db  90 percent + 1, JANGMO_O,   20
	db 100 percent,     time_group 2
.Ocean_Super:
	db  40 percent,     JANGMO_O,   40
	db  70 percent,     time_group 3
	db  90 percent + 1, SAWSBUCK, 40
	db 100 percent,     HAKAMO_O,    40

.Lake_Old:
	db  70 percent + 1, LAPRAS,   10
	db  85 percent + 1, LAPRAS,   10
	db 100 percent,     GOLDEEN,    10
.Lake_Good:
	db  35 percent,     LAPRAS,   20
	db  70 percent,     GOLDEEN,    20
	db  90 percent + 1, GOLDEEN,    20
	db 100 percent,     time_group 4
.Lake_Super:
	db  40 percent,     GOLDEEN,    40
	db  70 percent,     time_group 5
	db  90 percent + 1, LAPRAS,   40
	db 100 percent,     SEAKING,    40

.Pond_Old:
	db  70 percent + 1, LAPRAS,   10
	db  85 percent + 1, LAPRAS,   10
	db 100 percent,     SANDSLASH,    10
.Pond_Good:
	db  35 percent,     LAPRAS,   20
	db  70 percent,     SANDSLASH,    20
	db  90 percent + 1, SANDSLASH,    20
	db 100 percent,     time_group 6
.Pond_Super:
	db  40 percent,     SANDSLASH,    40
	db  70 percent,     time_group 7
	db  90 percent + 1, LAPRAS,   40
	db 100 percent,     SANDSLASH,    40

.Dratini_Old:
	db  70 percent + 1, LAPRAS,   10
	db  85 percent + 1, LAPRAS,   10
	db 100 percent,     LAPRAS,   10
.Dratini_Good:
	db  35 percent,     LAPRAS,   20
	db  70 percent,     LAPRAS,   20
	db  90 percent + 1, LAPRAS,   20
	db 100 percent,     time_group 8
.Dratini_Super:
	db  40 percent,     LAPRAS,   40
	db  70 percent,     time_group 9
	db  90 percent + 1, LAPRAS,   40
	db 100 percent,     DRAGONAIR,  40

.Piloswine_Swarm_Old:
	db  70 percent + 1, LAPRAS,   5
	db  85 percent + 1, LAPRAS,   5
	db 100 percent,     PILOSWINE,   5
.Piloswine_Swarm_Good:
	db  35 percent,     LAPRAS,   20
	db  70 percent,     PILOSWINE,   20
	db  90 percent + 1, PILOSWINE,   20
	db 100 percent,     time_group 10
.Piloswine_Swarm_Super:
	db  40 percent,     PILOSWINE,   40
	db  70 percent,     time_group 11
	db  90 percent + 1, PILOSWINE,   40
	db 100 percent,     PILOSWINE,   40

.Bronzor_Swarm_Old:
	db  70 percent + 1, LAPRAS,   10
	db  85 percent + 1, LAPRAS,   10
	db 100 percent,     BRONZOR,   10
.Bronzor_Swarm_Good:
	db  35 percent,     LAPRAS,   20
	db  70 percent,     BRONZOR,   20
	db  90 percent + 1, BRONZOR,   20
	db 100 percent,     time_group 12
.Bronzor_Swarm_Super:
	db  40 percent,     BRONZOR,   40
	db  70 percent,     time_group 13
	db  90 percent + 1, BRONZOR,   40
	db 100 percent,     BRONZOR,   40

.Anorith_Old:
	db  70 percent + 1, LAPRAS,   10
	db  85 percent + 1, LAPRAS,   10
	db 100 percent,     LAPRAS,   10
.Anorith_Good:
	db  35 percent,     LAPRAS,   20
	db  70 percent,     LAPRAS,   20
	db  90 percent + 1, LAPRAS,   20
	db 100 percent,     time_group 14
.Anorith_Super:
	db  40 percent,     LAPRAS,   40
	db  70 percent,     time_group 15
	db  90 percent + 1, LAPRAS,   40
	db 100 percent,     LAPRAS,   40

.Dratini_2_Old:
	db  70 percent + 1, LAPRAS,   10
	db  85 percent + 1, LAPRAS,   10
	db 100 percent,     LAPRAS,   10
.Dratini_2_Good:
	db  35 percent,     LAPRAS,   10
	db  70 percent,     LAPRAS,   10
	db  90 percent + 1, LAPRAS,   10
	db 100 percent,     time_group 16
.Dratini_2_Super:
	db  40 percent,     LAPRAS,   10
	db  70 percent,     time_group 17
	db  90 percent + 1, LAPRAS,   10
	db 100 percent,     DRAGONAIR,  10

.WhirlIslands_Old:
	db  70 percent + 1, LAPRAS,   10
	db  85 percent + 1, LAPRAS,   10
	db 100 percent,     KRABBY,     10
.WhirlIslands_Good:
	db  35 percent,     LAPRAS,   20
	db  70 percent,     KRABBY,     20
	db  90 percent + 1, KRABBY,     20
	db 100 percent,     time_group 18
.WhirlIslands_Super:
	db  40 percent,     KRABBY,     40
	db  70 percent,     time_group 19
	db  90 percent + 1, KINGLER,    40
	db 100 percent,     SEADRA,     40

.Piloswine_NoSwarm_Old:
.Piloswine_Old:
	db  70 percent + 1, LAPRAS,   10
	db  85 percent + 1, LAPRAS,   10
	db 100 percent,     DEERLING,  10
.Piloswine_NoSwarm_Good:
.Piloswine_Good:
	db  35 percent,     LAPRAS,   20
	db  70 percent,     DEERLING,  20
	db  90 percent + 1, DEERLING,  20
	db 100 percent,     time_group 20
.Piloswine_NoSwarm_Super:
.Piloswine_Super:
	db  40 percent,     DEERLING,  40
	db  70 percent,     time_group 21
	db  90 percent + 1, LAPRAS,   40
	db 100 percent,     PILOSWINE,   40

.Bronzor_Old:
	db  70 percent + 1, LAPRAS,   10
	db  85 percent + 1, LAPRAS,   10
	db 100 percent,     SANDSLASH,    10
.Bronzor_Good:
	db  35 percent,     LAPRAS,   20
	db  70 percent,     SANDSLASH,    20
	db  90 percent + 1, SANDSLASH,    20
	db 100 percent,     time_group 6
.Bronzor_Super:
	db  40 percent,     SANDSLASH,    40
	db  70 percent,     time_group 7
	db  90 percent + 1, LAPRAS,   40
	db 100 percent,     BRONZOR,   40

TimeFishGroups:
	;  day              nite
	db GOLURK,    20,  STARYU,     20 ; 0
	db GOLURK,    40,  STARYU,     40 ; 1
	db GALVANTULA,   20,  GALVANTULA,   20 ; 2
	db GALVANTULA,   40,  GALVANTULA,   40 ; 3
	db GOLDEEN,    20,  GOLDEEN,    20 ; 4
	db GOLDEEN,    40,  GOLDEEN,    40 ; 5
	db SANDSLASH,    20,  SANDSLASH,    20 ; 6
	db SANDSLASH,    40,  SANDSLASH,    40 ; 7
	db DRATINI,    20,  DRATINI,    20 ; 8
	db DRATINI,    40,  DRATINI,    40 ; 9
	db PILOSWINE,   20,  PILOSWINE,   20 ; 10
	db PILOSWINE,   40,  PILOSWINE,   40 ; 11
	db BRONZOR,   20,  BRONZOR,   20 ; 12
	db BRONZOR,   40,  BRONZOR,   40 ; 13
	db ANORITH,   20,  ANORITH,   20 ; 14
	db ANORITH,   40,  ANORITH,   40 ; 15
	db DRATINI,    10,  DRATINI,    10 ; 16
	db DRATINI,    10,  DRATINI,    10 ; 17
	db HORSEA,     20,  HORSEA,     20 ; 18
	db HORSEA,     40,  HORSEA,     40 ; 19
	db DEERLING,  20,  DEERLING,  20 ; 20
	db DEERLING,  40,  DEERLING,  40 ; 21
