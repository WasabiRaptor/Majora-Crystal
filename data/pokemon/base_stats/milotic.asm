	db MILOTIC ; 129

	db  95,  60,  79,  81, 100, 125
    evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 60 ; catch rate
	db 189 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/milotic/front.dimensions"
	db 0, 0 ;form differences
	db 0, 0	; abilities
	db 0 	; hidden ability
	db GROWTH_ERRATIC ; growth rate
	dn EGG_DRAGON, EGG_WATER_1 ; egg groups 

	; tm/hm learnset
	tmhm
	; end
	