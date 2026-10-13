; Unidentified routine.
CODE_9F9307:
	ldx.w #$0000
CODE_9F930A:
	lda.l $7E47F4,x
	sta.w $15D3,x
	inx
	inx
	cpx.w #$0781
	bcc CODE_9F930A
	lda.l $7E47F4,x
	inx
	inx
	sta.l $7E313A
	rtl
