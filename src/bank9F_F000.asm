; Bank $9F, last 4 KB: the end of the menu item names (see bank9F_E000), then the last game flow code, with auto labels
; for now: the exit prompt (Exit Game?, Exit Shootout?, Yes, No), the MultiPlayer 5 messages (it must be connected to
; controller socket 2 and does not work with the Super Scope or the Mouse), the jump table DATA8_9FF631 and the byte
; table DATA8_9FF4C0. The bank ends with $FF fill.

org $9FF00B
CODE_9FF00B:
	lda.w #$0000
	sta.w $1DB9
CODE_9FF011:
	jsl.l CODE_9FF063
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	lda.b $A9
	bit.w #$1000
	bne CODE_9FF055
	bit.w #$8080
	bne CODE_9FF05B
	bit.w #$0800
	bne CODE_9FF03D
	bit.w #$0400
	bne CODE_9FF045
	bra CODE_9FF011
CODE_9FF03D:
	lda.w $1DB9
	dec a
	bpl CODE_9FF050
	bra CODE_9FF011
CODE_9FF045:
	lda.w $1DB9
	inc a
	cmp.w #$0002
	bmi CODE_9FF050
	bra CODE_9FF011
CODE_9FF050:
	sta.w $1DB9
	bra CODE_9FF011
CODE_9FF055:
	lda.w #$0000
	sta.w $1DB9
CODE_9FF05B:
	jsl.l CODE_9B865F
	lda.w $1DB9
	rtl
CODE_9FF063:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF918
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0016
	sta.b $A5
	lda.w #$0007
	sta.b $A9
	jsl.l CODE_9D8000
	ldy.w #$000D
CODE_9FF08E:
	phy
	lda.w #$2400
	sta.w $0D0D
	lda.w #$0006
	sta.w printx
	sty.w printy
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF163
	sta.b $8D
	jsl.l CODE_9EC7BE
	ply
	iny
	cpy.w #$0012
	bcc CODE_9FF08E
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF91D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$2400
	sta.w $0D0D
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF179
	sta.b $8D
	lda.w $1D81
	beq CODE_9FF0EC
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF18F
	sta.b $8D
CODE_9FF0EC:
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF922
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$2400
	sta.w $0D0D
	lda.w $1DB9
	bne CODE_9FF11B
	lda.w #$2000
	sta.w $0D0D
CODE_9FF11B:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF1BB
	sta.b $8D
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF927
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$2400
	sta.w $0D0D
	lda.w $1DB9
	beq CODE_9FF154
	lda.w #$2000
	sta.w $0D0D
CODE_9FF154:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF1A5
	sta.b $8D
	jsl.l CODE_9EC7BE
	rtl
incsrc "data/text/DATA8_9FF163.asm"
CODE_9FF1D1:
	lda.w $1A0E
	beq CODE_9FF1E3
CODE_9FF1D6:
	jsl.l CODE_9FF1E4
	lda.w $1A0E
	bne CODE_9FF1D6
	jsl.l CODE_9FEA24
CODE_9FF1E3:
	rtl
CODE_9FF1E4:
	pha
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF92C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0016
	sta.b $A5
	lda.w #$0007
	sta.b $A9
	jsl.l CODE_9D8000
	pla
	bit.w #$0001
	bne CODE_9FF220
	bit.w #$0002
	bne CODE_9FF25A
	bit.w #$0004
	bne CODE_9FF294
	jmp.w $F2CC
CODE_9FF220:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF35F
	sta.b $8D
	jsl.l CODE_9FF2D5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF372
	sta.b $8D
	jsl.l CODE_9FF2F1
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF385
	sta.b $8D
	jsl.l CODE_9FF30D
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF394
	sta.b $8D
	jsl.l CODE_9FF329
	bra CODE_9FF2CC
CODE_9FF25A:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3A0
	sta.b $8D
	jsl.l CODE_9FF2D5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3B6
	sta.b $8D
	jsl.l CODE_9FF2F1
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3CC
	sta.b $8D
	jsl.l CODE_9FF30D
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3E0
	sta.b $8D
	jsl.l CODE_9FF329
	bra CODE_9FF2CC
