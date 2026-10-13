; Bank $9D, fourth 4 KB: screen code, with auto labels for now: screen setups that unpack tiles, maps and colours from
; banks $96 and $9A, code that reads CenterIceTable for the home team, and the word tables DATA8_9DB774 and
; DATA8_9DB78A (read with the same index).

org $9DB000
	jsl.l CODE_9DD923
	rtl
CODE_9DB005:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF60C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF62A
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF648
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9DD923
	rtl
CODE_9DB058:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF663
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF680
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF69E
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9DD923
	rtl
CODE_9DB0AB:
	lda.w #$0020
	sta.l $7EA676
	sta.l $7EA678
	lda.w #$007E
	sta.b $0E
	lda.w #$A676
	sta.b $0C
	lda.w #$0800
	sta.w $079C
	lda.w #$0000
	sta.b $24
	lda.w #$0020
	sta.b $18
	lda.w #$0002
	sta.b $1A
	ldy.w printy
	sty.b $26
	ldx.w #$0000
	jsl.l CODE_808BED
	lda.w #$007E
	sta.b $0E
	lda.w #$4EF4
	sta.b $0C
	ldy.w #$4000
	lda.l $7E3466
	inc a
	asl a
	asl a
	asl a
	asl a
	tax
	jsl.l CODE_80891F
	rts
CODE_9DB0FD:
	lda.w #$007E
	sta.b $12
	lda.w #$3AF4
	sta.b $10
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0500
	jsl.l CODE_808EDF
	rtl
CODE_9DB118:
	jsl.l CODE_8086A9
	jsl.l CODE_9C983D
	lda.w #$6000
	ldx.w #$0000
	ldy.w #$01A0
	jsl.l InitSprites
	sep #$20
	lda.b #$58
	sta.w BG2SC
	lda.b #$5C
	sta.w BG3SC
	lda.b #$05
	sta.w BG34NBA
	lda.b #$FF
	sta.w $07E2
	stz.w W34SEL
	stz.w WOBJSEL
	stz.w WH0
	stz.w WH2
	lda.b #$03
	sta.w TMW
	lda.b #$80
	sta.w M7SEL
	stz.w M7B
	stz.w M7B
	stz.w M7C
	stz.w M7C
	rep #$20
	stz.w $07D6
	lda.w #$FFFF
	sta.w $07D8
	stz.w $07DA
	stz.w $07DC
	stz.w $07DE
	stz.w $07E0
	lda.w #$0050
	sta.w $07E0
	lda.w #$0100
	sta.w $07D6
	stz.w $0BCB
	stz.w $0BCD
	stz.w $0BCF
	lda.w #$0009
	sta.w $0BD1
	lda.w #$0200
	sta.w $0BF3
	sta.w $0BF5
	lda.w #$0200
	sta.w $0BF5
	sta.w $0BF7
	lda.w #$0190
	sta.w $0BF7
	sta.w $0BF9
	lda.w #$0180
	sta.w $0BF9
	sta.w $0BFB
	lda.w #$1800
	sta.w $0BFB
	sta.w $0BFD
	lda.w #$0011
	sta.w $0BD3
	stz.w $0BFF
	jsr.w $B5B6
	jsr.w $BC8B
	stz.w $0BEB
	stz.w $0BE9
	jsl.l CODE_9F96E6
