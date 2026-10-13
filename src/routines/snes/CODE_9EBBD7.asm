; Unidentified routine.
CODE_9EBBD7:
	ldy.b $95
	lda.w tmap,y
	cmp.w #$0006
	beq CODE_9EBC23
	lda.b $A5
	sec
	sbc.b $B1
	sta.b $A5
	lda.b $95
	beq CODE_9EBBEF
	lda.w #$001A
CODE_9EBBEF:
	sta.b $89
CODE_9EBBF1:
	ldy.b $89
	lda.w tmboxlist,y
	inc.b $89
	and.w #$00FF
	sta.b $AD
	bit.w #$0080
	bne CODE_9EBC23
	lda.b $95
	beq CODE_9EBC09
	lda.w #$0034
CODE_9EBC09:
	clc
	adc.b $AD
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne CODE_9EBBF1
	lda.b $A5
	cmp.w tmpdst,y
	bmi CODE_9EBC23
	lda.b $A5
	clc
	adc.b $B1
	sta.b $A5
CODE_9EBC23:
	rtl