CODE_9FF294:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3EE
	sta.b $8D
	jsl.l CODE_9FF2D5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF404
	sta.b $8D
	jsl.l CODE_9FF2F1
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF41A
	sta.b $8D
	jsl.l CODE_9FF30D
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF42E
	sta.b $8D
	jsl.l CODE_9FF329
CODE_9FF2CC:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	rtl
CODE_9FF2D5:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF931
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9FF345
CODE_9FF2F1:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF936
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9FF345
CODE_9FF30D:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF93B
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9FF345
CODE_9FF329:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF940
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9FF345
CODE_9FF345:
	jsl.l CODE_9FF34E
	jsl.l CODE_9EC7BE
	rtl
CODE_9FF34E:
	lda.b [$8D]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	rtl
incsrc "data/text/DATA8_9FF35F.asm"
CODE_9FF436:
	stz.w $0AD3
	jsl.l CODE_8086A9
	jsl.l CODE_9B8000
	jsl.l CODE_9C97E9
	sep #$20
	lda.b #$FF
	sta.w $07E2
	rep #$30
	ldy.w #$01A0
	lda.w #$6000
	ldx.w #$0000
	jsl.l InitSprites
	stz.b $3A
	stz.b $3C
	lda.w #DATA8_9FF4C0
	sta.b $0C
	lda.w #$009F
	sta.b $0E
	jsl.l CODE_9FFAB4
	jsr.w $F4D8
	stz.b $C3
	jsr.w $F5E3
	stz.w $0AD1
	stz.w $0AD3
	jsl.l SpriteFrameStart
	jsl.l SpriteFrameEnd
	ldx.w #$009F
	lda.w #$FA17
	jsl.l CODE_80855E
	jsl.l CODE_8086BD
	lda.w #$7000
	sta.b $64
	ldx.w #$003C
CODE_9FF499:
	jsl.l WaitFrame
	dex
	bpl CODE_9FF499
	ldx.w #$009F
	lda.w #$FA17
	jsl.l CODE_80855E
CODE_9FF4AA:
	jsl.l RandomWord
	jsr.w $F613
	bne CODE_9FF4BB
	lda.b $3C
	cmp.b $3A
	beq CODE_9FF4AA
	bra CODE_9FF4AA
CODE_9FF4BB:
	jsl.l CODE_8086A9
	rtl
DATA8_9FF4C0:
	db $07,$C0,$11,$00,$00,$00,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
CODE_9FF4D8:
	sep #$20
	stz.w CGADD
	lda.b #$FF
	sta.w CGDATA
	sta.w CGDATA
	rep #$20
	lda.w #DATA8_9AEE1C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	ldy.w #$0030
	ldx.w #$0010
	jsl.l CODE_808723
	ldy.w #$00B0
	ldx.w #$0010
	jsl.l CODE_808723
	lda.w #DATA8_9AEE3C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	ldy.w #$0040
	ldx.w #$0010
	jsl.l CODE_808723
	ldy.w #$00C0
	ldx.w #$0010
	jsl.l CODE_808723
	lda.w #$FFFF
	ldx.w #$000F
	ldy.w #$0020
	jsl.l CODE_9FF9F5
	lda.w #$FFFF
	ldx.w #$000F
	ldy.w #$0010
	jsl.l CODE_9FF9F5
	ldx.w #$0000
	lda.w #$0000
CODE_9FF543:
	sta.l $7F4000,x
	inx
	inx
	cpx.w #$4000
	bcc CODE_9FF543
	lda.w #DATA8_949A00
	sta.b $0C
	lda.w #$0094
	sta.b $0E
	lda.w #$8010
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsl.l Decompress
	lda.w #DATA8_9ADC8D
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$4000
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsl.l Decompress
	stz.w VMADDL
	sep #$20
	lda.b #$80
	sta.w VMAIN
	ldy.w #$4000
	ldx.w #$0000
