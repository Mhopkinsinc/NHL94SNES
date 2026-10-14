; Unidentified routine.
CODE_9C88A0:
	lda.b d1
	pha
	lda.w $1DF9
	beq CODE_9C88DF
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF309
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1DC5
	sta.b d1
	dec.b d1
	lda.w #$007E
	sta.b $0E
	lda.w #$39B4
	sta.b $0C
	ldy.w #$00E0
	ldx.w #$00C0
	jsl.l CODE_80891F
	bra CODE_9C8912
