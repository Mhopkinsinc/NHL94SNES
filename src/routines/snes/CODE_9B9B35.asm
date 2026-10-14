; Unidentified routine.
CODE_9B9B35:
	lda.w printx
	pha
	lda.w tmdata
	sta.b a1
	lda.w #$009C
	sta.b $8F
	lda.b d3
	beq CODE_9B9B4C
	lda.w $1CDE
	sta.b a1
CODE_9B9B4C:
	ldy.w #$0004
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	lda.b [a1]
	adc.b a1
	sta.b a1
	jsl.l CODE_9EC894
	pla
	sta.w printx
	inc.w printy
	inc.w printy
	rtl
