; Bank $9C, second 4 KB: the game stats screens, with auto labels for now. DATA8_9C9168 and DATA8_9C9258 are the names
; of the stats in two lists (Score, Shots, Shooting Pct. ...), and DATA8_9C92FD says where each stat of the first list
; is kept: a kind word, then the RAM word of each team ($FFFF = none). TeamPlaceNames points to the team places
; (Anaheim ... All Stars W.). At the end, CODE_9C99BB to CODE_9C9A7F stream a block for the sound CPU by number
; ($7E35E6, from 1): DATA8_9C9A5B holds the blocks and DATA8_9C9A73 the sound played once each is in.

org $9C9000
	sta.b $8D
CODE_9C9002:
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC894
	lda.w #$2400
	sta.w $0D0D
	stz.b $91
	lda.w #$001C
	sta.w $0D0F
	jsr.w $902A
	lda.w #$0002
	sta.b $91
	lda.w #$0007
	sta.w $0D0F
	jsr.w $902A
	rts
CODE_9C902A:
	lda.w #$009C
	sta.b $8B
	lda.w #DATA8_9C92FD
	sta.b $89
	lda.w $1DB9
	sta.b $A5
CODE_9C9039:
	lda.b [$89]
	bpl CODE_9C9040
	jmp.w $9167
CODE_9C9040:
	and.w #$00F0
	ora.w $1E15
	beq CODE_9C904C
	dec.b $A5
	bmi CODE_9C9056
CODE_9C904C:
	lda.b $89
	clc
	adc.w #$0006
	sta.b $89
	bra CODE_9C9039
CODE_9C9056:
	lda.b [$89]
	and.w #$000F
	inc.b $89
	inc.b $89
	cmp.w #$0001
	bne CODE_9C9067
	jmp.w $90F0
CODE_9C9067:
	cmp.w #$0002
	beq CODE_9C9086
	cmp.w #$0003
	bne CODE_9C9074
	jmp.w $9145
CODE_9C9074:
	lda.b [$89]
	clc
	adc.b $91
	tay
	lda.w $0000,y
	sta.b $A5
	jsl.l CODE_9FC5EB
	jmp.w $9154
CODE_9C9086:
	lda.b [$89]
	clc
	adc.b $91
	tay
	lda.w $0000,y
	sta.b $A5
	inc.b $89
	inc.b $89
	lda.b [$89]
	clc
	adc.b $91
	tay
	lda.w $0000,y
	sta.b $A9
	lda.b $A5
	cmp.b $A9
	bpl CODE_9C90B8
	ldx.w #$0064
	jsl.l CODE_808F4C
	tax
	lda.b $A9
	beq CODE_9C90BF
	jsl.l DivX8U
	bra CODE_9C90BF
CODE_9C90B8:
	lda.b $A5
	beq CODE_9C90BF
	lda.w #$0064
CODE_9C90BF:
	sta.b $A5
	jsl.l CODE_9FC5EB
	lda.w #$0000
	sta.b $97
	lda.w #$0A2A
	sta.b $95
	lda.w #$0002
	sta.b [$95]
	jsl.l appstring
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF36A
	sta.b $8D
	jsl.l appstring
	lda.b $97
	sta.b $8F
	lda.b $95
	sta.b $8D
	bra CODE_9C9154
CODE_9C90F0:
	lda.b [$89]
	inc.b $89
	inc.b $89
	clc
	adc.b $91
	tay
	lda.w $0000,y
	sta.b $A5
	jsl.l CODE_9FC5EB
	lda.b [$89]
	sta.b $A9
	lda.w #$0000
	sta.b $97
	lda.w #$0A2A
	sta.b $95
	lda.w #$0002
	sta.b [$95]
	jsl.l appstring
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF36D
	sta.b $8D
	jsl.l appstring
	lda.b $91
	clc
	adc.b $A9
	tay
	lda.w $0000,y
	sta.b $A5
	jsl.l CODE_9FC5EB
	jsl.l appstring
	lda.b $97
	sta.b $8F
	lda.b $95
	sta.b $8D
	bra CODE_9C9154
CODE_9C9145:
	lda.b [$89]
	clc
	adc.b $91
	tay
	lda.w $0000,y
	sta.b $A5
	jsl.l CODE_9FA3D7
CODE_9C9154:
	lda.b [$8D]
	inc a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w $0D0F
	sta.w $0D0F
	jsl.l CODE_9EC894
CODE_9C9167:
	rts
DATA8_9C9168:		; stat names: a word (2 + the text), then the text
	dw $000F : db "    Score    "
	dw $000F : db "    Shots    "
	dw $000F : db "Shooting Pct."
	dw $000F : db "  Power Play "
	dw $000F : db "  PP Minutes "
	dw $000F : db "  PP Shots   "
	dw $000F : db "  SH Goals   "
	dw $000F : db " Breakaways  "
	dw $000F : db " One timers  "
	dw $000F : db "Penalty Shots"
	dw $000F : db "  Faceoffs   "
	dw $000F : db " Body Checks "
	dw $000F : db "  Penalties  "
	dw $000F : db " Attack Zone "
	dw $000F : db "   Passing   "
	dw $000F : db " Passing Pct."
