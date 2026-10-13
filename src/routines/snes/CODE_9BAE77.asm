; Unidentified routine.
CODE_9BAE77:
	lda.w $0CAB
	cmp.w #$FFFF
	bne CODE_9BAECF
	lda.w $0AE7
	cmp.w #$000F
	beq CODE_9BAE9D
	asl a
	tax
	lda.w #$000F
	sta.w $0AF3
	lda.w Xpos,x
	sta.w $0D75
	lda.w Ypos,x
	sta.w $0DD7
	bra CODE_9BAECF
