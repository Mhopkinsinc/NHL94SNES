; Unidentified routine.
CODE_9D9A0E:
	lda.l $7E34CA
	asl a
	asl a
	sta.b d0
	tay
	lda.w #$009D
	sta.b $8B
	lda.w #$9A48
	sta.b a0
	iny
	iny
CODE_9D9A23:
	jsl.l CODE_9FC79F
	rtl