DATA8_9C9258:		; stat names, the second list
	dw $000F : db "    Score    "
	dw $000F : db "    Shots    "
	dw $000F : db "Shooting Pct."
	dw $000F : db " Breakaways  "
	dw $000F : db " One timers  "
	dw $000F : db "Penalty Shots"
	dw $000F : db "  Faceoffs   "
	dw $000F : db " Body Checks "
	dw $000F : db " Attack Zone "
	dw $000F : db "   Passing   "
	dw $000F : db " Passing Pct."
DATA8_9C92FD:		; per stat of DATA8_9C9168: a kind word, then the RAM word of the home and away team
			;   ($FFFF = none); $FFFF ends them
	dw $0010,$178E,$FFFF
	dw $0010,$177A,$FFFF
	dw $0012,$178E,$177A
	dw $0001,$1742,$1746
	dw $0003,$1756,$FFFF
	dw $0000,$175A,$FFFF
	dw $0000,$1762,$FFFF
	dw $0011,$17C6,$17C2
	dw $0011,$17DA,$17D6
	dw $0011,$17CE,$17CA
	dw $0010,$1792,$FFFF
	dw $0010,$17B6,$FFFF
	dw $0001,$174A,$174E
	dw $0013,$1752,$FFFF
	dw $0011,$17BA,$17BE
	dw $0012,$17BA,$17BE
	dw $FFFF,$FFFF,$FFFF
DATA8_9C9363:
	dw $0003 : db "{"
	dw $0003 : db "}"
	dw $0003 : db " "
CODE_9C936C:
	stx.w $1E17
	sty.w $1E1B
	ldy.w #$0002
CODE_9C9375:
	tya
	cmp.b [$8D]
	bne CODE_9C937D
	jmp.w $93F0
CODE_9C937D:
	lda.b [$8D],y
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9C938C
	lda.w #$0006
	bra CODE_9C93E5
CODE_9C938C:
	cmp.w #$0030
	bcc CODE_9C93A0
	cmp.w #$003A
	bcs CODE_9C93A0
	sec
	sbc.w #$0030
	clc
	adc.w #$001A
	bra CODE_9C93C0
CODE_9C93A0:
	cmp.w #$0061
	bcc CODE_9C93B0
	cmp.w #$007B
	bcs CODE_9C93B0
	sec
	sbc.w #$0061
	bra CODE_9C93C0
CODE_9C93B0:
	cmp.w #$0041
	bcc CODE_9C93EC
	cmp.w #$005B
	bcs CODE_9C93EC
	sec
	sbc.w #$0041
	bra CODE_9C93C0
CODE_9C93C0:
	tax
	phx
	phy
	lda.w #$0092
	sta.b $12
	lda.w #LetterSprites
	sta.b $10
	stx.b $00
	lda.w #$2000
	ldx.w $1E17
	ldy.w $1E1B
	jsl.l DrawSprite
	ply
	plx
	lda.l DATA8_9C93F1,x
	and.w #$00FF
CODE_9C93E5:
	clc
	adc.w $1E17
	sta.w $1E17
CODE_9C93EC:
	iny
	jmp.w $9375
CODE_9C93F0:
	rtl
DATA8_9C93F1:
	db $0A,$0A,$0A,$0A,$08,$09,$0A,$0A,$05,$0A,$0A,$08,$0F,$0A,$0A,$0A
	db $0A,$0A,$0A,$09,$0A,$0A,$10,$0A,$0A,$0A,$0A,$07,$0A,$0A,$0B,$0B
	db $0A,$0B,$0A,$0A
CODE_9C9415:
	phb
	phk
	plb
	stx.w $1E17
	sty.w $1E1B
	stz.b $14
	lda.w #$0001
	sta.b $16
	lda.b $8D
	sta.b $A9
	lda.w #$FFFF
	sta.b $91
	sta.b $93
	pha
	sep #$30
	lda.b $8F
	pha
	plb
	rep #$30
	ldy.w #$0000
	bra CODE_9C9479
CODE_9C943E:
	phb
	phk
	plb
	stx.w $1E17
	sty.w $1E1B
	stz.b $14
	stz.b $16
	lda.b $A9
	pha
	bmi CODE_9C945C
	asl a
	tay
	lda.w $9649,y
	sta.b $A9
	ldy.w #$0000
	bra CODE_9C9479
CODE_9C945C:
	inc.b $16
	sep #$30
	lda.b $8F
	pha
	plb
	rep #$30
	lda.b ($8D)
	tay
	dey
	dey
	lda.b $8D
	inc a
	inc a
	sta.b $A9
	lda.w #$0000
	sta.b ($A9),y
	ldy.w #$0000
