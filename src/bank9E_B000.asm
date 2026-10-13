; Bank $9E, fourth 4 KB: more game code for the objects on the ice, with auto labels for now.

org $9EB000
	sec
	sbc.w $0EE4,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EB00F
	ora.w #$FF00
CODE_9EB00F:
	clc
	adc.b $03,s
	sec
	sbc.w Ypos,x
	sta.b $A9
	pla
	pla
	jsl.l vtoa
	lda.b $A5
	sta.w temp2b,x
	lda.w position,x
	beq CODE_9EB070
	lda.w puckvx
	sta.b $A5
	lda.w puckvy
	sta.b $A9
	jsl.l vtoa
	lda.b $A5
	cmp.w #$0008
	beq CODE_9EB045
	eor.w #$0004
	cmp.w facedir,x
	beq CODE_9EB070
CODE_9EB045:
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b $A9
	pha
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b $A5
	pha
	jsl.l vtoa
	lda.b $A5
	sta.b $C5
	pla
	sta.b $A5
	sta.b $00
	pla
	sta.b $A9
	lda.w facedir,x
	cmp.b $C5
	beq CODE_9EB079
CODE_9EB070:
	lda.w temp2b,x
	sta.b $A5
	jml.l doplayeracc
CODE_9EB079:
	lda.w puckc
	bmi CODE_9EB070
	lda.b $00
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9EB08B
	ora.w #$E000
CODE_9EB08B:
	tax
	jsl.l CODE_808F7D
	sta.b $A5
	lda.b $A9
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9EB09F
	ora.w #$E000
CODE_9EB09F:
	tax
	jsl.l CODE_808F7D
	ldx.b $95
	clc
	adc.b $A5
	cmp.w #$000E
	bcc CODE_9EB070
	cmp.w #$0028
	bcs CODE_9EB0B6
	jmp.w $A242
CODE_9EB0B6:
	bra CODE_9EB070
assscore:
	lda.w gmode
	bit.w #$0040
	beq CODE_9EB0C8
	lda.b $91
	inc a
	inc a
	jsl.l CODE_9C9FD5
CODE_9EB0C8:
	ldy.w $19D4,x
	bmi CODE_9EB0D6
	lda.w $0776,y
	and.w #$FFF0
	beq CODE_9EB0D6
	rtl
CODE_9EB0D6:
	lda.w Xvel,x
	tax
	lda.w #$00C0
	jsl.l CODE_808FC9
	ldx.b $95
	lda.b $09
	sta.w Xvel,x
	lda.w Yvel,x
	tax
	lda.w #$00C0
	jsl.l CODE_808FC9
	ldx.b $95
	lda.b $09
	sta.w Yvel,x
	txa
	lsr a
	cmp.w puckc
	bne CODE_9EB10D
	lda.w #$FFFF
	sta.w puckc
	lda.w #$0708
	sta.w nopuck,x
CODE_9EB10D:
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EB13F
	and.w #$FFFD
	sta.w pflags,x
	jsl.l CODE_9EB17A
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	lda.w #$005A
	sta.w temp3,x
	lda.w Hpos
	bpl CODE_9EB139
	lda.w #$FFA6
	sta.w temp3,x
CODE_9EB139:
	lda.w Vpos
	sta.w temp4,x
CODE_9EB13F:
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b $89
	lda.w temp3,x
	sta.b $A5
	lda.w temp4,x
	sta.b $A9
	lda.w temp1,x
	sec
	sbc.b $C1
	sta.w temp1,x
	bpl CODE_9EB185
	lda.w #SPAcelebrate
	sta.b $A9
	sta.w pfalock,x
	cpx.w $0D29
	bne CODE_9EB176
CODE_9EB16B:
	lda.w #DATA8_9DFA84
	sta.b $A9
	lda.w #$FFFF
	sta.w $0D29
CODE_9EB176:
	jsl.l SetSPA
CODE_9EB17A:
	lda.w #$0078
	jsl.l CODE_9BB385
	sta.w temp1,x
	rtl
CODE_9EB185:
	jmp.w $A5A4
CODE_9EB188:
	jsl.l updatepentime
	jsl.l checkfornewpen
	jsl.l chkprogress
	jml.l UpdatePA
CODE_9EB198:
	stz.b $A9
	lda.w pucky
	sec
	sbc.w #$0058
	bpl CODE_9EB1B0
	inc.b $A9
	inc.b $A9
	lda.w pucky
	sec
	sbc.w #$FFA8
	bpl CODE_9EB1C8
CODE_9EB1B0:
	lda.w gmode
	bit.w #$0002
	beq CODE_9EB1BF
	lda.b $A9
	eor.w #$0002
	sta.b $A9
CODE_9EB1BF:
	ldy.b $A9
	lda.w $1752,y
	inc a
	sta.w $1752,y
CODE_9EB1C8:
	rtl
CODE_9EB1C9:
	stz.b $A9
	lda.w tmap
	sec
	sbc.w $17A8
	beq CODE_9EB1E4
	bpl CODE_9EB1DB
	lda.w #$0002
	sta.b $A9
CODE_9EB1DB:
	ldy.b $A9
	lda.w $1756,y
	inc a
	sta.w $1756,y
CODE_9EB1E4:
	rtl
checkfornewpen:
	lda.w sfhormode
	beq CODE_9EB1ED
	jmp.w $B2B4
