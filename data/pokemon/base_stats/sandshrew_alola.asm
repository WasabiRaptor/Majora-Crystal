	db SANDSHREW ; 027

	db  50,  75,  90,  40,  10,  35
    evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ICE, STEEL ; type
	db 255 ; catch rate
	db 93 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sandshrew_alola/front.dimensions"
	db NUM_REGIONAL, ALOLAN ;form differences
	db 0, 0	; abilities
	db 0 	; hidden ability
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FIELD, EGG_FIELD ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, SWIFT, DEFENSE_CURL, REST, ATTRACT, THIEF, FURY_CUTTER, CUT, STRENGTH
	; end
