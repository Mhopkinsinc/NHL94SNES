; Unidentified routine.
CODE_9DB72F:
	ldx.w #$0BCB
	lda.w #$0000
CODE_9DB735:
	sta.b $00,x
	inx
	inx
	cpx.w #$0C01
	bcc CODE_9DB735
	rts
