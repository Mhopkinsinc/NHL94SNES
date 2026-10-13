; Unidentified routine.
CODE_9C88DF:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF32C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1DC1
	sta.b $A9
	lda.w #$007E
	sta.b $0E
	lda.w #$39B4
	sta.b $0C
	ldy.w #$00E0
	ldx.w #$04C0
	jsl.l CODE_80891F
CODE_9C8912:
	lda.w $1DB9
	xba
	lsr a
	adc.w #$2780
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	lda.b $A9
	xba
	lsr a
	adc.w #$0040
	tax
	ldy.w #$0160
	jsl.l CODE_80891F
	pla
	sta.b $A9
	rtl
