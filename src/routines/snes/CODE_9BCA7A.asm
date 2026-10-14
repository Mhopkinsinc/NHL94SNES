; Unidentified routine.
CODE_9BCA7A:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF227
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w printx
	clc
	adc.b d4
	sta.w printx
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #SelectLeft
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	rtl
