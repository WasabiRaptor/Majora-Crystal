
	db  40,  30,  35,  55,  45,  40
    evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FLYING, DRAGON ; type
	db 190 ; catch rate
	db 49 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/noibat/front.dimensions"
	db 0, 0	; abilities
	db 0	; hidden ability
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm
	; end
	