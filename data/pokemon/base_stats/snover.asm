
	db  60,  62,  50,  40,  62,  60
    evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, ICE ; type
	db 120 ; catch rate
	db 67 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/snover/front.dimensions"
	db 0, 0	; abilities
	db 0	; hidden ability
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GRASS ; egg groups

	; tm/hm learnset
	tmhm
	; end
