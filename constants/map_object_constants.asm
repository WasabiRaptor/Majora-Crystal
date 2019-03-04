; object struct
	const_def
	const OBJECT_SPRITE
	const OBJECT_MAP_OBJECT_INDEX
	const OBJECT_SPRITE_TILE
	const OBJECT_MOVEMENTTYPE
	const OBJECT_FLAGS1
	const OBJECT_FLAGS2
	const OBJECT_PALETTE
	const OBJECT_DIRECTION_WALKING
	const OBJECT_FACING
	const OBJECT_STEP_TYPE
	const OBJECT_STEP_DURATION
	const OBJECT_ACTION
	const OBJECT_STEP_FRAME
	const OBJECT_FACING_STEP
	const OBJECT_NEXT_TILE
	const OBJECT_STANDING_TILE
	const OBJECT_NEXT_MAP_X
	const OBJECT_NEXT_MAP_Y
	const OBJECT_MAP_X
	const OBJECT_MAP_Y
	const OBJECT_INIT_X
	const OBJECT_INIT_Y
	const OBJECT_RADIUS
	const OBJECT_SPRITE_X
	const OBJECT_SPRITE_Y
	const OBJECT_SPRITE_X_OFFSET
	const OBJECT_SPRITE_Y_OFFSET
	const OBJECT_MOVEMENT_BYTE_INDEX
	const OBJECT_28
	const OBJECT_29
	const OBJECT_30
	const OBJECT_31
	const OBJECT_RANGE
OBJECT_1C EQU OBJECT_28   
OBJECT_1D EQU OBJECT_29
OBJECT_1E EQU OBJECT_30
OBJECT_1F EQU OBJECT_31

; object_struct OBJECT_FACING values
OW_DOWN  EQU DOWN  << 2
OW_UP    EQU UP    << 2
OW_LEFT  EQU LEFT  << 2
OW_RIGHT EQU RIGHT << 2

; object_struct OBJECT_FLAGS1 bit flags
	const_def
	const INVISIBLE_F     ; 0
	const WONT_DELETE_F   ; 1
	const FIXED_FACING_F  ; 2
	const SLIDING_F       ; 3
	const NOCLIP_TILES_F  ; 4
	const MOVE_ANYWHERE_F ; 5
	const NOCLIP_OBJS_F   ; 6
	const EMOTE_OBJECT_F  ; 7

; object_struct OBJECT_FLAGS1 bit flags
FIXED_FACING EQU 2
SLIDING      EQU 3
EMOTE_OBJECT EQU 7

; object_struct OBJECT_FLAGS2 bit flags
	const_def
	const LOW_PRIORITY_F  ; 0
	const HIGH_PRIORITY_F ; 1
	const OBJ_FLAGS2_2    ; 2
	const OVERHEAD_F      ; 3
	const USE_OBP1_F      ; 4

WONT_DELETE   EQU 1 << WONT_DELETE_F
NOCLIP_TILES  EQU 1 << NOCLIP_TILES_F
MOVE_ANYWHERE EQU 1 << MOVE_ANYWHERE_F
NOCLIP_OBJS   EQU 1 << NOCLIP_OBJS_F

; object_struct OBJECT_FLAGS2 bit flags
INVISIBLE    EQU 0
OVERHEAD     EQU 3
OBJECT_DISABLE_STEP_TYPE EQU 5


; map_object struct members (see macros/wram.asm)
	const_def
	const MAPOBJECT_OBJECT_STRUCT_ID ; 0
	const MAPOBJECT_SPRITE ; 1
	const MAPOBJECT_Y_COORD ; 2
	const MAPOBJECT_X_COORD ; 3
	const MAPOBJECT_MOVEMENT ; 4
	const MAPOBJECT_RADIUS ; 5
	const MAPOBJECT_HOUR ; 6
	const MAPOBJECT_TIMEOFDAY ; 7
	const MAPOBJECT_COLOR ; 8
	const MAPOBJECT_RANGE ; 9
	const MAPOBJECT_SCRIPT_POINTER ; a
	const MAPOBJECT_POINTER_HI ; b
	const MAPOBJECT_EVENT_FLAG ; c
	const MAPOBJECT_FLAG_HI ; d
OBJECT_LENGTH EQU const_value

