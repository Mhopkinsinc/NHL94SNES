; Update the ticker scores of the other playoff games
UpdateScores:
	jsl.l GetShifter
	lda.b d1
	sta.w $0D31
	asl a
	sta.b a0
CODE_9F971E:
	lda.b d1
	cmp.l $7E35D6
	beq CODE_9F973C
	ldx.b a0
	lda.l $7E3598,x
	and.w #$FFFD
	sta.l $7E3598,x
	bit.w #$0004
	bne CODE_9F973C
	jsl.l CODE_9F9EB7
CODE_9F973C:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl CODE_9F971E
	rtl
