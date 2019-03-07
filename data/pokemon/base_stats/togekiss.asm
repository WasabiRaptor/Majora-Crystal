
	db  85,  50,  95,  80, 120, 115
    evs  0,   0,   0,   0,   2,   1
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FLYING ; type
	db 30 ; catch rate
	db 245 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/togekiss/front.dimensions"
	db 0, 0	; abilities
	db 0	; hidden ability
	db GROWTH_FAST ; growth rate
	dn EGG_FAIRY, EGG_FLYING ; egg groups

	; tmhm
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, SOLAR_BEAM, RETURN, PSYCHIC, SHADOW_BALL, ROOST, DOUBLE_TEAM, REFLECT, FLAMETHROWER, FIRE_BLAST, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, STEEL_WING, DAZZLINGLEAM, ROCK_SMASH, FOCUS_BLAST, ENDURE, DRAIN_PUNCH, WATER_PULSE, GIGA_IMPACT, FLASH, THUNDER_WAVE, FLY, DREAM_EATER, HEADBUTT, HYPER_VOICE, ROLLOUT, SLEEP_TALK, SWAGGER, TRICK, ZEN_HEADBUTT
	; end
