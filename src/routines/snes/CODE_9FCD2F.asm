; Unidentified routine.
CODE_9FCD2F:
	ldy.w #$0000
	cpx.w #$000C
	bcc CODE_9FCD3A
	ldy.w #$0002
CODE_9FCD3A:
	lda.w $1C94,y
	bne CODE_9FCD40
	rtl