CODE_9FF58E:
	lda.l $7F4006,x
	sta.w VMDATAL
	lda.l $7F8010,x
	sta.w VMDATAH
	inx
	dey
	bne CODE_9FF58E
	rep #$20
	ldx.w #$1C00
	ldy.w #$0000
	sep #$20
CODE_9FF5AA:
	lda.l $7F4000,x
	phx
	tyx
	sta.l $7F4040,x
	plx
	iny
	lda.l $7F8010,x
	phx
	tyx
	sta.l $7F4040,x
	plx
	inx
	iny
	cpy.w #$0A00
	bmi CODE_9FF5AA
	rep #$20
	lda.w #DATA8_94F8EC
	sta.b $0C
	lda.w #$0094
	sta.b $0E
	lda.w #$4A40
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsl.l Decompress
	rts
CODE_9FF5E3:
	lda.w #$0180
	sta.b $D5
	sta.w $07D6
	lda.w #$0190
	sta.b $D7
	sta.w $07D8
	lda.w #$0010
	tsb.b $C3
	lda.w #$0003
	sta.b $B7
	stz.b $BB
	lda.b $83
	tax
	clc
	adc.w #$02D0
	sta.b $BD
	txa
	clc
	adc.w #$00F0
	sta.b $C1
	jsr.w $F89C
	rts
CODE_9FF613:
	lda.b $B7
	sta.b $B5
	lda.b $B5
	cmp.w #$000D
	beq CODE_9FF623
	lda.w $0776
	beq CODE_9FF623
CODE_9FF623:
	lda.b $C3
	beq CODE_9FF62A
	jmp.w $F898
CODE_9FF62A:
	lda.b $B5
	asl a
	tax
	jmp (DATA8_9FF631,x)
DATA8_9FF631:		; jump table for jmp (DATA8_9FF631,x)
	dw CODE_9FF64D,CODE_9FF676,CODE_9FF6A9,CODE_9FF6BA,CODE_9FF6F1,CODE_9FF71D,CODE_9FF74D
	dw CODE_9FF78B,CODE_9FF7C5,CODE_9FF7E6,CODE_9FF811,CODE_9FF83C,CODE_9FF863,CODE_9FF878
CODE_9FF64D:
	ldx.b $BB
	bne CODE_9FF667
	lda.b $D9
	clc
	adc.w #$000C
	sta.b $D9
	sta.b $DB
	cmp.w #$0100
	bpl CODE_9FF667
	lda.w #$0040
	tsb.b $C3
	bra CODE_9FF673
CODE_9FF667:
	jsr.w $F8D4
	lda.w #$0040
	tsb.b $C3
	lda.b $B9
	sta.b $B7
CODE_9FF673:
	jmp.w $F898
CODE_9FF676:
	ldx.b $BB
	bne CODE_9FF690
	jsr.w $F992
	bne CODE_9FF690
	jsr.w $F992
	bne CODE_9FF690
	jsr.w $F992
	bne CODE_9FF690
	lda.w #$0008
	tsb.b $C3
	bra CODE_9FF6A6
CODE_9FF690:
	lda.w #$4000
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsr.w $FA08
	lda.w #$0008
	tsb.b $C3
	lda.b $B9
	sta.b $B7
CODE_9FF6A6:
	jmp.w $F898
CODE_9FF6A9:
	ldx.b $BB
	bne CODE_9FF6B3
	lda.b $83
	cmp.b $BF
	bmi CODE_9FF6B7
CODE_9FF6B3:
	lda.b $B9
	sta.b $B7
CODE_9FF6B7:
	jmp.w $F898
CODE_9FF6BA:
	lda.b $BB
	bne CODE_9FF6CA
	lda.w #$0000
	jsl.l CODE_80A200
	jsr.w $F8DC
	bra CODE_9FF6CD
CODE_9FF6CA:
	jsr.w $F8D4
CODE_9FF6CD:
	lda.w #DATA8_9ADBD3
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	jsl.l CODE_9FF8EA
	lda.w #$00C0
	tsb.b $C3
	lda.w #$0004
	ldx.b $BB
	bne CODE_9FF6EC
	sta.b $B9
	lda.w #$0000
