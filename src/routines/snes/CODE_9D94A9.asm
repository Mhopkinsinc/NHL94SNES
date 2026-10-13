; Unidentified routine.
CODE_9D94A9:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D94AF:
	inx
	lda.b $03,s
	and.b #$02
	beq CODE_9D94BE
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D94C4
