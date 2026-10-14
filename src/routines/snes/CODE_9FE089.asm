; Unidentified routine.
CODE_9FE089:
	stz.b d0
	lda.b a2
	bne CODE_9FE091
	inc.b d0
CODE_9FE091:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8E4
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w gmode
	bit.w #$0002
	beq CODE_9FE0BA
	lda.b d0
	eor.w #$0001
	sta.b d0
CODE_9FE0BA:
	phx
	lda.w #$0015
	ldx.b d0
	jsl.l CODE_808F4C
	plx
	adc.w printy
	sta.w printy
	lda.w #$0002
	sta.b d0
	jsl.l getlchoice
	lda.w #$0006
	sta.b d1
	lda.b d0
	bpl CODE_9FE0E2
	dec.b d1
	inc.w printy
CODE_9FE0E2:
	lda.w #$000C
	sta.b d0
	rtl