CODE_9EB1ED:
	lda.w #$15DE
	sta.b $89
CODE_9EB1F2:
	lda.b ($89)
	inc.b $89
	inc.b $89
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB1F2
	tay
	bne CODE_9EB206
	jmp.w $B2B4
CODE_9EB206:
	lda.w gmode
	bit.w #$0004
	bne CODE_9EB25F
	dec.b $89
	dec.b $89
	lda.b ($89)
	inc.b $89
	inc.b $89
	and.w #$00FF
	sta.b $A5
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	lda.b [$8D]
	and.w #$00FF
	beq CODE_9EB25B
	lda.w puckc
	bmi CODE_9EB2B5
	lsr a
	sec
	sbc.w #$0006
	sta.b $A5
	dec.b $89
	lda.b ($89)
	inc.b $89
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EB253
	ora.w #$FF00
CODE_9EB253:
	sec
	sbc.w #$0006
	eor.b $A5
	bmi CODE_9EB2B5
CODE_9EB25B:
	jsl.l CODE_9EB2C9
CODE_9EB25F:
	dec.b $89
	lda.b ($89)
	tay
	ora.w #$0080
	sta.b ($89)
	inc.b $89
	tya
	bit.w #$0080
	beq CODE_9EB274
	jmp.w $B1F2
CODE_9EB274:
	dec.b $89
	dec.b $89
	lda.b ($89)
	inc.b $89
	inc.b $89
	and.w #$00FF
	sta.b $A5
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	ldy.w #$0001
	lda.b [$8D],y
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $A9
	sec
	sbc.w Pencntdwn
	beq CODE_9EB2B1
	bmi CODE_9EB2B1
	lda.b $A9
	sta.w Pencntdwn
CODE_9EB2B1:
	jmp.w $B1F2
CODE_9EB2B4:
	rtl
CODE_9EB2B5:
	lda.w #$0008
	tsb.w gmode
	bne CODE_9EB2B1
	lda.w #$0030
	sta.b $A5
	jsl.l SetPA
	jmp.w $B1F2
CODE_9EB2C9:
	lda.w #$FFFF
	tsb.w gmclock
	beq CODE_9EB2D4
	jmp.w $B388
CODE_9EB2D4:
	stz.b $A5
	stz.b $A9
	dec.b $89
	dec.b $89
	lda.b ($89)
	inc.b $89
	inc.b $89
	and.w #$00FF
	cmp.w #$000E
	beq CODE_9EB326
	pha
	lda.l $7E30F8
	sta.b $A5
	lda.l $7E30FA
	sta.b $A9
	pla
	cmp.w #$0006
	beq CODE_9EB326
	ldy.w puckx
	sty.b $A5
	ldy.w pucky
	sty.b $A9
	cmp.w #$000C
	bne CODE_9EB326
	dec.b $89
	lda.b ($89)
	inc.b $89
	and.w #$00FF
	asl a
	tay
	lda.w #$0258
	sta.b $A9
	lda.w pfgoal,y
	beq CODE_9EB326
	lda.w #$FDA8
	sta.b $A9
CODE_9EB326:
	lda.b $A5
	sta.b $C5
	sec
	sbc.w #$0046
	bmi CODE_9EB335
	lda.w #$0046
	sta.b $A5
CODE_9EB335:
	lda.b $A5
	sec
	sbc.w #$FFBA
	bpl CODE_9EB342
	lda.w #$FFBA
	sta.b $A5
CODE_9EB342:
	lda.b $A9
	sec
	sbc.w #$00A6
	bmi CODE_9EB35D
	lda.w #$00CE
	sta.b $A9
	lda.w #$0046
	sta.b $A5
	lda.b $C5
	bpl CODE_9EB35D
	lda.w #$FFBA
	sta.b $A5
CODE_9EB35D:
	lda.b $A9
	sec
	sbc.w #$FF5A
	bpl CODE_9EB378
	lda.w #$FF32
	sta.b $A9
	lda.w #$0046
	sta.b $A5
	lda.b $C5
	bpl CODE_9EB378
	lda.w #$FFBA
	sta.b $A5
CODE_9EB378:
	lda.b $A5
	sta.l $7E3136
	lda.b $A9
	sta.l $7E3138
	jsl.l CODE_9FB601
CODE_9EB388:
	lda.b $83
	sec
	sbc.w $0D2B
	cmp.w #$003C
	bcc CODE_9EB393
CODE_9EB393:
	lda.w $0CA9
	bne CODE_9EB39E
	lda.w #$001E
	sta.w $0CA9
CODE_9EB39E:
	lda.w #$7000
	sta.b $64
	lda.w #$0015
	jsl.l CODE_80A17D
	stz.w Pencntdwn
	lda.w #$0004
	tsb.w gmode
	lda.w #$000A
	sta.b $A5
	jml.l SetPA
chkprogress:
	lda.w gmode
	bit.w #$0004
	bne CODE_9EB3C5
CODE_9EB3C4:
	rtl
CODE_9EB3C5:
	lda.w Pencntdwn
	bpl CODE_9EB3CD
	jmp.w $B476
CODE_9EB3CD:
	sec
	sbc.b $C1
	sta.w Pencntdwn
	bpl CODE_9EB3C4
	lda.w #$0008
	trb.w gmode
	lda.w #$0000
	sta.b $8B
	lda.w #$15DE
	sta.b $89
