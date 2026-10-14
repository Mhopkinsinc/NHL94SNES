; Unidentified routine.
CODE_9BA0A2:
	ldy.w #$0006
	lda.b [$10],y
	asl a
	adc.b [$10],y
	sta.w $0C7F,x
	ldy.w $0C55,x
	lda.b [$0C],y
	bmi CODE_9BA076
	tax
	lda.b [$10]
	jsl.l Mul8U
	ldy.w #$0004
	clc
	adc.b [$10],y
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$8000
	sta.b $0C
	lda.w #$0090
	sta.b $0E
	ldy.w #$0002
	lda.b [$10],y
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$1000
	tay
	lda.b [$10]
	asl a
	asl a
	asl a
	asl a
	asl a
	tax
	jsl.l DMAToVRAM
	ldx.b $08
	cpx.w #$0028
	bne CODE_9BA106
	lda.w $0C51
	bne CODE_9BA106
	lda.w #$000A
	sta.w $0C4F
	sta.w $0C51
	stz.w $0CA3
	stz.w $0CA5
CODE_9BA106:
	ldx.b $08
	dex
	dex
	bmi .t1
	jmp.w CODE_9B9FDC

.t1:
	rtl
