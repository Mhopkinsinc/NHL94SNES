; Unidentified routine.
GetLowestPen:
	stz.b $A5
	stz.b $B1
	lda.b $91
	beq CODE_9EBB9D
	lda.w #$001A
CODE_9EBB9D:
	sta.b $89
CODE_9EBB9F:
	ldy.b $89
	inc.b $89
	lda.w tmboxlist,y
	and.w #$00FF
	sta.b $AD
	bit.w #$0080
	bne CODE_9EBBD7
	lda.b $91
	beq CODE_9EBBB7
	lda.w #$0034
CODE_9EBBB7:
	clc
	adc.b $AD
	tay
	lda.w tmpdst,y
	sta.b $AD
	bit.w #$4000
	bne CODE_9EBB9F
	lda.b $AD
	sec
	sbc.b $B1
	sta.b $AD
	clc
	adc.b $A5
	sta.b $A5
	lda.b $AD
	sta.b $B1
	bra CODE_9EBB9F
