
	db  60, 105,  60, 105, 120,  60
    evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 45 ; catch rate
	db 179 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/flabebe/front.dimensions" ; TEMP
	db 0, 0	; abilities
	db 0	; hidden ability
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FIELD, EGG_FIELD ; egg groups

	; tm/hm learnset
	tmhm
	; end
