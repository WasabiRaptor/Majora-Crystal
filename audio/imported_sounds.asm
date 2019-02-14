pcm: MACRO
    dw .End - .Start
.Start
    \1
.End:
ENDM

SECTION "HMS Laugh", ROMX ; Bank $??
HMSLaugh::
    pcm INCBIN "audio/imported_sounds/hms_laugh.pcm"
    
SECTION "Wind 1", ROMX
Wind1::
    pcm INCBIN "audio/imported_sounds/wind1.pcm"
    
SECTION "Wind 2", ROMX
Wind2::
    pcm INCBIN "audio/imported_sounds/wind2.pcm"

SECTION "Sylveon", ROMX
Sylveon::
    pcm INCBIN "audio/imported_sounds/sylveon.pcm"
