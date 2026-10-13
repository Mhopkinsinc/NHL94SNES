; Unidentified routine.
CODE_9FCD4D:
	ldy.w #$0000
	cpx.w #$000C
	bcc CODE_9FCD58
	ldy.w #$0002
CODE_9FCD58:
	lda.w $1C94,y
	bne CODE_9FCD5E
	rtl