CODE_9C9479:
	lda.b ($A9),y
	and.w #$00FF
	beq CODE_9C94D2
	cmp.w #$0020
	bne CODE_9C948F
	cpy.w #$0000
	beq CODE_9C94CF
	lda.w #$0005
	bra CODE_9C94CA
CODE_9C948F:
	cmp.w #$002E
	bne CODE_9C9499
	lda.w #$0003
	bra CODE_9C94CA
CODE_9C9499:
	cmp.w #$0040
	bne CODE_9C94A7
	lda.l DATA8_9C9623+$1B
	and.w #$00FF
	bra CODE_9C94CA
CODE_9C94A7:
	cmp.w #$0030
	bcc CODE_9C94BB
	cmp.w #$003A
	bcs CODE_9C94BB
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	bra CODE_9C94C2
CODE_9C94BB:
	and.w #$00DF
	sec
	sbc.w #$0041
CODE_9C94C2:
	tax
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9C94CA:
	clc
	adc.b $14
	sta.b $14
CODE_9C94CF:
	iny
	bra CODE_9C9479
CODE_9C94D2:
	ldy.w #$0000
	lda.b $16
	beq CODE_9C94EA
	lda.b $91
	bmi CODE_9C94EA
	bne CODE_9C94F8
	lda.w #$00F8
	sec
	sbc.b $14
	sta.w $1E17
	bra CODE_9C94F8
CODE_9C94EA:
	lda.b $14
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w $1E17
	sta.w $1E17
CODE_9C94F8:
	lda.b ($A9),y
	and.w #$00FF
	bne CODE_9C9502
	jmp.w $958B
CODE_9C9502:
	cmp.w #$0020
	bne CODE_9C9514
	cpy.w #$0000
	bne CODE_9C950F
	jmp.w $9587
CODE_9C950F:
	lda.w #$0005
	bra CODE_9C9580
CODE_9C9514:
	cmp.w #$002E
	bne CODE_9C951E
	ldx.w #$001A
	bra CODE_9C9545
CODE_9C951E:
	cmp.w #$0040
	bne CODE_9C9528
	ldx.w #$001B
	bra CODE_9C9545
CODE_9C9528:
	cmp.w #$0030
	bcc CODE_9C953D
	cmp.w #$003A
	bcs CODE_9C953D
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	tax
	bra CODE_9C9545
CODE_9C953D:
	and.w #$00DF
	sec
	sbc.w #$0041
	tax
CODE_9C9545:
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	phy
	phx
	txa
	clc
	adc.w #$03A0
	sta.b $00
	lda.l $7E3462
	bne CODE_9C9563
	lda.w #$3800
	bra CODE_9C956D
CODE_9C9563:
	lda.w #$3C00
	ldx.b $91
	bne CODE_9C956D
	lda.w #$3E00
CODE_9C956D:
	ldx.w $1E17
	ldy.w $1E1B
	jsl.l DrawSprite
	plx
	ply
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9C9580:
	clc
	adc.w $1E17
	sta.w $1E17
CODE_9C9587:
	iny
	jmp.w $94F8
CODE_9C958B:
	pla
	sta.b $A9
	plb
	rtl
CODE_9C9590:
	stx.w $1E17
	sty.w $1E1B
	ldy.w #$0002
CODE_9C9599:
	tya
	cmp.b [$8D]
	bne CODE_9C95A1
	jmp.w $9622
CODE_9C95A1:
	lda.b [$8D],y
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9C95B0
	lda.w #$0003
	bra CODE_9C9617
CODE_9C95B0:
	cmp.w #$002E
	bne CODE_9C95BA
	lda.w #$0024
	bra CODE_9C95EE
CODE_9C95BA:
	cmp.w #$0030
	bcc CODE_9C95CE
	cmp.w #$003A
	bcs CODE_9C95CE
	sec
	sbc.w #$0030
	clc
	adc.w #$001A
	bra CODE_9C95EE
CODE_9C95CE:
	cmp.w #$0061
	bcc CODE_9C95DE
	cmp.w #$007B
	bcs CODE_9C95DE
	sec
	sbc.w #$0061
	bra CODE_9C95EE
CODE_9C95DE:
	cmp.w #$0041
	bcc CODE_9C961E
	cmp.w #$005B
	bcs CODE_9C961E
	sec
	sbc.w #$0041
	bra CODE_9C95EE
CODE_9C95EE:
	tax
	phx
	phy
	lda.w #$0095
	sta.b $12
	lda.w #SmallLetterSprites
	sta.b $10
	stx.b $00
	lda.w #$2000
	ldx.w $1E17
	ldy.w $1E1B
	jsl.l DrawSprite
	ply
	plx
	lda.w #$0004
	cpx.w #$0024
	bne CODE_9C9617
	lda.w #$0002
