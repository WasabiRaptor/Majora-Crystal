
	db  50,  50, 150,  50,  50, 150
    evs  0,   0,   1,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db ROCK, FAIRY ; type
	db 60 ; catch rate
	db 100 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/carbink/front.dimensions"
	db 0, 0	; abilities
	db 0	; hidden ability
	db GROWTH_SLOW ; growth rate
	dn EGG_FAIRY, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm
	; end
	