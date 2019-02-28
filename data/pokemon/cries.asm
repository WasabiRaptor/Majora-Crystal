mon_cry: MACRO
; index, pitch, length
	dw \1, \2, \3
ENDM

PokemonCries::
; entries correspond to constants/pokemon_constants.asm
	mon_cry CRY_VENONAT,     $088,  $0e0 ; EEVEE
	mon_cry CRY_VENONAT,     $0aa,  $17f ; VAPOREON
	mon_cry CRY_VENONAT,     $03d,  $100 ; JOLTEON
	mon_cry CRY_VENONAT,     $010,  $0a0 ; FLAREON
	mon_cry CRY_AIPOM,       $0a2,  $140 ; ESPEON
	mon_cry CRY_VENONAT,    -$0e9,  $0f0 ; UMBREON
	mon_cry CRY_VENONAT,     $088,  $0e0 ; LEAFEON
	mon_cry CRY_VENONAT,     $088,  $0e0 ; GLACEON
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SYLVEON
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ZORUA
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ZOROARK
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ROCKRUFF
	mon_cry CRY_VENONAT,     $088,  $0e0 ; LYCANROC
	mon_cry CRY_VENONAT,     $088,  $0e0 ; MIMIKYU
	mon_cry CRY_METAPOD,     $080,  $0e0 ; MAGNEMITE
	mon_cry CRY_METAPOD,     $020,  $140 ; MAGNETON
	mon_cry CRY_VENONAT,     $088,  $0e0 ; MAGNEZONE
	mon_cry CRY_WEEPINBELL,  $0aa,  $17f ; PORYGON
	mon_cry CRY_GIRAFARIG,   $073,  $240 ; PORYGON2
	mon_cry CRY_VENONAT,     $088,  $0e0 ; PORYGONZ
	mon_cry CRY_CLEFAIRY,    $077,  $090 ; MEOWTH
	mon_cry CRY_CLEFAIRY,    $099,  $17f ; PERSIAN
	mon_cry CRY_TOGEPI,      $010,  $100 ; TOGEPI
	mon_cry CRY_TOGETIC,     $03b,  $038 ; TOGETIC
	mon_cry CRY_VENONAT,     $088,  $0e0 ; TOGEKISS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ROTOM
	mon_cry CRY_VENONAT,     $088,  $0e0 ; CHINGLING
	mon_cry CRY_VENONAT,     $088,  $0e0 ; CHIMECHO
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ESPURR
	mon_cry CRY_VENONAT,     $088,  $0e0 ; MEOWSTIC
	mon_cry CRY_VENONAT,     $088,  $0e0 ; TIMBURR
	mon_cry CRY_VENONAT,     $088,  $0e0 ; GURDURR
	mon_cry CRY_VENONAT,     $088,  $0e0 ; CONKELDURR
	mon_cry CRY_PIDGEY,      $0ff,  $17f ; DITTO
	mon_cry CRY_VENONAT,     $088,  $0e0 ; PURRLOIN
	mon_cry CRY_VENONAT,     $088,  $0e0 ; LIEPARD
	mon_cry CRY_GRIMER,      $000,  $100 ; GRIMER
	mon_cry CRY_MUK,         $0ef,  $17f ; MUK
	mon_cry CRY_NIDORAN_M,   $000,  $100 ; NIDORAN_M
	mon_cry CRY_NIDORAN_M,   $02c,  $140 ; NIDORINO
	mon_cry CRY_NIDORAN_F,   $02c,  $160 ; NIDORINA
	mon_cry CRY_RAICHU,      $000,  $100 ; NIDOKING
	mon_cry CRY_NIDOQUEEN,   $000,  $100 ; NIDOQUEEN
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SEVIPER
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ZANGOOSE
	mon_cry CRY_SENTRET,     $08a,  $0b8 ; SENTRET
	mon_cry CRY_SENTRET,     $06b,  $102 ; FURRET
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SWABLU
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ALTARIA
	mon_cry CRY_VENONAT,     $088,  $0e0 ; MIENFOO
	mon_cry CRY_VENONAT,     $088,  $0e0 ; MIENSHAO
	mon_cry CRY_VENONAT,     $088,  $0e0 ; HAWLUCHA
	mon_cry CRY_MAREEP,      $022,  $0d8 ; MAREEP
	mon_cry CRY_MAREEP,     -$007,  $180 ; FLAAFFY
	mon_cry CRY_AMPHAROS,   -$07c,  $0e8 ; AMPHAROS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SHINX
	mon_cry CRY_VENONAT,     $088,  $0e0 ; LUXIO
	mon_cry CRY_VENONAT,     $088,  $0e0 ; LUXRAY
	mon_cry CRY_NIDORAN_M,   $020,  $0c0 ; SANDSHREW
	mon_cry CRY_NIDORAN_M,   $0ff,  $17f ; SANDSLASH
	mon_cry CRY_VENONAT,     $088,  $0e0 ; CUTIEFLY
	mon_cry CRY_VENONAT,     $088,  $0e0 ; RIBOMBEE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FLABEBE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FLOETTE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FLORGES
	mon_cry CRY_CHIKORITA,   $0e8,  $0e8 ; IGGLYBUFF
	mon_cry CRY_PIDGEY,      $0ff,  $0b5 ; JIGGLYPUFF
	mon_cry CRY_PIDGEY,      $068,  $0e0 ; WIGGLYTUFF
	mon_cry CRY_VENONAT,     $088,  $0e0 ; CHESPIN
	mon_cry CRY_VENONAT,     $088,  $0e0 ; QUILLADIN
	mon_cry CRY_VENONAT,     $088,  $0e0 ; CHESNAUGHT
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DEERLING
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SAWSBUCK
	mon_cry CRY_VENONAT,     $088,  $0e0 ; COTTONEE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; WHIMSICOTT
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FOONGUS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; AMOONGUSS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; PHANTUMP
	mon_cry CRY_VENONAT,     $088,  $0e0 ; TREVENANT
	mon_cry CRY_VENONAT,     $088,  $0e0 ; BONSLY
	mon_cry CRY_CLEFFA,      $f40,  $180 ; SUDOWOODO
	mon_cry CRY_VENONAT,     $088,  $0e0 ; PASSIMIAN
	mon_cry CRY_VENONAT,     $088,  $0e0 ; STUFFUL
	mon_cry CRY_VENONAT,     $088,  $0e0 ; BEWEAR
	mon_cry CRY_GIRAFARIG,   $041,  $200 ; GIRAFARIG
	mon_cry CRY_AMPHAROS,    $035,  $0e0 ; HERACROSS
	mon_cry CRY_LEDYBA,      $000,  $0de ; LEDYBA
	mon_cry CRY_LEDYBA,     -$096,  $138 ; LEDIAN
	mon_cry CRY_VENONAT,     $088,  $0e0 ; JOLTIK
	mon_cry CRY_VENONAT,     $088,  $0e0 ; GALVANTULA
	mon_cry CRY_SLOWKING,    $080,  $100 ; PINECO
	mon_cry CRY_SLOWKING,    $000,  $180 ; FORRETRESS
	mon_cry CRY_TOTODILE,    $031,  $0c8 ; YANMA
	mon_cry CRY_VENONAT,     $088,  $0e0 ; YANMEGA
	mon_cry CRY_CATERPIE,    $000,  $100 ; SCYTHER
	mon_cry CRY_AMPHAROS,    $000,  $160 ; SCIZOR
	mon_cry CRY_VENONAT,     $088,  $0e0 ; VENIPEDE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; WHIRLIPEDE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SCOLIPEDE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; MORELULL
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SHIINOTIC
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SHROOMISH
	mon_cry CRY_VENONAT,     $088,  $0e0 ; BRELOOM
	mon_cry CRY_VENONAT,     $088,  $0e0 ; CROAGUNK
	mon_cry CRY_VENONAT,     $088,  $0e0 ; TOXICROAK
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SANDILE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; KROKOROK
	mon_cry CRY_VENONAT,     $088,  $0e0 ; KROOKODILE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; TYMPOLE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; PALPITOAD
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SEISMITOAD
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DRAMPA
	mon_cry CRY_VENONAT,     $088,  $0e0 ; GOOMY
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SLIGGOO
	mon_cry CRY_VENONAT,     $088,  $0e0 ; GOODRA
	mon_cry CRY_HOOTHOOT,    $130,  $0e8 ; MISDREAVUS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; MISMAGIUS
	mon_cry CRY_METAPOD,     $000,  $100 ; GASTLY
	mon_cry CRY_METAPOD,     $030,  $0c0 ; HAUNTER
	mon_cry CRY_MUK,         $000,  $17f ; GENGAR
	mon_cry CRY_VENONAT,     $088,  $0e0 ; OSHAWOTT
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DEWOTT
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SAMUROTT
	mon_cry CRY_VENONAT,     $088,  $0e0 ; BUIZEL
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FLOATZEL
	mon_cry CRY_VENONAT,     $088,  $0e0 ; AZURILL
	mon_cry CRY_MARILL,      $11b,  $120 ; MARILL
	mon_cry CRY_MARILL,      $0b6,  $180 ; AZUMARILL
	mon_cry CRY_LAPRAS,      $000,  $100 ; LAPRAS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ANORITH
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ARMALDO
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DEWPIDER
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ARAQUANID
	mon_cry CRY_EKANS,       $080,  $080 ; MAGIKARP
	mon_cry CRY_EKANS,       $000,  $100 ; GYARADOS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FEEBAS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; MILOTIC
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FINNEON
	mon_cry CRY_VENONAT,     $088,  $0e0 ; LUMINEON
	mon_cry CRY_SLOWKING,    $160,  $0e0 ; QWILFISH
	mon_cry CRY_CYNDAQUIL,   $3c9,  $140 ; CHINCHOU
	mon_cry CRY_CYNDAQUIL,   $2d0,  $110 ; LANTURN
	mon_cry CRY_VENONAT,     $088,  $0e0 ; STUNFISK
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DWEBBLE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; CRUSTLE
	mon_cry CRY_AIPOM,       $02c,  $108 ; TYROGUE
	mon_cry CRY_SEEL,        $0ee,  $140 ; HITMONCHAN
	mon_cry CRY_GOLEM,       $080,  $140 ; HITMONLEE
	mon_cry CRY_SLUGMA,      $000,  $100 ; HITMONTOP
	mon_cry CRY_VENONAT,     $088,  $0e0 ; RIOLU
	mon_cry CRY_VENONAT,     $088,  $0e0 ; LUCARIO
	mon_cry CRY_VENONAT,     $088,  $0e0 ; MEDITITE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; MEDICHAM
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SNOVER
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ABOMASNOW
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FERROSEED
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FERROTHORN
	mon_cry CRY_DUNSPARCE,   $290,  $0a8 ; SHUCKLE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; NOSEPASS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; PROBOPASS
	mon_cry CRY_RAIKOU,      $05f,  $0d0 ; LARVITAR
	mon_cry CRY_SPINARAK,   -$1db,  $150 ; PUPITAR
	mon_cry CRY_RAIKOU,     -$100,  $180 ; TYRANITAR
	mon_cry CRY_VENONAT,     $088,  $0e0 ; NOIBAT
	mon_cry CRY_VENONAT,     $088,  $0e0 ; NOIVERN
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DRUDDIGON
	mon_cry CRY_VENONAT,     $088,  $0e0 ; AXEW
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FRAXURE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; HAXORUS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; JANGMO_O
	mon_cry CRY_VENONAT,     $088,  $0e0 ; HAKAMO_O
	mon_cry CRY_VENONAT,     $088,  $0e0 ; KOMMO_O
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DEINO
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ZWEILOUS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; HYDREIGON
	mon_cry CRY_CYNDAQUIL,   $347,  $080 ; CYNDAQUIL
	mon_cry CRY_CYNDAQUIL,   $321,  $120 ; QUILAVA
	mon_cry CRY_TYPHLOSION,  $f00,  $0d4 ; TYPHLOSION
	mon_cry CRY_VENONAT,     $088,  $0e0 ; LITTEN
	mon_cry CRY_VENONAT,     $088,  $0e0 ; TORRACAT
	mon_cry CRY_VENONAT,     $088,  $0e0 ; INCINEROAR
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FENNEKIN
	mon_cry CRY_VENONAT,     $088,  $0e0 ; BRAIXEN
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DELPHOX
	mon_cry CRY_VULPIX,      $04f,  $090 ; VULPIX
	mon_cry CRY_VULPIX,      $088,  $0e0 ; NINETALES
	mon_cry CRY_SLUGMA,     -$1d8,  $140 ; SLUGMA
	mon_cry CRY_MAGCARGO,   -$20d,  $1c0 ; MAGCARGO
	mon_cry CRY_CYNDAQUIL,   $039,  $140 ; HOUNDOUR
	mon_cry CRY_TOTODILE,   -$10a,  $100 ; HOUNDOOM
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FLETCHLING
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FLETCHINDER
	mon_cry CRY_VENONAT,     $088,  $0e0 ; TALONFLAME
	mon_cry CRY_VENONAT,     $088,  $0e0 ; HEATMOR
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DURANT
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ARCHEN
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ARCHEOPS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ROGGENROLA
	mon_cry CRY_VENONAT,     $088,  $0e0 ; BOLDORE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; GIGALITH
	mon_cry CRY_VENONAT,     $088,  $0e0 ; CARBINK
	mon_cry CRY_VENONAT,     $088,  $0e0 ; AMAURA
	mon_cry CRY_VENONAT,     $088,  $0e0 ; AURORUS
	mon_cry CRY_WOOPER,      $053,  $0af ; SNEASEL
	mon_cry CRY_VENONAT,     $088,  $0e0 ; WEAVILE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; CRYOGONAL
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SNORUNT
	mon_cry CRY_VENONAT,     $088,  $0e0 ; GLALIE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; FROSSLASS
	mon_cry CRY_CYNDAQUIL,   $1fe,  $140 ; SWINUB
	mon_cry CRY_MAGCARGO,   -$109,  $100 ; PILOSWINE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; MAMOSWINE
	mon_cry CRY_HOOTHOOT,    $162,  $100 ; UNOWN
	mon_cry CRY_NATU,       -$067,  $100 ; NATU
	mon_cry CRY_NATU,       -$0a7,  $168 ; XATU
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SIGILYPH
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DRILBUR
	mon_cry CRY_VENONAT,     $088,  $0e0 ; EXCADRILL
	mon_cry CRY_VENONAT,     $088,  $0e0 ; BALTOY
	mon_cry CRY_VENONAT,     $088,  $0e0 ; CLAYDOL
	mon_cry CRY_VENONAT,     $088,  $0e0 ; GOLETT
	mon_cry CRY_VENONAT,     $088,  $0e0 ; GOLURK
	mon_cry CRY_VENONAT,     $088,  $0e0 ; BRONZOR
	mon_cry CRY_VENONAT,     $088,  $0e0 ; BRONZONG
	mon_cry CRY_VENONAT,     $088,  $0e0 ; HONEDGE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DOUBLADE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; AEGISLASH
	mon_cry CRY_VENONAT,     $088,  $0e0 ; PAWNIARD
	mon_cry CRY_VENONAT,     $088,  $0e0 ; BISHARP
	mon_cry CRY_VENONAT,     $088,  $0e0 ; YAMASK
	mon_cry CRY_VENONAT,     $088,  $0e0 ; COFAGRIGUS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; LITWICK
	mon_cry CRY_VENONAT,     $088,  $0e0 ; LAMPENT
	mon_cry CRY_VENONAT,     $088,  $0e0 ; CHANDELURE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SPIRITOMB
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DUSKULL
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DUSCLOPS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; DUSKNOIR
	mon_cry CRY_RAICHU,      $080,  $0c0 ; ARTICUNO
	mon_cry CRY_FEAROW,      $0ff,  $100 ; ZAPDOS
	mon_cry CRY_RAICHU,      $0f8,  $0c0 ; MOLTRES
	mon_cry CRY_MAGCARGO,    $000,  $180 ; SUICUNE
	mon_cry CRY_VENONAT,     $088,  $0e0 ; RAIKOU
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ENTEI
	mon_cry CRY_VENONAT,     $088,  $0e0 ; LATIAS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; LATIOS
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SILVALLY
	mon_cry CRY_VENONAT,     $088,  $0e0 ; MAGEARNA
	mon_cry CRY_VENONAT,     $088,  $0e0 ; SHAYMIN
	mon_cry CRY_ENTEI,       $14a,  $111 ; CELEBI
	mon_cry CRY_VENONAT,     $088,  $0e0 ; ZYGARDE
	mon_cry CRY_PARAS,       $0ee,  $17f ; MEW
	mon_cry CRY_PARAS,       $099,  $17f ; MEWTWO
	mon_cry CRY_NIDORAN_M,      0,     0 ; 254
	mon_cry CRY_NIDORAN_M,      0,     0 ; 255