CODE_9C9617:
	clc
	adc.w $1E17
	sta.w $1E17
CODE_9C961E:
	iny
	jmp.w $9599
CODE_9C9622:
	rtl
DATA8_9C9623:
	db $07,$07,$06,$07,$06,$06,$07,$06,$02,$05,$07,$05,$08,$07,$08,$06
	db $08,$06,$05,$06,$06,$07,$08,$06,$06,$05,$03,$05,$05,$04,$06,$06
	db $06,$05,$05,$06,$05,$05
TeamPlaceNames:		; word pointers to the team places, then the places ($00 ends each)
	dw .ANA,.BOS,.BUF,.CGY,.CHI,.DAL,.DET
	dw .EDM,.FLA,.HFD,.LAK,.MTL,.NJD,.NYI
	dw .NYR,.OTT,.PHI,.PIT,.QUE,.SJS,.STL
	dw .TBL,.TOR,.VAN,.WSH,.WPG,.ASE,.ASW
.ANA:	db "Anaheim",$00
.BOS:	db "Boston",$00
.BUF:	db "Buffalo",$00
.CGY:	db "Calgary",$00
.CHI:	db "Chicago",$00
.DAL:	db "Dallas",$00
.DET:	db "Detroit",$00
.EDM:	db "Edmonton",$00
.FLA:	db "Florida",$00
.HFD:	db "Hartford",$00
.LAK:	db "Los Angeles",$00
.MTL:	db "Montreal",$00
.NJD:	db "New Jersey",$00
.NYI:	db "New York",$00
.NYR:	db "New York",$00
.OTT:	db "Ottawa",$00
.PHI:	db "Philadelphia",$00
.PIT:	db "Pittsburgh",$00
.QUE:	db "Quebec",$00
.SJS:	db "San Jose",$00
.STL:	db "St. Louis",$00
.TBL:	db "Tampa Bay",$00
.TOR:	db "Toronto",$00
.VAN:	db "Vancouver",$00
.WSH:	db "Washington",$00
.WPG:	db "Winnipeg",$00
.ASE:	db "All Stars E.",$00
.ASW:	db "All Stars W.",$00
CODE_9C9786:
	lda.w #$0200
	jsl.l SetSoundFade
	rtl
CODE_9C978E:
	stz.w $0CC3
	lda.w $1D68
	cmp.w #$0002
	beq CODE_9C97E1
	jsl.l CODE_8086A9
	lda.w #$0002
	sta.w $1D68
	sep #$20
	dec.w $07E5
	rep #$20
	jsl.l SPCCmd01
	sep #$20
	inc.w $07E5
	rep #$20
	lda.w #$009B
	sta.b $36
	lda.w #DATA8_9BB4C9
	sta.b $34
	jsl.l SoundInit
	ldx.w #$0000
CODE_9C97C6:
	lda.l DATA8_80E6FD,x
	sta.b $0C
	lda.l DATA8_80E6FD+2,x
	sta.b $0E
	phx
	jsl.l SPCUploadBlock
	plx
	inx
	inx
	inx
	inx
	cpx.w #$0040
	bne CODE_9C97C6
CODE_9C97E1:
	lda.w #$0000
	sta.l $7E35EA
	rtl
CODE_9C97E9:
	stz.w $0CC3
	lda.w $1D68
	cmp.w #$0001
	beq CODE_9C983C
	jsl.l CODE_8086A9
	lda.w #$0001
	sta.w $1D68
	sep #$20
	dec.w $07E5
	rep #$20
	jsl.l SPCCmd01
	sep #$20
	inc.w $07E5
	rep #$20
	lda.w #$0080
	sta.b $36
	lda.w #$E741
	sta.b $34
	jsl.l SoundInit
	ldx.w #$0000
CODE_9C9821:
	lda.l DATA8_80E73D,x
	sta.b $0C
	lda.l DATA8_80E73D+2,x
	sta.b $0E
	phx
	jsl.l SPCUploadBlock
	plx
	inx
	inx
	inx
	inx
	cpx.w #$0004
	bne CODE_9C9821
CODE_9C983C:
	rtl
CODE_9C983D:
	stz.w $0CC3
	lda.w $1D68
	cmp.w #$0001
	beq CODE_9C9890
	jsl.l CODE_8086A9
	lda.w #$0001
	sta.w $1D68
	sep #$20
	dec.w $07E5
	rep #$20
	jsl.l SPCCmd01
	sep #$20
	inc.w $07E5
	rep #$20
	lda.w #$009B
	sta.b $36
	lda.w #DATA8_9BB4C9
	sta.b $34
	jsl.l SoundInit
	ldx.w #$0000
CODE_9C9875:
	lda.l DATA8_80E6C1,x
	sta.b $0C
	lda.l DATA8_80E6C1+2,x
	sta.b $0E
	phx
	jsl.l SPCUploadBlock
	plx
	inx
	inx
	inx
	inx
	cpx.w #$003C
	bne CODE_9C9875
