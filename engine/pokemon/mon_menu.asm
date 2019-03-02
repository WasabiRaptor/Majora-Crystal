HasNoItems:
	ld a, [wNumItems]
	and a
	ret nz
	ld a, [wNumKeyItems]
	and a
	ret nz
	ld a, [wNumBalls]
	and a
	ret nz
	ld hl, wTMsHMs
	ld b, NUM_TMS + NUM_HMS
.loop
	ld a, [hli]
	and a
	jr nz, .done
	dec b
	jr nz, .loop
	scf
	ret
.done
	and a
	ret

TossItemFromPC:
	push de
	call PartyMonItemName
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .key_item
	ld hl, .TossHowMany
	call MenuTextBox
	farcall SelectQuantityToToss
	push af
	call CloseWindow
	call ExitMenu
	pop af
	jr c, .quit
	ld hl, .ConfirmToss
	call MenuTextBox
	call YesNoBox
	push af
	call ExitMenu
	pop af
	jr c, .quit
	pop hl
	ld a, [wCurItemQuantity]
	call TossItem
	call PartyMonItemName
	ld hl, .TossedThisMany
	call MenuTextBox
	call ExitMenu
	and a
	ret

.key_item
	call .CantToss
.quit
	pop hl
	scf
	ret

.TossHowMany:
	; Toss out how many @ (S)?
	text_jump UnknownText_0x1c1a90
	db "@"

.ConfirmToss:
	; Throw away @ @ (S)?
	text_jump UnknownText_0x1c1aad
	db "@"

.TossedThisMany:
	; Discarded @ (S).
	text_jump UnknownText_0x1c1aca
	db "@"

.CantToss:
	ld hl, .TooImportantToToss
	call MenuTextBoxBackup
	ret

.TooImportantToToss:
	; That's too impor- tant to toss out!
	text_jump UnknownText_0x1c1adf
	db "@"

CantUseItem:
	ld hl, CantUseItemText
	call MenuTextBoxWaitButton
	ret

CantUseItemText:
	text_jump UnknownText_0x1c1b03
	db "@"

PartyMonItemName:
	ld a, [wCurItem]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	call CopyName1
	ret

CancelPokemonAction:
	farcall InitPartyMenuWithCancel
	farcall UnfreezeMonIcons
	ld a, 1
	ret

PokemonActionSubmenu:
	hlcoord 1, 15
	lb bc, 2, 18
	call ClearBox
	farcall MonSubmenu
	call GetCurNick
	ld a, [wMenuSelection]
	ld hl, .Actions
	ld de, 3
	call IsInArray
	jr nc, .nothing

	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.nothing
	ld a, 0
	ret

.Actions:
	dbw MONMENUITEM_CUT,        MonMenu_Cut
	dbw MONMENUITEM_FLY,        MonMenu_Fly
	dbw MONMENUITEM_SURF,       MonMenu_Surf
	dbw MONMENUITEM_STRENGTH,   MonMenu_Strength
	dbw MONMENUITEM_FLASH,      MonMenu_Flash
	dbw MONMENUITEM_WHIRLPOOL,  MonMenu_Whirlpool
	dbw MONMENUITEM_DIG,        MonMenu_Dig
	dbw MONMENUITEM_TELEPORT,   MonMenu_Teleport
	dbw MONMENUITEM_SOFTBOILED, MonMenu_Softboiled_MilkDrink
	dbw MONMENUITEM_MILKDRINK,  MonMenu_Softboiled_MilkDrink
	dbw MONMENUITEM_HEADBUTT,   MonMenu_Headbutt
	dbw MONMENUITEM_WATERFALL,  MonMenu_Waterfall
	dbw MONMENUITEM_ROCKSMASH,  MonMenu_RockSmash
	dbw MONMENUITEM_SWEETSCENT, MonMenu_SweetScent
	dbw MONMENUITEM_STATS,      OpenPartyStats
	dbw MONMENUITEM_SWITCH,     SwitchPartyMons
	dbw MONMENUITEM_ITEM,       GiveTakePartyMonItem
	dbw MONMENUITEM_CANCEL,     CancelPokemonAction
	dbw MONMENUITEM_MOVE,       ManagePokemonMoves
	dbw MONMENUITEM_MAIL,       MonMailAction

