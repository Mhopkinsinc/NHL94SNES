; Unidentified routine.
CODE_9E9B3C:
	lda.w $0EC3,y
	sta.b $0C
	lda.w $0EE3,y
	sta.b $0E
CODE_9E9B46:
	asl.b $0C
	asl.b $0E
	lda.w #$000F
	jsl.l CODE_9C9AD0
	rtl
