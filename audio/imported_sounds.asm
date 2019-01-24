pcm: MACRO
    dw .End - .Start
.Start
\1
.End:
ENDM

SECTION "HMS Laugh", ROMX ; Bank $??

HMSLaugh::
    pcm INCBIN "audio/imported_sounds/hms_laugh.pcm"
    db $77
