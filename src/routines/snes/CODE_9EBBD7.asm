; Unidentified routine.
CODE_9EBBD7:
	ldy.b a3
	lda.w tmap,y
	cmp.w #$0006
	beq CODE_9EBC23
	lda.b d0
	sec
	sbc.b d3
	sta.b d0
	lda.b a3
	beq CODE_9EBBEF
	lda.w #$001A
CODE_9EBBEF:
	sta.b a0
CODE_9EBBF1:
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d2
	bit.w #$0080
	bne CODE_9EBC23
	lda.b a3
	beq CODE_9EBC09
	lda.w #$0034
CODE_9EBC09:
	clc
	adc.b d2
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne CODE_9EBBF1
	lda.b d0
	cmp.w tmpdst,y
	bmi CODE_9EBC23
	lda.b d0
	clc
	adc.b d3
	sta.b d0
CODE_9EBC23:
	rtl
