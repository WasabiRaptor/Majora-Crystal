	db ARAQUANID ; 133

	db  68,  70,  92,  42,  50, 132
    evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db WATER, BUG ; type
	db 100 ; catch rate
	db 159 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/araquanid/front.dimensions"
	db 0, 0 ;form differences
	db 0, 0	;abilities
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, THUNDERPUNCH, REST, ATTRACT, FIRE_PUNCH, STRENGTH, FLASH, THUNDERBOLT
	; end
