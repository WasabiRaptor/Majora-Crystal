	; npctrade struct members (see data/events/npc_trades.asm)
TRADE_DIALOG      EQU 0
TRADE_GIVEMON     EQU 1
TRADE_GETMON      EQU 2
TRADE_NICK        EQU 3
TRADE_DVS         EQU 14
TRADE_PERSONALITY EQU 17
TRADE_BALL        EQU 19
TRADE_ITEM        EQU 20
TRADE_OT_ID       EQU 22
TRADE_OT_NAME     EQU 23

; NPCTrades indexes (see data/events/npc_trades.asm)
	const_def
	const NPC_TRADE_MIKE   ; 0
	const NPC_TRADE_KYLE   ; 1
	const NPC_TRADE_TIM    ; 2
	const NPC_TRADE_EMY    ; 3
	const NPC_TRADE_CHRIS  ; 4
	const NPC_TRADE_KIM    ; 5
	const NPC_TRADE_FOREST ; 6
NUM_NPC_TRADES EQU const_value

; trade gender limits
	const_def
	const TRADE_GENDER_EITHER
	const TRADE_GENDER_MALE
	const TRADE_GENDER_FEMALE

; TradeTexts indexes (see engine/events/npc_trade.asm)

; Trade dialogs
TRADE_INTRO    EQU 0
TRADE_CANCEL   EQU 1
TRADE_WRONG    EQU 2
TRADE_COMPLETE EQU 3
TRADE_AFTER    EQU 4


; trade dialog sets
	const_def
	const TRADE_DIALOGSET_COLLECTOR
	const TRADE_DIALOGSET_HAPPY
	const TRADE_DIALOGSET_NEWBIE
	const TRADE_DIALOGSET_GIRL
