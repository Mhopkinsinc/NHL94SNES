; Unidentified routine.
CODE_9EC6E7:
	jsl.l CODE_9EC64B
	lda.w $1638
	sta.w $1E8B
	beq CODE_9EC72C
	lda.w $1E9B
	bne CODE_9EC704
	lda.w #$7000
	sta.b $64
	lda.w #$0005
	jsl.l CODE_80A17D
CODE_9EC704:
	lda.w $19BE
	clc
	adc.w #$0014
	bmi CODE_9EC710
	sta.w $19BE
CODE_9EC710:
	phy
	ldy.w #$0000
	lda.w puckc
	cmp.w #$000C
	bmi CODE_9EC71F
	ldy.w #$0002
CODE_9EC71F:
	lda.w $1E9B
	bne CODE_9EC72B
	lda.w $17C2,y
	inc a
	sta.w $17C2,y
CODE_9EC72B:
	ply
CODE_9EC72C:
	rtl