CODE_9EB3E5:
	lda.b [$89]
	inc.b $89
	inc.b $89
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB3E5
	tay
	beq CODE_9EB3C4
	dec.b $89
	dec.b $89
	lda.b [$89]
	inc.b $89
	inc.b $89
	and.w #$00FF
	sta.b $A5
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	clc
	adc.b [$8D],y
	sta.b $8D
	lda.b [$8D]
	and.w #$00FF
	beq CODE_9EB3E5
	cmp.w #$0001
	beq CODE_9EB3E5
	lda.w #$0400
	tsb.w sflags
	lda.w $0AD3
	beq CODE_9EB434
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
CODE_9EB434:
	jsl.l SetHor
	lda.w #$FF00
	tsb.w puckc
	ldx.w #$001C
	stx.b $95
	lda.w #$001A
	sta.b $A5
	jsl.l assinsert
	ldx.b $95
	lda.w #$1C20
	sta.w temp1,x
	lda.w #$FF00
	tsb.w RefStep
	stz.w RefCnt
	jsl.l UpdatePA
	lda.w #$0032
	sta.w RefCnt
	stz.b $A5
	jsl.l CODE_9EFA36
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	rtl
CODE_9EB476:
	jsl.l CODE_9EBF11
	lda.w RefCnt
	bmi CODE_9EB482
	jmp.w $B6F6
CODE_9EB482:
	lda.w RefStep
	bmi CODE_9EB48A
	jmp.w $B6F6
CODE_9EB48A:
	lda.b $A5
	pha
	lda.b $A7
	pha
	stx.b $87
	ldx.w #$0000
CODE_9EB495:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9EB495
	ldx.b $87
CODE_9EB4A1:
	lda.w #$0000
	sta.b $8B
	lda.w #$15DE
	sta.b $89
CODE_9EB4AB:
	lda.b [$89]
	inc.b $89
	inc.b $89
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB4AB
	cmp.w #$0000
	bne CODE_9EB4C1
	jmp.w $B6B8
CODE_9EB4C1:
	lda.b [$89]
	inc.b $89
	inc.b $89
	cmp.w #$0000
	bne CODE_9EB4C1
	dec.b $89
	dec.b $89
	dec.b $89
	dec.b $89
	lda.b [$89]
	pha
	and.w #$7FFF
	sta.b [$89]
	pla
	bmi CODE_9EB4F9
	lda.b [$89]
	xba
	and.w #$00FF
	asl a
	sta.b $A9
	tay
	lda.w position,y
	bmi CODE_9EB4F1
	jmp.w $B6CC
CODE_9EB4F1:
	lda.w #$0000
	sta.b [$89]
	jmp.w $B6CC
CODE_9EB4F9:
	lda.b [$89]
	and.w #$00FF
	sta.b $A5
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	cmp.w #$D4AD
	bne CODE_9EB51A
	jmp.w $B6A1
CODE_9EB51A:
	cmp.w #$D434
	bne CODE_9EB523
	jsl.l CODE_9C9BAB
CODE_9EB523:
	lda.b [$8D]
	and.w #$00FF
	sta.b $AD
	bne CODE_9EB52F
	jmp.w $B6A5
CODE_9EB52F:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	stx.b $87
	ldx.w #$0000
CODE_9EB540:
	lda.b $8D,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9EB540
	ldx.b $87
	jsl.l GetPeriodTimeRemaining
	lda.b [$89]
	xba
	and.w #$00FF
	asl a
	sta.b $A9
	tax
	stx.b $95
	stz.b $A5
	stz.b $91
	lda.w #$0002
	sta.b $8D
	lda.w pfteam,x
	beq CODE_9EB582
	lda.w #$8000
	sta.b $A5
	stz.b $8D
	lda.w #$0002
	sta.b $91
	lda.w $19BE
	clc
	adc.w #$0014
	bmi CODE_9EB582
	sta.w $19BE
CODE_9EB582:
	ldy.b $91
	lda.w $174A,y
	inc a
	sta.w $174A,y
	lda.w $174E,y
	clc
	adc.b $AD
	sta.w $174E,y
	lda.w pnum,x
	and.w #$00FF
	ora.b $A5
	sta.w TempPlOffset
	lda.w pnum,x
	sta.b $A5
	lda.b $91
	beq CODE_9EB5AB
	lda.w #$001A
CODE_9EB5AB:
	phx
	clc
	adc.b $A5
	tax
	sep #$20
	lda.w $198A,x
	rep #$20
	and.w #$00FF
	clc
	adc.b $AD
	sep #$20
	sta.w $198A,x
	rep #$20
	plx
	lda.w $163C
	cmp.w #$0041
	bcs CODE_9EB5FD
	asl a
	asl a
	tay
	jsl.l GetPeriodTimeRemaining
	lda.b $A5
	sta.w $163E,y
	iny
	iny
	lda.w TempPlOffset
	cmp.w #$0080
	bmi CODE_9EB5E6
	ora.w #$0080
CODE_9EB5E6:
	sep #$20
	sta.w $163E,y
	rep #$20
	iny
	lda.b [$89]
	and.w #$00FF
	sep #$20
	sta.w $163E,y
	rep #$20
	inc.w $163C
CODE_9EB5FD:
	lda.w TempPlOffset
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EB60B
	ora.w #$FF00