SwitchPartyMons:
; Don't try if there's nothing to switch!
	ld a, [wPartyCount]
	cp 2
	jr c, .DontSwitch

	ld a, [wCurPartyMon]
	inc a
	ld [wSwitchMon], a

	farcall HoldSwitchmonIcon
	farcall InitPartyMenuNoCancel

	ld a, PARTYMENUACTION_MOVE
	ld [wPartyMenuActionText], a
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText

	hlcoord 0, 1
	ld bc, SCREEN_WIDTH * 2
	ld a, [wSwitchMon]
	dec a
	rst AddNTimes
	ld [hl], "▷"
	call WaitBGMap
	call SetPalettes
	call DelayFrame

	farcall PartyMenuSelect
	bit 1, b
	jr c, .DontSwitch

	farcall _SwitchPartyMons

	xor a
	ld [wPartyMenuActionText], a

	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX

	ld a, 1
	ret

.DontSwitch:
	xor a
	ld [wPartyMenuActionText], a
	call CancelPokemonAction
	ret

GiveTakePartyMonItem:
; Eggs can't hold items!
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .cancel

	ld hl, GiveTakeItemMenuData
	call LoadMenuHeader
	call VerticalMenu
	call ExitMenu
	jr c, .cancel

	call GetCurNick
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	rst CopyBytes
	ld a, [wMenuCursorY]
	cp 1
	jr nz, .take

	call LoadStandardMenuHeader
	call ClearPalettes
	call .GiveItem
	call ClearPalettes
	call LoadFontsBattleExtra
	call ExitMenu
	ld a, 0
	ret

.take
	call TakePartyItem
	ld a, 3
	ret

.cancel
	ld a, 3
	ret

.GiveItem:
	farcall DepositSellInitPackBuffers

.loop
	farcall DepositSellPack

	ld a, [wcf66]
	and a
	jr z, .quit

	ld a, [wcf65]
	cp 2
	jr z, .next

	call CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .next

	call TryGiveItemToPartymon
	jr .quit

.next
	ld hl, CantBeHeldText
	call MenuTextBoxBackup
	jr .loop

.quit
	ret

TryGiveItemToPartymon:
	call SpeechTextBox
	call PartyMonItemName
	call GetPartyItemLocation
	ld a, [hl]
	and a
	jr z, .give_item_to_mon

	push hl
	ld d, a
	farcall ItemIsMail
	pop hl
	jr c, .please_remove_mail
	ld a, [hl]
	jr .already_holding_item

.give_item_to_mon
	call GiveItemToPokemon
	ld hl, MadeHoldText
	call MenuTextBoxBackup
	call GivePartyItem
	ret

.please_remove_mail
	ld hl, PleaseRemoveMailText
	call MenuTextBoxBackup
	ret

.already_holding_item
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, SwitchAlreadyHoldingText
	call StartMenuYesNo
	jr c, .abort

	call GiveItemToPokemon
	ld a, [wNamedObjectIndexBuffer]
	push af
	ld a, [wCurItem]
	ld [wNamedObjectIndexBuffer], a
	pop af
	ld [wCurItem], a
	call ReceiveItemFromPokemon
	jr nc, .bag_full

	ld hl, TookAndMadeHoldText
	call MenuTextBoxBackup
	ld a, [wNamedObjectIndexBuffer]
	ld [wCurItem], a
	call GivePartyItem
	ret

.bag_full
	ld a, [wNamedObjectIndexBuffer]
	ld [wCurItem], a
	call ReceiveItemFromPokemon
	ld hl, ItemStorageIsFullText
	call MenuTextBoxBackup

.abort
	ret

GivePartyItem:
	call GetPartyItemLocation
	ld a, [wCurItem]
	ld [hl], a
	ld d, a
	farcall ItemIsMail
	jr nc, .done
	call ComposeMailMessage

.done
	ret

TakePartyItem:
	call SpeechTextBox
	call GetPartyItemLocation
	ld a, [hl]
	and a
	jr z, .asm_12c8c

	ld [wCurItem], a
	call ReceiveItemFromPokemon
	jr nc, .asm_12c94

	farcall ItemIsMail
	call GetPartyItemLocation
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	ld [hl], NO_ITEM
	call GetItemName
	ld hl, TookFromText
	call MenuTextBoxBackup
	jr .asm_12c9a

.asm_12c8c
	ld hl, IsntHoldingAnythingText
	call MenuTextBoxBackup
	jr .asm_12c9a

