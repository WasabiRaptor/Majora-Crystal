AltFormSpeciesTable:
	db LYCANROC
	db MEOWTH
	db PERSIAN
	db GRIMER
	db MUK
	db ROTOM
	db MEOWSTIC
    db NIDORAN
    db SANDSHREW
    db SANDSLASH
    db SAWSBUCK
    db GIRAFARIG
    db VULPIX
    db NINETALES
    db UNOWN
    db AEGISLASH
    db SUICUNE
    db RAIKOU
    db ENTEI
    db SHAYMIN
    db ZYGARDE
	db -1

AltFormAnimPointerTable:
    dbbww LYCANROC,     BANK(LycanrocAnimations), LycanrocAnimationPointers, LycanrocAnimationIdlePointers
    dbbww MEOWTH,       BANK(MeowthAnimations), MeowthAnimationPointers, MeowthAnimationIdlePointers
	dbbww PERSIAN,      BANK(PersianAnimations), PersianAnimationPointers, PersianAnimationIdlePointers
    dbbww GRIMER,       BANK(GrimerAnimations), GrimerAnimationPointers, GrimerAnimationIdlePointers
    dbbww MUK,          BANK(MukAnimations), MukAnimationPointers, MukAnimationIdlePointers
    dbbww ROTOM,        BANK(RotomAnimations), RotomAnimationPointers, RotomAnimationIdlePointers
    dbbww MEOWSTIC,     BANK(MeowsticAnimations), MeowsticAnimationPointers, MeowsticAnimationIdlePointers
    dbbww NIDORAN,      BANK(NidoranAnimations), NidoranAnimationPointers, NidoranAnimationIdlePointers
    dbbww SANDSHREW,    BANK(SandshrewAnimations), SandshrewAnimationPointers, SandshrewAnimationIdlePointers
    dbbww SANDSLASH,    BANK(SandslashAnimations), SandslashAnimationPointers, SandslashAnimationIdlePointers
    dbbww SAWSBUCK,     BANK(SawsbuckAnimations), SawsbuckAnimationPointers, SawsbuckAnimationIdlePointers
    dbbww GIRAFARIG,    BANK(GirafarigAnimations), GirafarigAnimationPointers, GirafarigAnimationIdlePointers
    dbbww VULPIX,       BANK(VulpixAnimations), VulpixAnimationPointers, VulpixAnimationIdlePointers
    dbbww NINETALES,    BANK(NinetalesAnimations), NinetalesAnimationPointers, NinetalesAnimationIdlePointers
    dbbww UNOWN,        BANK(UnownAnimations), UnownAnimationPointers, UnownAnimationIdlePointers
    dbbww AEGISLASH,    BANK(AegislashAnimations), AegislashAnimationPointers, AegislashAnimationIdlePointers
    dbbww SUICUNE,      BANK(SuicuneAnimations), SuicuneAnimationPointers, SuicuneAnimationIdlePointers
    dbbww RAIKOU,       BANK(RaikouAnimations), RaikouAnimationPointers, RaikouAnimationIdlePointers
    dbbww ENTEI,        BANK(EnteiAnimations), EnteiAnimationPointers, EnteiAnimationIdlePointers
    dbbww SHAYMIN,      BANK(ShayminAnimations), ShayminAnimationPointers, ShayminAnimationIdlePointers
    dbbww ZYGARDE,      BANK(ZygardeAnimations), ZygardeAnimationPointers, ZygardeAnimationIdlePointers
	dbbww -1,           BANK(PicAnimations), AnimationPointers, AnimationIdlePointers

AltFormFramesPointerTable:
	dbbba LYCANROC,     BANK(LycanrocsFrames), LycanrocFramesPointers
    dbbba MEOWTH,       BANK(MeowthsFrames), MeowthFramesPointers
    dbbba PERSIAN,      BANK(PersiansFrames), PersianFramesPointers
    dbbba GRIMER,       BANK(GrimersFrames), GrimerFramesPointers
    dbbba MUK,          BANK(MuksFrames), MukFramesPointers
    dbbba ROTOM,        BANK(RotomsFrames), RotomFramesPointers
    dbbba MEOWSTIC,     BANK(MeowsticsFrames), MeowsticFramesPointers
    dbbba NIDORAN,      BANK(NidoransFrames), NidoranFramesPointers
    dbbba SANDSHREW,    BANK(SandshrewsFrames), SandshrewFramesPointers
    dbbba SANDSLASH,    BANK(SandslashsFrames), SandslashFramesPointers
    dbbba SAWSBUCK,     BANK(SawsbucksFrames), SawsbuckFramesPointers
    dbbba GIRAFARIG,    BANK(GirafarigsFrames), GirafarigFramesPointers
    dbbba VULPIX,       BANK(VulpixsFrames), VulpixFramesPointers
    dbbba NINETALES,    BANK(NinetalessFrames), NinetalesFramesPointers
    dbbba UNOWN,        BANK(UnownsFrames), UnownFramesPointers
    dbbba AEGISLASH,    BANK(AegislashsFrames), AegislashFramesPointers
    dbbba SUICUNE,      BANK(SuicunesFrames), SuicuneFramesPointers
    dbbba RAIKOU,       BANK(RaikousFrames), RaikouFramesPointers
    dbbba ENTEI,        BANK(EnteisFrames), EnteiFramesPointers
    dbbba SHAYMIN,      BANK(ShayminsFrames), ShayminFramesPointers
    dbbba ZYGARDE,      BANK(ZygardesFrames), ZygardeFramesPointers
	dbbba -1, BANK(KantoFrames), FramesPointers

AltFormBitmasksPointerTable:
	dbba LYCANROC,      LycanrocBitmasksPointers
    dbba MEOWTH,        MeowthBitmasksPointers
    dbba PERSIAN,       PersianBitmasksPointers
    dbba GRIMER,        GrimerBitmasksPointers
    dbba MUK,           MukBitmasksPointers
    dbba ROTOM,         RotomBitmasksPointers
    dbba MEOWSTIC,      MeowsticBitmasksPointers
    dbba NIDORAN,       NidoranBitmasksPointers
    dbba SANDSHREW,     SandshrewBitmasksPointers
    dbba SANDSLASH,     SandslashBitmasksPointers
    dbba SAWSBUCK,      SawsbuckBitmasksPointers
    dbba GIRAFARIG,     GirafarigBitmasksPointers
    dbba VULPIX,        VulpixBitmasksPointers
    dbba NINETALES,     NinetalesBitmasksPointers
    dbba UNOWN,         UnownBitmasksPointers
    dbba AEGISLASH,     AegislashBitmasksPointers
    dbba SUICUNE,       SuicuneBitmasksPointers
    dbba RAIKOU,        RaikouBitmasksPointers
    dbba ENTEI,         EnteiBitmasksPointers
    dbba SHAYMIN,       ShayminBitmasksPointers
    dbba ZYGARDE,       ZygardeBitmasksPointers
	dbba -1,            BitmasksPointers