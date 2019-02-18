	db LATIOS ; 246

	db  80,  90,  80, 110, 130, 110
    evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, PSYCHIC ; type
	db 3 ; catch rate
	db 270 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/latios/front.dimensions"
	db 0, 0 ;form differences
	db 0, 0	;abilities
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, THUNDERPUNCH, DREAM_EATER, REST, ATTRACT, THIEF, FIRE_PUNCH, NIGHTMARE, FLASH ; TEMP
	; end