.asm_12c94
	ld hl, ItemStorageIsFullText
	call MenuTextBoxBackup

.asm_12c9a
	ret

GiveTakeItemMenuData:
	db MENU_SPRITE_ANIMS | MENU_BACKUP_TILES ; flags
	menu_coords 12, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .Items
	db 1 ; default option

.Items:
	db STATICMENU_CURSOR ; flags
	db 2 ; # items
	db "GIVE@"
	db "TAKE@"

TookAndMadeHoldText:
	text_jump UnknownText_0x1c1b2c
	db "@"

MadeHoldText:
	text_jump UnknownText_0x1c1b57
	db "@"

PleaseRemoveMailText:
	text_jump UnknownText_0x1c1b6f
	db "@"

IsntHoldingAnythingText:
	text_jump UnknownText_0x1c1b8e
	db "@"

ItemStorageIsFullText:
	text_jump UnknownText_0x1c1baa
	db "@"

TookFromText:
	text_jump UnknownText_0x1c1bc4
	db "@"

SwitchAlreadyHoldingText:
	text_jump UnknownText_0x1c1bdc
	db "@"

CantBeHeldText:
	text_jump UnknownText_0x1c1c09
	db "@"

GetPartyItemLocation:
	push af
	ld a, MON_ITEM
	call GetPartyParamLocation
	pop af
	ret

ReceiveItemFromPokemon:
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	jp ReceiveItem

GiveItemToPokemon:
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	jp TossItem

StartMenuYesNo:
	call MenuTextBox
	call YesNoBox
	jp ExitMenu

ComposeMailMessage:
	ld de, wTempMailMessage
	farcall _ComposeMailMessage
	ld hl, wPlayerName
	ld de, wTempMailAuthor
	ld bc, NAME_LENGTH - 1
	rst CopyBytes
	ld hl, wPlayerID
	ld bc, 2
	rst CopyBytes
	ld a, [wCurPartySpecies]
	ld [de], a
	inc de
	ld a, [wCurItem]
	ld [de], a
	ld a, [wCurPartyMon]
	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, wTempMail
	ld bc, MAIL_STRUCT_LENGTH
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	rst CopyBytes
	call CloseSRAM
	ret

MonMailAction:
; If in the time capsule or trade center,
; selecting the mail only allows you to
; read the mail.
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr z, .read
	cp LINK_TRADECENTER
	jr z, .read

; Show the READ/TAKE/QUIT menu.
	ld hl, .MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	call ExitMenu

; Interpret the menu.
	jp c, .done
	ld a, [wMenuCursorY]
	cp $1
	jr z, .read
	cp $2
	jr z, .take
	jp .done

.read
	farcall ReadPartyMonMail
	ld a, $0
	ret

.take
	ld hl, .sendmailtopctext
	call StartMenuYesNo
	jr c, .RemoveMailToBag
	ld a, [wCurPartyMon]
	ld b, a
	farcall SendMailToPC
	jr c, .MailboxFull
	ld hl, .sentmailtopctext
	call MenuTextBoxBackup
	jr .done

.MailboxFull:
	ld hl, .mailboxfulltext
	call MenuTextBoxBackup
	jr .done

.RemoveMailToBag:
	ld hl, .mailwilllosemessagetext
	call StartMenuYesNo
	jr c, .done
	call GetPartyItemLocation
	ld a, [hl]
	ld [wCurItem], a
	call ReceiveItemFromPokemon
	jr nc, .BagIsFull
	call GetPartyItemLocation
	ld [hl], $0
	call GetCurNick
	ld hl, .tookmailfrommontext
	call MenuTextBoxBackup
	jr .done

.BagIsFull:
	ld hl, .bagfulltext
	call MenuTextBoxBackup
	jr .done

.done
	ld a, $3
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 10, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "READ@"
	db "TAKE@"
	db "QUIT@"

.mailwilllosemessagetext
; The MAIL will lose its message. OK?
	text_jump UnknownText_0x1c1c22
	db "@"

.tookmailfrommontext
; MAIL detached from <POKEMON>.
	text_jump UnknownText_0x1c1c47
	db "@"

.bagfulltext
; There's no space for removing MAIL.
	text_jump UnknownText_0x1c1c62
	db "@"

.sendmailtopctext
; Send the removed MAIL to your PC?
	text_jump UnknownText_0x1c1c86
	db "@"