CODE_9DB1DD:
	lda.w $0AD3
	cmp.w #$000F
	bcc CODE_9DB1DD
	lda.w #$B50C
	ldx.w #$009D
	ldy.w #$0000
	sty.w $07D4
	ldy.w #$0046
	jsl.l CODE_808520
	lda.w #$B4B2
	ldx.w #$009D
	jsl.l CODE_80855E
	jsl.l WaitFrame
	jsl.l WaitFrame
	lda.w #$000F
	sta.w $0AD3
	sta.w $0762
	jsr.w $B7A0
	lda.w #$7000
	sta.b $64
	lda.w #$0037
	jsl.l CODE_80A200
	ldx.w #$001E
	jsl.l CODE_9DBCEB
	lda.w #$0000
	jsr.w $B73F
	lda.w #$0001
	jsr.w $B73F
	lda.w #$0002
	jsr.w $B73F
	lda.w #$0034
	jsl.l CODE_80A200
	lda.w #$0042
	sta.w $0BCD
	jsr.w $B891
	lda.w #$0003
	jsr.w $B73F
	lda.w #$0004
	jsr.w $B73F
	lda.w #$0005
	jsr.w $B73F
	lda.w #$0034
	jsl.l CODE_80A200
	lda.w #$007D
	sta.w $0BCD
	jsr.w $B891
	lda.w #$0006
	jsr.w $B73F
	lda.w #$0007
	jsr.w $B73F
	lda.w #$0008
	jsr.w $B73F
	lda.w #$0034
	jsl.l CODE_80A200
	lda.w #$00FF
	sta.w $0BCD
	jsr.w $B891
	jsr.w $BCB2
	lda.w #$0001
	sta.w $0BD1
	lda.w #$0036
	jsl.l CODE_80A200
	ldx.w #$0007
	jsl.l CODE_9DBCEB
	jsr.w $BCB3
	jsl.l CODE_9C9891
	lda.w #$008F
	sta.b $0E
	lda.w #DATA8_8FDD32
	sta.b $0C
	jsl.l MusicStart
	jsl.l SpriteFrameStart
	jsr.w $B954
	jsl.l SpriteFrameEnd
	jsl.l WaitFrame
	jsl.l WaitFrame
	jsr.w $B7D6
	jsl.l SpriteFrameStart
	jsr.w $B954
	lda.w #$007F
	sta.b $12
	lda.w #$5000
	sta.b $10
	lda.w #$0009
	jsr.w $B754
	lda.w #$0010
	sta.w $0BD3
	lda.w #$1800
	sta.w $0BFB
	lda.w #$0190
	sta.w $0BF7
	lda.w #$0180
	sta.w $0BF9
	jsl.l SpriteFrameEnd
	jsl.l WaitFrame
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.w #$0000
	sta.w $079C
	ldx.w #$003C
	ldy.w #$003C
	jsl.l CODE_808D43
	jsl.l WaitFrame
	lda.w #$0011
	sta.w $0BD3
	jsl.l WaitFrame
	jsr.w $B7A0
	ldx.w #$002D
	jsl.l CODE_9DBCEB
	jsr.w $B82B
	jsl.l SpriteFrameStart
	jsr.w $B954
	lda.w #$007F
	sta.b $12
	lda.w #$5000
	sta.b $10
	lda.w #$0009
	jsr.w $B754
	lda.w #$000A
	jsr.w $B754
	jsl.l SpriteFrameEnd
	jsl.l WaitFrame
	jsl.l WaitFrame
	lda.w #$0010
	sta.w $0BD3
	lda.w #$0F00
	sta.w $0BFB
	lda.w #$0190
	sta.w $0BF7
	lda.w #$01B0
	sta.w $0BF9
	lda.w #$0210
	sta.w $0BF3
	lda.w #$F0C0
	sta.w $0BEB
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96A5E5
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$2000
	jsl.l CODE_80899B
	jsr.w $BCF8
	stz.w $0BFD
	lda.w $0BD5
	asl a
	tax
	lda.l $7EF000,x
	jsr.w $BB14
	lda.w #$0011
	sta.w $0BD3
	jsl.l WaitFrame
	jsl.l WaitFrame
	stz.w $0764
	stz.w $0BEF
	stz.w $0BF1
	lda.w #$0002
	sta.w $0BFF
CODE_9DB3E2:
	lda.w $0764
	cmp.w #$00F0
	bcs CODE_9DB3FF
	lda.w $0764
	cmp.w #$0078
	bcs CODE_9DB3F7
	jsr.w $B983
	bra CODE_9DB3FA
CODE_9DB3F7:
	jsr.w $B9B4
CODE_9DB3FA:
	jsr.w $B430
	bra CODE_9DB3E2
CODE_9DB3FF:
	stz.w $0764
	jsr.w $B9F7
	jsl.l WaitFrame
CODE_9DB409:
	lda.w $0764
	cmp.w #$1284
	bcs CODE_9DB41E
	lda.w $0BE9
	bne CODE_9DB41E
	jsr.w CODE_80BA13
	jsr.w $B430
	bra CODE_9DB409
CODE_9DB41E:
	lda.w $0AD3
	beq CODE_9DB42C
	dec.w $0AD3
	jsl.l WaitFrame
	bra CODE_9DB41E
CODE_9DB42C:
	jsr.w $B72F
	rtl
CODE_9DB430:
	lda.w $0BFF
	bit.w #$0001
	beq CODE_9DB44A
	stz.w $0BEF
	stz.w $0BF1
	jsr.w $BD36
	jsr.w $BB14
	lda.w #$0001
	trb.w $0BFF
CODE_9DB44A:
	rts
