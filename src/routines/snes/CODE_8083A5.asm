; Unidentified routine.
CODE_8083A5:
	stx.b $3A
	rep #$20
	lda.b $3E
	cmp.w #$026E
	bcc CODE_8083DD
	sep #$20
	lda.w OAMReady
	beq CODE_8083DD
	stz.w OAMReady
	lda.b #$7E
	sta.w A1B0
	rep #$20
	lda.w #DMA_OAM
	sta.w DMAP0
	lda.w OAMShowBuf
	sta.w A1T0L
	lda.w #$0220
	sta.w DAS0L
	stz.w OAMADDL
	sep #$20
	lda.b #$01
	sta.w MDMAEN
CODE_8083DD:
	rep #$30
	lda.l $7E35D8
	clc
	adc.l $7E35DA
	sta.l $7E35D8
	lda.b $83
	adc.w #$0001
	sta.b $83
	bcc CODE_8083F7
CODE_8083F5:
	inc.b $85
CODE_8083F7:
	lda.w $0AD1
	beq CODE_80843E
	bmi CODE_80841F
	cmp.w #$0001
	bne CODE_808415
	lda.w $0AD3
	cmp.w #$000F
	bcs CODE_808435
	lda.w STAT77
	bmi CODE_80843E
	inc.w $0AD3
	bra CODE_80843E
