npctrade: MACRO
	db \1, \2, \3, \4 ; dialog set, requested mon, offered mon, nickname
	db \5, \6, \7 ; dvs
	db \8, \9 ; personality
	shift
	db \9 ; item
	shift
	db \9 ; ball
	shift
	dw \9 ; OT ID
	shift
	db \9, 0 ; OT name
ENDM

NPCTrades:
; OT names have 3 characters less padding so the total struct is 31 bytes
; TRADE_WITH_MIKE_FOR_MACHOP in Goldenrod City
	npctrade 0, EEVEE,       EEVEE,     "Why even@@@", $EE, $EE, $EE, HIDDEN_ABILITY | ADAMANT, MALE,   LEVEL_BALL,   SITRUS_BERRY, 42069, "haha yes@"