CODE_9DB44B:
	php
	rep #$30
	lda.w $0BFF
	bit.w #$0002
	beq CODE_9DB4B0
	bit.w #$0001
	bne CODE_9DB46A
	lda.w $0BF1
	clc
	adc.w #$0C00
	sta.w $0BF1
	bcc CODE_9DB46A
	inc.w $0BEF
CODE_9DB46A:
	sep #$20
	lda.w $0BEF
	xba
	lda.w $0BF2
	rep #$20
	cmp.w #$0500
	bcc CODE_9DB48C
	lda.w #$0001
	tsb.w $0BFF
	lda.w $0BFD
	eor.w #$0001
	sta.w $0BFD
	lda.w #$0000
CODE_9DB48C:
	asl a
	tax
	lda.l $7F8000,x
	sta.w $0BFB
	lda.l $7F8A00,x
	ldy.w $0BFD
	beq CODE_9DB4A2
	eor.w #$FFFF
	inc a
CODE_9DB4A2:
	clc
	adc.w #$0190
	sta.w $0BF7
	lda.l $7F9400,x
	sta.w $0BF9
CODE_9DB4B0:
	plp
	rts
	lda.w $0776
	bit.w $0BEB
	beq CODE_9DB4C0
	lda.w #$0001
	sta.w $0BE9
CODE_9DB4C0:
	sep #$20
	lda.w $0AD3
	sta.w INIDISP
	lda.b #$17
	sta.w TM
	lda.b #$54
	sta.w BG1SC
	lda.b #$44
	sta.w BG12NBA
	lda.b #$C3
	sta.w W12SEL
	lda.w $0BD1
	sta.w BGMODE
	lda.w $0BCB
	sta.w WH1
	lda.w $0BCD
	sta.w WH3
	rep #$20
	lda.w #$009D
	sta.w $0791
	lda.w #$B50C
	sta.w $078F
	lda.w #$0046
	sta.w VTIMEL
	lda.w #$0000
	sta.w HTIMEL
	jsr.w $B44B
	rtl
	sep #$20
	lda.w $0BCF
	sta.w WH3
	rep #$20
	lda.w #$009D
	sta.w $0791
	lda.w #$B52F
	sta.w $078F
	lda.w #$0050
	sta.w VTIMEL
	lda.w #$00A0
	sta.w HTIMEL
	rtl
	sep #$20
	lda.b #$07
	sta.w BGMODE
	lda.b #$00
	sta.w BG1SC
	lda.b #$00
	sta.w BG12NBA
	stz.w W12SEL
	lda.w $0BD3
	sta.w TM
	lda.w $0BF3
	sta.w M7X
	lda.w $0BF4
	sta.w M7X
	lda.w $0BF5
	sta.w M7Y
	lda.w $0BF6
	sta.w M7Y
	lda.w $0BF7
	sta.w BG1HOFS
	lda.w $0BF8
	sta.w BG1HOFS
	lda.w $0BF9
	sta.w BG1VOFS
	lda.w $0BFA
	sta.w BG1VOFS
	lda.w $0BFB
	sta.w M7A
	lda.w $0BFC
	sta.w M7A
	lda.w $0BFB
	sta.w M7D
	lda.w $0BFC
	sta.w M7D
	rep #$20
	lda.w #$009D
	sta.w $0791
	lda.w #$B5AC
	sta.w $078F
	lda.w #$00B0
	sta.w VTIMEL
	lda.w #$0000
	sta.w HTIMEL
	rtl
	sep #$20
	lda.b #$11
	sta.w TM
	rep #$20
	rtl
CODE_9DB5B6:
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ACCA9
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE0D5
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0100
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0100
	jsl.l CODE_808723
	lda.w #$0000
	ldx.w #$4000
	ldy.w #$0000
	jsl.l CODE_808862
	lda.w #$0095
	sta.b $0E
	lda.w #DATA8_95F8C6
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$0000
	jsl.l CODE_80899B
	lda.w #$008A
	sta.b $0E
	lda.w #DATA8_8AFF7A
	sta.b $0C
	lda.w #$0000
	sta.w $079C
	ldx.w #$003C
	ldy.w #$003C
	jsl.l CODE_808D43
	lda.w #$0094
	sta.b $0E
	lda.w #DATA8_948000
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$4000
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ADDC6
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.w #$5400
	sta.w $079C
	ldx.w #$0000
	ldy.w #$0000
	jsl.l CODE_808ADF
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AD88C
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.w #$5800
	sta.w $079C
	ldx.w #$0000
	ldy.w #$0000
	jsl.l CODE_808ADF
	lda.w #$0087
	sta.b $0E
	lda.w #DATA8_87FF91
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ADEE0
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$4000
	sta.b $10
	jsl.l Decompress
	lda.b $10
	clc
	adc.w #$0006
	sta.b $10
	lda.w #$8080
	jsl.l CODE_808F03
	lda.w #$0091
	sta.b $0E
	lda.w #DATA8_91B188
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$5000
	sta.b $10
	jsl.l Decompress
	rts