CODE_9C9890:
	rtl
CODE_9C9891:
	stz.w $0CC3
	jsl.l SPCCmd04
	jsl.l SPCCmd04
	jsl.l SPCCmd04
	lda.w #$0094
	sta.b $0E
	lda.w #DATA8_94BEAC
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93DFAD
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9A8000
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_9390FA
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #$0002
	sta.w $1D68
	rtl
CODE_9C98DF:
	lda.w $1D68
	cmp.w #$0001
	beq CODE_9C992F
	jsl.l CODE_8086A9
	lda.w #$0001
	sta.w $1D68
	sep #$20
	dec.w $07E5
	rep #$20
	jsl.l SPCCmd01
	sep #$20
	inc.w $07E5
	rep #$20
	lda.w #$0080
	sta.b $36
	lda.w #$DD66
	sta.b $34
	jsl.l SoundInit
	ldx.w #$0000
CODE_9C9914:
	lda.l DATA8_80DD16,x
	sta.b $0C
	lda.l DATA8_80DD16+2,x
	sta.b $0E
	phx
	jsl.l SPCUploadBlock
	plx
	inx
	inx
	inx
	inx
	cpx.w #$0050
	bne CODE_9C9914
CODE_9C992F:
	rtl
CODE_9C9930:
	lda.l $7E35E0
	cmp.w #$0380
	bcc CODE_9C993C
	lda.w #$0380
CODE_9C993C:
	clc
	adc.w #$0080
	asl a
	asl a
	asl a
	asl a
	sta.w $093C
	phx
	tax
	lda.w #$0015
	jsl.l DivX8U
	plx
	clc
	adc.w #$0253
	sta.w $094C
	lda.w $093C
	cmp.w #$2733
	bcs CODE_9C9967
	lda.w #$0100
	sta.w $093A
	rtl
CODE_9C9967:
	sec
	sbc.w #$2600
	asl a
	asl a
	sta.w $093A
	rtl
	sep #$20
	lda.w $0762
	bmi CODE_9C997E
	lda.w $0AD3
	sta.w INIDISP
CODE_9C997E:
	rep #$30
	rtl
CODE_9C9981:
	rep #$30
	lda.w $07E5
	and.w #$00FF
	bne CODE_9C99E4
	lda.w $1D68
	cmp.w #$0002
	beq CODE_9C99E4
	lda.w $15D6
	bne CODE_9C99A2
	lda.w $07F3
	beq CODE_9C999F
	bra CODE_9C99A2
CODE_9C999F:
	stz.w $0CC3
CODE_9C99A2:
	lda.l $7E35E6
	beq CODE_9C99E4
	lda.l $7E35E8
	beq CODE_9C99B1
	jmp.w $9A21
CODE_9C99B1:
	lda.l $7E35E6
	cmp.l $7E35EA
	beq CODE_9C99CA
CODE_9C99BB:
	jsl.l SPCCmd02
	cmp.w #$0015
	bcc CODE_9C99E5
CODE_9C99C4:
	jsl.l SPCCmd04
	bra CODE_9C99BB
CODE_9C99CA:
	lda.l $7E35E6
	asl a
	tax
	lda.w #$7000
	sta.b $64
	lda.l DATA8_9C9A73-2,x
	jsl.l CODE_80A17D
	lda.w #$0003
	sta.l $7E35E8
CODE_9C99E4:
	rtl
CODE_9C99E5:
	lda.l $7E35E6
	sta.l $7E35EA
	asl a
	asl a
	tax
	lda.l DATA8_9C9A5B-4,x
	sta.b $3E
	lda.l DATA8_9C9A5B-2,x
	sta.b $40
	ldy.w #$0000
	lda.b [$3E],y
	xba
	sta.b $42
	ldy.w #$0002
	lda.b [$3E],y
	xba
	tax
	ldy.b $42
	lda.b $3E
	clc
	adc.w #$0004
	sta.b $3E
	jsl.l SPCStreamStart
	lda.w #$0001
	sta.l $7E35E8
CODE_9C9A20:
	rtl
CODE_9C9A21:
	cmp.w #$0003
	beq CODE_9C9A5A
	jsl.l SPCStreamNext
	cmp.w #$0000
	beq CODE_9C9A53
	lda.l $7E35E8
	cmp.w #$0001
	bne CODE_9C9A20
	lda.w #$0002
	sta.l $7E35E8
	lda.l $7E35E6
	asl a
	tax
	lda.w #$7000
	sta.b $64
	lda.l DATA8_9C9A73-2,x
	jsl.l CODE_80A17D
	rtl
CODE_9C9A53:
	lda.w #$0003
	sta.l $7E35E8
CODE_9C9A5A:
	rtl
