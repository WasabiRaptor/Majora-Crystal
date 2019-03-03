INCLUDE "constants.asm"


SECTION "Egg Moves", ROMX

; All instances of Charm, Steel Wing, Sweet Scent, and Lovely Kiss were
; removed from egg move lists in Crystal.
; Sweet Scent and Steel Wing were redundant since they're TMs, and
; Charm and Lovely Kiss were unobtainable.

; Gengar's egg moves were removed in Crystal, because Gengar is genderless
; and can only breed with Ditto.

INCLUDE "data/pokemon/egg_move_pointers.asm"
INCLUDE "data/pokemon/alt_form_egg_move_pointers.asm"

EeveeEggMoves:
	db LIGHT_SCREEN
	db SKULL_BASH
	db SAFEGUARD
	db RAZOR_WIND
	db PETAL_DANCE
	db -1 ; end

ZoruaEggMoves:
	db PURSUIT
	db FAINT_ATTACK
	db FORESIGHT
	db -1 ; end

RockruffEggMoves:
	db -1 ; end

MimikyuEggMoves:
	db -1 ; end

MagnemiteEggMoves:
	db -1 ; end

PorygonEggMoves:
	db SCREECH
	db FLAME_WHEEL
	db FURY_SWIPES
	db BITE
	db COUNTER
	db REVERSAL
	db -1 ; end

MeowthEggMoves:
	db FAINT_ATTACK
	db FALSE_SWIPE
	db SCARY_FACE
	db QUICK_ATTACK
	db TRI_ATTACK
	db -1 ; end
Meowth_AlolaEggMoves:
	db FAINT_ATTACK
	db FALSE_SWIPE
	db SCARY_FACE
	db QUICK_ATTACK
	db TRI_ATTACK
	db -1 ; end

TogepiEggMoves:
	db PURSUIT
	db SLAM
	db SPITE
	db BEAT_UP
	db -1 ; end

RotomEggMoves:
	db -1 ; end

ChinglingEggMoves:
	db FLAIL
	db SAFEGUARD
	db COUNTER
	db RAPID_SPIN
	db -1 ; end

EspurrEggMoves:
	db SUPERSONIC
	db DISABLE
	db TAKE_DOWN
	db FOCUS_ENERGY
	db CHARM
	db COUNTER
	db BEAT_UP
	db -1 ; end

TimburrEggMoves:
	db -1 ; end

PurrloinEggMoves:
	db -1 ; end

GrimerEggMoves:
	db FAINT_ATTACK
	db HYPNOSIS
	db FLAIL
	db SPITE
	db DISABLE
	db -1 ; end
Grimer_AlolaEggMoves:
	db FAINT_ATTACK
	db HYPNOSIS
	db FLAIL
	db SPITE
	db DISABLE
	db -1 ; end

NidoranEggMoves:
	db -1 ; end

SeviperEggMoves:
	db -1 ; end

ZangooseEggMoves:
	db -1 ; end

SentretEggMoves:
	db FALSE_SWIPE
	db SCREECH
	db COUNTER
	db PSYBEAM
	db FLAIL
if !_BRASS
	db SWEET_SCENT
endc
	db LIGHT_SCREEN
	db PURSUIT
	db -1 ; end

SwabluEggMoves:
	db BATON_PASS
	db SCREECH
	db GIGA_DRAIN
	db -1 ; end

MienfooEggMoves:
	db FAINT_ATTACK
	db SCREECH
	db ANCIENTPOWER
	db PURSUIT
	db BEAT_UP
	db -1 ; end

HawluchaEggMoves:
	db SPITE
	db CHARM
	db HYPNOSIS
	db AMNESIA
	db -1 ; end

MareepEggMoves:
	db -1 ; end

ShinxEggMoves:
	db ROCK_SLIDE
	db FORESIGHT
	db MEDITATE
	db COUNTER
	db REVERSAL
	db BEAT_UP
	db -1 ; end

SandshrewEggMoves:
	db MIST
	db SPLASH
	db BUBBLEBEAM
	db HAZE
	db MIND_READER
	db -1 ; end
Sandshrew_AlolaEggMoves:
	db MIST
	db SPLASH
	db BUBBLEBEAM
	db HAZE
	db MIND_READER
	db -1 ; end

CutieflyEggMoves:
	db -1 ; end