; SpriteMovementData struct members (see data/sprites/map_objects.asm)
	const_def
	const SPRITEMOVEATTR_MOVEMENT ; 0
	const SPRITEMOVEATTR_FACING   ; 1
	const SPRITEMOVEATTR_ACTION   ; 2
	const SPRITEMOVEATTR_FLAGS1   ; 3
	const SPRITEMOVEATTR_FLAGS2   ; 4
	const SPRITEMOVEATTR_PALFLAGS ; 5
NUM_SPRITEMOVEDATA_FIELDS EQU const_value

MAPOBJECT_SCREEN_WIDTH  EQU (SCREEN_WIDTH / 2) + 2
MAPOBJECT_SCREEN_HEIGHT EQU (SCREEN_HEIGHT / 2) + 2

; sprite movement data table indices
; see data/sprites/map_objects.asm
	const_def
	const SPRITEMOVEDATA_00                   ; 00
	const SPRITEMOVEDATA_DOLL                 ; 01
	const SPRITEMOVEDATA_WANDER               ; 02
	const SPRITEMOVEDATA_SPINRANDOM_SLOW      ; 03
	const SPRITEMOVEDATA_WALK_UP_DOWN         ; 04
	const SPRITEMOVEDATA_WALK_LEFT_RIGHT      ; 05
	const SPRITEMOVEDATA_STANDING_DOWN        ; 06
	const SPRITEMOVEDATA_STANDING_UP          ; 07
	const SPRITEMOVEDATA_STANDING_LEFT        ; 08
	const SPRITEMOVEDATA_STANDING_RIGHT       ; 09
	const SPRITEMOVEDATA_SPINRANDOM_FAST      ; 0a
	const SPRITEMOVEDATA_PLAYER               ; 0b
	const SPRITEMOVEDATA_CUTTABLE_TREE        ; 0c
	const SPRITEMOVEDATA_FOLLOWING            ; 0d
	const SPRITEMOVEDATA_SCRIPTED             ; 0e
	const SPRITEMOVEDATA_SNORLAX              ; 0f
	const SPRITEMOVEDATA_POKEMON              ; 10
	const SPRITEMOVEDATA_SUDOWOODO            ; 11
	const SPRITEMOVEDATA_SMASHABLE_ROCK       ; 12
	const SPRITEMOVEDATA_STRENGTH_BOULDER     ; 13
	const SPRITEMOVEDATA_FOLLOWNOTEXACT       ; 14
	const SPRITEMOVEDATA_SHADOW               ; 15
	const SPRITEMOVEDATA_EMOTE                ; 16
	const SPRITEMOVEDATA_SCREENSHAKE          ; 17
	const SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE ; 18
	const SPRITEMOVEDATA_SPINCLOCKWISE        ; 19
	const SPRITEMOVEDATA_BIGDOLL              ; 1a
	const SPRITEMOVEDATA_BOULDERDUST          ; 1b
	const SPRITEMOVEDATA_GRASS                ; 1c
	const SPRITEMOVEDATA_PUDDLE               ; 1d
	const SPRITEMOVEDATA_SWIM_AROUND          ; 1e
	const SPRITEMOVEDATA_SWIM_UP_DOWN         ; 1f
	const SPRITEMOVEDATA_SWIM_LEFT_RIGHT      ; 20
	const SPRITEMOVEDATA_BIG_GYARADOS         ; 21
	const SPRITEMOVEDATA_STANDING_DOWN_FLIP   ; 22
	const SPRITEMOVEDATA_STANDING_UP_FLIP     ; 23
	const SPRITEMOVEDATA_POKECOM_NEWS         ; 24
	const SPRITEMOVEDATA_ARCH_TREE_DOWN       ; 25
	const SPRITEMOVEDATA_ARCH_TREE_UP         ; 26
	const SPRITEMOVEDATA_ARCH_TREE_LEFT       ; 27
	const SPRITEMOVEDATA_ARCH_TREE_RIGHT      ; 28
	const SPRITEMOVEDATA_SAILBOAT_TOP         ; 29
	const SPRITEMOVEDATA_SAILBOAT_BOTTOM      ; 2a
NUM_SPRITEMOVEDATA EQU const_value
SPRITEMOVEDATA_FIELDS EQU 6

