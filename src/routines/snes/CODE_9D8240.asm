; Unidentified routine.
CODE_9D8240:
	lda.w #$FFFF
	sta.w $1E3F
CODE_9D8246:
	lda.w $1DB9
	inc a
	cmp.w #$0007
	bcc .1
	lda.w #$0000
.1:
	sta.w $1DB9
	jsl.l CODE_9D8489
	stz.w $1E3D
	bra CODE_9D8217
