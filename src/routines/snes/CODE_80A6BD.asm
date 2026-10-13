; Unidentified routine.
CODE_80A6BD:
	asl a
	sta.w $0800
	lda.b $4A
	sta.w $08FA,x
	ldy.b #$2A
	lda.b ($4E),y
	sta.w $0912,x
	ldy.b #$15
	lda.b ($4E),y
	bpl CODE_80A6D7
	lda.b #$02
	bra CODE_80A6D9
