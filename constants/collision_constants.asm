LANDTILE  EQU $0
WATERTILE EQU $1
WALLTILE  EQU $f

TALK     EQU $1 << 4

COLL_FLOOR             EQU $00
COLL_WALL              EQU $07
COLL_LONG_GRASS        EQU $14
COLL_HEADBUTT_TREE     EQU $15
COLL_TALL_GRASS        EQU $18
COLL_OVERHEAD          EQU $1c
COLL_ICE               EQU $23
COLL_WHIRLPOOL         EQU $24
COLL_BUOY              EQU $27
COLL_WATER             EQU $29
COLL_WATERFALL         EQU $33
COLL_CURRENT_RIGHT     EQU $38
COLL_CURRENT_LEFT      EQU $39
COLL_CURRENT_UP        EQU $3a
COLL_CURRENT_DOWN      EQU $3b
COLL_HOLE              EQU $60
COLL_WARP_CARPET_DOWN  EQU $70
COLL_DOOR              EQU $71
COLL_LADDER            EQU $72
COLL_AWNING            EQU $73
COLL_DOOR_LEFT     	   EQU $74 
COLL_DOOR_RIGHT        EQU $75 
COLL_WARP_CARPET_LEFT  EQU $76
COLL_WARP_CARPET_UP    EQU $78
COLL_STAIRCASE         EQU $7a
COLL_CAVE              EQU $7b
COLL_WARP_PANEL        EQU $7c
COLL_WARP_CARPET_RIGHT EQU $7e
COLL_STOP_SPIN         EQU $80
COLL_SPIN_UP           EQU $81
COLL_SPIN_DOWN         EQU $82
COLL_SPIN_LEFT         EQU $83
COLL_SPIN_RIGHT        EQU $84
COLL_PUDDLE            EQU $85
COLL_COUNTER           EQU $90
COLL_BOOKSHELF         EQU $91
COLL_TRASH_CAN         EQU $92
COLL_PC                EQU $93
COLL_RADIO             EQU $94
COLL_TOWN_MAP          EQU $95
COLL_MART_SHELF        EQU $96
COLL_TV                EQU $97
COLL_POKECENTER_SIGN   EQU $98
COLL_MART_SIGN         EQU $99
COLL_VENDING_MACHINE   EQU $9a
COLL_FRIDGE            EQU $9b
COLL_SINK              EQU $9c
COLL_WINDOW            EQU $9d
COLL_STOVE             EQU $9e
COLL_INCENSE           EQU $9f
COLL_HOP_RIGHT         EQU $a0
COLL_HOP_LEFT          EQU $a1
COLL_HOP_UP            EQU $a2 ; unused
COLL_HOP_DOWN          EQU $a3
COLL_HOP_DOWN_RIGHT    EQU $a4
COLL_HOP_DOWN_LEFT     EQU $a5
COLL_HOP_UP_RIGHT      EQU $a6 ; unused
COLL_HOP_UP_LEFT       EQU $a7 ; unused
COLL_RIGHT_WALL        EQU $b0
COLL_LEFT_WALL         EQU $b1
COLL_UP_WALL           EQU $b2
COLL_DOWN_WALL         EQU $b3
COLL_ELEVATOR_BUTTON   EQU $d1
COLL_DIAGONAL_STAIRS_RIGHT EQU $d0
COLL_DIAGONAL_STAIRS_LEFT  EQU $d1
COLL_FF                EQU $ff ; garbage

COLL_DOOR_DOWN         EQU COLL_AWNING
COLL_LEDGE_RIGHT       EQU $a0
COLL_LEDGE_LEFT        EQU $a1
COLL_LEDGE_UP          EQU $a2
COLL_LEDGE_DOWN        EQU $a3
COLL_LEDGE_DOWN_RIGHT  EQU $a4
COLL_LEDGE_DOWN_LEFT   EQU $a5
COLL_LEDGE_UP_RIGHT    EQU $a6
COLL_LEDGE_UP_LEFT     EQU $a7

; collision data type nybbles
LO_NYBBLE_GRASS      EQU $07
HI_NYBBLE_TALL_GRASS EQU $10
HI_NYBBLE_WATER      EQU $20
HI_NYBBLE_CURRENT    EQU $30
HI_NYBBLE_WALK       EQU $40
HI_NYBBLE_WALK_ALT   EQU $50
HI_NYBBLE_WARPS      EQU $70
HI_NYBBLE_LEDGES     EQU $a0
HI_NYBBLE_SIDE_WALLS EQU $b0
HI_NYBBLE_UNUSED_C0  EQU $c0
HI_NYBBLE_DIAGONAL_STAIRS  EQU $d0