; sprite movement functions
; see engine/map_objects.asm:MapObjectMovementPattern.Pointers
	const_def
	const SPRITEMOVEFN_00                    ; 00
	const SPRITEMOVEFN_RANDOM_WALK_Y         ; 01
	const SPRITEMOVEFN_RANDOM_WALK_X         ; 02
	const SPRITEMOVEFN_RANDOM_WALK_XY        ; 03
	const SPRITEMOVEFN_SLOW_RANDOM_SPIN      ; 04
	const SPRITEMOVEFN_FAST_RANDOM_SPIN      ; 05
	const SPRITEMOVEFN_STANDING              ; 06
	const SPRITEMOVEFN_OBEY_DPAD             ; 07
	const SPRITEMOVEFN_FOLLOW                ; 08
	const SPRITEMOVEFN_SCRIPTED              ; 09
	const SPRITEMOVEFN_STRENGTH              ; 0a
	const SPRITEMOVEFN_FOLLOWNOTEXACT        ; 0b
	const SPRITEMOVEFN_SHADOW                ; 0c
	const SPRITEMOVEFN_EMOTE                 ; 0d
	const SPRITEMOVEFN_BIG_SNORLAX           ; 0e
	const SPRITEMOVEFN_BOUNCE                ; 0f
	const SPRITEMOVEFN_SCREENSHAKE           ; 10
	const SPRITEMOVEFN_SPIN_CLOCKWISE        ; 11
	const SPRITEMOVEFN_SPIN_COUNTERCLOCKWISE ; 12
	const SPRITEMOVEFN_BOULDERDUST           ; 13
	const SPRITEMOVEFN_GRASS                 ; 14
	const SPRITEMOVEFN_PUDDLE                ; 15
	const SPRITEMOVEFN_CUT_TREE              ; 16
	const SPRITEMOVEFN_BIG_GYARADOS          ; 17
	const SPRITEMOVEFN_STANDING_FLIP         ; 18
	const SPRITEMOVEFN_POKECOM_NEWS          ; 19
	const SPRITEMOVEFN_ARCH_TREE             ; 1a
	const SPRITEMOVEFN_SAILBOAT_TOP          ; 1b
	const SPRITEMOVEFN_SAILBOAT_BOTTOM       ; 1c

; sprite step types
; see engine/map_objects.asm:StepTypesJumptable
	const_def
	const STEP_TYPE_00              ; 00
	const STEP_TYPE_SLEEP           ; 01
	const STEP_TYPE_NPC_WALK        ; 02
	const STEP_TYPE_03              ; 03
	const STEP_TYPE_04              ; 04
	const STEP_TYPE_05              ; 05
	const STEP_TYPE_PLAYER_WALK     ; 06
	const STEP_TYPE_07              ; 07
	const STEP_TYPE_NPC_JUMP        ; 08
	const STEP_TYPE_PLAYER_JUMP     ; 09
	const STEP_TYPE_HALF_STEP       ; 0a
	const STEP_TYPE_BUMP            ; 0b
	const STEP_TYPE_TELEPORT_FROM   ; 0c
	const STEP_TYPE_TELEPORT_TO     ; 0d
	const STEP_TYPE_SKYFALL         ; 0e
	const STEP_TYPE_0F              ; 0f
	const STEP_TYPE_GOT_BITE        ; 10
	const STEP_TYPE_ROCK_SMASH      ; 11
	const STEP_TYPE_RETURN_DIG      ; 12
	const STEP_TYPE_TRACKING_OBJECT ; 13
	const STEP_TYPE_14              ; 14
	const STEP_TYPE_SKYFALL_TOP     ; 15
	const STEP_TYPE_NPC_DIAGONAL_STAIRS
	const STEP_TYPE_PLAYER_DIAGONAL_STAIRS


