text   EQUS "db \"<START>\"," ; Start writing text.
next   EQUS "db \"<NL>\","    ; Move a line down.
next1  EQUS "db \"<LNBRK>\"," ; Move a line down (without line spacing)
line   EQUS "db \"<LINE>\","  ; Start writing at the bottom line.
page   EQUS "db \"@\","       ; Start a new Pokedex page.
para   EQUS "db \"<PARA>\","  ; Start a new paragraph.
cont   EQUS "db \"<CONT>\","  ; Scroll to the next line.
done   EQUS "db \"<DONE>\""   ; End a text box.
prompt EQUS "db \"<PROMPT>\"" ; Prompt the player to end a text box (initiating some other event).

text_start: MACRO
	db "<START>"
ENDM

text_ram: MACRO
	db "<RAM>"
	dw \1
endm

text_bcd: MACRO
	db "<BCD>"
	dw \1
	db \2
endm

text_move: MACRO
	db "<MOVE>"
	dw \1
endm

text_box: MACRO
	db "<BOX>"
	dw \1
	db \2, \3
ENDM

text_low: MACRO
	db "<LOW>"
endm

text_waitbutton: MACRO
	db "<WAIT>"
endm

text_scroll: MACRO
	db "<SCROLL>"
endm

start_asm: MACRO
	db "<ASM>"
endm

deciram: MACRO
	db "<NUM>"
	dw \1 ; address
	dn \2, \3 ; bytes, digits
endm

interpret_data: MACRO
	db "<EXIT>"
endm

sound_dex_fanfare_50_79: MACRO
	db "<DEX2>"
endm

limited_interpret_data: MACRO
	db "<DOTS>"
	db \1
endm

link_wait_button: MACRO
	db "<LINK>"
endm

sound_dex_fanfare_20_49: MACRO
	db "<DEX1>"
endm

sound_item: MACRO
	db "<ITEM>"
endm

sound_caught_mon: MACRO
	db "<CAUGHT>"
endm

sound_dex_fanfare_80_109: MACRO
	db "<DEX3>"
endm

sound_fanfare: MACRO
	db "<BEEP>"
endm

sound_slot_machine_start: MACRO
	db "<SLOTS>"
endm

text_buffer: MACRO
	db "<BUFFER>"
	db \1
endm

current_day: MACRO
	db "<DAY>"
endm

text_jump: MACRO
	db "<FAR>"
	dw \1
	db BANK(\1)
ENDM
