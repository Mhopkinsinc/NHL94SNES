; Unidentified routine.
CODE_9ECB5D:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF796
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $0D47
	clc
	adc.w printx
	sta.w printx
	lda.w VertLineScrolling
	clc
	adc.w printy
	sta.w printy
	jsl.l print
	lda.w $0D47
	clc
	adc.b d1
	sta.w $0D47
	rtl