; see engine/map_object_action.asm:Pointers445f
	const_def
	const OBJECT_ACTION_00              ; 00
	const OBJECT_ACTION_STAND           ; 01
	const OBJECT_ACTION_STEP            ; 02
	const OBJECT_ACTION_BUMP            ; 03
	const OBJECT_ACTION_SPIN            ; 04
	const OBJECT_ACTION_SPIN_FLICKER    ; 05
	const OBJECT_ACTION_FISHING         ; 06
	const OBJECT_ACTION_SHADOW          ; 07
	const OBJECT_ACTION_EMOTE           ; 08
	const OBJECT_ACTION_BIG_SNORLAX     ; 09
	const OBJECT_ACTION_BOUNCE          ; 0a
	const OBJECT_ACTION_WEIRD_TREE      ; 0b
	const OBJECT_ACTION_BIG_DOLL        ; 0c
	const OBJECT_ACTION_BOULDER_DUST    ; 0d
	const OBJECT_ACTION_GRASS_SHAKE     ; 0e
	const OBJECT_ACTION_PUDDLE_SPLASH   ; 0f
	const OBJECT_ACTION_CUT_TREE        ; 10
	const OBJECT_ACTION_SKYFALL         ; 11
	const OBJECT_ACTION_BIG_GYARADOS    ; 12
	const OBJECT_ACTION_STAND_FLIP      ; 13
	const OBJECT_ACTION_POKECOM_NEWS    ; 14
	const OBJECT_ACTION_ARCH_TREE       ; 15
	const OBJECT_ACTION_RUN             ; 16
	const OBJECT_ACTION_SAILBOAT_TOP    ; 17
	const OBJECT_ACTION_SAILBOAT_BOTTOM ; 18

; see data/sprites/facings.asm:Facings
	const_def
	const FACING_STEP_DOWN_0     ; 00
	const FACING_STEP_DOWN_1     ; 01
	const FACING_STEP_DOWN_2     ; 02
	const FACING_STEP_DOWN_3     ; 03
	const FACING_STEP_UP_0       ; 04
	const FACING_STEP_UP_1       ; 05
	const FACING_STEP_UP_2       ; 06
	const FACING_STEP_UP_3       ; 07
	const FACING_STEP_LEFT_0     ; 08
	const FACING_STEP_LEFT_1     ; 09
	const FACING_STEP_LEFT_2     ; 0a
	const FACING_STEP_LEFT_3     ; 0b
	const FACING_STEP_RIGHT_0    ; 0c
	const FACING_STEP_RIGHT_1    ; 0d
	const FACING_STEP_RIGHT_2    ; 0e
	const FACING_STEP_RIGHT_3    ; 0f
	const FACING_FISH_DOWN       ; 10
	const FACING_FISH_UP         ; 11
	const FACING_FISH_LEFT       ; 12
	const FACING_FISH_RIGHT      ; 13
	const FACING_EMOTE           ; 14
	const FACING_SHADOW          ; 15
	const FACING_BIG_DOLL_ASYM   ; 16
	const FACING_BIG_DOLL_SYM    ; 17
	const FACING_WEIRD_TREE_0    ; 18
	const FACING_WEIRD_TREE_1    ; 19
	const FACING_WEIRD_TREE_2    ; 1a
	const FACING_WEIRD_TREE_3    ; 1b
	const FACING_BOULDER_DUST_1  ; 1c
	const FACING_BOULDER_DUST_2  ; 1d
	const FACING_GRASS_1         ; 1e
	const FACING_GRASS_2         ; 1f
	const FACING_SPLASH_1        ; 20
	const FACING_SPLASH_2        ; 21
	const FACING_CUT_TREE        ; 22
	const FACING_BIG_GYARADOS_1  ; 23
	const FACING_BIG_GYARADOS_2  ; 24
	const FACING_STEP_DOWN_FLIP  ; 25
	const FACING_STEP_UP_FLIP    ; 26
	const FACING_POKECOM_NEWS    ; 27
	const FACING_ARCH_TREE_DOWN  ; 28
	const FACING_ARCH_TREE_UP    ; 29
	const FACING_ARCH_TREE_LEFT  ; 2a
	const FACING_ARCH_TREE_RIGHT ; 2b
	const FACING_SAILBOAT_TOP    ; 2c
	const FACING_SAILBOAT_BOTTOM ; 2d

; DoPlayerMovement.DoStep arguments (see engine/overworld/player_movement.asm)
	const_def
	const STEP_SLOW          ; 0
	const STEP_WALK          ; 1
	const STEP_BIKE          ; 2
	const STEP_RUN			 ; 3
	const STEP_LEDGE         ; 4
	const STEP_ICE           ; 5
	const STEP_TURN          ; 6
	const STEP_BACK_LEDGE    ; 7
	const STEP_WALK_IN_PLACE ; 8
	const STEP_SPIN
	const STEP_FAST ; same as STEP_RUN but without doubling animation speed
	const STEP_DIAGONAL_STAIRS; 11
