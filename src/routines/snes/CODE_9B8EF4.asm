; Unidentified routine.
CODE_9B8EF4:
	stz.b $A5
	inc.b $A5
	bit.w #$0100
	bne CODE_9B8F2B
	dec.b $A5
	dec.b $A5
	bit.w #$0200
	bne CODE_9B8F2B
	bit.w #$0400
	bne CODE_9B8F14
	inc.b $A5
	inc.b $A5
	bit.w #$0800
	beq CODE_9B8F28
CODE_9B8F14:
	lda.b $A5
	clc
	adc.w $1D9B
	bmi CODE_9B8F3E
	cmp.w $1DAF
	bpl CODE_9B8F5D
	sta.w $1D9B
	jsl.l CODE_9B8F7B
CODE_9B8F28:
	jmp.w CODE_9B8EBC
