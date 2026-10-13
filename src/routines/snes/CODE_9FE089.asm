; Unidentified routine.
CODE_9FE089:
	stz.b $A5
	lda.b $91
	bne CODE_9FE091
	inc.b $A5
CODE_9FE091:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8E4
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w gmode
	bit.w #$0002
	beq CODE_9FE0BA
	lda.b $A5
	eor.w #$0001
	sta.b $A5
CODE_9FE0BA:
	phx
	lda.w #$0015
	ldx.b $A5
	jsl.l CODE_808F4C
	plx
	adc.w printy
	sta.w printy
	lda.w #$0002
	sta.b $A5
	jsl.l getlchoice
	lda.w #$0006
	sta.b $A9
	lda.b $A5
	bpl CODE_9FE0E2
	dec.b $A9
	inc.w printy
CODE_9FE0E2:
	lda.w #$000C
	sta.b $A5
	rtl