.mailboxfulltext
; Your PC's MAILBOX is full.
	text_jump UnknownText_0x1c1ca9
	db "@"

.sentmailtopctext
; The MAIL was sent to your PC.
	text_jump UnknownText_0x1c1cc4
	db "@"

OpenPartyStats:
	call LoadStandardMenuHeader
	call ClearSprites
; PartyMon
	xor a
	ld [wMonType], a
	call LowVolume
	predef StatsScreenInit
	call MaxVolume
	call Call_ExitMenu
	ld a, 0
	ret

MonMenu_Cut:
	farcall CutFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Fly:
	farcall FlyFunction
	ld a, [wFieldMoveSucceeded]
	cp $2
	jr z, .Fail
	cp $0
	jr z, .Error
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

.Error:
	ld a, $0
	ret

MonMenu_Flash:
	farcall OWFlash
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Strength:
	farcall StrengthFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Whirlpool:
	farcall WhirlpoolFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Waterfall:
	farcall WaterfallFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Teleport:
	farcall TeleportFunction
	ld a, [wFieldMoveSucceeded]
	and a
	jr z, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Surf:
	farcall SurfFunction
	ld a, [wFieldMoveSucceeded]
	and a
	jr z, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Dig:
	farcall DigFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Softboiled_MilkDrink:
	call .CheckMonHasEnoughHP
	jr nc, .NotEnoughHP
	farcall Softboiled_MilkDrinkFunction
	jr .finish

.NotEnoughHP:
	ld hl, .Text_NotEnoughHP
	call PrintText

.finish
	xor a
	ld [wPartyMenuActionText], a
	ld a, $3
	ret

.Text_NotEnoughHP:
	; Not enough HP!
	text_jump UnknownText_0x1c1ce3
	db "@"

.CheckMonHasEnoughHP:
; Need to have at least (MaxHP / 5) HP left.
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld a, [hli]
	ldh [hDividend + 0], a
	ld a, [hl]
	ldh [hDividend + 1], a
	ld a, 5
	ldh [hDivisor], a
	ld b, 2
	call Divide
	ld a, MON_HP + 1
	call GetPartyParamLocation
	ldh a, [hQuotient + 3]
	sub [hl]
	dec hl
	ldh a, [hQuotient + 2]
	sbc [hl]
	ret

MonMenu_Headbutt:
	farcall HeadbuttFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_RockSmash:
	farcall RockSmashFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_SweetScent:
	farcall SweetScentFromMenu
	ld b, $4
	ld a, $2
	ret


	const_def
	const MOVESCREEN_NORMAL
	const MOVESCREEN_DELETER
	const MOVESCREEN_NEWMOVE
	const MOVESCREEN_REMINDER

ChooseMoveToDelete:
	ld hl, wOptions1
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call LoadFontsBattleExtra
	ld a, MOVESCREEN_DELETER
	ld [wMoveScreenMode], a
	call MoveScreenLoop
	pop bc
	push af
	ld a, b
	ld [wOptions1], a
	call ClearBGPalettes
	pop af
	ret

ChooseMoveToForget:
	ld hl, wOptions1
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call LoadTileMapToTempTileMap
	call LoadFontsBattleExtra
	ld a, MOVESCREEN_NEWMOVE
	ld [wMoveScreenMode], a
	call MoveScreenLoop
	pop bc
	push af
	ld a, b
	ld [wOptions1], a
	call ClearBGPalettes
	ld a, [wBattleMode]
	and a
	jr z, .tm_tutor

	; Level up in battle
	call ClearTileMap
	call ClearSprites
	call ClearPalettes
	call DelayFrame
	call UpdateSprites
	farcall FinishBattleAnim
	farcall _LoadBattleFontsHPBar
	farcall GetMonBackpic
	call LoadTempTileMapToTileMap
	jr .done

.tm_tutor
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	call SpeechTextBox
.done
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	pop af
	ret

ChooseMoveToRelearn:
	ld hl, wOptions1
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call LoadFontsBattleExtra
	ld a, MOVESCREEN_REMINDER
	ld [wMoveScreenMode], a
	call MoveScreenLoop
	pop bc
	push af
	ld a, b
	ld [wOptions1], a
	jr c, .no_moves
	call ClearBGPalettes
	ld a, [wCurPartyMon]
	push af
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	pop af
	ld [wCurPartyMon], a
	pop af
	push af
	call nz, SpeechTextBox
	call WaitBGMap
	call SetPalettes
	call DelayFrame
