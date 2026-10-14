; Unidentified routine.
CODE_9F92CB:
	ldx.w #$0000
.loop:
	lda.w $15D3,x
	sta.l $7E47F4,x
	inx
	inx
	cpx.w #$0781
	bcc .loop
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
.loop2:
	sta.w $19D4,x
	inx
	inx
	cpx.w #$0018
	bcc .loop2
	jsl.l ClearPenaltyBuffer
	rtl