FlabebeEggMoves:
	db LIGHT_SCREEN
	db ENCORE
	db BARRIER
	db -1 ; end

IgglybuffEggMoves:
	db LIGHT_SCREEN
	db MEDITATE
	db ROLLING_KICK
	db ENCORE
	db -1 ; end

ChespinEggMoves:
	db SWORDS_DANCE
	db ENCORE
	db REFLECT
	db SYNTHESIS
	db LEECH_LIFE
	db -1 ; end

DeerlingEggMoves:
	db AURORA_BEAM
	db MIRROR_COAT
	db RAPID_SPIN
	db HAZE
	db SAFEGUARD
	db -1 ; end

CottoneeEggMoves:
	db MEGA_PUNCH
	db ROCK_SLIDE
	db -1 ; end

FoongusEggMoves:
	db -1 ; end

PhantumpEggMoves:
	db -1 ; end

BonslyEggMoves:
	db -1 ; end

PassimianEggMoves:
	db -1 ; end

StuffulEggMoves:
if !_BRASS
	db STEEL_WING
endc
	db FORESIGHT
	db MIRROR_MOVE
	db GUST
	db QUICK_ATTACK
	db FLAIL
	db -1 ; end


GirafarigEggMoves:
	db -1 ; end
Girafarig_BetaEggMoves:
	db -1 ; end

HeracrossEggMoves:
	db LICK
	db PERISH_SONG
	db DISABLE
	db PECK
	db SLAM
	db ENCORE
	db -1 ; end

LedybaEggMoves:
	db -1 ; end

JoltikEggMoves:
	db -1 ; end

PinecoEggMoves:
	db -1 ; end

YanmaEggMoves:
	db -1 ; end

ScytherEggMoves:
	db ROCK_SLIDE
	db FLAIL
	db -1 ; end

VenipedeEggMoves:
	db -1 ; end

MorelullEggMoves:
	db -1 ; end

ShroomishEggMoves:
	db SYNTHESIS
	db MOONLIGHT
	db REFLECT
	db MEGA_DRAIN
	db ANCIENTPOWER
	db -1 ; end

CroagunkEggMoves:
	db ROCK_SLIDE
	db ANCIENTPOWER
	db BELLY_DRUM
	db SCREECH
	db SKULL_BASH
	db PERISH_SONG
if _BRASS
	db SWORDS_DANCE
endc
	db -1 ; end

SandileEggMoves:
	db -1 ; end

TympoleEggMoves:
	db SCREECH
	db PSYWAVE
	db PSYBEAM
	db DESTINY_BOND
	db PAIN_SPLIT
	db -1 ; end

DrampaEggMoves:
	db -1 ; end

GoomyEggMoves:
	db PRESENT
	db METRONOME
	db HEAL_BELL
	db -1 ; end

MisdreavusEggMoves:
	db FLAIL
	db AURORA_BEAM
	db OCTAZOOKA
	db DISABLE
	db SPLASH
	db DRAGON_RAGE
	db -1 ; end

GastlyEggMoves:
	db PSYBEAM
	db HAZE
	db HYDRO_PUMP
	db -1 ; end

OshawottEggMoves:
	db -1 ; end

BuizelEggMoves:
	db -1 ; end

AzurillEggMoves:
	db -1 ; end

LaprasEggMoves:
	db -1 ; end

AnorithEggMoves:
	db -1 ; end

DewpiderEggMoves:
	db -1 ; end

MagikarpEggMoves:
	db -1 ; end

FeebasEggMoves:
	db -1 ; end

FinneonEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db SLAM
	db SUPERSONIC
	db HAZE
	db -1 ; end

QwilfishEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db RAPID_SPIN
	db DIG
	db FLAIL
	db -1 ; end

ChinchouEggMoves:
	db -1 ; end

StunfiskEggMoves:
	db LICK
if !_BRASS
	db CHARM
endc
	db -1 ; end

DwebbleEggMoves:
	db -1 ; end

TyrogueEggMoves:
	db -1 ; end

RioluEggMoves:
	db -1 ; end

MedititeEggMoves:
	db VINE_WHIP
	db LEECH_SEED
	db COUNTER
	db ANCIENTPOWER
	db FLAIL
	db SWORDS_DANCE
	db -1 ; end

SnoverEggMoves:
	db -1 ; end

FerroseedEggMoves:
	db -1 ; end

