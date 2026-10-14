; Unidentified routine.
CODE_9FB518:
	stz.w $1E9D
	stz.b d0
	jsl.l CODE_9FB54F
	lda.w #$0020
	sta.b d0
	jsl.l CODE_9FB54F
	ldx.b a3
	lda.w $1003,x
	bpl CODE_9FB517
	lda.w $1023,x
	bpl CODE_9FB517
	stz.b a2
	lda.w #$0001
	sta.b d0
	inc a
	sta.b a1
	jsl.l CODE_9FB44C
	lda.w #$001C
	sta.b d0
	ldx.b a3
	jml.l assreplace
