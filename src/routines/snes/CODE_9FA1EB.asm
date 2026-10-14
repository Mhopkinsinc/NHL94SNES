; Unidentified routine.
CODE_9FA1EB:
	lda.b a2
	beq CODE_9FA1F2
	lda.w #$001A
CODE_9FA1F2:
	sta.b a0
CODE_9FA1F4:
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne CODE_9FA1B7
	lda.b a2
	beq CODE_9FA20C
	lda.w #$0034
CODE_9FA20C:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bit.w #$4000
	beq CODE_9FA1F4
	jsl.l pplpen
	bra CODE_9FA1F4
