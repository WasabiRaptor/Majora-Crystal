	db NINETALES ; 038

	db  73,  67,  75, 109,  81, 100
    evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ICE, FAIRY ; type
	db 75 ; catch rate
	db 178 ; base exp
	db BURNT_BERRY, BURNT_BERRY ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/alolanninetales/front.dimensions"
	db 2, 2 ;total form differences, which form this is
	db 0, 0	;abilities
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, BLIZZARD, SWIFT, REST, ATTRACT, ICE_BEAM
	; end TODO, add HAIL TM