DATA8_9C9A5B:		; long pointers to the blocks for the sound CPU that the code above streams in
	dd DATA8_959E48,DATA8_92CECD,DATA8_8FBB26
	dd DATA8_90A120,DATA8_94A662,DATA8_93A18D
DATA8_9C9A73:		; the sound played once each block is in
	dw $0016,$0017,$0018,$0019,$001A,$001B
CODE_9C9A7F:
	sep #$20
	dec.w $07E5
	rep #$20
	sta.b $14
	phx
	lda.l $7E35E6
	beq CODE_9C9AA6
	cmp.b $14
	beq CODE_9C9AB3
	lda.l $7E35E6
	cmp.w #$0003
	bcc CODE_9C9AB3
	asl a
	tax
	lda.l DATA8_9C9A73-2,x
	jsl.l CODE_80A2A8
CODE_9C9AA6:
	lda.w #$0000
	sta.l $7E35E8
	lda.b $14
	sta.l $7E35E6
CODE_9C9AB3:
	sep #$20
	inc.w $07E5
	rep #$20
	plx
	rtl
CODE_9C9ABC:
	pha
	lda.w $0EDF
	cmp.w #$8000
	ror a
	sta.b $0C
	lda.w $0EFF
	cmp.w #$8000
	ror a
	sta.b $0E
	pla
CODE_9C9AD0:
	phx
	sta.b $12
	asl a
	tay
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	lda.b $0D
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9C9AE9
	ora.w #$FF00
CODE_9C9AE9:
	tax
	jsl.l CODE_808F7D
	sta.b $64
	lda.b $0F
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9C9AFD
	ora.w #$FF00
CODE_9C9AFD:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b $64
	lsr a
	lsr a
	lsr a
	sta.b $64
	cmp.w #$0070
	bcs CODE_9C9B14
	xba
	sta.b $64
	bra CODE_9C9B19
CODE_9C9B14:
	lda.w #$7000
	sta.b $64
CODE_9C9B19:
	ldy.w #$0002
	lda.b [$4E],y
	tax
	lda.w $0792
	and.w #$003F
	clc
	adc.w #$00C0
	jsl.l CODE_808F98
	lda.b $09
	sta.b $0C
	lda.b $12
	jsl.l CODE_80A17D
	tay
	sep #$20
	dec.w $07E5
	lda.w $08F2,y
	cmp.b #$02
	bne CODE_9C9B56
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.b $0C
	sta.w $094A,y
	sta.w $0CAF
CODE_9C9B56:
	sep #$20
	inc.w $07E5
	rep #$20
	plx
	rtl
CODE_9C9B5F:
	phx
	ldx.w $07F3
	bne CODE_9C9BA9
	sta.b $14
	inc a
	pha
	lda.w $1C98
	asl a
	adc.w $1C98
	asl a
	clc
	adc.b $14
	asl a
	asl a
	tax
	lda.l TeamSongs+2,x
	bmi CODE_9C9B8B
	sta.b $0E
	lda.l TeamSongs,x
	sta.b $0C
	jsl.l MusicStart
	bra CODE_9C9BA5
CODE_9C9B8B:
	lda.w #$0008
	jsl.l CODE_9BB385
	asl a
	asl a
	tax
	lda.l DefaultSongs,x
	sta.b $0C
	lda.l DefaultSongs+2,x
	sta.b $0E
	jsl.l MusicStart
CODE_9C9BA5:
	pla
	sta.w $0CC3
CODE_9C9BA9:
	plx
	rtl
CODE_9C9BAB:
	phx
	phy
	stx.b $87
	ldx.w #$0000
CODE_9C9BB2:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0018
	bne CODE_9C9BB2
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9C9BC3:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9C9BC3
	ldx.b $87
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF370
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0013
	sta.b $A5
	lda.w #$0008
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l CODE_9FBD9C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF375
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0015
	sta.b $A5
	lda.w #$0007
	sta.b $A9
	jsl.l CODE_9D8000
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF37A
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9C9D25
	lda.w #$0005
	sta.w $0D11
	lda.w #$000D
	sta.w $0D0F
	stz.b $B1
	stz.b $91
	lda.w $1E2B
	cmp.w #$001A
	bmi CODE_9C9C69
	sec
	sbc.w #$001A
	sta.w $1E2B
	inc.b $B1
	lda.w #$0002
	sta.b $91
CODE_9C9C69:
	jsl.l CODE_9FBD66
	lda.w #$0005
	sta.w $0D11
	lda.w #$0011
	sta.w $0D0F
	lda.w $1E2B
	sta.b $A5
	jsl.l CODE_9FC427
	jsl.l CODE_9EC7BE
	inc.w $0D11
	lda.w #$000D
	sta.w $0D0F
	stz.b $B1
	stz.b $91
	lda.w $1E2D
	cmp.w #$001A
	bmi CODE_9C9CA9
	sec
	sbc.w #$001A
	sta.w $1E2D
	inc.b $B1
	lda.w #$0002
	sta.b $91