CODE_9FF6EC:
	sta.b $B7
	jmp.w $F898
CODE_9FF6F1:
	jsl.l SpriteFrameStart
	lda.w #$4A40
	sta.b $10
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $00
	lda.w #$0000
	ldx.w #$0038
	ldy.w #$002F
	jsl.l DrawSprite
	jsl.l SpriteFrameEnd
	lda.w #$0009
	sta.b $B7
	jmp.w $F898
CODE_9FF71D:
	lda.b $BB
	bne CODE_9FF726
	jsr.w $F8DC
	bra CODE_9FF729
CODE_9FF726:
	jsr.w $F8D4
CODE_9FF729:
	lda.w #DATA8_9ADB19
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	jsl.l CODE_9FF8EA
	lda.w #$00C0
	tsb.b $C3
	lda.w #$0006
	ldx.b $BB
	bne CODE_9FF748
	sta.b $B9
	lda.w #$0000
CODE_9FF748:
	sta.b $B7
	jmp.w $F898
CODE_9FF74D:
	jsl.l SpriteFrameStart
	lda.w #$4A40
	sta.b $10
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $00
	lda.w #$0000
	ldx.w #$0038
	ldy.w #$002F
	jsl.l DrawSprite
	lda.w #$0001
	sta.b $00
	lda.w #$0000
	ldx.w #$0038
	ldy.w #$002F
	jsl.l DrawSprite
	jsl.l SpriteFrameEnd
	lda.w #$000A
	sta.b $B7
	jmp.w $F898
CODE_9FF78B:
	lda.b $BB
	bne CODE_9FF794
	jsr.w $F8DC
	bra CODE_9FF797
CODE_9FF794:
	jsr.w $F8D4
CODE_9FF797:
	jsl.l CODE_9FF8E4
	lda.w #DATA8_9AEE5C
	sta.b $C9
	lda.w #$009A
	sta.b $CB
	lda.w #$0020
	sta.b $C5
	lda.w #$0010
	sta.b $C7
	lda.w #$00C8
	tsb.b $C3
	lda.w #$000B
	ldx.b $BB
	bne CODE_9FF7C0
	sta.b $B9
	lda.w #$0000
CODE_9FF7C0:
	sta.b $B7
	jmp.w $F898
CODE_9FF7C5:
	lda.w #DATA8_9AEE7C
	sta.b $C9
	lda.w #$009A
	sta.b $CB
	lda.w #$0010
	sta.b $C5
	lda.w #$0010
	sta.b $C7
	lda.w #$0008
	tsb.b $C3
	lda.w #$000D
	sta.b $B7
	jmp.w $F898
CODE_9FF7E6:
	lda.b $BB
	beq CODE_9FF7F2
CODE_9FF7EA:
	lda.w #$0005
	sta.b $B7
	jmp.w $F898
CODE_9FF7F2:
	lda.w #DATA8_9AEE1C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$0030
	sta.b $C5
	jsr.w $F975
	lda.w #$0005
	sta.b $B9
	lda.w #$0001
	sta.b $B7
	jmp.w $F898
CODE_9FF811:
	lda.b $BB
	beq CODE_9FF81D
CODE_9FF815:
	lda.w #$0007
	sta.b $B7
	jmp.w $F898
CODE_9FF81D:
	lda.w #DATA8_9AEE3C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$0040
	sta.b $C5
	jsr.w $F975
	lda.w #$0007
	sta.b $B9
	lda.w #$0001
	sta.b $B7
	jmp.w $F898
CODE_9FF83C:
	lda.w #$0008
	sta.b $B7
	jmp.w $F898
CODE_9FF844:
	lda.w #DATA8_9AEE5C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$0020
	sta.b $C5
	jsr.w $F975
	lda.w #$000C
	sta.b $B9
	lda.w #$0001
	sta.b $B7
	jmp.w $F898
