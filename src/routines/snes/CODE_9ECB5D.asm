; Unidentified routine.
CODE_9ECB5D:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF796
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D47
	clc
	adc.w printx
	sta.w printx
	lda.w $0D49
	clc
	adc.w printy
	sta.w printy
	jsl.l CODE_9EC7BE
	lda.w $0D47
	clc
	adc.b $A9
	sta.w $0D47
	rtl