CODE_9C9CA9:
	jsl.l CODE_9FBD66
	lda.w #$0006
	sta.w $0D11
	lda.w #$0011
	sta.w $0D0F
	lda.w $1E2D
	sta.b $A5
	jsl.l CODE_9FC427
	jsl.l CODE_9EC7BE
	inc.w $0D11
	lda.w #$000D
	sta.w $0D0F
	stz.b $B1
	stz.b $91
	lda.w $1E2F
	cmp.w #$001A
	bmi CODE_9C9CE9
	sec
	sbc.w #$001A
	sta.w $1E2F
	inc.b $B1
	lda.w #$0002
	sta.b $91
CODE_9C9CE9:
	jsl.l CODE_9FBD66
	lda.w #$0007
	sta.w $0D11
	lda.w #$0011
	sta.w $0D0F
	lda.w $1E2F
	sta.b $A5
	jsl.l CODE_9FC427
	jsl.l CODE_9EC7BE
	stx.b $87
	ldx.w #$0012
CODE_9C9D0B:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9C9D0B
	ldx.b $87
	stx.b $87
	ldx.w #$0016
CODE_9C9D19:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9C9D19
	ldx.b $87
	ply
	plx
	rtl
CODE_9C9D25:
	lda.w #$0000
	sta.w $1E33
	lda.w #$0000
	sta.w $1E31
	lda.w #$0000
	sta.w $1E37
	lda.w #$0000
	sta.w $1E35
	lda.w #$0000
	sta.w $1E3B
	lda.w #$0000
	sta.w $1E39
	lda.w #$FFFF
	sta.w $1E1F
	lda.w #$007E
	sta.b $8F
	lda.w #$3136
	sta.b $8D
	ldy.w #$0000
	lda.b [$8D],y
	and.w #$F000
	xba
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w #$0003
	bne CODE_9C9D8A
	iny
	iny
	iny
	lda.b [$8D],y
	and.w #$00FF
	sta.w $1E1F
	dey
	lda.b [$8D],y
	and.w #$00F0
	beq CODE_9C9D8A
	lda.w $1E1F
	clc
	adc.w #$001A
	sta.w $1E1F
CODE_9C9D8A:
	stz.b $91
	jsl.l GetPlayerCount
	lda.b $A5
	sta.w $1E21
	jsl.l CODE_9ED300
	lda.b $A5
	sta.w $1E23
	ldx.w #$0000
CODE_9C9DA1:
	phx
	cpx.w $1E21
	bmi CODE_9C9DAA
	jmp.w $9E8E
CODE_9C9DAA:
	jsl.l CODE_9C9EC5
	lda.b $A7
	sec
	sbc.w $1E33
	bmi CODE_9C9DBA
	bvc CODE_9C9DBC
	bra CODE_9C9DD6
CODE_9C9DBA:
	bvc CODE_9C9DD6
CODE_9C9DBC:
	beq CODE_9C9DC6
	bmi CODE_9C9DC4
	bvs CODE_9C9DC6
	bra CODE_9C9E29
CODE_9C9DC4:
	bvs CODE_9C9E29
CODE_9C9DC6:
	lda.b $A5
	sec
	sbc.w $1E31
	beq CODE_9C9DD6
	bmi CODE_9C9DD4
	bvs CODE_9C9DD6
	bra CODE_9C9E29
CODE_9C9DD4:
	bvs CODE_9C9E29
CODE_9C9DD6:
	lda.b $A7
	sec
	sbc.w $1E37
	bmi CODE_9C9DE2
	bvc CODE_9C9DE4
	bra CODE_9C9DFE
CODE_9C9DE2:
	bvc CODE_9C9DFE
CODE_9C9DE4:
	beq CODE_9C9DEE
	bmi CODE_9C9DEC
	bvs CODE_9C9DEE
	bra CODE_9C9E55
CODE_9C9DEC:
	bvs CODE_9C9E55
CODE_9C9DEE:
	lda.b $A5
	sec
	sbc.w $1E35
	beq CODE_9C9DFE
	bmi CODE_9C9DFC
	bvs CODE_9C9DFE
	bra CODE_9C9E55
CODE_9C9DFC:
	bvs CODE_9C9E55
CODE_9C9DFE:
	lda.b $A7
	sec
	sbc.w $1E3B
	bmi CODE_9C9E0B
	bvc CODE_9C9E0D
CODE_9C9E08:
	jmp.w $9E8E
CODE_9C9E0B:
	bvc CODE_9C9E08
CODE_9C9E0D:
	beq CODE_9C9E17
	bmi CODE_9C9E15
	bvs CODE_9C9E17
	bra CODE_9C9E81
CODE_9C9E15:
	bvs CODE_9C9E81