CODE_9DB72F:
	ldx.w #$0BCB
	lda.w #$0000
CODE_9DB735:
	sta.b $00,x
	inx
	inx
	cpx.w #$0C01
	bcc CODE_9DB735
	rts
CODE_9DB73F:
	pha
	jsl.l SpriteFrameStart
	pla
	jsr.w $B754
	jsl.l SpriteFrameEnd
	ldx.w #$0004
	jsl.l CODE_9DBCEB
	rts
CODE_9DB754:
	sta.b $00
	asl a
	tax
	lda.w #$007F
	sta.b $12
	lda.w #$5000
	sta.b $10
	lda.l DATA8_9DB78A,x
	tay
	lda.l DATA8_9DB774,x
	tax
	lda.w #$3000
	jsl.l DrawSprite
	rts
DATA8_9DB774:
	dw $0058,$0040,$0028,$0070,$0060,$0050,$0080,$0080,$0080,$0007,$00D0
DATA8_9DB78A:
	dw $0058,$0040,$0028,$0060,$0048,$0028,$0060,$0048,$0028,$00B0,$00B0
CODE_9DB7A0:
	lda.w $0BFB
CODE_9DB7A3:
	dec a
	cmp.w #$0100
	bcc CODE_9DB7B4
	sta.w $0BFB
	ldx.w #$0064
	jsr.w $B884
	bra CODE_9DB7A3
CODE_9DB7B4:
	lda.w #$0100
	sta.w $0BFB
	rts
CODE_9DB7BB:
	lda.w $0BFB
CODE_9DB7BE:
	inc a
	cmp.w #$0200
	bcs CODE_9DB7CF
	sta.w $0BFB
	ldx.w #$0200
	jsr.w $B884
	bra CODE_9DB7BE
CODE_9DB7CF:
	lda.w #$0200
	sta.w $0BFB
	rts
CODE_9DB7D6:
	lda.w $0BFB
	inc a
	cmp.w #$0200
	bcs CODE_9DB818
	sta.w $0BFB
	sec
	sbc.w #$0100
	pha
	ldx.w #$0058
	jsl.l CODE_808F4C
	xba
	and.w #$00FF
	clc
	adc.w #$0190
	sta.w $0BF7
	pla
	ldx.w #$0040
	jsl.l CODE_808F4C
	xba
	and.w #$00FF
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0180
	sta.w $0BF9
	ldx.w #$03E8
	jsr.w $B884
	bra CODE_9DB7D6
CODE_9DB818:
	lda.w #$0200
	sta.w $0BFB
	lda.w #$01E8
	sta.w $0BF7
	lda.w #$0140
	sta.w $0BF9
	rts
CODE_9DB82B:
	lda.w $0BFB
	inc a
	cmp.w #$0200
	bcs CODE_9DB871
	sta.w $0BFB
	sec
	sbc.w #$0100
	pha
	ldx.w #$0070
	jsl.l CODE_808F4C
	xba
	and.w #$00FF
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0190
	sta.w $0BF7
	pla
	ldx.w #$0040
	jsl.l CODE_808F4C
	xba
	and.w #$00FF
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0180
	sta.w $0BF9
	ldx.w #$03E8
	jsr.w $B884
	bra CODE_9DB82B
CODE_9DB871:
	lda.w #$0200
	sta.w $0BFB
	lda.w #$0120
	sta.w $0BF7
	lda.w #$0140
	sta.w $0BF9
	rts
CODE_9DB884:
	phx
	ldx.w $0BE9
	bne CODE_9DB88F
	plx
CODE_9DB88B:
	dex
	bne CODE_9DB88B
	phx
CODE_9DB88F:
	plx
	rts
CODE_9DB891:
	jsl.l SpriteFrameStart
	jsl.l SpriteFrameEnd
	ldx.w #$0023
	jsl.l CODE_9DBCEB
	rts
CODE_9DB8A1:
	phx
	phy
	cmp.w #$0400
	bcs CODE_9DB8C3
	ldx.w #$0E00
	jsl.l Mul16U
	lda.b $09
	sta.b $08
	lda.w #$0008
	sta.b $04
	jsl.l Div16S
	asl.b $00
	lda.w #$0F00
	bra CODE_9DB8E0
