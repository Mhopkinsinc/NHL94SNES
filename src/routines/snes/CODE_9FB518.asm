; Unidentified routine.
CODE_9FB518:
	stz.w $1E9D
	stz.b $A5
	jsl.l CODE_9FB54F
	lda.w #$0020
	sta.b $A5
	jsl.l CODE_9FB54F
	ldx.b $95
	lda.w $1003,x
	bpl CODE_9FB517
	lda.w $1023,x
	bpl CODE_9FB517
	stz.b $91
	lda.w #$0001
	sta.b $A5
	inc a
	sta.b $8D
	jsl.l CODE_9FB44C
	lda.w #$001C
	sta.b $A5
	ldx.b $95
	jml.l CODE_9E8C18
