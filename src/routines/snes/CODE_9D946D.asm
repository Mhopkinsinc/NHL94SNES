; Unidentified routine.
CODE_9D946D:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D9473:
	inx
	lda.b $03,s
	and.b #$08
	beq CODE_9D9482
	lda.b #$7F
	sta.l $7F6700,x
	bra CODE_9D9488
