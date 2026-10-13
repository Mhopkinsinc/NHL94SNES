; Unidentified routine.
CODE_9EE564:
	lda.w #$0108
	sec
	sbc.w Ypos,x
	sta.b $A9
CODE_9EE56D:
	jsl.l vtoa
	jsl.l Findhittype
	beq CODE_9EE57C
	lda.w #DATA8_9DF020
	bra CODE_9EE57F
