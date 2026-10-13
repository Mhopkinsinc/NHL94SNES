; Unidentified routine.
CODE_9B8792:
	stz.b $A5
	inc.b $A5
	bit.w #$0100
	bne CODE_9B87C9
	dec.b $A5
	dec.b $A5
	bit.w #$0200
	bne CODE_9B87C9
	bit.w #$0400
	bne CODE_9B87B2
	inc.b $A5
	inc.b $A5
	bit.w #$0800
	beq CODE_9B880D
CODE_9B87B2:
	lda.b $A5
	clc
	adc.w $1D8B
	bmi CODE_9B880D
	cmp.w $1D9F
	bpl CODE_9B880D
	sta.w $1D8B
	jsl.l CODE_9B8810
	jmp.w $880D
