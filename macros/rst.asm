FarCall    EQU $08
Bankswitch EQU $10
AddNTimes  EQU $18
CopyBytes  EQU $20
JumpTable  EQU $28

farcall: MACRO ; bank, address
	ld a, BANK(\1)
	ld hl, \1
	rst FarCall
ENDM

callfar: MACRO ; address, bank
	ld hl, \1
	ld a, BANK(\1)
	rst FarCall
ENDM

farjp: MACRO ; bank, address
	rst FarCall
	dbw BANK(\1) | $80, \1
endm

homecall: MACRO
	ldh a, [hROMBank]
	push af
	ld a, BANK(\1)
	rst Bankswitch
	call \1
	pop af
	rst Bankswitch
ENDM