CODE_9DB8C3:
	sec
	sbc.w #$0400
	ldx.w #$00C0
	jsl.l Mul16U
	lda.b $09
	sta.b $08
	lda.w #$0002
	sta.b $04
	jsl.l Div16S
	asl.b $00
	lda.w #$0100
CODE_9DB8E0:
	sec
	sbc.b $00
	ply
	plx
	rts
CODE_9DB8E6:
	phx
	phy
	cmp.w #$0480
	bcc CODE_9DB90A
	sec
	sbc.w #$0480
	tax
	lda.w #$00C6
	jsl.l CODE_808F98
	lda.w #$0080
	sta.b $04
	jsl.l Div16U
	lda.b $00
	clc
	adc.w #$0066
	bra CODE_9DB931
CODE_9DB90A:
	pha
	tax
	lda.w #$000A
	jsl.l CODE_808F98
	lda.w #$0050
	sta.b $04
	jsl.l Div16U
	lda.b $00
	clc
	adc.w #$0001
	tax
	pla
	phx
	jsl.l Sin
	tax
	pla
	jsl.l CODE_808FC9
	lda.b $09
CODE_9DB931:
	ply
	plx
	rts
CODE_9DB934:
	phx
	phy
	tax
	lda.w #$0050
	jsl.l CODE_808FC9
	lda.b $09
	sta.b $08
	lda.w #$0005
	sta.b $04
	jsl.l Div16S
	lda.w #$01B0
	sec
	sbc.b $00
	ply
	plx
	rts
CODE_9DB954:
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80E2E0
	sta.b $8D
	lda.w #$0000
	ldx.w #$0080
	ldy.w #$00B8
	jsl.l CODE_9C9415
	lda.w #$0080
	sta.b $8F
	lda.w #$E2F7
	sta.b $8D
	lda.w #$0000
	ldx.w #$0080
	ldy.w #$00C8
	jsl.l CODE_9C9415
	rts
CODE_9DB983:
	jsl.l SpriteFrameStart
	lda.w #$007F
	sta.b $12
	lda.w #$5000
	sta.b $10
	lda.w #$0009
	jsr.w $B754
	lda.w #$000A
	jsr.w $B754
	lda.w #$000B
	sta.b $00
	ldx.w #$003C
	ldy.w #$00B0
	lda.w #$2800
	jsl.l DrawSprite
	jsl.l SpriteFrameEnd
	rts
CODE_9DB9B4:
	jsl.l SpriteFrameStart
	lda.w #$007F
	sta.b $12
	lda.w #$5000
	sta.b $10
	lda.w #$0009
	jsr.w $B754
	lda.w #$000A
	jsr.w $B754
	lda.w #$000B
	sta.b $00
	ldx.w #$003C
	ldy.w #$00A0
	lda.w #$2800
	jsl.l DrawSprite
	lda.w #$000C
	sta.b $00
	ldx.w #$003C
	ldy.w #$00D0
	lda.w #$2800
	jsl.l DrawSprite
	jsl.l SpriteFrameEnd
	rts
CODE_9DB9F7:
	stz.w $0BDD
	stz.w $0BE1
	lda.w #$0000
	sta.w $0BD9
	lda.w #$00E0
	sta.w $0BDF
	lda.w #$00F0
	sta.w $0BE3
	stz.w $0BDB
	rts
CODE_9DBA13:
	lda.w $0764
	cmp.w $0BDB
	bcc CODE_9DBA23
	lda.w $0BD9
	cmp.w #$0003
	bne CODE_9DBA24
CODE_9DBA23:
	rts
CODE_9DBA24:
	cmp.w #$0000
	bne CODE_9DBA44
	lda.w $0BDF
	dec a
	dec a
	cmp.w #$00B9
	bmi CODE_9DBA53
	dec.w $0BDF
	dec.w $0BDF
CODE_9DBA39:
	dec.w $0BE3
	dec.w $0BE3
	lda.w #$0002
	bra CODE_9DBABA
CODE_9DBA44:
	cmp.w #$0001
	bne CODE_9DBA5E
	lda.w $0BE3
	dec a
	dec a
	cmp.w #$00C9
	bpl CODE_9DBA39
CODE_9DBA53:
	lda.w #$0002
	sta.w $0BD9
	lda.w #$0046
	bra CODE_9DBABA
