evs: MACRO
       db (\1 << 6) | (\2 << 4) | (\3 << 2) | \4
	   db (\5 << 6) | (\6 << 4)
ENDM

tmhm: MACRO
; used in data/pokemon/base_stats/*.asm
tms1 = 0 ; TM01-TM24 (24)
tms2 = 0 ; TM25-TM48 (24)
tms3 = 0 ; TM49-TM50 + HM01-HM07 + MT01-MT03 (12/24)
rept _NARG
	if DEF(\1_TMNUM)
	if \1_TMNUM < 24 + 1
tms1 = tms1 | (1 << ((\1_TMNUM) - 1))
	elif \1_TMNUM < 48 + 1
tms2 = tms2 | (1 << ((\1_TMNUM) - 1 - 24))
	else
tms3 = tms3 | (1 << ((\1_TMNUM) - 1 - 48))
	endc
	else
		fail "\1 is not a TM, HM, or move tutor move"
	endc
	shift
endr
rept 3 ; TM01-TM24 (24/24)
	db tms1 & $ff
tms1 = tms1 >> 8
endr
rept 3 ; TM25-TM48 (24/24)
	db tms2 & $ff
tms2 = tms2 >> 8
endr
rept 2 ; TM49-TM50 + HM01-HM07 + MT01-MT03 (12/16)
	db tms3 & $ff
tms3 = tms3 >> 8
endr
ENDM

BaseData::
INCLUDE "data/pokemon/base_stats/eevee.asm"
INCLUDE "data/pokemon/base_stats/vaporeon.asm"
INCLUDE "data/pokemon/base_stats/jolteon.asm"
INCLUDE "data/pokemon/base_stats/flareon.asm"
INCLUDE "data/pokemon/base_stats/espeon.asm"
INCLUDE "data/pokemon/base_stats/umbreon.asm"
INCLUDE "data/pokemon/base_stats/leafeon.asm"
INCLUDE "data/pokemon/base_stats/glaceon.asm"
INCLUDE "data/pokemon/base_stats/sylveon.asm"
INCLUDE "data/pokemon/base_stats/zorua.asm"
INCLUDE "data/pokemon/base_stats/zoroark.asm"
INCLUDE "data/pokemon/base_stats/rockruff.asm"
INCLUDE "data/pokemon/base_stats/lycanroc_midday.asm"

INCLUDE "data/pokemon/base_stats/mimikyu.asm"
INCLUDE "data/pokemon/base_stats/magnemite.asm"
INCLUDE "data/pokemon/base_stats/magneton.asm"
INCLUDE "data/pokemon/base_stats/magnezone.asm"
INCLUDE "data/pokemon/base_stats/porygon.asm"
INCLUDE "data/pokemon/base_stats/porygon2.asm"
INCLUDE "data/pokemon/base_stats/porygonz.asm"
INCLUDE "data/pokemon/base_stats/meowth.asm"
INCLUDE "data/pokemon/base_stats/persian.asm"
INCLUDE "data/pokemon/base_stats/togepi.asm"
INCLUDE "data/pokemon/base_stats/togetic.asm"
INCLUDE "data/pokemon/base_stats/togekiss.asm"
INCLUDE "data/pokemon/base_stats/rotom.asm"
INCLUDE "data/pokemon/base_stats/chingling.asm"
INCLUDE "data/pokemon/base_stats/chimecho.asm"
INCLUDE "data/pokemon/base_stats/espurr.asm"
INCLUDE "data/pokemon/base_stats/meowstic_m.asm"
INCLUDE "data/pokemon/base_stats/timburr.asm"
INCLUDE "data/pokemon/base_stats/gurdurr.asm"
INCLUDE "data/pokemon/base_stats/conkeldurr.asm"
INCLUDE "data/pokemon/base_stats/ditto.asm"
INCLUDE "data/pokemon/base_stats/purrloin.asm"
INCLUDE "data/pokemon/base_stats/liepard.asm"
INCLUDE "data/pokemon/base_stats/grimer.asm"
INCLUDE "data/pokemon/base_stats/muk.asm"
INCLUDE "data/pokemon/base_stats/nidoran_m.asm"
INCLUDE "data/pokemon/base_stats/nidorino.asm"
INCLUDE "data/pokemon/base_stats/nidorina.asm"
INCLUDE "data/pokemon/base_stats/nidoking.asm"
INCLUDE "data/pokemon/base_stats/nidoqueen.asm"
INCLUDE "data/pokemon/base_stats/seviper.asm"
INCLUDE "data/pokemon/base_stats/zangoose.asm"
INCLUDE "data/pokemon/base_stats/sentret.asm"
INCLUDE "data/pokemon/base_stats/furret.asm"
INCLUDE "data/pokemon/base_stats/swablu.asm"
INCLUDE "data/pokemon/base_stats/altaria.asm"
INCLUDE "data/pokemon/base_stats/mienfoo.asm"
INCLUDE "data/pokemon/base_stats/mienshao.asm"
INCLUDE "data/pokemon/base_stats/hawlucha.asm"
INCLUDE "data/pokemon/base_stats/mareep.asm"
INCLUDE "data/pokemon/base_stats/flaaffy.asm"
INCLUDE "data/pokemon/base_stats/ampharos.asm"
INCLUDE "data/pokemon/base_stats/shinx.asm"
INCLUDE "data/pokemon/base_stats/luxio.asm"
INCLUDE "data/pokemon/base_stats/luxray.asm"
INCLUDE "data/pokemon/base_stats/sandshrew.asm"
INCLUDE "data/pokemon/base_stats/sandslash.asm"
INCLUDE "data/pokemon/base_stats/cutiefly.asm"
INCLUDE "data/pokemon/base_stats/ribombee.asm"
INCLUDE "data/pokemon/base_stats/flabebe.asm"
INCLUDE "data/pokemon/base_stats/floette.asm"
INCLUDE "data/pokemon/base_stats/florges.asm"
INCLUDE "data/pokemon/base_stats/igglybuff.asm"
INCLUDE "data/pokemon/base_stats/jigglypuff.asm"
INCLUDE "data/pokemon/base_stats/wigglytuff.asm"
INCLUDE "data/pokemon/base_stats/chespin.asm"
INCLUDE "data/pokemon/base_stats/quilladin.asm"
INCLUDE "data/pokemon/base_stats/chesnaught.asm"
INCLUDE "data/pokemon/base_stats/deerling.asm"
INCLUDE "data/pokemon/base_stats/sawsbuck.asm"
INCLUDE "data/pokemon/base_stats/cottonee.asm"
INCLUDE "data/pokemon/base_stats/whimsicott.asm"
INCLUDE "data/pokemon/base_stats/foongus.asm"
INCLUDE "data/pokemon/base_stats/amoongus.asm"
INCLUDE "data/pokemon/base_stats/phantump.asm"
INCLUDE "data/pokemon/base_stats/trevanant.asm"
INCLUDE "data/pokemon/base_stats/bonsly.asm"
INCLUDE "data/pokemon/base_stats/sudowoodo.asm"
INCLUDE "data/pokemon/base_stats/passimian.asm"
INCLUDE "data/pokemon/base_stats/Stufful.asm"
INCLUDE "data/pokemon/base_stats/bewear.asm"
INCLUDE "data/pokemon/base_stats/girafarig.asm"
INCLUDE "data/pokemon/base_stats/heracross.asm"
INCLUDE "data/pokemon/base_stats/ledyba.asm"
INCLUDE "data/pokemon/base_stats/ledian.asm"
INCLUDE "data/pokemon/base_stats/joltik.asm"
INCLUDE "data/pokemon/base_stats/galvantula.asm"
INCLUDE "data/pokemon/base_stats/pineco.asm"
INCLUDE "data/pokemon/base_stats/forretress.asm"
INCLUDE "data/pokemon/base_stats/haunter.asm"
INCLUDE "data/pokemon/base_stats/gengar.asm"
INCLUDE "data/pokemon/base_stats/onix.asm"
INCLUDE "data/pokemon/base_stats/drowzee.asm"
INCLUDE "data/pokemon/base_stats/hypno.asm"
INCLUDE "data/pokemon/base_stats/krabby.asm"
INCLUDE "data/pokemon/base_stats/kingler.asm"
INCLUDE "data/pokemon/base_stats/voltorb.asm"
INCLUDE "data/pokemon/base_stats/electrode.asm"
INCLUDE "data/pokemon/base_stats/exeggcute.asm"
INCLUDE "data/pokemon/base_stats/exeggutor.asm"
INCLUDE "data/pokemon/base_stats/cubone.asm"
INCLUDE "data/pokemon/base_stats/marowak.asm"
INCLUDE "data/pokemon/base_stats/hitmonlee.asm"
INCLUDE "data/pokemon/base_stats/hitmonchan.asm"
INCLUDE "data/pokemon/base_stats/lickitung.asm"
INCLUDE "data/pokemon/base_stats/koffing.asm"
INCLUDE "data/pokemon/base_stats/weezing.asm"
INCLUDE "data/pokemon/base_stats/rhyhorn.asm"
INCLUDE "data/pokemon/base_stats/rhydon.asm"
INCLUDE "data/pokemon/base_stats/chansey.asm"
INCLUDE "data/pokemon/base_stats/tangela.asm"
INCLUDE "data/pokemon/base_stats/kangaskhan.asm"
INCLUDE "data/pokemon/base_stats/horsea.asm"
INCLUDE "data/pokemon/base_stats/seadra.asm"
INCLUDE "data/pokemon/base_stats/goldeen.asm"
INCLUDE "data/pokemon/base_stats/seaking.asm"
INCLUDE "data/pokemon/base_stats/staryu.asm"
INCLUDE "data/pokemon/base_stats/starmie.asm"
INCLUDE "data/pokemon/base_stats/mr__mime.asm"
INCLUDE "data/pokemon/base_stats/scyther.asm"
INCLUDE "data/pokemon/base_stats/jynx.asm"
INCLUDE "data/pokemon/base_stats/electabuzz.asm"
INCLUDE "data/pokemon/base_stats/magmar.asm"
INCLUDE "data/pokemon/base_stats/pinsir.asm"
INCLUDE "data/pokemon/base_stats/azumarill.asm"
INCLUDE "data/pokemon/base_stats/magikarp.asm"
INCLUDE "data/pokemon/base_stats/anorith.asm"
INCLUDE "data/pokemon/base_stats/armaldo.asm"
INCLUDE "data/pokemon/base_stats/dewpider.asm"
INCLUDE "data/pokemon/base_stats/araquanid.asm"
INCLUDE "data/pokemon/base_stats/vaporeon.asm"
INCLUDE "data/pokemon/base_stats/jolteon.asm"
INCLUDE "data/pokemon/base_stats/flareon.asm"
INCLUDE "data/pokemon/base_stats/place3.asm"
INCLUDE "data/pokemon/base_stats/omanyte.asm"
INCLUDE "data/pokemon/base_stats/omastar.asm"
INCLUDE "data/pokemon/base_stats/kabuto.asm"
INCLUDE "data/pokemon/base_stats/kabutops.asm"
INCLUDE "data/pokemon/base_stats/aerodactyl.asm"
INCLUDE "data/pokemon/base_stats/snorlax.asm"
INCLUDE "data/pokemon/base_stats/dwebble.asm"
INCLUDE "data/pokemon/base_stats/crustle.asm"
INCLUDE "data/pokemon/base_stats/tyrogue.asm"
INCLUDE "data/pokemon/base_stats/dratini.asm"
INCLUDE "data/pokemon/base_stats/dragonair.asm"
INCLUDE "data/pokemon/base_stats/dragonite.asm"
INCLUDE "data/pokemon/base_stats/riolu.asm"
INCLUDE "data/pokemon/base_stats/lucario.asm"
INCLUDE "data/pokemon/base_stats/chikorita.asm"
INCLUDE "data/pokemon/base_stats/bayleef.asm"
INCLUDE "data/pokemon/base_stats/meganium.asm"
INCLUDE "data/pokemon/base_stats/abomasnow.asm"
INCLUDE "data/pokemon/base_stats/ferroseed.asm"
INCLUDE "data/pokemon/base_stats/ferrothorn.asm"
INCLUDE "data/pokemon/base_stats/totodile.asm"
INCLUDE "data/pokemon/base_stats/croconaw.asm"
INCLUDE "data/pokemon/base_stats/feraligatr.asm"
INCLUDE "data/pokemon/base_stats/larvitar.asm"
INCLUDE "data/pokemon/base_stats/pupitar.asm"
INCLUDE "data/pokemon/base_stats/tyranitar.asm"
INCLUDE "data/pokemon/base_stats/noctowl.asm"
INCLUDE "data/pokemon/base_stats/noivern.asm"
INCLUDE "data/pokemon/base_stats/ledian.asm"
INCLUDE "data/pokemon/base_stats/spinarak.asm"
INCLUDE "data/pokemon/base_stats/ariados.asm"
INCLUDE "data/pokemon/base_stats/crobat.asm"
INCLUDE "data/pokemon/base_stats/chinchou.asm"
INCLUDE "data/pokemon/base_stats/lanturn.asm"
INCLUDE "data/pokemon/base_stats/pichu.asm"
INCLUDE "data/pokemon/base_stats/cleffa.asm"
INCLUDE "data/pokemon/base_stats/zweilous.asm"
INCLUDE "data/pokemon/base_stats/heidreigon.asm"
INCLUDE "data/pokemon/base_stats/cyndaquil.asm"
INCLUDE "data/pokemon/base_stats/quilava.asm"
INCLUDE "data/pokemon/base_stats/typhlosion.asm"
INCLUDE "data/pokemon/base_stats/litten.asm"
INCLUDE "data/pokemon/base_stats/torracat.asm"
INCLUDE "data/pokemon/base_stats/incineroar.asm"
INCLUDE "data/pokemon/base_stats/fennekin.asm"
INCLUDE "data/pokemon/base_stats/braixen.asm"
INCLUDE "data/pokemon/base_stats/delphox.asm"
INCLUDE "data/pokemon/base_stats/vulpix.asm"
INCLUDE "data/pokemon/base_stats/ninetales.asm"
INCLUDE "data/pokemon/base_stats/hoppip.asm"
INCLUDE "data/pokemon/base_stats/skiploom.asm"
INCLUDE "data/pokemon/base_stats/jumpluff.asm"
INCLUDE "data/pokemon/base_stats/aipom.asm"
INCLUDE "data/pokemon/base_stats/fletchling.asm"
INCLUDE "data/pokemon/base_stats/fletchinder.asm"
INCLUDE "data/pokemon/base_stats/talonflame.asm"
INCLUDE "data/pokemon/base_stats/heatmor.asm"
INCLUDE "data/pokemon/base_stats/durant.asm"
INCLUDE "data/pokemon/base_stats/archen.asm"
INCLUDE "data/pokemon/base_stats/archeops.asm"
INCLUDE "data/pokemon/base_stats/roggenrola.asm"
INCLUDE "data/pokemon/base_stats/boldore.asm"
INCLUDE "data/pokemon/base_stats/gigalith.asm"
INCLUDE "data/pokemon/base_stats/carbink.asm"
INCLUDE "data/pokemon/base_stats/amaura.asm"
INCLUDE "data/pokemon/base_stats/aurorus.asm"
INCLUDE "data/pokemon/base_stats/sneasel.asm"
INCLUDE "data/pokemon/base_stats/weavile.asm"
INCLUDE "data/pokemon/base_stats/cryogonal.asm"
INCLUDE "data/pokemon/base_stats/snowrunt.asm"
INCLUDE "data/pokemon/base_stats/glalie.asm"
INCLUDE "data/pokemon/base_stats/frosslass.asm"
INCLUDE "data/pokemon/base_stats/swinub.asm"
INCLUDE "data/pokemon/base_stats/piloswine.asm"
INCLUDE "data/pokemon/base_stats/mamoswine.asm"
INCLUDE "data/pokemon/base_stats/unown.asm"
INCLUDE "data/pokemon/base_stats/natu.asm"
INCLUDE "data/pokemon/base_stats/xatu.asm"
INCLUDE "data/pokemon/base_stats/sigilyph.asm"
INCLUDE "data/pokemon/base_stats/drillbur.asm"
INCLUDE "data/pokemon/base_stats/excadrill.asm"
INCLUDE "data/pokemon/base_stats/baltoy.asm"
INCLUDE "data/pokemon/base_stats/claydol.asm"
INCLUDE "data/pokemon/base_stats/golett.asm"
INCLUDE "data/pokemon/base_stats/golurk.asm"
INCLUDE "data/pokemon/base_stats/bronzor.asm"
INCLUDE "data/pokemon/base_stats/bronzong.asm"
INCLUDE "data/pokemon/base_stats/honedge.asm"
INCLUDE "data/pokemon/base_stats/doublade.asm"
INCLUDE "data/pokemon/base_stats/aegislash.asm"
INCLUDE "data/pokemon/base_stats/pawniard.asm"
INCLUDE "data/pokemon/base_stats/bisharp.asm"
INCLUDE "data/pokemon/base_stats/yamask.asm"
INCLUDE "data/pokemon/base_stats/cofagrigus.asm"
INCLUDE "data/pokemon/base_stats/litwick.asm"
INCLUDE "data/pokemon/base_stats/lampent.asm"
INCLUDE "data/pokemon/base_stats/chandelure.asm"
INCLUDE "data/pokemon/base_stats/spiritomb.asm"
INCLUDE "data/pokemon/base_stats/duskull.asm"
INCLUDE "data/pokemon/base_stats/dusclops.asm"
INCLUDE "data/pokemon/base_stats/dusknoir.asm"
INCLUDE "data/pokemon/base_stats/articuno.asm"
INCLUDE "data/pokemon/base_stats/magby.asm"
INCLUDE "data/pokemon/base_stats/moltres.asm"
INCLUDE "data/pokemon/base_stats/suicune.asm"
INCLUDE "data/pokemon/base_stats/raikou.asm"
INCLUDE "data/pokemon/base_stats/entei.asm"
INCLUDE "data/pokemon/base_stats/latias.asm"
INCLUDE "data/pokemon/base_stats/latios.asm"
INCLUDE "data/pokemon/base_stats/silvally.asm"
INCLUDE "data/pokemon/base_stats/magearna.asm"
INCLUDE "data/pokemon/base_stats/shaymin.asm"
INCLUDE "data/pokemon/base_stats/celebi.asm"
INCLUDE "data/pokemon/base_stats/zygarde.asm"
INCLUDE "data/pokemon/base_stats/mew.asm"
INCLUDE "data/pokemon/base_stats/mewtwo.asm"

