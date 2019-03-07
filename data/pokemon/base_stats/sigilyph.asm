
	db  72,  58,  80,  97, 103,  80
    evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FLYING ; type
	db 45 ; catch rate
	db 172 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sigilyph/front.dimensions"
	db 0, 0	; abilities
	db 0	; hidden ability
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm
	; end
