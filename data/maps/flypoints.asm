flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM

Flypoints:
; landmark, spawn point
	const_def
; Johto

; Kanto
KANTO_FLYPOINT EQU const_value

	db -1