CODE_9DBA5E:
	inc.w $0BE1
	lda.w $0BE1
	asl a
	tax
	lda.l CreditNames,x
	bne CODE_9DBAAB
	inc.w $0BDD
	lda.w $0BDD
	asl a
	tax
	lda.l CreditTitles,x
	beq CODE_9DBA94
	inc.w $0BE1
	lda.w #$00E0
	sta.w $0BDF
	lda.w #$00F0
	sta.w $0BE3
	lda.w #$0000
	sta.w $0BD9
	lda.w #$000F
	bra CODE_9DBABA
CODE_9DBA94:
	lda.w #$0003
	sta.w $0BD9
	lda.w #$00E0
	sta.w $0BDF
	lda.w #$00F0
	sta.w $0BE3
	lda.w #$002D
	bra CODE_9DBABA
CODE_9DBAAB:
	lda.w #$0001
	sta.w $0BD9
	lda.w #$00E0
	sta.w $0BE3
	lda.w #$000F
CODE_9DBABA:
	clc
	adc.w $0764
	sta.w $0BDB
	jsl.l SpriteFrameStart
	lda.w #$007F
	sta.b $12
	lda.w #$5000
	sta.b $10
	lda.w #$0009
	jsr.w $B754
	lda.w #$000A
	jsr.w $B754
	lda.w $0BDD
	asl a
	tax
	lda.l CreditTitles,x
	sta.b $8D
	lda.w #$0080
	sta.b $8F
	ldx.w #$0080
	ldy.w $0BDF
	jsl.l CODE_9C9415
	lda.w $0BE1
	asl a
	tax
	lda.l CreditNames,x
	sta.b $8D
	lda.w #$0080
	sta.b $8F
	ldx.w #$0080
	ldy.w $0BE3
	jsl.l CODE_9C9415
	jsl.l SpriteFrameEnd
	rts
CODE_9DBB14:
	pha
	lda.w #$007F
	sta.b $0E
	lda.w #$4000
	sta.b $0C
	lda.w #$0000
	sta.w $079C
	ldx.w #$003C
	ldy.w #$003C
	jsl.l CODE_808D43
	pla
	asl a
	asl a
	asl a
	tax
	phx
	lda.l CenterIceTable+4,x
	sta.b $0C
	lda.l CenterIceTable+6,x
	sta.b $0E
	jsr.w $BC25
	txa
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0042
	tax
	tya
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0040
	tay
	lda.w #$007F
	sta.b $0E
	lda.w #$A000
	sta.b $0C
	lda.w #$0000
	sta.w $079C
	jsl.l CODE_808D43
	plx
	lda.l CenterIceTable,x
	sta.b $0C
	lda.l CenterIceTable+2,x
	sta.b $0E
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	jsr.w $BBA8
	lda.w #$007F
	sta.b $0E
	lda.w #$A000
	sta.b $0C
	ldy.w #$0000
	jsl.l CODE_80899B
	rts
CODE_9DBBA8:
	phx
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	inc a
	tax
	phx
	ldx.w #$0000
	lda.w #$0000
CODE_9DBBB8:
	sta.l $7FA000,x
	inx
	inx
	cpx.w #$0040
	bcc CODE_9DBBB8
	plx
	stz.w $0BE5
	lda.w #$0040
	sta.w $0BE7
CODE_9DBBCD:
	phx
	jsr.w $BBF1
	lda.w $0BE5
	clc
	adc.w #$0020
	sta.w $0BE5
	lda.w $0BE7
	clc
	adc.w #$0040
	sta.w $0BE7
	plx
	dex
	bne CODE_9DBBCD
	pla
	asl a
	clc
	adc.w #$0040
	tax
	rts
CODE_9DBBF1:
	stz.b $A7
	ldx.w $0BE7
	ldy.w $0BE5
	sep #$20
CODE_9DBBFB:
	lda.b [$0C],y
	sta.b $A5
	and.b #$0F
	ora.w $0BED
	sta.l $7FA001,x
	lda.b $A5
	lsr a
	lsr a
	lsr a
	lsr a
	and.b #$0F
	ora.w $0BED
	sta.l $7FA000,x
	inx
	inx
	iny
	inc.b $A7
	lda.b $A7
	cmp.b #$20
	bcc CODE_9DBBFB
	rep #$20
	rts
CODE_9DBC25:
	lda.w #$0060
	sta.w $0BED
	ldx.w #$0000
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $A5
	sta.l $7FA000,x
	ldx.w #$0002
	ldy.w #$0002
	lda.b [$0C],y
	sta.b $A7
	sta.l $7FA000,x
	ldx.w #$0004
	lda.w #$0010
	sta.l $7FA000,x
	lda.b $A5
	ldx.b $A7
	jsl.l CODE_808F4C
	clc
	adc.w #$0006
	sta.b $A9
	ldx.w #$0006
	ldy.w #$0006
	sep #$20
