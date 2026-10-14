; Unidentified routine.
CODE_9FA2D1:
	lda.w #$0708
	sta.w $0CE3
	lda.w #$0001
	sta.w $0D2F
	lda.b $83
	sec
	sbc.w #$0150
	sta.w $0D33
	jsl.l CODE_9FA37A
	lda.w $0D31
	sta.l $7E35DC
	stz.w $0D13
	stz.w $0D15
	lda.w #$FFFF
	sta.w $0AC6
	ldy.w #$FFFE
CODE_9FA300:
	iny
	iny
	cpy.w #$000A
	bcs CODE_9FA313
	lda.w $1C84,y
	beq CODE_9FA300
	eor.w #$FFFF
	inc a
	sta.w $0AC6
CODE_9FA313:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne CODE_9FA327
	stz.w $0AC6
CODE_9FA327:
	lda.w #$0001
	sta.w $1A10
CODE_9FA32D:
	lda.w #$0000
	ldy.w #$001E
CODE_9FA333:
	sta.w Xpos,y
	dey
	dey
	bpl CODE_9FA333
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F862
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0016
	sta.b d0
	lda.w #$0007
	sta.b d1
	jsl.l CODE_9D8000
	jsl.l CODE_9F9B36
	jsl.l CODE_9FE11D
	bne CODE_9FA32D
	lda.w #$0000
	sta.l $7E3476
	stz.w $1A10
	stz.w $0D2F
CODE_9FA379:
	rtl