.no_moves
	pop af
	ret

ManagePokemonMoves: ; 12fba
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	ld hl, wOptions1
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	xor a
	ld [wMoveScreenMode], a
	call MoveScreenLoop
	pop af
	ld [wOptions1], a
	call ClearBGPalettes

.egg
	xor a
	ret
; 12fd5

MoveScreenLoop:
; Returns:
; a = >0: f = nc|nz; selected move (index in wMoveScreenSelectedMove)
; a =  0: f = nc|z;  user pressed B
;         f = c;     no options existed, move screen was aborted early
	xor a
	ld [wMoveScreenSelectedMove], a
	ld [wMenuCursorY], a
	ld [wMoveScreenOffset], a
	ld [wMoveScreenNumMoves], a

	; Zero the first 4 moves to avoid oddities if we have less than 4 total
	ld hl, wMoveScreenMoves
	ld b, NUM_MOVES
	xor a
.zero_movescreenmoves
	ld [hli], a
	dec b
	jr nz, .zero_movescreenmoves
	ld a, [wMoveScreenMode]
	cp MOVESCREEN_REMINDER
	jr z, .movecopy_reminder

	; Copy over moves from the party struct
	ld bc, NUM_MOVES
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld de, wMoveScreenMoves
.movecopy_loop
	ld a, [hli]
	and a
	jr z, .movecopy_done
	ld [de], a
	inc de
	inc b
	dec c
	jr nz, .movecopy_loop

.movecopy_done
	; If we're learning a new move, append the move to the move list buffer
	ld a, [wMoveScreenMode]
	cp MOVESCREEN_NEWMOVE
	jr nz, .newmove_done
	ld a, [wPutativeTMHMMove]
	ld [de], a
	inc b
	jr .newmove_done

.movecopy_reminder
	call GetForgottenMoves
	ld b, c
.newmove_done
	ld a, b
	ld [wMoveScreenNumMoves], a
	sub 1
	ret c ; no moves

	; Initialize the interface
	call SetUpMoveScreenBG
	call MoveScreen_ListMoves
	jr .loop
.outer_loop
	call MoveScreen_ListMovesFast
.pressed_start
	ld c, 5
	call DelayFrames
.loop
	farcall PlaySpriteAnimationsAndDelayFrame
	call JoyTextDelay

	; allow d-pad to be held, but not a/b/start/select
	ld a, [hJoyPressed]
	and BUTTONS
	ld b, a
	ld a, [hJoyDown]
	and D_PAD
	or b
	rrca
	jr c, .pressed_a
	rrca
	jr c, .pressed_b
	rrca
	jr c, .pressed_select
	rrca
	jr c, .pressed_start
	rrca
	jr c, .pressed_right
	rrca
	jp c, .pressed_left
	rrca
	jp c, .pressed_up
	rrca
	jp c, .pressed_down
	jr .loop
.pressed_a
	ld a, [wMoveScreenMode]
	and a ; cp MOVESCREEN_NORMAL
	jr z, .swap_move
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, [wMenuCursorY]
	ld c, a
	ld a, [wMoveScreenOffset]
	add c
	ld c, a
	ld b, 0
	ld hl, wMoveScreenMoves
	add hl, bc
	ld a, [wMoveScreenMode]
	cp MOVESCREEN_NEWMOVE
	ld a, [hl]
	ld [wMoveScreenSelectedMove], a
	jr nz, .ok
	push bc
	call IsHMMove
	pop bc
	ld a, c
	jr nc, .ok
	cp 4 ; selected new move
	jr z, .ok
	ld hl, Text_CantForgetHM
	call PrintTextNoBox
	jr .outer_loop
.ok
	inc a
	ret
.pressed_b
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, [wMoveSwapBuffer]
	and a
	ret z
	xor a
	ld [wMoveSwapBuffer], a
	jp .outer_loop
.pressed_select
	ld a, [wMoveScreenMode]
	and a
	jp nz, .loop
.swap_move
	; check if we are in swap mode
	ld a, [wMoveSwapBuffer]
	and a
	jp nz, .perform_swap
	ld a, [wMenuCursorY]
	inc a
	ld [wMoveSwapBuffer], a
	jp .outer_loop