ShuckleEggMoves:
	db CRUNCH
	db THRASH
	db HYDRO_PUMP
	db ANCIENTPOWER
	db RAZOR_WIND
	db ROCK_SLIDE
	db -1 ; end

NosepassEggMoves:
	db -1 ; end

LarvitarEggMoves:
	db DOUBLE_EDGE
	db PURSUIT
	db SLASH
	db FOCUS_ENERGY
	db REVERSAL
	db -1 ; end

NoibatEggMoves:
	db -1 ; end

DruddigonEggMoves:
	db -1 ; end

AxewEggMoves:
	db PSYBEAM
	db DISABLE
	db SONICBOOM
	db BATON_PASS
	db PURSUIT
	db -1 ; end

Jangmo_oEggMoves:
	db FLAIL
	db SUPERSONIC
	db SCREECH
	db -1 ; end

DeinoEggMoves:
	db PRESENT
	db METRONOME
	db AMNESIA
	db BELLY_DRUM
	db SPLASH
	db MIMIC
	db -1 ; end

CyndaquilEggMoves:
	db -1 ; end

LittenEggMoves:
	db THUNDERBOLT
	db TAKE_DOWN
	db BODY_SLAM
	db SAFEGUARD
	db SCREECH
	db REFLECT
	db -1 ; end

FennekinEggMoves:
	db -1 ; end

VulpixEggMoves:
	db -1 ; end
Vulpix_AlolaEggMoves:
	db -1 ; end

SlugmaEggMoves:
	db CONFUSION
	db GROWL
	db ENCORE
	db DOUBLE_EDGE
	db REFLECT
	db AMNESIA
	db PAY_DAY
	db -1 ; end

HoundourEggMoves:
	db -1 ; end

FletchlingEggMoves:
	db -1 ; end

HeatmorEggMoves:
	db BODY_SLAM
	db ANCIENTPOWER
	db SAFEGUARD
	db -1 ; end

DurantEggMoves:
	db -1 ; end

ArchenEggMoves:
	db -1 ; end

RoggenrolaEggMoves:
	db WHIRLWIND
	db DRILL_PECK
	db QUICK_ATTACK
	db MIRROR_MOVE
	db WING_ATTACK
if _BRASS
	db SKY_ATTACK
endc
	db -1 ; end

CarbinkEggMoves:
	db -1 ; end

AmauraEggMoves:
	db -1 ; end

SneaselEggMoves:
	db REFLECT
	db PIN_MISSILE
	db FLAIL
	db SWIFT
	db -1 ; end

CryogonalEggMoves:
	db BIDE
	db ANCIENTPOWER
	db ROCK_SLIDE
	db BITE
	db RAGE
	db -1 ; end

SnoruntEggMoves:
	db METAL_CLAW
	db WING_ATTACK
	db RAZOR_WIND
	db COUNTER
	db -1 ; end

SwinubEggMoves:
	db -1 ; end

NatuEggMoves:
	db HARDEN
	db BIDE
	db FLAIL
	db -1 ; end

SigilyphEggMoves:
	db CRUNCH
	db TAKE_DOWN
	db SEISMIC_TOSS
	db FOCUS_ENERGY
	db COUNTER
if _BRASS
	db METAL_CLAW
endc
	db -1 ; end

DrilburEggMoves:
	db -1 ; end

BaltoyEggMoves:
	db -1 ; end

GolettEggMoves:
	db -1 ; end

BronzorEggMoves:
	db AURORA_BEAM
	db OCTAZOOKA
	db SUPERSONIC
	db HAZE
	db SCREECH
	db -1 ; end

HonedgeEggMoves:
	db AURORA_BEAM
	db QUICK_ATTACK
	db FUTURE_SIGHT
	db SPLASH
	db RAPID_SPIN
	db -1 ; end

PawniardEggMoves:
	db FIRE_SPIN
	db RAGE
	db PURSUIT
	db COUNTER
	db SPITE
	db REVERSAL
	db BEAT_UP
	db -1 ; end

YamaskEggMoves:
	db -1 ; end

LitwickEggMoves:
	db -1 ; end

SpiritombEggMoves:
	db -1 ; end

DuskullEggMoves:
	db RAPID_SPIN
	db HI_JUMP_KICK
	db MACH_PUNCH
	db MIND_READER
	db -1 ; end

NoEggMoves:
	db -1 ; end
