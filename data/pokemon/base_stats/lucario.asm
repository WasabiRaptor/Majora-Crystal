	db LUCARIO

	db  70, 110,  70,  90, 115,  90
    evs  0,   1,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, STEEL ; type
	db 45 ; catch rate
	db 184 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/lucario/front.dimensions"
	db 0, 0 ;form differences
	db 0, 0	;abilities
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FIELD, EGG_HUMAN_LIKE ; egg groups 

	; tm/hm learnset
	tmhm
	; end
	