.pressed_right
	ld a, [wMoveScreenMode]
	and a
	jr z, .species_right
	ld a, [wMenuCursorY]
	cp 3
	jp z, .far_down
	ld a, [wMoveScreenNumMoves]
	dec a
	cp 4
	jp c, .update_screen_cursor
	ld a, 3
	jp .update_screen_cursor
.species_right
	ld a, [wPartyCount]
	ld d, a
	ld a, [wCurPartyMon]
	dec d
	cp d
	jp z, .loop
.loop_right
	inc a
	ld d, a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1IsEgg
	rst AddNTimes
	ld a, [hl]
	and IS_EGG_MASK
	ld a, d
	jr nz, .loop_right_invalid
	ld hl, wPartyMon1Species
	rst AddNTimes
	ld a, [hl]
	call IsAPokemon
	ld a, d
	jr c, .loop_right_invalid
	ld [wCurPartyMon], a
	jp MoveScreenLoop
.loop_right_invalid
	ld a, [wPartyCount]
	dec a
	cp d
	ld a, d
	jp z, .loop
	jr .loop_right
.pressed_left
	ld a, [wMoveScreenMode]
	and a
	jp z, .species_left
	ld a, [wMenuCursorY]
	and a
	jr z, .far_up
	xor a
	jr .update_screen_cursor
.species_left
	ld a, [wCurPartyMon]
	and a
	jp z, .loop
.loop_left
	dec a
	ld d, a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1IsEgg
	rst AddNTimes
	ld a, [hl]
	and IS_EGG_MASK
	ld a, d
	jr nz, .loop_left_invalid
	ld hl, wPartyMon1Species
	rst AddNTimes
	ld a, [hl]
	call IsAPokemon
	ld a, d
	jr c, .loop_left_invalid
	ld [wCurPartyMon], a
	jp MoveScreenLoop
.loop_left_invalid
	and a
	jp z, .loop
	jr .loop_left
.pressed_up
	ld a, [wMenuCursorY]
	and a
	jr z, .scroll_up
	dec a
	jr .update_screen_cursor
.pressed_down
	ld a, [wMoveScreenNumMoves]
	ld b, a
	ld a, [wMenuCursorY]
	cp 3
	jr z, .scroll_down
	inc a
	cp b
	jp nc, .outer_loop ; less than 4 moves
.update_screen_cursor
	ld [wMenuCursorY], a
	jp .outer_loop
.far_up
	ld a, [wMoveScreenOffset]
	sub 4
	jr nc, .update_screen_offset
	xor a
	jr .update_screen_offset
.scroll_up
	ld a, [wMoveScreenOffset]
	and a
	jp z, .outer_loop
	dec a
	jr .update_screen_offset
.far_down
	ld a, [wMoveScreenNumMoves]
	sub 4
	ld b, a
	ld a, [wMoveScreenOffset]
	add 4
	cp b
	jr c, .update_screen_offset
	ld a, b
	jr .update_screen_offset
.scroll_down
	ld a, [wMoveScreenNumMoves]
	ld b, a
	ld a, [wMoveScreenOffset]
	add 4
	sub b
	jp nc, .outer_loop
	ld a, [wMoveScreenOffset]
	inc a
.update_screen_offset
	ld [wMoveScreenOffset], a
	call MoveScreen_ListMoves
	jp .loop

.perform_swap
	ld a, [wBattleMode]
	and a
	jr z, .regular_swap_move

	; If we're transformed, the Moves screen shows our original moveset.
	; So swapping in the moves screen swap our original moves, while
	; swapping in the battle interface swaps our temporary moves.
	ld a, [wPlayerSubStatus2]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .regular_swap_move
	ld a, [wMenuCursorY]
	inc a
	ld [wMenuCursorY], a
	farcall SwapBattleMoves
	jr .finish_swap

.regular_swap_move
	ld a, MON_MOVES
	call GetPartyParamLocation
	call .swap_location
	ld a, MON_PP
	call GetPartyParamLocation
	call .swap_location

.finish_swap
	ld hl, wMoveScreenMoves
	call .swap_location
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	call WaitSFX
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	call WaitSFX
	xor a
	ld [wMoveSwapBuffer], a
	call MoveScreen_ListMoves
	jp .loop

.swap_location
	ld a, [wMenuCursorY]
	ld b, 0
	ld c, a
	push hl
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [wMoveSwapBuffer]
	dec a
	ld c, a
	add hl, bc
	ld a, [de]
	ld b, [hl]
	ld [hl], a
	ld a, b
	ld [de], a
	ret

