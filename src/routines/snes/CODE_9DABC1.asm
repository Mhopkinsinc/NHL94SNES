; Unidentified routine.
CODE_9DABC1:
	lda.w #$0078
	sta.l $7E3458
	lda.l $7E345E
	inc a
	cmp.w #$0007
	bcc CODE_9DABD5
	lda.w #$0000
CODE_9DABD5:
	sta.l $7E345E
	cmp.w #$0006
	beq CODE_9DAC21
	lda.l $7E3452
	cmp.w #$001C
	bpl CODE_9DABF4
	lda.w #$FFFF
	sta.l $7E3452
	ldx.w #$0000
	jsr.w $AC22
CODE_9DABF4:
	lda.l $7E3454
	cmp.w #$001C
	bpl CODE_9DAC0A
	lda.w #$FFFF
	sta.l $7E3454
	ldx.w #$0002
	jsr.w $AC22
CODE_9DAC0A:
	stz.b $91
	lda.l $7E345E
	sta.l $7E345A
	lda.w #$0002
	sta.b $91
	lda.l $7E345E
	sta.l $7E345C
CODE_9DAC21:
	rts
