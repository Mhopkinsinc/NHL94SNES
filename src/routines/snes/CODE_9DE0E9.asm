; Unidentified routine.
CODE_9DE0E9:
	stz.b $91
	ldx.w $0AC6
	lda.w $1C84,x
	cmp.w #$0002
	bne CODE_9DE0FB
	lda.w #$0002
	sta.b $91
CODE_9DE0FB:
	rtl