GetForgottenMoves::
; retrieve a list of a mon's forgotten moves, excluding ones beyond level
; and moves the mon already knows
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld d, a
	push de
	call GetRelevantEvosAttacksPointers
	pop de
	ld a, d
	jr nc, .notvariant
	ld a, [wAltForm]
.notvariant
	dec a
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	push de
	ld a, d
	pop de
	call GetFarHalfword
.skip_evos
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr nz, .skip_evos

	ld de, wMoveScreenMoves
	ld c, a
	ld a, [wCurPartyLevel]
	ld b, a
	ld b, 100 ; Gen VII behaviour
	inc b ; so that we can use jr nc
.loop
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	ret z
	cp b
	ret nc
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl

	; exclude moves the user already knows
	push hl
	push bc
	ld b, a
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld c, NUM_MOVES
	ld a, b
	call .move_exists
	jr z, .already_knows_move
	pop bc
	push bc
	jr .move_ok
	ld b, 0
	ld hl, wMoveScreenMoves
	call .move_exists
	jr z, .already_knows_move
.move_ok
	pop bc
	pop hl
	ld [de], a
	inc de
	inc c
	jr .loop
.already_knows_move
	pop bc
	pop hl
	jr .loop

.move_exists
	ld b, a
.move_exists_loop
	ld a, [hli]
	cp b
	ret z
	dec c
	jr nz, .move_exists_loop
	inc c ; ret nz
	ld a, b
	ret

String_MoveSwap: ; 1316b
	db "Switch with?@"
; 13172

SetUpMoveScreenBG: ; 13172
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	xor a
	ldh [hBGMapMode], a
	ld b, CGB_PARTY_MENU
	call GetCGBLayout
	farcall LoadStatsScreenPageTilesGFX
	farcall ClearSpriteAnims2
	ld a, [wCurPartyMon]
	ld e, a
	ld d, $0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wTempIconSpecies], a
	farcall LoadMoveMenuMonIcon
	hlcoord 0, 1
	lb bc, 9, 18
	call TextBox
	hlcoord 0, 11
	lb bc, 5, 18
	call TextBox
	hlcoord 2, 0
	lb bc, 2, 3
	call ClearBox
	xor a
	ld [wMonType], a
	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	call GetNick
	hlcoord 5, 1
	call PlaceString
	push bc
	farcall CopyMonToTempMon
	pop hl
	call PrintLevel
	ld hl, wPlayerHPPal
	call SetHPPal
	call SetPalettes
	hlcoord 16, 0
	lb bc, 1, 3
	jp ClearBox
; 131ef

MoveScreen_ListMoves:
	ld c, 2
	call DelayFrames
	hlcoord 1, 2
	lb bc, 14, 18
	call ClearBox
	xor a
	ld [hBGMapMode], a
	ld hl, wMoveScreenMoves
	ld b, a
	ld a, [wMoveScreenOffset]
	ld c, a
	add hl, bc
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	rst CopyBytes
	ld a, SCREEN_WIDTH * 2 ; move list spacing
	ld [wBuffer1], a
	hlcoord 2, 3
	predef ListMoves

	; Get PP -- either current PP, or default PP for the move
	ld hl, wListMoves_MoveIndicesBuffer
	ld de, wTempMonMoves
	ld bc, NUM_MOVES
	rst CopyBytes

	; Get default PP for moves
	ld c, NUM_MOVES
	ld hl, wTempMonMoves
	ld de, wTempMonPP
.defaultpp_loop
	ld a, [hli]
	push hl
	push bc
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	dec a
	rst AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [de], a
	inc de
	pop bc
	pop hl
	dec c
	jr nz, .defaultpp_loop

	; Get current PP for current moves
	ld a, [wMoveScreenMode]
	cp MOVESCREEN_REMINDER
	jr z, .got_pp
	ld a, MON_PP
	call GetPartyParamLocation
	ld c, NUM_MOVES
	ld de, wTempMonPP
	ld a, [wMoveScreenOffset]
.currentpp_loop
	and a
	jr z, .currentpp_ok
	dec a
	jr .currentpp_next
.currentpp_ok
	push af
	ld a, [hl]
	ld [de], a
	inc de
	pop af
.currentpp_next
	inc hl
	dec c
	jr nz, .currentpp_loop

