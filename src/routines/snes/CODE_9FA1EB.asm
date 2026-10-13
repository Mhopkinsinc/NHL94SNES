; Unidentified routine.
CODE_9FA1EB:
	lda.b $91
	beq CODE_9FA1F2
	lda.w #$001A
CODE_9FA1F2:
	sta.b $89
CODE_9FA1F4:
	ldy.b $89
	lda.w tmboxlist,y
	inc.b $89
	and.w #$00FF
	sta.b $A5
	bit.w #$0080
	bne CODE_9FA1B7
	lda.b $91
	beq CODE_9FA20C
	lda.w #$0034
CODE_9FA20C:
	clc
	adc.b $A5
	tay
	lda.w tmpdst,y
	bit.w #$4000
	beq CODE_9FA1F4
	jsl.l pplpen
	bra CODE_9FA1F4
