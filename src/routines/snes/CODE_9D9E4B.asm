; Unidentified routine.
CODE_9D9E4B:
	bit.w #$4000
	bne CODE_9D9E9C
	stz.b d0
	inc.b d0
	bit.w #$0100
	bne CODE_9D9E89
	dec.b d0
	dec.b d0
	bit.w #$0200
	bne CODE_9D9E89
	bit.w #$0800
	bne CODE_9D9E70
	inc.b d0
	inc.b d0
	bit.w #DMA_OAM
	beq CODE_9D9E86
CODE_9D9E70:
	lda.b d0
	clc
	adc.w SelectedPlayerIdx
	sta.b d0
	bmi CODE_9D9E86
	cmp.w #$0008
	bcs CODE_9D9E86
	sta.w SelectedPlayerIdx
	jsl.l CODE_9D9ECB
CODE_9D9E86:
	jmp.w CODE_9D9E2D
