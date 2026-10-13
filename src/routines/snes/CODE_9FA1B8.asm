; Unidentified routine.
CODE_9FA1B8:
	lda.b $91
	beq CODE_9FA1BF
	lda.w #$001A
CODE_9FA1BF:
	sta.b $89
CODE_9FA1C1:
	ldy.b $89
	lda.w tmboxlist,y
	inc.b $89
	and.w #$00FF
	sta.b $A5
	bit.w #$0080
	bne CODE_9FA1EB
	lda.b $91
	beq CODE_9FA1D9
	lda.w #$0034
CODE_9FA1D9:
	clc
	adc.b $A5
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne CODE_9FA1C1
	jsl.l pplpen
	bra CODE_9FA1C1
