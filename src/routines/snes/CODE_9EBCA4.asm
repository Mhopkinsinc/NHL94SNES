; Unidentified routine.
CODE_9EBCA4:
	jsl.l CODE_9EC124
	lda.b $A5
	cmp.w #$0005
	bcs CODE_9EBCB8
	lda.w #$0022
	sta.b $A5
	jsl.l AddPenalty
CODE_9EBCB8:
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	lda.w #$FFFF
	sta.w $0CDB
	rtl
	lda.w pflags,x
	bit.w #$0002
	bne CODE_9EBCD2
	jmp.w $BD1D
