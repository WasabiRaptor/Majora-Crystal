TreeMons:
; entries correspond to TREEMON_SET_* constants
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_City

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	db 50, MEOWTH,    10
	db 15, MEOWTH,    10
	db 15, MEOWTH,    10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1
; rare
	db 50, MEOWTH,    10
	db 15, NATU,  10
	db 15, NATU,  10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

TreeMonSet_Town:
; common
	db 50, MEOWTH,    10
	db 15, TOGEPI,      10
	db 15, MEOWTH,    10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1
; rare
	db 50, MEOWTH,    10
	db 15, NATU,  10
	db 15, NATU,  10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

TreeMonSet_Route:
; common
	db 50, TYRANITAR,   10
	db 15, SPINARAK,   10
	db 15, LEDYBA,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, TYRANITAR,   10
	db 15, SNEASEL,     10
	db 15, SNEASEL,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Kanto:
; common
	db 50, TYRANITAR,   10
	db 15, TOGEPI,      10
	db 15, TYRANITAR,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, TYRANITAR,   10
	db 15, SNEASEL,     10
	db 15, SNEASEL,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Lake:
; common
	db 50, TYRANITAR,   10
	db 15, SWABLU,    10
	db 15, TYRANITAR,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, TYRANITAR,   10
	db 15, SNEASEL,     10
	db 15, SNEASEL,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Forest:
; common
	db 50, TYRANITAR,   10
	db 15, SNEASEL,     10
	db 15, SNEASEL,     10
	db 10, NOCTOWL,    10
	db  5, ROCKRUFF, 10
	db  5, MAGNEMITE,   10
	db -1
; rare
	db 50, TYRANITAR,   10
	db 15, ZORUA,   10
	db 15, LYCANROC,     10
	db 10, TYRANITAR,   10
	db  5, ZOROARK,    10
	db  5, MIMIKYU,     10
	db -1

TreeMonSet_Rock:
	db 90, KRABBY,     15
	db 10, UNOWN,    15
	db -1
