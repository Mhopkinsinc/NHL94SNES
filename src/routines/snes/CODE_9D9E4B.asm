; Unidentified routine.
CODE_9D9E4B:
	bit.w #$4000
	bne CODE_9D9E9C
	stz.b $A5
	inc.b $A5
	bit.w #$0100
	bne CODE_9D9E89
	dec.b $A5
	dec.b $A5
	bit.w #$0200
	bne CODE_9D9E89
	bit.w #$0800
	bne CODE_9D9E70
	inc.b $A5
	inc.b $A5
	bit.w #$0400
	beq CODE_9D9E86
CODE_9D9E70:
	lda.b $A5
	clc
	adc.w $0D43
	sta.b $A5
	bmi CODE_9D9E86
	cmp.w #$0008
	bcs CODE_9D9E86
	sta.w $0D43
	jsl.l CODE_9D9ECB
CODE_9D9E86:
	jmp.w $9E2D
