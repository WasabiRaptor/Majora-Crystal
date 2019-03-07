
	db  92, 102,  90,  98, 125,  90
    evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, DARK ; type
	db 45 ; catch rate
	db 255 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/hydreigon/front.dimensions"
	db 0, 0	; abilities
	db 0	; hidden ability
	db GROWTH_SLOW ; growth rate
	dn EGG_DRAGON, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm
	; end
	