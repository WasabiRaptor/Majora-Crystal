; pokemon ids
; indexes for:
; - PokemonNames (see data/pokemon/names.asm)
; - BaseData (see data/pokemon/base_stats.asm)
; - EvosAttacksPointers (see data/pokemon/evos_attacks_pointers.asm)
; - EggMovePointers (see data/pokemon/egg_move_pointers.asm)
; - PokemonCries (see data/pokemon/cries.asm)
; - MonMenuIcons (see data/pokemon/menu_icons.asm)
; - PokemonPicPointers (see data/pokemon/pic_pointers.asm)
; - PokemonPalettes (see data/pokemon/palettes.asm)
; - PokedexDataPointerTable (see data/pokemon/dex_entry_pointers.asm)
; - AlphabeticalPokedexOrder (see data/pokemon/dex_order_alpha.asm)
; - NewPokedexOrder (see data/pokemon/dex_order_new.asm)
; - Pokered_MonIndices (see data/pokemon/gen1_order.asm)
; - AnimationPointers (see gfx/pokemon/anim_pointers.asm)
; - AnimationIdlePointers (see gfx/pokemon/idle_pointers.asm)
; - BitmasksPointers (see gfx/pokemon/bitmask_pointers.asm)
; - FramesPointers (see gfx/pokemon/frame_pointers.asm)
; - Footprints (see gfx/footprints.asm)
	const_def 1
	const EEVEE			; 01
	const VAPOREON		; 02
	const JOLTEON		; 03
	const FLAREON		; 04
	const ESPEON		; 05
	const UMBREON		; 06
	const LEAFEON		; 07
	const GLACEON		; 08
	const SYLVEON		; 09
	const ZORUA			; 0a
	const ZOROARK		; 0b
	const ROCKRUFF		; 0c
	const LYCANROC		; 0d
	const MIMIKYU     	; 0e
	const MAGNEMITE   	; 0f
	const MAGNETON     	; 10
	const MAGNEZONE  	; 11
	const PORYGON    	; 12
	const PORYGON2    	; 13
	const PORYGONZ   	; 14
	const MEOWTH    	; 15
	const PERSIAN     	; 16
	const TOGEPI      	; 17
	const TOGETIC      	; 18
	const TOGEKISS    	; 19
	const ROTOM     	; 1a
	const CHINGLING  	; 1b
	const CHIMECHO  	; 1c
	const ESPURR  		; 1d
	const MEOWSTIC_M   	; 1e
	const TIMBURR  		; 1f
	const GURDURR  		; 20
	const CONKELDURR   	; 21
	const DITTO   		; 22
	const PURRLOIN   	; 23
	const LIEPARD   	; 24
	const GRIMER     	; 25
	const MUK  			; 26
	const NIDORAN_M 	; 27
	const NIDORINO 		; 28
	const NIDORINA      ; 29
	const NIDOKING     	; 2a
	const NIDOQUEEN     ; 2b
	const SEVIPER      	; 2c
	const ZANGOOSE  	; 2d
	const SENTRET      	; 2e
	const FURRET   		; 2f
	const SWABLU    	; 30
	const ALTARIA   	; 31
	const MIENFOO    	; 32
	const MIENSHAO    	; 33
	const HAWLUCHA     	; 34
	const MAREEP    	; 35
	const FLAAFFY    	; 36
	const AMPHAROS    	; 37
	const SHINX     	; 38
	const LUXIO   		; 39
	const LUXRAY  		; 3a
	const SANDSHREW   	; 3b
	const SANDSLASH    	; 3c
	const CUTIEFLY  	; 3d
	const RIBOMBEE  	; 3e
	const FLABEBE       ; 3f
	const FLOETTE    	; 40
	const FLORGES   	; 41

	const IGGLYBUFF     ; 42
	const JIGGLYPUFF    ; 43
	const WIGGLYTUFF    ; 44
	const BELLSPROUT ; 45
	const WEEPINBELL ; 46
	const VICTREEBEL ; 47
	const TENTACOOL  ; 48
	const TENTACRUEL ; 49
	const GEODUDE    ; 4a
	const GRAVELER   ; 4b
	const GOLEM      ; 4c
	const PONYTA     ; 4d
	const RAPIDASH   ; 4e
	const SLOWPOKE   ; 4f
	const SLOWBRO    ; 50
	const PLACEHOLDER1  ; 51
	const PLACEHOLDER2   ; 52
	const FARFETCH_D ; 53
	const DODUO      ; 54
	const DODRIO     ; 55
	const SEEL       ; 56
	const DEWGONG    ; 57
	const GRIMER     ; 58
	const MUK        ; 59
	const SHELLDER   ; 5a
	const CLOYSTER   ; 5b
	const GASTLY     ; 5c
	const HAUNTER    ; 5d
	const GENGAR     ; 5e
	const ONIX       ; 5f
	const DROWZEE    ; 60
	const HYPNO      ; 61
	const KRABBY     ; 62
	const KINGLER    ; 63
	const VOLTORB    ; 64
	const ELECTRODE  ; 65
	const EXEGGCUTE  ; 66
	const EXEGGUTOR  ; 67
	const CUBONE     ; 68
	const MAROWAK    ; 69
	const HITMONLEE  ; 6a
	const HITMONCHAN ; 6b
	const LICKITUNG  ; 6c
	const KOFFING    ; 6d
	const WEEZING    ; 6e
	const RHYHORN    ; 6f
	const RHYDON     ; 70
	const CHANSEY    ; 71
	const TANGELA    ; 72
	const KANGASKHAN ; 73
	const HORSEA     ; 74
	const SEADRA     ; 75
	const GOLDEEN    ; 76
	const SEAKING    ; 77
	const STARYU     ; 78
	const STARMIE    ; 79
	const MR__MIME   ; 7a
	const SCYTHER    ; 7b
	const JYNX       ; 7c
	const ELECTABUZZ ; 7d
	const MAGMAR     ; 7e
	const PINSIR     ; 7f
	const TAUROS     ; 80
	const MAGIKARP   ; 81
	const GYARADOS   ; 82
	const LAPRAS     ; 83

	const DEWPIDER      ; 84

	const EEVEEX      ; 85
	const VAPOREONX   ; 86
	const JOLTEONX    ; 87
	const FLAREONX    ; 88
	const PLACE3    ; 89
	const OMANYTE    ; 8a
	const OMASTAR    ; 8b
	const KABUTO     ; 8c
	const KABUTOPS   ; 8d
	const AERODACTYL ; 8e
	const SNORLAX    ; 8f

	const DWEBBLE   	; 90
	const CRUSTLE     	; 91
	const TYROGUE    	; 92

	const DRATINI    ; 93
	const DRAGONAIR  ; 94
	const DRAGONITE  ; 95

	const RIOLU     	; 96
	const LUCARIO       ; 97

