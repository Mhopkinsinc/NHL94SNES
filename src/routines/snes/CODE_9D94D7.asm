; Unidentified routine.
CODE_9D94D7:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D94DD:
	inx
	lda.b $03,s
	and.b #$08
	beq CODE_9D94EC
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D94F2
