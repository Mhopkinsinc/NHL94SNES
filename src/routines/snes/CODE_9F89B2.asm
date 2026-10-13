; Unidentified routine.
CODE_9F89B2:
	lda.w pfalock,x
	bne CODE_9F89D5
	lda.w $0B7D,x
	asl a
	asl a
	tax
	lda.l asstab,x
	sta.w $1D5A
	lda.l asstab+1,x
	sta.w $1D5B
	ldx.b $E4
	jsl.l CODE_9FC757
	jsl.l $001D59
CODE_9F89D5:
	lda.w position,x
	ora.w gmclock
	bne CODE_9F8A44
	cpx.w #$0018
	bcs CODE_9F8A44
	cpx.w puckc
	beq CODE_9F8A44
	lda.w $0B05,x
	bit.w #$0001
	bne CODE_9F8A44
	lda.w Xpos,x
	cmp.w #$FFD5
	bpl CODE_9F8A04
	cmp.w #$FFCF
	bmi CODE_9F8A14
	lda.w #$FFD5
	stz.w Xvel,x
	bra CODE_9F8A14
