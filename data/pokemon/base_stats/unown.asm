	db UNOWN ; 213

	db  48,  72,  48,  48,  72,  48
    evs  0,   1,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 225 ; catch rate
	db 118 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/unown_a/front.dimensions"
	db 0, 0 ;form differences
	db 0, 0	; abilities
	db 0 	; hidden ability
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm
	; end
