; Unidentified routine.
CODE_9DBD23:
	plx
	sta.l $7EF000,x
	inx
	inx
	stx.w $0BD5
	cpx.w #$0034
	bcc CODE_9DBD01
	stz.w $0BD5
	rts