CODE_9C9E17:
	lda.b $A5
	sec
	sbc.w $1E39
	beq CODE_9C9E27
	bmi CODE_9C9E25
	bvs CODE_9C9E27
	bra CODE_9C9E81
CODE_9C9E25:
	bvs CODE_9C9E81
CODE_9C9E27:
	bra CODE_9C9E8E
CODE_9C9E29:
	lda.w $1E2B
	sta.w $1E25
	lda.w $1E33
	sta.w $1E29
	lda.w $1E31
	sta.w $1E27
	stx.w $1E2B
	lda.b $A7
	sta.w $1E33
	lda.b $A5
	sta.w $1E31
	ldx.w $1E25
	lda.w $1E29
	sta.b $A7
	lda.w $1E27
	sta.b $A5
CODE_9C9E55:
	lda.w $1E2D
	sta.w $1E25
	lda.w $1E37
	sta.w $1E29
	lda.w $1E35
	sta.w $1E27
	stx.w $1E2D
	lda.b $A7
	sta.w $1E37
	lda.b $A5
	sta.w $1E35
	ldx.w $1E25
	lda.w $1E29
	sta.b $A7
	lda.w $1E27
	sta.b $A5
CODE_9C9E81:
	stx.w $1E2F
	lda.b $A7
	sta.w $1E3B
	lda.b $A5
	sta.w $1E39
CODE_9C9E8E:
	plx
	inx
	lda.w $1E21
	cmp.w #$001A
	bpl CODE_9C9EBC
	cpx.w #$001A
	bmi CODE_9C9EBC
	lda.w #$0002
	sta.b $91
	jsl.l GetPlayerCount
	lda.b $A5
	clc
	adc.w #$001A
	sta.w $1E21
	jsl.l CODE_9ED300
	lda.b $A5
	clc
	adc.w #$001A
	sta.w $1E23
CODE_9C9EBC:
	cpx.w #$0034
	bpl CODE_9C9EC4
	jmp.w $9DA1
CODE_9C9EC4:
	rtl
CODE_9C9EC5:
	stz.b $91
	lda.w #$0002
	sta.b $8D
	cpx.w #$001A
	bmi CODE_9C9ED8
	lda.w #$0002
	sta.b $91
	stz.b $8D
CODE_9C9ED8:
	ldy.b $91
	lda.w $178E,y
	ldy.b $8D
	sec
	sbc.w $178E,y
	sta.b $A5
	lda.w #$0000
	sbc.w #$0000
	sta.b $A7
	cpx.w $1E23
	bmi CODE_9C9F48
	cpx.w $1E1F
	bne CODE_9C9F04
	lda.w #$000B
	sta.b $0A
	lda.w #$71B0
	sta.b $08
	jsr.w $9FC7
CODE_9C9F04:
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$2AF8
	jsl.l Mul16U
	plx
	jsr.w $9FC7
	sep #$20
	lda.w $1922,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$2774
	jsl.l Mul16U
	plx
	jsr.w $9FC7
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$000A
	jsl.l Mul16U
	plx
	jsr.w $9FC7
	bra CODE_9C9FB0
CODE_9C9F48:
	lda.b $A5
	pha
	jsl.l CODE_9F9B1F
	lda.b $A5
	phx
	ldx.w #$0028
	jsl.l DivX8U
	plx
	sta.b $A9
	pla
	sta.b $A5
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	cmp.b $A9
	bmi CODE_9C9FB0
	sta.b $04
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$0064
	jsl.l CODE_808F4C
	sta.b $08
	jsl.l Div16U
	plx
	lda.b $00
	cmp.w #$0003
	bpl CODE_9C9FB0
	lda.w #$0000
	sta.b $0A
	lda.w #$7D00
	sta.b $08
	jsr.w $9FC7
	lda.b $00
	cmp.w #$0000
	bne CODE_9C9FB0
	lda.w #$0001
	sta.b $0A
	lda.w #$24F8
	sta.b $08
	jsr.w $9FC7
CODE_9C9FB0:
	lda.b $A7
	asl a
	sta.b $A7
	lda.b $A5
	asl a
	lda.b $A7
	adc.w #$0000
	sta.b $A7
	lda.b $A5
	and.w #$7FFF
	sta.b $A5
	rtl
CODE_9C9FC7:
	lda.b $A5
	clc
	adc.b $08
	sta.b $A5
	lda.b $A7
	adc.b $0A
	sta.b $A7
	rts
CODE_9C9FD5:
	ldy.w $0C23
	bne CODE_9C9FEC
	sta.w $0C23
	asl a
	asl a
	asl a
	sta.w $0C29
	lda.w #$000B
	sta.w $0C27
	stz.w $0C25
CODE_9C9FEC:
	rtl
CODE_9C9FED:
	lda.w $0C23
	beq CODE_9CA04D
	lda.w $0C29
	and.w #$0007
	sta.w $0C29
	lda.w $0C27
	sec
	sbc.w $0ADB