CODE_9FF863:
	lda.b $83
	clc
	adc.w #$001E
	sta.b $BF
	lda.w #$0002
	sta.b $B7
	lda.w #$0008
	sta.b $B9
	jmp.w $F898
CODE_9FF878:
	lda.w $0AD3
	cmp.w #$000F
	bne CODE_9FF898
	lda.b $83
	cmp.b $C1
	bmi CODE_9FF898
	lda.w $0776
	bne CODE_9FF893
	lda.b $83
	cmp.b $BD
	bmi CODE_9FF898
	bra CODE_9FF893
CODE_9FF893:
	lda.w #$0001
	bra CODE_9FF89B
CODE_9FF898:
	lda.w #$0000
CODE_9FF89B:
	rts
CODE_9FF89C:
	sep #$20
	lda.b #$00
	sta.w M7X
	lda.b #$02
	sta.w M7X
	lda.b #$00
	sta.w M7Y
	lda.b #$02
	sta.w M7Y
	stz.w M7A
	lda.b #$01
	sta.w M7A
	stz.w M7B
	stz.w M7B
	stz.w M7C
	stz.w M7C
	stz.w M7D
	lda.b #$01
	sta.w M7D
	rep #$20
	jsr.w $F8D4
	rts
CODE_9FF8D4:
	lda.w #$0100
	sta.b $D9
	sta.b $DB
	rts
CODE_9FF8DC:
	lda.w #$0001
	sta.b $D9
	sta.b $DB
	rts
CODE_9FF8E4:
	stz.b $A9
	jsr.w $F8F3
	rtl
CODE_9FF8EA:
	lda.w #$0001
	sta.b $A9
	jsr.w $F8F3
	rtl
CODE_9FF8F3:
	ldy.w #$0006
	stz.b $A7
CODE_9FF8F8:
	lda.b $A7
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$0037
	asl a
	tax
	stz.b $A5
	sep #$20
CODE_9FF90B:
	lda.b $A9
	beq CODE_9FF911
	lda.b [$0C],y
CODE_9FF911:
	sta.l $7F4040,x
	iny
	inx
	inx
	inc.b $A5
	lda.b $A5
	cmp.b #$12
	bmi CODE_9FF90B
	rep #$20
	inc.b $A7
	lda.b $A7
	cmp.w #$000A
	bmi CODE_9FF8F8
	rts
CODE_9FF92C:
	rep #$30
CODE_9FF92E:
	lda.b $0C
	pha
	lda.b $0E
	pha
	lda.w #$4040
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	ldx.w #$1C00
	lda.w #$0A00
	jsl.l CODE_9FF94F
	pla
	sta.b $0E
	pla
	sta.b $0C
	rtl
CODE_9FF94F:
	php
	sta.w DAS0L
	lda.b $0C
	sta.w A1T0L
	stx.w VMADDL
	sep #$20
	lda.b $0E
	sta.w A1B0
	lda.b #$01
	sta.w DMAP0
	lda.b #$18
	sta.w BBAD0
	lda.b #$01
	sta.w MDMAEN
	rep #$30
	plp
	rtl
CODE_9FF975:
	lda.w #$4000
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsr.w $FA08
	lda.w #$0010
	sta.b $C7
	lda.w #$4000
	sta.b $C9
	lda.w #$007F
	sta.b $CB
	rts
CODE_9FF992:
	ldx.w #$0000
	ldy.w #$0001
CODE_9FF998:
	lda.l $7F4000,x
	pha
	and.w #$001F
	cmp.w #$001F
	beq CODE_9FF9AC
	clc
	adc.w #$0001
	and.w #$001F
CODE_9FF9AC:
	sta.l $7F4000,x
	pla
	pha
	and.w #$03E0
	cmp.w #$03E0
	beq CODE_9FF9C1
	clc
	adc.w #$0020
	and.w #$03E0
CODE_9FF9C1:
	ora.l $7F4000,x
	sta.l $7F4000,x
	pla
	and.w #$7C00
	cmp.w #$7C00
	beq CODE_9FF9D9
	clc
	adc.w #$0400
	and.w #$7C00
