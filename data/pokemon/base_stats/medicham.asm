	db MEDICHAM

	db  60,  60,  75,  80,  60,  75
    evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, PSYCHIC ; type
	db 90 ; catch rate
	db 144 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/medicham/front.dimensions"
	db 0, 0 ;form differences
	db 0, 0	;abilities
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMAN_LIKE, EGG_HUMAN_LIKE ; egg groups 

	; tm/hm learnset
	tmhm
	; end
	