CODE_9EB60B:
	asl a
	sta.b $A5
	phx
	ldx.w #$003C
	lda.b $AD
	and.w #$00FF
	jsl.l CODE_808F4C
	ora.w #$2000
	sta.b $AD
	plx
	lda.b $91
	beq CODE_9EB628
	lda.w #$0034
CODE_9EB628:
	clc
	adc.b $A5
	tay
	lda.w tmpdst,y
	bmi CODE_9EB636
	and.w #$1000
	tsb.b $AD
CODE_9EB636:
	lda.b $AD
	sta.w tmpdst,y
	lda.w #$1000
	trb.b $AD
	lda.b $8B
	pha
	lda.b $89
	pha
	lda.b $91
	beq CODE_9EB64D
	lda.w #$001A
CODE_9EB64D:
	sta.b $89
	lda.w #$0018
	sta.b $A9
CODE_9EB654:
	ldy.b $89
	inc.b $89
	lda.w tmboxlist,y
	bit.w #$0080
	bne CODE_9EB664
	dec.b $A9
	bpl CODE_9EB654
CODE_9EB664:
	lda.b $A5
	ora.w #$FF00
	sta.w tmboxlist,y
	pla
	sta.b $89
	pla
	sta.b $8B
	lda.w #$000D
	sta.b $A5
	jsl.l assreplace
	stx.b $87
	ldx.w #$000E
CODE_9EB680:
	pla
	sta.b $8D,x
	dex
	dex
	bpl CODE_9EB680
	ldx.b $87
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	ldx.b $95
	jsl.l SetPA
	jsl.l ShowInjuryBox
	bra CODE_9EB6CC
CODE_9EB6A1:
	jsl.l CODE_9EC72D
CODE_9EB6A5:
	lda.w #$0000
	sta.b [$89]
	lda.w sfhormode
	beq CODE_9EB6B2
	jmp.w $B4A1
CODE_9EB6B2:
	jsl.l SetPA
	bra CODE_9EB6CC
CODE_9EB6B8:
	lda.w #$0004
	trb.w gmode
	ldx.w #$001C
	stx.b $95
	lda.w #$001B
	sta.b $A5
	jsl.l assreplace
CODE_9EB6CC:
	lda.w $1E9B
	bne CODE_9EB6E0
	stz.b $91
	jsl.l coinsearch
	lda.w #$0002
	sta.b $91
	jsl.l coinsearch
CODE_9EB6E0:
	stx.b $87
	ldx.w #$000E
CODE_9EB6E5:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9EB6E5
	ldx.b $87
	pla
	sta.b $A7
	pla
	sta.b $A5
	ldx.b $95
CODE_9EB6F6:
	rtl
coinsearch:
	lda.w #$0006
	sta.b $A9
	lda.w #$0032
	sta.b $A5
CODE_9EB701:
	lda.b $91
	beq CODE_9EB708
	lda.w #$0034
CODE_9EB708:
	clc
	adc.b $A5
	tay
	lda.w tmpdst,y
	bmi CODE_9EB727
	beq CODE_9EB727
	and.w #$DFFF
	sta.w tmpdst,y
	bit.w #$5000
	bne CODE_9EB727
	lda.b $A9
	cmp.w #$0004
	beq CODE_9EB727
	dec.b $A9
CODE_9EB727:
	dec.b $A5
	dec.b $A5
	bpl CODE_9EB701
	ldy.b $91
	lda.b $A9
	sta.w tmap,y
	rtl
updatepwrplay:
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9EB769
	stz.b $91
	lda.w #$0002
	sta.b $95
	lda.w tmap
	sec
	sbc.w $17A8
	sta.b $A5
	bne CODE_9EB753
	jmp.w $B851
CODE_9EB753:
	bpl CODE_9EB76A
	lda.w sflags
	bit.w #$4000
	bne CODE_9EB784
	jsl.l updatepwrplay_clr
	lda.w #$4000
	tsb.w sflags
	bra CODE_9EB784
CODE_9EB769:
	rtl
CODE_9EB76A:
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	lda.w sflags
	bit.w #$4000
	beq CODE_9EB784
	jsl.l updatepwrplay_clr
	lda.w #$4000
	trb.w sflags
CODE_9EB784:
	lda.w #$2000
	tsb.w sflags
	bne CODE_9EB791
	ldx.b $95
	inc.w $1746,x
CODE_9EB791:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF718
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l GetLowestPen
	lda.w gmclock
	bne CODE_9EB7FB
	lda.b $A5
	cmp.w #$0005
	bcs CODE_9EB7FB
	cmp.w #$0001
	beq CODE_9EB7CE
	lda.w #$7000
	sta.b $64
	lda.w #$0005
	jsl.l CODE_80A17D
	bra CODE_9EB7FB
CODE_9EB7CE:
	lda.w #$7000
	sta.b $64
	lda.w #$0005
	jsl.l CODE_80A17D
	phx
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne CODE_9EB7F8
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.w #$0659
	sta.w $094A,y
	sta.w $0CAF
CODE_9EB7F8:
	rep #$20
	plx
