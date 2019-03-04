	db AZUMARILL ; 128

	db 100,  50,  80,  50,  60,  80
    evs  3,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY ; type
	db 75 ; catch rate
	db 189 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/azumarill/front.dimensions"
	db 0, 0	; abilities
	db 0	; hidden ability
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, BULLDOZE, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, ROCK_SMASH, FOCUS_BLAST, SCALD, ENDURE, WATER_PULSE, GIGA_IMPACT, SURF, STRENGTH, WHIRLPOOL, WATERFALL, AQUA_TAIL, BODY_SLAM, DEFENSE_CURL, DOUBLE_EDGE, HEADBUTT, HYPER_VOICE, ICE_PUNCH, ICY_WIND, KNOCK_OFF, ROLLOUT, SEISMIC_TOSS, SLEEP_TALK, SWAGGER
	; end
