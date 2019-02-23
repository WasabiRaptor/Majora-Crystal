	db KOMMO_O

	db  75, 110, 125,  85, 100, 105
    evs  0,   0,   3,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FIGHTING ; type
	db 45 ; catch rate
	db 270 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/kommo_o/front.dimensions"
	db 0, 0 ;form differences
	db 0, 0	;abilities
	db GROWTH_SLOW ; growth rate
	dn EGG_DRAGON, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, SWIFT,  REST, STEEL_WING, FLY, ICE_BEAM
	; end
	