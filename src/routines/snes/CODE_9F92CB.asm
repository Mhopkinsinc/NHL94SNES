; Unidentified routine.
CODE_9F92CB:
	ldx.w #$0000
CODE_9F92CE:
	lda.w $15D3,x
	sta.l $7E47F4,x
	inx
	inx
	cpx.w #$0781
	bcc CODE_9F92CE
	lda.l $7E313A
	sta.l $7E47F4,x
	inx
	inx
	stz.w tmgoalie
	stz.w $17AC
	stz.w $19D0
	stz.w $19D2
	lda.w #$FFFF
	ldx.w #$0000
CODE_9F92F8:
	sta.w $19D4,x
	inx
	inx
	cpx.w #$0018
	bcc CODE_9F92F8
	jsl.l ClearPenaltyBuffer
	rtl