CODE_9EB7FB:
	jsl.l PushTime
	jsl.l CODE_9EC7BE
	ldx.b $95
	lda.w tmdata,x
	sta.b $89
	lda.w #$009C
	sta.b $8B
	lda.w #$0000
	sta.b $97
	lda.w #$0A2A
	sta.b $95
	lda.w #$0002
	sta.b [$95]
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF72A
	sta.b $8D
	jsl.l appstring
	lda.b $89
	ldy.w #$0004
	clc
	adc.b [$89],y
	sta.b $89
	adc.b [$89]
	sta.b $89
	sta.b $8D
	lda.b $8B
	sta.b $8F
	jsl.l appstring
	lda.b $97
	sta.b $8F
	lda.b $95
	sta.b $8D
	jsl.l CODE_9EC7BE
	rtl
updatepwrplay_clr:
	lda.w #$2000
	trb.w sflags
	beq CODE_9EB85D
	jsl.l CODE_9FBEFD
CODE_9EB85D:
	rtl
AddPenalty:
	lda.w gmclock
	bne CODE_9EB889
	lda.w $163A
	bne CODE_9EB889
	lda.b $A5
	cmp.w #$000C
	beq CODE_9EB88A
	cmp.w #$0024
	beq CODE_9EB88A
	lda.l $7E34C4
	beq CODE_9EB889
	lda.w gmode
	bit.w #$0020
	bne CODE_9EB88A
	lda.b $A5
	cmp.w #$0012
	bne CODE_9EB88A
CODE_9EB889:
	rtl
CODE_9EB88A:
	lda.w sfhormode
	beq CODE_9EB892
	jmp.w $B94B
CODE_9EB892:
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.b $A5
	cmp.w #$000E
	bne CODE_9EB8AB
CODE_9EB8AB:
	sec
	sbc.w #$000E
	bmi CODE_9EB8D8
	lda.l $7E35E0
	clc
	adc.w #$00C8
	sta.l $7E35E0
	lda.w #$002D
	sta.b $81
	lda.w pfteam,x
	beq CODE_9EB8D8
	lda.l $7E35E0
	sec
	sbc.w #$00C8
	bcs CODE_9EB8D4
	lda.w #$0000
CODE_9EB8D4:
	sta.l $7E35E0
CODE_9EB8D8:
	lda.w #$0000
	sta.b $8F
	lda.w #$15DE
	sta.b $8D
	lda.w #$001F
	sta.b $A9
CODE_9EB8E7:
	lda.b [$8D]
	inc.b $8D
	inc.b $8D
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB8E7
	tay
	beq CODE_9EB8FE
	dec.b $A9
	bpl CODE_9EB8E7
	bra CODE_9EB939
CODE_9EB8FE:
	dec.b $8D
	dec.b $8D
	txa
	lsr a
	xba
	and.w #$FF00
	ora.b $A5
	sta.b [$8D]
	lda.w #$0080
	sta.b $8B
	lda.w #DATA8_80D3EB
	sta.b $89
	ldy.b $A5
	clc
	adc.b [$89],y
	sta.b $89
	lda.b [$89]
	and.w #$00FF
	beq CODE_9EB939
	lda.w pflags,x
	pha
	ora.w #$4000
	sta.w pflags,x
	pla
	bit.w #$4000
	beq CODE_9EB939
	lda.w #$0000
	sta.b [$8D]
CODE_9EB939:
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AB
	pla
	sta.b $A9
CODE_9EB94B:
	rtl
CODE_9EB94C:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.w gsp
	cmp.w #$0003
	beq CODE_9EB9D1
	lda.w #$15DE
	sta.b $89
CODE_9EB971:
	lda.b ($89)
	inc.b $89
	inc.b $89
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB971
	cmp.w #$0000
	bne CODE_9EB987
	jmp.w $B9D5
CODE_9EB987:
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	lda.b [$8D]
	and.w #$00FF
	beq CODE_9EB9C2
	dec.b $89
	dec.b $89
	lda.w #$0000
	sta.b $A5
	lda.b ($89)
	inc.b $89
	inc.b $89
	and.w #$FF00
	cmp.w #$0600
	bcc CODE_9EB9BC
	lda.w #$0002
	sta.b $A5
CODE_9EB9BC:
	lda.b $91
	cmp.b $A5
	beq CODE_9EB971
CODE_9EB9C2:
	dec.b $89
	dec.b $89
	lda.w #$0034
	sta.b ($89)
	inc.b $89
	inc.b $89
	bra CODE_9EB971
CODE_9EB9D1:
	jsl.l ClearPenaltyBuffer
CODE_9EB9D5:
	ldy.b $91
	lda.w tmap,y
	ldy.b $8D
	sec
	sbc.w tmap,y
	beq CODE_9EBA36
	bmi CODE_9EBA36
	lda.b $8D
	beq CODE_9EB9EB
	lda.w #$001A
CODE_9EB9EB:
	sta.b $89
CODE_9EB9ED:
	ldy.b $89
	lda.w tmboxlist,y
	inc.b $89
	and.w #$00FF
	sta.b $AD
	bit.w #$0080
	bne CODE_9EBA36
	lda.b $8D
	beq CODE_9EBA05
	lda.w #$0034
CODE_9EBA05:
	clc
	adc.b $AD
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne CODE_9EB9ED
	lda.w #$0000
	sta.w tmpdst,y
	jsl.l RemovePlayerFromList
	ldy.b $8D
	lda.w tmap,y
	inc a
	sta.w tmap,y
	ldy.b $91
	lda.w $1742,y
	inc a
	sta.w $1742,y
	lda.w #$0001
	tsb.w tmflags
	tsb.w $17E0