JOHTO_POKEMON EQU const_value
	const CHIKORITA  ; 98
	const BAYLEEF    ; 99
	const MEGANIUM   ; 9a

	const ABOMASNOW  	; 9b
	const FERROSEED    	; 9c
	const FERROTHORN 	; 9d

	const TOTODILE   ; 9e
	const CROCONAW   ; 9f
	const FERALIGATR ; a0

	const LARVITAR    	; a1
	const PUPITAR     	; a2
	const TYRANITAR   	; a3

	const NOCTOWL    ; a4
	const LEDYBA     ; a5
	const LEDIAN     ; a6
	const SPINARAK   ; a7
	const ARIADOS    ; a8
	const CROBAT     ; a9
	const CHINCHOU   ; aa
	const LANTURN    ; ab
	const PICHU      ; ac
	const CLEFFA     ; ad

	const ZWEILOUS  	; ae
	const HEIDREIGON    ; af
	const CYNDAQUIL    	; b0	
	const QUILAVA       ; b1
	const TYPHLOSION    ; b2
	const LITTEN     	; b3
	const TORRACAT    	; b4
	const INCINEROAR   	; b5
	const FENNEKIN  	; b6
	const BRAIXEN     	; b7
	const DELPHOX  		; b8
	const VULPIX  		; b9
	const NINETALES   	; ba

	const HOPPIP     ; bb
	const SKIPLOOM   ; bc
	const JUMPLUFF   ; bd
	const AIPOM      ; be
	const SUNKERN    ; bf
	const SUNFLORA   ; c0
	const YANMA      ; c1
	const WOOPER     ; c2
	const QUAGSIRE   ; c3
	const ESPEONX     ; c4
	const UMBREONX    ; c5
	const MURKROW    ; c6
	const SLOWKING   ; c7
	const MISDREAVUS ; c8

	const CARBINK      	; c9

	const WOBBUFFET  ; ca
	const GIRAFARIG  ; cb
	const PINECO     ; cc
	const FORRETRESS ; cd
	const DUNSPARCE  ; ce
	const GLIGAR     ; cf
	const STEELIX    ; d0
	const SNUBBULL   ; d1
	const GRANBULL   ; d2
	const QWILFISH   ; d3
	const SCIZOR     ; d4

	const UNOWN    		; d5

	const HERACROSS  ; d6
	const SNEASEL    ; d7
	const TEDDIURSA  ; d8
	const URSARING   ; d9
	const SLUGMA     ; da
	const MAGCARGO   ; db
	const SWINUB     ; dc
	const PILOSWINE  ; dd
	const GOLURK        ; de
	const BRONZOR       ; df
	const BRONZONG      ; e0
	const HONEDGE       ; e1
	const DOUBLADE      ; e2
	const AEGISLASH     ; e3
	const PAWNIARD      ; e4
	const BISHARP       ; e5
	const YAMASK        ; e6
	const COFAGRIGUS    ; e7
	const LITWICK       ; e8
	const LAMPENT       ; e9
	const CHANDELURE    ; ea
	const SPIRITOMB     ; eb
	const DUSKULL    	; ec
	const DUSCLOPS  	; ed
	const DUSKNOIR   	; ee
	const ARTICUNO   	; ef
	const ZAPDOS     	; f0
	const MOLTRES    	; f1
	const SUICUNE    	; f2
	const RAIKOU     	; f3
	const ENTEI      	; f4
	const LATIAS     	; f5
	const LATIOS     	; f6
	const SILVALLY   	; f7
	const MAGEARNA   	; f8
	const SHAYMIN    	; f9
	const CELEBI     	; fa
	const ZYGARDE    	; fb
	const MEW        	; fc
	const MEWTWO     	; fd
