	db LEAFEON ; 07

	db  65, 110, 130,  95,  60,  65
    evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 184 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/leafeon/front.dimensions" 
	db 0, 0	; abilities
	db 0	; hidden ability
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FIELD, EGG_FIELD ; egg groups

	; tmhm
	tmhm ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, SOLAR_BEAM, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, ROCK_SMASH, ENERGY_BALL, X_SCISSOR, ENDURE, GIGA_IMPACT, FLASH, SWORDS_DANCE, STRENGTH, EARTH_POWER, HEADBUTT, HYPER_VOICE, KNOCK_OFF, SEED_BOMB, SLEEP_TALK, SWAGGER
	; end