CODE_9EBA36:
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
CODE_9EBA4F:
	jsl.l CODE_9EBA68
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	jsl.l CODE_9EBA68
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
CODE_9EBA67:
	rtl
CODE_9EBA68:
	ldy.b $91
	lda.w position,y
	bne CODE_9EBA67
	lda.w gmclock
	bne CODE_9EBA67
	lda.w puckc
	cmp.b $95
	beq CODE_9EBA84
	lda.w $0F23,x
	sec
	sbc.w #$001A
	bmi CODE_9EBA67
CODE_9EBA84:
	lda.w $0F23,x
	sec
	sbc.w #$0003
	bmi CODE_9EBA67
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	jsl.l CODE_9E9B52
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	lda.w $0F23,y
	sec
	sbc.w #$001F
	bmi CODE_9EBA67
	lda.w pflags,x
	bit.w #$4000
	bne CODE_9EBA67
	lda.w #$0014
	sec
	sbc.w $1443,x
	jsl.l CODE_9BB385
	cmp.w #$0002
	bcs CODE_9EBA67
	lda.w gmode
	bit.w #$0010
	bne CODE_9EBA67
	lda.w $0B05,y
	and.w #$0004
	bne CODE_9EBA67
	lda.w #$0026
	sta.b $A5
	jmp.w $B85E
assepen:
	lda.w pflags,x
	bit.w #$0002
	bne CODE_9EBAE5
	jmp.w $BB35
CODE_9EBAE5:
	and.w #$FFFD
	sta.w pflags,x
	ldy.w #$0010
	lda.w pfteam,x
	beq CODE_9EBAF6
	ldy.w #$0001
CODE_9EBAF6:
	sty.b $A5
	lda.w PBnum
	sec
	sbc.b $A5
	sta.w PBnum
	stz.w Xvel,x
	stz.w Yvel,x
	lda.w #$003C
	sta.b $A5
	lda.w pfteam,x
	bne CODE_9EBB16
	lda.w #$FFC4
	sta.b $A5
CODE_9EBB16:
	lda.b $A5
	sta.w Ypos,x
	lda.w #$0088
	sta.w Xpos,x
	lda.w #$0002
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #SPAwallleft
	jsl.l CODE_9EA3F1
	jml.l SprSort
CODE_9EBB35:
	lda.w #$0004
	sta.w facedir,x
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	lda.w pflags,x
	and.w #$6FF7
	sta.w pflags,x
	stz.w pfnc,x
	lda.w #$F000
	sta.w Xvel,x
	ldx.b $91
	lda.w $19D0,x
	cmp.w #$0004
	bcc CODE_9EBB8C
	ldy.w $0AF9,x
CODE_9EBB63:
	iny
	iny
	cpy.w #$000A
	bne CODE_9EBB6D
	ldy.w #$0000
CODE_9EBB6D:
	lda.w $19F6,y
	bpl CODE_9EBB63
	and.w #$00FF
	cmp.b $91
	bne CODE_9EBB63
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
	ldx.b $E4
	tya
	sta.w $19D4,x
	txa
	sta.w $19EC,y
CODE_9EBB8C:
	ldx.b $E4
	jml.l CODE_9E8BE6
GetLowestPen:
	stz.b $A5
	stz.b $B1
	lda.b $91
	beq CODE_9EBB9D
	lda.w #$001A
CODE_9EBB9D:
	sta.b $89
CODE_9EBB9F:
	ldy.b $89
	inc.b $89
	lda.w tmboxlist,y
	and.w #$00FF
	sta.b $AD
	bit.w #$0080
	bne CODE_9EBBD7
	lda.b $91
	beq CODE_9EBBB7
	lda.w #$0034
CODE_9EBBB7:
	clc
	adc.b $AD
	tay
	lda.w tmpdst,y
	sta.b $AD
	bit.w #$4000
	bne CODE_9EBB9F
	lda.b $AD
	sec
	sbc.b $B1
	sta.b $AD
	clc
	adc.b $A5
	sta.b $A5
	lda.b $AD
	sta.b $B1
	bra CODE_9EBB9F
CODE_9EBBD7:
	ldy.b $95
	lda.w tmap,y
	cmp.w #$0006
	beq CODE_9EBC23
	lda.b $A5
	sec
	sbc.b $B1
	sta.b $A5
	lda.b $95
	beq CODE_9EBBEF
	lda.w #$001A
CODE_9EBBEF:
	sta.b $89
CODE_9EBBF1:
	ldy.b $89
	lda.w tmboxlist,y
	inc.b $89
	and.w #$00FF
	sta.b $AD
	bit.w #$0080
	bne CODE_9EBC23
	lda.b $95
	beq CODE_9EBC09
	lda.w #$0034
CODE_9EBC09:
	clc
	adc.b $AD
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne CODE_9EBBF1
	lda.b $A5
	cmp.w tmpdst,y
	bmi CODE_9EBC23
	lda.b $A5
	clc
	adc.b $B1
	sta.b $A5
CODE_9EBC23:
	rtl
CODE_9EBC24:
	ldy.b $91
	lda.w pfalock,x
	bne CODE_9EBCA3
	lda.w position,x
	beq CODE_9EBCA3
	lda.l $7E34C4
	bne CODE_9EBC4F
	lda.w $19D4,y
	bmi CODE_9EBC4F
	lda.w #$0010
	clc
	adc.w aggress,y
	sec
	sbc.w $12E3,x
	jsl.l CODE_9BB385
	cmp.w #$000C
	bcc CODE_9EBCA3