NUM_POKEMON EQU const_value + -1
	const EGG        ; fe

; Unown forms
; indexes for:
; - UnownWords (see data/pokemon/unown_words.asm)
; - UnownPicPointers (see data/pokemon/unown_pic_pointers.asm)
; - UnownAnimationPointers (see gfx/pokemon/unown_anim_pointers.asm)
; - UnownAnimationIdlePointers (see gfx/pokemon/unown_idle_pointers.asm)
; - UnownBitmasksPointers (see gfx/pokemon/unown_bitmask_pointers.asm)
; - UnownFramesPointers (see gfx/pokemon/unown_frame_pointers.asm)
	const_def 1
	const UNOWN_A ;  1
	const UNOWN_B ;  2
	const UNOWN_C ;  3
	const UNOWN_D ;  4
	const UNOWN_E ;  5
	const UNOWN_F ;  6
	const UNOWN_G ;  7
	const UNOWN_H ;  8
	const UNOWN_I ;  9
	const UNOWN_J ; 10
	const UNOWN_K ; 11
	const UNOWN_L ; 12
	const UNOWN_M ; 13
	const UNOWN_N ; 14
	const UNOWN_O ; 15
	const UNOWN_P ; 16
	const UNOWN_Q ; 17
	const UNOWN_R ; 18
	const UNOWN_S ; 19
	const UNOWN_T ; 20
	const UNOWN_U ; 21
	const UNOWN_V ; 22
	const UNOWN_W ; 23
	const UNOWN_X ; 24
	const UNOWN_Y ; 25
	const UNOWN_Z ; 26
NUM_UNOWN EQU const_value + -1 ; 26

	const_def 1
	const KANTONIAN
	const ALOLAN
NUM_REGIONAL EQU const_value + -1 ; 2

	const_def 1
	const MIDDAY
	const MIDNIGHT
	const DUSK
NUM_LYCANROC EQU const_value + -1 ; 3
