; Unidentified routine.
CODE_9EBDF8:
	ldy.b a2
	lda.w $19D0,y
	cmp.w #$0004
	bcc CODE_9EBE24
CODE_9EBE02:
	sta.b d1
	lda.w #$0006
	sta.b d0
	lda.w tmsort,y
	tax
	ldy.w #$0000
CODE_9EBE10:
	lda.w position,x
	bmi CODE_9EBE18
	beq CODE_9EBE18
	iny
CODE_9EBE18:
	inx
	inx
	dec.b d0
	bne CODE_9EBE10
	cpy.b d1
	beq CODE_9EBE35
	bcc CODE_9EBE35
CODE_9EBE24:
	ldx.b $E4
	lda.w $19D4,x
	bpl CODE_9EBE2E
	jmp.w CODE_80BDF7