CODE_9EBC4F:
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b $A5
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b $A9
	jsl.l vtoa
	ldy.b $91
	lda.b $A5
	sec
	sbc.w facedir,y
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EBCA3
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	jsl.l CODE_9E9B52
	jsl.l CODE_9EC042
	beq CODE_9EBCA4
	lda.w $1E8D
	bpl CODE_9EBCA4
	ldy.b $91
	sty.w $1E8D
	lda.w $19D4,y
	sta.w $1E93
	lda.w #$0024
	sta.b $A5
	jsl.l AddPenalty
	bra CODE_9EBCB8
CODE_9EBCA3:
	rtl
CODE_9EBCA4:
	jsl.l CODE_9EC124
	lda.b $A5
	cmp.w #$0005
	bcs CODE_9EBCB8
	lda.w #$0022
	sta.b $A5
	jsl.l AddPenalty
CODE_9EBCB8:
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	lda.w #$FFFF
	sta.w $0CDB
	rtl
asspenalty:
	lda.w pflags,x
	bit.w #$0002
	bne CODE_9EBCD2
	jmp.w $BD1D
CODE_9EBCD2:
	jsl.l CODE_9EBDF8
	lda.w pflags,x
	and.w #$FFF9
	ora.w #$1000
	sta.w pflags,x
	lda.w #$0000
	sta.b $B5
	jsl.l CODE_9BC174
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	jsl.l CODE_9EBEA1
	lda.b $08
	sta.b $A9
	sta.w temp4,x
	lda.w #$0088
	sta.w temp3,x
	stz.w temp1,x
	lda.w pflags,x
	ora.w #$8000
	sta.w pflags,x
	stz.w $1103,x
	stz.w $1123,x
	lda.w #$0384
	sta.w temp5,x
CODE_9EBD1D:
	lda.w temp5,x
	sec
	sbc.w $0ADB
	sta.w temp5,x
	bpl CODE_9EBD45
CODE_9EBD29:
	jmp.w $BDC9
CODE_9EBD2C:
	rtl
CODE_9EBD2D:
	lda.w temp3,x
	sta.b $A5
	lda.w temp4,x
	sta.b $A9
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b $89
	jml.l CODE_9EA5A4
CODE_9EBD45:
	lda.w Ypos,x
	sec
	sbc.w temp4,x
	cmp.w #$FFF3
	bmi CODE_9EBD2D
	cmp.w #$000D
	bpl CODE_9EBD2D
	lda.w Xpos,x
	sec
	sbc.w temp3,x
	sta.b $A5
	sec
	sbc.w #$FFE8
	bmi CODE_9EBD2D
	lda.w temp1,x
	sec
	sbc.b $C1
	sta.w temp1,x
	bpl CODE_9EBD2C
	adc.w #$0008
	sta.w temp1,x
	cpx.w puckc
	bne CODE_9EBD87
CODE_9EBD7B:
	lda.w #$FFFF
	sta.w puckc
	lda.w #$003C
	sta.w nopuck,x
CODE_9EBD87:
	lda.w #SPAglide
	sta.w pfnc,x
	jsl.l CODE_9EA3F1
	lda.w #$0006
	sta.b $AD
	lda.w handed,x
	beq CODE_9EBDA0
	lda.w #$0002
	sta.b $AD
CODE_9EBDA0:
	lda.w facedir,x
	cmp.b $AD
	beq CODE_9EBDAE
CODE_9EBDA7:
	inc a
	and.w #$0007
	sta.w facedir,x
CODE_9EBDAE:
	stz.w Yvel,x
	lda.w #$1000
	sta.w Xvel,x
	lda.b $A5
	sec
	sbc.w #$FFF8
	bmi CODE_9EBDF7
	stz.w Xvel,x
	lda.w facedir,x
	cmp.b $AD
	bne CODE_9EBDF7
CODE_9EBDC9:
	lda.w temp4,x
	sta.w Ypos,x
	lda.w #$0088
	sta.w Xpos,x
	lda.w #$0002
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #SPAwallright
	jsl.l CODE_9EA3F1
	lda.w pflags,x
	and.w #$BFFF
	sta.w pflags,x
	lda.w #$000E
	sta.b $A5
	jml.l assreplace
CODE_9EBDF7:
	rtl
CODE_9EBDF8:
	ldy.b $91
	lda.w $19D0,y
	cmp.w #$0004
	bcc CODE_9EBE24
CODE_9EBE02:
	sta.b $A9
	lda.w #$0006
	sta.b $A5
	lda.w tmsort,y
	tax
	ldy.w #$0000
CODE_9EBE10:
	lda.w position,x
	bmi CODE_9EBE18
	beq CODE_9EBE18
	iny
CODE_9EBE18:
	inx
	inx
	dec.b $A5
	bne CODE_9EBE10
	cpy.b $A9
	beq CODE_9EBE35
	bcc CODE_9EBE35
CODE_9EBE24:
	ldx.b $E4
	lda.w $19D4,x
	bpl CODE_9EBE2E
	jmp.w CODE_80BDF7
CODE_9EBE2E:
	sta.b $B5
	jsl.l CODE_9FCD0A
	rtl
CODE_9EBE35:
	cpy.w #$0003
	bne CODE_9EBE5E
	ldx.b $91
	ldy.w $0AF9,x
