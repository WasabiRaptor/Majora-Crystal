mon_cry: MACRO
; index, pitch, length
	dw \1, \2, \3
ENDM

PokemonCries::
; entries correspond to constants/pokemon_constants.asm
	mon_cry CRY_SWABLU,     $088,  $0e0 ; EEVEE
	mon_cry CRY_SWABLU,     $0aa,  $17f ; VAPOREON
	mon_cry CRY_SWABLU,     $03d,  $100 ; JOLTEON
	mon_cry CRY_SWABLU,     $010,  $0a0 ; FLAREON
	mon_cry CRY_AIPOM,       $0a2,  $140 ; ESPEON
	mon_cry CRY_SWABLU,    -$0e9,  $0f0 ; UMBREON
	mon_cry CRY_SQUIRTLE,    $060,  $0c0 ; LEAFEON
	mon_cry CRY_SQUIRTLE,    $020,  $0c0 ; GLACEON
	mon_cry CRY_BLASTOISE,   $000,  $100 ; SYLVEON
	mon_cry CRY_CATERPIE,    $080,  $0a0 ; ZORUA
	mon_cry CRY_METAPOD,     $0cc,  $081 ; ZOROARK
	mon_cry CRY_CATERPIE,    $077,  $0c0 ; ROCKRUFF
	mon_cry CRY_WEEDLE,      $0ee,  $081 ; LYCANROC
	mon_cry CRY_BLASTOISE,   $0ff,  $081 ; MIMIKYU
	mon_cry CRY_BLASTOISE,   $060,  $100 ; MAGNEMITE
	mon_cry CRY_MAGNETON,      $0df,  $084 ; MAGNETON
	mon_cry CRY_MAGNEZONE,   $028,  $140 ; MAGNEZONE
	mon_cry CRY_MAGNEZONE,   $011,  $17f ; PORYGON
	mon_cry CRY_PORYGON2,     $000,  $100 ; PORYGON2
	mon_cry CRY_PORYGON2,     $020,  $17f ; PORYGONZ
	mon_cry CRY_MEOWTH,     $000,  $100 ; MEOWTH
	mon_cry CRY_PERSIAN,      $040,  $120 ; PERSIAN
	mon_cry CRY_TOGEPI,       $012,  $0c0 ; TOGEPI
	mon_cry CRY_TOGEPI,       $0e0,  $090 ; TOGETIC
	mon_cry CRY_BULBASAUR,   $0ee,  $081 ; TOGEKISS
	mon_cry CRY_ROTOM,      $0ee,  $088 ; ROTOM
	mon_cry CRY_GURDURR,   $020,  $0c0 ; CHINGLING
	mon_cry CRY_GURDURR,   $0ff,  $17f ; CHIMECHO
	mon_cry CRY_ESPURR,   $000,  $100 ; ESPURR
	mon_cry CRY_ESPURR,   $02c,  $160 ; MEOWSTIC_M
	mon_cry CRY_TIMBURR,   $000,  $100 ; TIMBURR
	mon_cry CRY_GURDURR,   $000,  $100 ; GURDURR
	mon_cry CRY_GURDURR,   $02c,  $140 ; CONKELDURR
	mon_cry CRY_ROTOM,      $000,  $100 ; DITTO
	mon_cry CRY_PURRLOIN,    $0cc,  $081 ; PURRLOIN
	mon_cry CRY_PURRLOIN,    $0aa,  $0a0 ; LIEPARD
	mon_cry CRY_GRIMER,      $04f,  $090 ; GRIMER
	mon_cry CRY_GRIMER,      $088,  $0e0 ; MUK
	mon_cry CRY_MAGNETON,      $0ff,  $0b5 ; NIDORAN_M
	mon_cry CRY_MAGNETON,      $068,  $0e0 ; NIDORINO
	mon_cry CRY_SQUIRTLE,    $0e0,  $100 ; NIDORINA
	mon_cry CRY_SQUIRTLE,    $0fa,  $100 ; NIDOKING
	mon_cry CRY_NIDOQUEEN,      $0dd,  $081 ; NIDOQUEEN
	mon_cry CRY_NIDOQUEEN,      $0aa,  $0c0 ; SEVIPER
	mon_cry CRY_ZANGOOSE,   $022,  $17f ; ZANGOOSE
	mon_cry CRY_SENTRET,       $020,  $160 ; SENTRET
	mon_cry CRY_SENTRET,       $042,  $17f ; FURRET
	mon_cry CRY_SWABLU,     $044,  $0c0 ; SWABLU
	mon_cry CRY_SWABLU,     $029,  $100 ; ALTARIA
	mon_cry CRY_MIENFOO,     $0aa,  $081 ; MIENFOO
	mon_cry CRY_MIENFOO,     $02a,  $090 ; MIENSHAO
	mon_cry CRY_PURRLOIN,    $077,  $090 ; HAWLUCHA
	mon_cry CRY_PURRLOIN,    $099,  $17f ; MAREEP
	mon_cry CRY_FLAAFFY,     $020,  $0e0 ; FLAAFFY
	mon_cry CRY_FLAAFFY,     $0ff,  $0c0 ; AMPHAROS
	mon_cry CRY_TIMBURR,   $0dd,  $0e0 ; MANKEY
	mon_cry CRY_TIMBURR,   $0af,  $0c0 ; PRIMEAPE
	mon_cry CRY_GROWLITHE,   $020,  $0c0 ; GROWLITHE
	mon_cry CRY_WEEDLE,      $000,  $100 ; ARCANINE
	mon_cry CRY_MAGNETON,      $0ff,  $17f ; POLIWAG
	mon_cry CRY_MAGNETON,      $077,  $0e0 ; POLIWHIRL
	mon_cry CRY_MAGNETON,      $000,  $17f ; POLIWRATH
	mon_cry CRY_METAPOD,     $0c0,  $081 ; ABRA
	mon_cry CRY_METAPOD,     $0a8,  $140 ; KADABRA
	mon_cry CRY_METAPOD,     $098,  $17f ; ALAKAZAM
	mon_cry CRY_GROWLITHE,   $0ee,  $081 ; MACHOP
	mon_cry CRY_GROWLITHE,   $048,  $0e0 ; MACHOKE
	mon_cry CRY_GROWLITHE,   $008,  $140 ; MACHAMP
	mon_cry CRY_FLAAFFY,     $055,  $081 ; BELLSPROUT
	mon_cry CRY_WEEPINBELL,  $044,  $0a0 ; WEEPINBELL
	mon_cry CRY_WEEPINBELL,  $066,  $14c ; VICTREEBEL
	mon_cry CRY_SWABLU,     $000,  $100 ; TENTACOOL
	mon_cry CRY_SWABLU,     $0ee,  $17f ; TENTACRUEL
	mon_cry CRY_GRIMER,      $0f0,  $090 ; GEODUDE
	mon_cry CRY_GRIMER,      $000,  $100 ; GRAVELER
	mon_cry CRY_GOLEM,       $0e0,  $0c0 ; GOLEM
	mon_cry CRY_WEEPINBELL,  $000,  $100 ; PONYTA
	mon_cry CRY_WEEPINBELL,  $020,  $140 ; RAPIDASH
	mon_cry CRY_SLOWPOKE,    $000,  $100 ; SLOWPOKE
	mon_cry CRY_GROWLITHE,   $000,  $100 ; SLOWBRO
	mon_cry CRY_METAPOD,     $080,  $0e0 ; PLACEHOLDER1
	mon_cry CRY_METAPOD,     $020,  $140 ; PLACEHOLDER2
	mon_cry CRY_MEOWTH,     $0dd,  $081 ; FARFETCH_D
	mon_cry CRY_MIENFOO,     $0bb,  $081 ; DODUO
	mon_cry CRY_MIENFOO,     $099,  $0a0 ; DODRIO
	mon_cry CRY_SEEL,        $088,  $140 ; SEEL
	mon_cry CRY_SEEL,        $023,  $17f ; DEWGONG
	mon_cry CRY_GRIMER,      $000,  $100 ; GRIMER
	mon_cry CRY_MUK,         $0ef,  $17f ; MUK
	mon_cry CRY_PERSIAN,      $000,  $100 ; SHELLDER
	mon_cry CRY_PERSIAN,      $06f,  $160 ; CLOYSTER
	mon_cry CRY_METAPOD,     $000,  $100 ; GASTLY
	mon_cry CRY_METAPOD,     $030,  $0c0 ; HAUNTER
	mon_cry CRY_MUK,         $000,  $17f ; GENGAR
	mon_cry CRY_TOGEPI,       $0ff,  $140 ; ONIX
	mon_cry CRY_DROWZEE,     $088,  $0a0 ; DROWZEE
	mon_cry CRY_DROWZEE,     $0ee,  $0c0 ; HYPNO
	mon_cry CRY_KRABBY,      $020,  $160 ; KRABBY
	mon_cry CRY_KRABBY,      $0ee,  $160 ; KINGLER
	mon_cry CRY_VOLTORB,     $0ed,  $100 ; VOLTORB
	mon_cry CRY_VOLTORB,     $0a8,  $110 ; ELECTRODE
	mon_cry CRY_MIENFOO,     $000,  $100 ; EXEGGCUTE
	mon_cry CRY_DROWZEE,     $000,  $100 ; EXEGGUTOR
	mon_cry CRY_PURRLOIN,    $000,  $100 ; CUBONE
	mon_cry CRY_NIDOQUEEN,      $04f,  $0e0 ; MAROWAK
	mon_cry CRY_GOLEM,       $080,  $140 ; HITMONLEE
	mon_cry CRY_SEEL,        $0ee,  $140 ; HITMONCHAN
	mon_cry CRY_SEEL,        $000,  $100 ; LICKITUNG
	mon_cry CRY_GOLEM,       $0e6,  $15d ; KOFFING
	mon_cry CRY_GOLEM,       $0ff,  $17f ; WEEZING
	mon_cry CRY_CHARMANDER,  $000,  $100 ; RHYHORN
	mon_cry CRY_RHYDON,      $000,  $100 ; RHYDON
	mon_cry CRY_MAGNEZONE,   $00a,  $140 ; CHANSEY
	mon_cry CRY_GOLEM,       $000,  $100 ; TANGELA
	mon_cry CRY_KANGASKHAN,  $000,  $100 ; KANGASKHAN
	mon_cry CRY_PURRLOIN,    $099,  $090 ; HORSEA
	mon_cry CRY_PURRLOIN,    $03c,  $081 ; SEADRA
	mon_cry CRY_CATERPIE,    $080,  $0c0 ; GOLDEEN
	mon_cry CRY_CATERPIE,    $010,  $17f ; SEAKING
	mon_cry CRY_SENTRET,       $002,  $0a0 ; STARYU
	mon_cry CRY_SENTRET,       $000,  $100 ; STARMIE
	mon_cry CRY_KRABBY,      $008,  $0c0 ; MR__MIME
	mon_cry CRY_CATERPIE,    $000,  $100 ; SCYTHER
	mon_cry CRY_DROWZEE,     $0ff,  $17f ; JYNX
	mon_cry CRY_VOLTORB,     $08f,  $17f ; ELECTABUZZ
	mon_cry CRY_CHARMANDER,  $0ff,  $0b0 ; MAGMAR
	mon_cry CRY_MAGNEZONE,   $000,  $100 ; PINSIR
	mon_cry CRY_SQUIRTLE,    $011,  $0c0 ; TAUROS
	mon_cry CRY_TOGEPI,       $080,  $080 ; MAGIKARP
	mon_cry CRY_TOGEPI,       $000,  $100 ; GYARADOS
	mon_cry CRY_LAPRAS,      $000,  $100 ; LAPRAS
	mon_cry CRY_MAGNETON,      $0ff,  $17f ; DEWPIDER
	mon_cry CRY_SWABLU,     $088,  $0e0 ; EEVEEX
	mon_cry CRY_SWABLU,     $0aa,  $17f ; VAPOREONX
	mon_cry CRY_SWABLU,     $03d,  $100 ; JOLTEONX
	mon_cry CRY_SWABLU,     $010,  $0a0 ; FLAREONX
	mon_cry CRY_WEEPINBELL,  $0aa,  $17f ; PLACE3
	mon_cry CRY_GROWLITHE,   $0f0,  $081 ; OMANYTE
	mon_cry CRY_GROWLITHE,   $0ff,  $0c0 ; OMASTAR
	mon_cry CRY_CATERPIE,    $0bb,  $0c0 ; KABUTO
	mon_cry CRY_PERSIAN,      $0ee,  $081 ; KABUTOPS
	mon_cry CRY_ZANGOOSE,   $020,  $170 ; AERODACTYL
	mon_cry CRY_GRIMER,      $055,  $081 ; SNORLAX
	mon_cry CRY_ROTOM,      $080,  $0c0 ; DWEBBLE
	mon_cry CRY_PERSIAN,      $0ff,  $100 ; CRUSTLE
	mon_cry CRY_ROTOM,      $0f8,  $0c0 ; TYROGUE
	mon_cry CRY_BULBASAUR,   $060,  $0c0 ; DRATINI
	mon_cry CRY_BULBASAUR,   $040,  $100 ; DRAGONAIR
	mon_cry CRY_BULBASAUR,   $03c,  $140 ; DRAGONITE
	mon_cry CRY_SENTRET,       $099,  $17f ; RIOLU
	mon_cry CRY_SENTRET,       $0ee,  $17f ; LUCARIO
	mon_cry CRY_CHIKORITA,  -$010,  $0b0 ; CHIKORITA
	mon_cry CRY_CHIKORITA,  -$022,  $120 ; BAYLEEF
	mon_cry CRY_CHIKORITA,  -$0b7,  $200 ; MEGANIUM
	mon_cry CRY_ABOMASNOW,   $347,  $080 ; ABOMASNOW
	mon_cry CRY_ABOMASNOW,   $321,  $120 ; FERROSEED
	mon_cry CRY_FERROTHORN,  $f00,  $0d4 ; FERROTHORN
	mon_cry CRY_TOTODILE,    $46c,  $0e8 ; TOTODILE
	mon_cry CRY_TOTODILE,    $440,  $110 ; CROCONAW
	mon_cry CRY_TOTODILE,    $3fc,  $180 ; FERALIGATR
	mon_cry CRY_LARVITAR,     $08a,  $0b8 ; LARVITAR
	mon_cry CRY_LARVITAR,     $06b,  $102 ; PUPITAR
	mon_cry CRY_TYRANITAR,    $091,  $0d8 ; TYRANITAR
	mon_cry CRY_TYRANITAR,    $000,  $1a0 ; NOCTOWL
	mon_cry CRY_LEDYBA,      $000,  $0de ; LEDYBA
	mon_cry CRY_LEDYBA,     -$096,  $138 ; LEDIAN
	mon_cry CRY_SPINARAK,    $011,  $200 ; SPINARAK
	mon_cry CRY_SPINARAK,   -$0ae,  $1e2 ; ARIADOS
	mon_cry CRY_SQUIRTLE,   -$010,  $140 ; CROBAT
	mon_cry CRY_ABOMASNOW,   $3c9,  $140 ; CHINCHOU
	mon_cry CRY_ABOMASNOW,   $2d0,  $110 ; LANTURN
	mon_cry CRY_PICHU,       $000,  $140 ; PICHU
	mon_cry CRY_CLEFFA,      $061,  $091 ; CLEFFA
	mon_cry CRY_CHIKORITA,   $0e8,  $0e8 ; IGGLYBUFF
	mon_cry CRY_HEIDREIGON,      $010,  $100 ; HEIDREIGON
	mon_cry CRY_CYNDAQUIL,     $03b,  $038 ; CYNDAQUIL
	mon_cry CRY_QUILAVA,       -$067,  $100 ; QUILAVA
	mon_cry CRY_QUILAVA,       -$0a7,  $168 ; TYPHLOSION
	mon_cry CRY_LITTEN,      $022,  $0d8 ; LITTEN
	mon_cry CRY_LITTEN,     -$007,  $180 ; TORRACAT
	mon_cry CRY_INCINEROAR,   -$07c,  $0e8 ; INCINEROAR
	mon_cry CRY_CLEFFA,      $084,  $150 ; FENNEKIN
	mon_cry CRY_BRAIXEN,      $11b,  $120 ; BRAIXEN
	mon_cry CRY_BRAIXEN,      $0b6,  $180 ; DELPHOX
	mon_cry CRY_CLEFFA,      $f40,  $180 ; VULPIX
	mon_cry CRY_CLEFFA,     -$2a3,  $1c8 ; NINETALES
	mon_cry CRY_CLEFFA,      $03b,  $0c8 ; HOPPIP
	mon_cry CRY_CLEFFA,      $027,  $138 ; SKIPLOOM
	mon_cry CRY_CLEFFA,      $000,  $180 ; JUMPLUFF
	mon_cry CRY_AIPOM,      -$051,  $0e8 ; AIPOM
	mon_cry CRY_BRAIXEN,      $12b,  $0b8 ; SUNKERN
	mon_cry CRY_SUNFLORA,   -$020,  $180 ; SUNFLORA
	mon_cry CRY_TOTODILE,    $031,  $0c8 ; YANMA
	mon_cry CRY_WOOPER,      $093,  $0af ; WOOPER
	mon_cry CRY_WOOPER,     -$0c6,  $140 ; QUAGSIRE
	mon_cry CRY_AIPOM,       $0a2,  $140 ; ESPEONX
	mon_cry CRY_SWABLU,    -$0e9,  $0f0 ; UMBREONX
	mon_cry CRY_BRAIXEN,     -$01f,  $180 ; MURKROW
	mon_cry CRY_SLOWKING,    $104,  $200 ; SLOWKING
	mon_cry CRY_TYRANITAR,    $130,  $0e8 ; MISDREAVUS
	mon_cry CRY_TYRANITAR,    $162,  $100 ; CARBINK
	mon_cry CRY_INCINEROAR,    $27b,  $144 ; WOBBUFFET
	mon_cry CRY_GIRAFARIG,   $041,  $200 ; GIRAFARIG
	mon_cry CRY_SLOWKING,    $080,  $100 ; PINECO
	mon_cry CRY_SLOWKING,    $000,  $180 ; FORRETRESS
	mon_cry CRY_DUNSPARCE,   $1c4,  $100 ; DUNSPARCE
	mon_cry CRY_GLIGAR,     -$102,  $100 ; GLIGAR
	mon_cry CRY_FERROTHORN,  $0ef,  $0f7 ; STEELIX
	mon_cry CRY_DUNSPARCE,   $112,  $0e8 ; SNUBBULL
	mon_cry CRY_DUNSPARCE,   $000,  $180 ; GRANBULL
	mon_cry CRY_SLOWKING,    $160,  $0e0 ; QWILFISH
	mon_cry CRY_INCINEROAR,    $000,  $160 ; SCIZOR
	mon_cry CRY_DUNSPARCE,   $290,  $0a8 ; UNOWN
	mon_cry CRY_INCINEROAR,    $035,  $0e0 ; HERACROSS
	mon_cry CRY_WOOPER,      $053,  $0af ; SNEASEL
	mon_cry CRY_TEDDIURSA,   $7a2,  $06e ; TEDDIURSA
	mon_cry CRY_TEDDIURSA,   $640,  $0d8 ; URSARING
	mon_cry CRY_SLUGMA,     -$1d8,  $140 ; SLUGMA
	mon_cry CRY_MAGCARGO,   -$20d,  $1c0 ; MAGCARGO
	mon_cry CRY_ABOMASNOW,   $1fe,  $140 ; SWINUB
	mon_cry CRY_MAGCARGO,   -$109,  $100 ; PILOSWINE
	mon_cry CRY_MAGCARGO,    $0a1,  $0e8 ; CORSOLA
	mon_cry CRY_SUNFLORA,    $00d,  $100 ; REMORAID
	mon_cry CRY_TOTODILE,    $000,  $180 ; OCTILLERY
	mon_cry CRY_TEDDIURSA,   $002,  $06a ; DELIBIRD
	mon_cry CRY_MANTINE,    -$0be,  $0f0 ; MANTINE
	mon_cry CRY_INCINEROAR,    $8a9,  $180 ; SKARMORY
	mon_cry CRY_ABOMASNOW,   $039,  $140 ; HOUNDOUR
	mon_cry CRY_TOTODILE,   -$10a,  $100 ; HOUNDOOM
	mon_cry CRY_SLUGMA,      $2fb,  $100 ; KINGDRA
	mon_cry CRY_LARVITAR,     $048,  $230 ; PHANPY
	mon_cry CRY_DONPHAN,     $000,  $1a0 ; DONPHAN
	mon_cry CRY_GIRAFARIG,   $073,  $240 ; PLACE4
	mon_cry CRY_AIPOM,      -$160,  $180 ; STANTLER
	mon_cry CRY_PICHU,      -$21a,  $1f0 ; SPIRITOMB
	mon_cry CRY_AIPOM,       $02c,  $108 ; DUSKULL
	mon_cry CRY_SLUGMA,      $000,  $100 ; DUSCLOPS
	mon_cry CRY_BRAIXEN,      $068,  $100 ; DUSKNOIR
	mon_cry CRY_SUNFLORA,   -$2d8,  $0b4 ; ARTICUNO
	mon_cry CRY_TEDDIURSA,   $176,  $03a ; ZAPDOS
	mon_cry CRY_GLIGAR,     -$1cd,  $1a0 ; MOLTRES
	mon_cry CRY_SLOWKING,    $293,  $140 ; SUICUNE
	mon_cry CRY_RAIKOU,      $22e,  $120 ; RAIKOU
	mon_cry CRY_ENTEI,       $000,  $1a0 ; ENTEI
	mon_cry CRY_MAGCARGO,    $000,  $180 ; LATIAS
	mon_cry CRY_RAIKOU,      $05f,  $0d0 ; LATIOS
	mon_cry CRY_SPINARAK,   -$1db,  $150 ; SILVALLY
	mon_cry CRY_RAIKOU,     -$100,  $180 ; MAGEARNA
	mon_cry CRY_FERROTHORN,  $000,  $100 ; SHAYMIN
	mon_cry CRY_AIPOM,       $000,  $180 ; CELEBI
	mon_cry CRY_ENTEI,       $14a,  $111 ; ZYGARDE
	mon_cry CRY_SWABLU,     $010,  $0a0 ; MEW
	mon_cry CRY_SWABLU,     $010,  $0a0 ; MEWTWO
	mon_cry CRY_GURDURR,      0,     0 ; 254
	mon_cry CRY_GURDURR,      0,     0 ; 255
