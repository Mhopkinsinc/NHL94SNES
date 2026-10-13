; Unidentified routine.
CODE_9B852C:
	lda.b $B1
	beq CODE_9B8543
	lda.b $AD
	bne CODE_9B8544
	dec.w $0AC4
	bpl CODE_9B8543
	lda.w #$0006
	sta.w $0AC4
	lda.b $B1
	sta.b $A9
CODE_9B8543:
	rtl
