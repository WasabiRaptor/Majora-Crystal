	db SEVIPER

	db  73, 100,  60,  65, 100,  60
    evs  0,   1,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 90 ; catch rate
	db 160 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/seviper/front.dimensions"
	db 0, 0 ;total form differences, which form this is
	db 0, 0	; abilities
	db 0 	; hidden ability
	db GROWTH_FLUCTUATING ; growth rate
	dn EGG_DRAGON, EGG_FIELD ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, ATTRACT, FLAMETHROWER
	; end
	