CODE_9EBE3F:
	iny
	iny
	cpy.w #$000A
	bne CODE_9EBE49
	ldy.w #$0000
CODE_9EBE49:
	lda.w $19F6,y
	bpl CODE_9EBE3F
	and.w #$00FF
	cmp.b $91
	bne CODE_9EBE3F
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
CODE_9EBE5E:
	ldx.b $91
	ldy.w $0AF9,x
	bra CODE_9EBE6F
CODE_9EBE65:
	iny
	iny
	cpy.w #$000A
	bne CODE_9EBE6F
	ldy.w #$0000
CODE_9EBE6F:
	lda.w $19F6,y
	cmp.b $91
	bne CODE_9EBE65
	ora.w #$FF00
	sta.w $19F6,y
	lda.w #$0000
	sta.w $1C84,y
	phy
	iny
	iny
	cpy.w #$000A
	bne CODE_9EBE8D
	ldy.w #$0000
CODE_9EBE8D:
	tya
	sta.w $0AF9,x
	ply
	ldx.w $19EC,y
	lda.w #$FFFF
	sta.w $19EC,y
	sta.w $19D4,x
	jmp.w $BE24
CODE_9EBEA1:
	lda.w #$000B
	sta.b $A5
	lda.w PBnum
	sta.b $A9
	lda.w pfteam,x
	bne CODE_9EBEBD
	lda.b $A9
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $A9
	lda.w #$FFF5
	sta.b $A5
CODE_9EBEBD:
	lda.b $A9
	and.w #$000F
	sta.b $A9
	cmp.w #$0003
	bcc CODE_9EBECE
	lda.w #$0002
	sta.b $A9
CODE_9EBECE:
	inc.b $A9
	inc.b $A9
	inc.b $A9
	phx
	lda.b $A5
	ldx.b $A9
	jsl.l Mul16S
	plx
	rtl
assdopen:
	lda.w #$0010
	sta.b $A5
	lda.w pfteam,x
	beq CODE_9EBEEE
	lda.w #$0001
	sta.b $A5
CODE_9EBEEE:
	lda.w PBnum
	clc
	adc.b $A5
	sta.w PBnum
	lda.w #$FFFF
	sta.w position,x
	lda.w sfhormode
	bne CODE_9EBF0A
	lda.w #$0171
	sta.w frame,x
	bra CODE_9EBF10
CODE_9EBF0A:
	lda.w #$0170
	sta.w frame,x
CODE_9EBF10:
	rtl
CODE_9EBF11:
	lda.w $1E9B
	ora.w $163A
	ora.w $1D81
	bne CODE_9EBF43
	phx
	stz.w PBnum
	ldx.w #$0000
CODE_9EBF23:
	lda.w position,x
	bpl CODE_9EBF3B
	jsl.l CODE_9EBEA1
	lda.b $08
	sta.w Ypos,x
	lda.w #$0088
	sta.w Xpos,x
	jsl.l assdopen
CODE_9EBF3B:
	inx
	inx
	cpx.w #$0018
	bcc CODE_9EBF23
	plx
CODE_9EBF43:
	rtl
updatepentime:
	lda.w #$0020
	trb.w sflags3
	lda.w gmclock
	beq CODE_9EBF52
	jmp.w CODE_80BFDD
CODE_9EBF52:
	lda.w $163A
	beq CODE_9EBF5A
	jmp.w CODE_80BFDD
CODE_9EBF5A:
	lda.w pentimer
	sec
	sbc.b $C1
	sta.w pentimer
	bpl CODE_9EBFDD
	adc.w #$0018
	sta.w pentimer
	lda.w #$0020
	tsb.w sflags3
	jsl.l CODE_9EB198
	jsl.l CODE_9EB1C9
	stz.b $91
	jsl.l CODE_9EBF84
	lda.w #$0002
	sta.b $91
CODE_9EBF84:
	lda.b $91
	beq CODE_9EBF8B
	lda.w #$001A
CODE_9EBF8B:
	sta.b $89
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$0002
	sta.b $A9
	sta.b $B1
CODE_9EBF9E:
	ldy.b $89
	lda.w tmboxlist,y
	inc.b $89
	and.w #$00FF
	sta.b $A5
	bit.w #$0080
	bne CODE_9EBFDE
	lda.b $91
	beq CODE_9EBFB6
	lda.w #$0034
CODE_9EBFB6:
	clc
	adc.b $A5
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne CODE_9EC01D
	dec.b $A9
	bmi CODE_9EBF9E
	lda.b $A5
	sta.b [$8D]
	inc.b $8D
	inc.b $8D
	lda.w tmpdst,y
	dec a
	sta.w tmpdst,y
	bne CODE_9EBFDB
	jsl.l RemovePlayerFromList
CODE_9EBFDB:
	bra CODE_9EBF9E
CODE_9EBFDD:
	rtl
CODE_9EBFDE:
	lda.w $0A2A
	sta.b $A5
	lda.b $A9
	cmp.w #$0001
	beq CODE_9EC000
	lda.b $A9
	bne CODE_9EBFF4
	jsl.l CODE_9EC000
	bra CODE_9EBFFB
CODE_9EBFF4:
	lda.b $A9
	cmp.w #$FFFF
	bne CODE_9EBFDD
CODE_9EBFFB:
	lda.w $0A2C
	sta.b $A5
