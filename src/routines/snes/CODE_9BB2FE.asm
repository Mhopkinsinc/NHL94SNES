; Unidentified routine.
CODE_9BB2FE:
	lda.b #$00
CODE_9BB300:
	sta.w $1625
	lda.w sflags
	bit.b #$20
	bne CODE_9BB330
	lda.w WMDATA
	sta.w $0CEB
	lda.w WMDATA
	sta.w $0CEC
	lda.w WMDATA
	sta.w $0D37
	lda.w WMDATA
	sta.w $0D38
	lda.w WMDATA
	sta.w $0C29
	lda.w WMDATA
	sta.w $0C2A
	bra CODE_9BB348
