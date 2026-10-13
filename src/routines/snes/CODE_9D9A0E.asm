; Unidentified routine.
CODE_9D9A0E:
	lda.l $7E34CA
	asl a
	asl a
	sta.b $A5
	tay
	lda.w #$009D
	sta.b $8B
	lda.w #$9A48
	sta.b $89
	iny
	iny
CODE_9D9A23:
	jsl.l CODE_9FC79F
	rtl