CODE_9DBC67:
	lda.b [$0C],y
	inc a
	sta.l $7FA000,x
	iny
	cmp.b #$00
	beq CODE_9DBC7E
	lda.b [$0C],y
	bit.b #$1C
	beq CODE_9DBC7E
	lda.b #$70
	sta.w $0BED
CODE_9DBC7E:
	iny
	inx
	cpx.b $A9
	bcc CODE_9DBC67
	rep #$20
	ldx.b $A5
	ldy.b $A7
	rts
CODE_9DBC8B:
	ldx.w #$0000
	ldy.w #$0000
CODE_9DBC91:
	tya
	jsr.w $B8A1
	sta.l $7F8000,x
	tya
	jsr.w $B8E6
	sta.l $7F8A00,x
	tya
	jsr.w $B934
	sta.l $7F9400,x
	inx
	inx
	iny
	cpy.w #$0500
	bcc CODE_9DBC91
	rts
CODE_9DBCB2:
	rts
CODE_9DBCB3:
	lda.w $07D6
CODE_9DBCB6:
	dec a
	bmi CODE_9DBCDE
	sta.w $07D6
	tay
	eor.w #$FFFF
	inc a
	and.w #$00FF
	beq CODE_9DBCD5
	sta.w $0BCB
	sec
	sbc.w #$0020
	bmi CODE_9DBCD5
	and.w #$00FF
	sta.w $0BCF
CODE_9DBCD5:
	tya
	ldx.w #$0200
	jsr.w $B884
	bra CODE_9DBCB6
CODE_9DBCDE:
	stz.w $07D6
	lda.w #$00FF
	sta.w $0BCB
	sta.w $0BCF
	rts
CODE_9DBCEB:
	ldy.w $0BE9
	bne CODE_9DBCF7
	ldy.w #$0000
	jsl.l WaitFrames_Inc
CODE_9DBCF7:
	rtl
CODE_9DBCF8:
	stz.w $0BD5
	ldx.w #$0000
	lda.w #$0000
CODE_9DBD01:
	jsl.l RandomWord
	and.w #$001F
	cmp.w #$001A
	bcs CODE_9DBD01
	phx
	ldx.w #$0000
CODE_9DBD11:
	cpx.w $0BD5
	bcs CODE_9DBD23
	cmp.l $7EF000,x
	beq CODE_9DBD20
	inx
	inx
	bra CODE_9DBD11
CODE_9DBD20:
	plx
	bra CODE_9DBD01
CODE_9DBD23:
	plx
	sta.l $7EF000,x
	inx
	inx
	stx.w $0BD5
	cpx.w #$0034
	bcc CODE_9DBD01
	stz.w $0BD5
	rts
CODE_9DBD36:
	lda.w $0BD5
	inc a
	cmp.w #$001A
	bcc CODE_9DBD45
	jsr.w $BCF8
	lda.w #$0000
CODE_9DBD45:
	sta.w $0BD5
	asl a
	tax
	lda.l $7EF000,x
	rts
CODE_9DBD4F:
	jsl.l CODE_9DE0E9
	lda.b $91
	pha
	stz.w $07C6
	jsl.l CODE_9DC697
	pla
	sta.b $91
	lda.b $91
	pha
	stz.w $1DB9
	jsl.l GetPlayerCount
	lda.b $A5
	clc
	adc.w #$0006
	sta.w $1DC1
	jsl.l CODE_8086BD
	jsl.l CODE_9DBE79
CODE_9DBD7B:
	jsl.l CODE_9DD923
CODE_9DBD7F:
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	bne CODE_9DBDAA
	bit.w #$0100
	bne CODE_9DBE06
	bit.w #$0200
	bne CODE_9DBDAE
	bit.w #$4000
	beq CODE_9DBDA8
	jmp.w $BE5B
CODE_9DBDA8:
	bra CODE_9DBD7F
CODE_9DBDAA:
	pla
	sta.b $91
	rtl
CODE_9DBDAE:
	lda.w $1DB9
	beq CODE_9DBDA8
	dec.w $1DB9
	lda.w $1DB9
	sec
	sbc.w #$0007
	bmi CODE_9DBDFF
	inc a
	inc a
	sta.w $1D9B
	ldy.b $91
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b $95
	ldy.w #$000C
	clc
	adc.b [$95],y
	sta.b $95
CODE_9DBDD8:
	dec.w $1D9B
	beq CODE_9DBDF2
	bmi CODE_9DBDF2
	ldy.w #$0000
