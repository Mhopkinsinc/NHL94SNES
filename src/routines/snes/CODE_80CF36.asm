; Unidentified routine.
CODE_80CF36:
	lda.w $1DA7
	clc
	adc.w #$0008
	sec
	sbc.w $1D9B
CODE_80CF41:
	sta.w $1D9B
	jsl.l CODE_80D004
CODE_80CF48:
	jsl.l CODE_9DD923
	jsl.l CODE_9DD94D
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	bne CODE_80CF84
	bit.w #$0800
	bne CODE_80CFBE
	bit.w #$0400
	bne CODE_80CFAE
	bit.w #$0100
	bne CODE_80CF8C
	bit.w #$0200
	bne CODE_80CF9E
	bit.w #$8080
	beq CODE_80CF48
	jsl.l CODE_80D2BD
CODE_80CF84:
	lda.w #$0001
	sta.l $7E3468
	rtl
