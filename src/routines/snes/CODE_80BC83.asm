; Unidentified routine.
CODE_80BC83:
	lda.b $7B
	asl a
	sta.b $00
	lda.w $0100,y
	sta.b $01
	iny
	cmp.b $73
	bne .1
	lda.b $7B
	inc a
	sta.b $74
	lda.b #$12
	sta.b $00
.1:
	sty.b $04
	ldy.b $7D
	bra CODE_80BCAC