CODE_9DBDE2:
	lda.b [$95],y
	and.w #$00FF
	cmp.w $1D9B
	beq CODE_9DBDD8
	iny
	cpy.w #$0006
	bmi CODE_9DBDE2
CODE_9DBDF2:
	dec.w $1D9B
	lda.w $1D9B
	clc
	adc.w #$0007
	sta.w $1DB9
CODE_9DBDFF:
	jsl.l CODE_9DBE79
	jmp.w $BD7B
CODE_9DBE06:
	lda.w $1DB9
	cmp.w $1DC1
	bpl CODE_9DBDA8
	inc.w $1DB9
	lda.w $1DB9
	sec
	sbc.w #$0007
	bmi CODE_9DBE54
	sta.w $1D9B
	ldy.b $91
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b $95
	ldy.w #$000C
	clc
	adc.b [$95],y
	sta.b $95
CODE_9DBE31:
	inc.w $1D9B
	ldy.w #$0000
CODE_9DBE37:
	lda.b [$95],y
	and.w #$00FF
	cmp.w $1D9B
	beq CODE_9DBE31
	iny
	cpy.w #$0006
	bmi CODE_9DBE37
	dec.w $1D9B
	lda.w $1D9B
	clc
	adc.w #$0007
	sta.w $1DB9
CODE_9DBE54:
	jsl.l CODE_9DBE79
	jmp.w $BD7B
CODE_9DBE5B:
	lda.b $91
	eor.w #$0002
	sta.b $91
	stz.w $1DB9
	jsl.l GetPlayerCount
	lda.b $A5
	clc
	adc.w #$0006
	sta.w $1DC1
	jsl.l CODE_9DBE79
	jmp.w $BD7B
CODE_9DBE79:
	jsl.l SpriteFrameStart
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6B3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$0014
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	ldy.b $91
	lda.w HomeTeam,y
	ldx.w #$00C8
	ldy.w #$0010
	jsl.l CODE_9DDFBF
	ldy.b $91
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b $95
	ldy.w #$000C
	clc
	adc.b [$95],y
	sta.b $95
	ldy.w $1DB9
	bne CODE_9DBED6
	jmp.w $C0EE
CODE_9DBED6:
	lda.w $1DB9
	sec
	sbc.w #$0007
	bmi CODE_9DBEE4
	sta.w $1D9B
	bra CODE_9DBF02
CODE_9DBEE4:
	clc
	adc.w #$0006
	tay
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DC298
	sta.b $8D
	lda.b [$8D],y
	and.w #$00FF
	tay
	lda.b [$95],y
	and.w #$00FF
	dec a
	sta.w $1D9B
CODE_9DBF02:
	lda.w $1D9B
	sta.b $A5
	jsl.l CODE_9FC372
	lda.b [$8D]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$000C
	sta.w printy
	jsl.l CODE_9EC7BE
	jsl.l GoalieCount
	lda.w $1D9B
	cmp.b $A5
	bmi CODE_9DBF33
	jmp.w $BFEE
CODE_9DBF33:
	lda.w #$009D
	sta.b $8F
	lda.w #$C2B0
	sta.b $8D
	lda.b [$8D]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$000D
	sta.w printy
	jsl.l CODE_9EC7BE
	jsl.l CODE_9DC374
	ldx.w #$0038
	ldy.w #$007A
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6B8
	sta.b $8D
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b $8D
	lda.w $1E79
	sta.b $A5
	bpl CODE_9DBF83
CODE_9DBF80:
	jmp.w $C0BB
CODE_9DBF83:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$0084
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b $8D
	lda.w $1E7D
	sta.b $A5
	bpl CODE_9DBFA5
CODE_9DBFA2:
	jmp.w $C0BB
CODE_9DBFA5:
	lda.w $1E7F
	cmp.w #$0050
	bpl CODE_9DBFB0
	jmp.w $C0BB
CODE_9DBFB0:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$008E
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b $8D
	lda.w $1E81
	sta.b $A5
	bpl CODE_9DBFD2
CODE_9DBFCF:
	jmp.w $C0BB
CODE_9DBFD2:
	lda.w $1E83
	cmp.w #$0050
	bpl CODE_9DBFDD
CODE_9DBFDA:
	jmp.w $C0BB
CODE_9DBFDD:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$0098
	jsl.l CODE_9C9590
	jmp.w $C0BB
CODE_9DBFEE:
	jsl.l GoalieCount
	lda.b $A5
	sta.b $A9
	jsl.l CODE_9B92DC
	lda.b $A5
	clc
	adc.b $A9
	cmp.w $1D9B