CODE_9FF9D9:
	ora.l $7F4000,x
	sta.l $7F4000,x
	and.w #$7FFF
	cmp.w #$7FFF
	beq CODE_9FF9EC
	ldy.w #$0000
CODE_9FF9EC:
	inx
	inx
	cpx.w #$0020
	bmi CODE_9FF998
	tya
	rts
CODE_9FF9F5:
	sep #$30
	sty.w CGADD
CODE_9FF9FA:
	sta.w CGDATA
	xba
	sta.w CGDATA
	xba
	dex
	bpl CODE_9FF9FA
	rep #$30
	rtl
CODE_9FFA08:
	ldy.w #$0000
CODE_9FFA0B:
	lda.b [$0C],y
	sta.b [$10],y
	iny
	iny
	cpy.w #$0020
	bmi CODE_9FFA0B
	rts
	rep #$30
	lda.b $C3
	bit.w #$0080
	beq CODE_9FFA2C
	jsl.l CODE_9FF92E
	lda.w #$0080
	trb.b $C3
	jmp.w $FA6B
CODE_9FFA2C:
	lda.b $C3
	bit.w #$0008
	beq CODE_9FFA6B
	lda.b $0C
	pha
	lda.b $0E
	pha
	lda.b $C9
	sta.b $0C
	lda.b $CB
	sta.b $0E
	ldy.b $C5
	ldx.b $C7
	jsl.l CODE_808723
	lda.b $C3
	bit.w #$0200
	beq CODE_9FFA60
CODE_9FFA50:
	lda.b $D1
	sta.b $0C
	lda.b $D3
	sta.b $0E
	ldy.b $CD
	ldx.b $CF
	jsl.l CODE_808723
CODE_9FFA60:
	pla
	sta.b $0E
	pla
	sta.b $0C
	lda.w #$0208
	trb.b $C3
CODE_9FFA6B:
	lda.b $C3
	bit.w #$0010
	beq CODE_9FFA8F
	sep #$20
	lda.b $D5
	sta.w BG1HOFS
	lda.b $D6
	sta.w BG1HOFS
	lda.b $D7
	sta.w BG1VOFS
	lda.b $D8
	sta.w BG1VOFS
	rep #$20
	lda.w #$0010
	trb.b $C3
CODE_9FFA8F:
	lda.b $C3
	bit.w #$0040
	beq CODE_9FFAB3
	sep #$20
	lda.b $D9
	sta.w M7A
	lda.b $DA
	sta.w M7A
	lda.b $DB
	sta.w M7D
	lda.b $DC
	sta.w M7D
	rep #$20
	lda.w #$0040
	trb.b $C3
CODE_9FFAB3:
	rtl
CODE_9FFAB4:
	sep #$20
	lda.b #$03
	sta.w OBSEL
	lda.b #$80
	sta.w VMAIN
	ldy.w #$0000
	lda.b [$0C],y
	sta.w BGMODE
	iny
	lda.b [$0C],y
	sta.w M7SEL
	iny
	lda.b [$0C],y
	sta.w TM
	iny
	lda.b [$0C],y
	sta.w TS
	iny
	iny
	lda.b [$0C],y
	iny
	ora.b [$0C],y
	sta.w BG1SC
	iny
	iny
	lda.b [$0C],y
	iny
	ora.b [$0C],y
	sta.w BG2SC
	iny
	iny
	lda.b [$0C],y
	iny
	ora.b [$0C],y
	sta.w BG3SC
	iny
	iny
	lda.b [$0C],y
	iny
	ora.b [$0C],y
	sta.w BG4SC
	iny
	iny
	lda.b [$0C],y
	lsr a
	lsr a
	lsr a
	lsr a
	iny
	iny
	ora.b [$0C],y
	sta.w BG12NBA
	iny
	iny
	lda.b [$0C],y
	lsr a
	lsr a
	lsr a
	lsr a
	iny
	iny
	ora.b [$0C],y
	sta.w BG34NBA
	rep #$20
	rtl
	db $00
	padbyte $FF
	pad $A08000