.got_pp
	; Now we have things set up correctly
	hlcoord 10, 4
	predef ListMovePP
	hlcoord 1, 12, wAttrMap
	ld bc, 6
	xor a
	call ByteFill

	farcall ApplyAttrMap

MoveScreen_ListMovesFast:
	hlcoord 0, 11
	lb bc, 5, 18
	call TextBox
	ld hl, wTempMonMoves
	ld a, [wMenuCursorY]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wCurMove], a

	hlcoord 1, 1 ; 2 below topmost position
	ld bc, SCREEN_WIDTH * 2
	ld a, [wMoveSwapBuffer]
	ld d, a
	ld a, [wMenuCursorY]
	inc a
	ld e, a
	xor a
.cursor_loop
	inc a
	add hl, bc
	ld [hl], " "
	cp d
	jr nz, .not_selected_swap
	ld [hl], "▷"
.not_selected_swap
	cp e
	jr nz, .not_selected
	ld [hl], "▶"
.not_selected
	cp NUM_MOVES
	jr nz, .cursor_loop
	ld a, [wMoveScreenOffset]
	and a
	jr z, .skip_up
	hlcoord 18, 2
	ld a, "▲"
	ld [hl], a
.skip_up
	ld a, [wMoveScreenOffset]
	ld b, a
	ld a, [wMoveScreenNumMoves]
	sub b
	sub 5
	jr c, .skip_down
	hlcoord 18, 10
	ld a, "▼"
	ld [hl], a
.skip_down
	jp PlaceMoveData

PlaceMoveData:
	ld a, [wMoveSwapBuffer]
	and a
	jr z, .not_swapping
	hlcoord 1, 14
	ld de, String_MoveSwap
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret

.not_swapping
	xor a
	ld [hBGMapMode], a

	hlcoord 10, 12
	ld de, String_PowAcc
	call PlaceString

	ld a, [wCurMove]
	dec a
	ld hl, Moves + MOVE_CATEGORY
	ld bc, MOVE_LENGTH
	rst AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld b, a
	push bc
	ld hl, CategoryIconGFX
	ld bc, 2 tiles
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile $59
	lb bc, BANK(CategoryIconGFX), 2
	call Request2bpp
	hlcoord 1, 12
	ld [hl], $59
	inc hl
	ld [hl], $5a

	ld a, [wCurMove]
	dec a
	ld hl, Moves + MOVE_TYPE
	ld bc, MOVE_LENGTH
	rst AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop bc
	ld c, a
	ld de, wUnknBGPals palette 0 + 2
	push af
	farcall LoadCategoryAndTypePals
	call SetPalettes

	pop af
	ld hl, TypeIconGFX
	ld bc, 4 * LEN_1BPP_TILE
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile $5b
	lb bc, BANK(TypeIconGFX), 4
	call Request1bpp
	hlcoord 3, 12
	ld [hl], $5b
	inc hl
	ld [hl], $5c
	inc hl
	ld [hl], $5d
	inc hl
	ld [hl], $5e

	ld a, [wCurMove]
	dec a
	ld hl, Moves + MOVE_POWER
	ld bc, MOVE_LENGTH
	rst AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	hlcoord 10, 12
	cp 2
	jr c, .no_power
	ld [wd265], a
	ld de, wd265
	lb bc, 1, 3
	call PrintNum
	jr .place_accuracy
.no_power
	ld de, String_na
	call PlaceString

.place_accuracy
	ld a, [wCurMove]
	dec a
	ld hl, Moves + MOVE_ACC
	ld bc, MOVE_LENGTH
	rst AddNTimes
	; convert internal accuracy representation to a number
	; between 0-100
	ld a, BANK(Moves)
	call GetFarByte
	ld [hMultiplicand], a
	ld a, 100
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct]
	; don't increase a for 0% moves
	and a
	jr z, .no_inc
	inc a
.no_inc
	hlcoord 15, 12
	cp 2
	jr c, .no_acc
	ld [wd265], a
	ld de, wd265
	lb bc, 1, 3
	call PrintNum
	jr .description
.no_acc
	ld de, String_na
	call PlaceString

.description
	hlcoord 1, 14
	predef PrintMoveDesc
	ld a, $1
	ld [hBGMapMode], a
	ret
; 132ba

String_na: ; 132cf
	db "---@"

String_PowAcc:
	db "   <BOLDP>/   %@"
