; Unidentified routine.
CODE_9FAF97:
	lda.w #$0001
	sta.w printy
	lda.w #$0006
	sta.w printx
	lda.w #$0014
	sta.b d0
	lda.w #$0008
	sta.b d1
CODE_9FAFAD:
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	stz.w $0764
	stz.w $1D6D
	rtl
