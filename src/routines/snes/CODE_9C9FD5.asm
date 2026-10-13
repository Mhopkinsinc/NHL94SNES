; Unidentified routine.
CODE_9C9FD5:
	ldy.w $0C23
	bne CODE_9C9FEC
	sta.w $0C23
	asl a
	asl a
	asl a
	sta.w $0C29
	lda.w #$000B
	sta.w $0C27
	stz.w $0C25
CODE_9C9FEC:
	rtl
