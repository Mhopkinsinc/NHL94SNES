; Unidentified routine.
CODE_9EC042:
	lda.w gmode
	bit.w #$0010
	bne .t3
	lda.b a2
	cmp.w shotPlIdx
	bne .t3
	lda.w $1E8B
	bne .t2
	jmp.w .t3

.t2:
	jsl.l CODE_9EC64B
	lda.w $1638
	sta.w $1E8B
	bne .t1
	jmp.w .t3

.t1:
	lda.w #$FFFF
	bra CODE_9EC070

.t3:
	lda.w #$0000
CODE_9EC070:
	rtl
