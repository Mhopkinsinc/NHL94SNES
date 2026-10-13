; Unidentified routine.
CODE_9B9B35:
	lda.w printx
	pha
	lda.w tmdata
	sta.b $8D
	lda.w #$009C
	sta.b $8F
	lda.b $B1
	beq CODE_9B9B4C
	lda.w $1CDE
	sta.b $8D
CODE_9B9B4C:
	ldy.w #$0004
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	lda.b [$8D]
	adc.b $8D
	sta.b $8D
	jsl.l CODE_9EC894
	pla
	sta.w printx
	inc.w printy
	inc.w printy
	rtl
