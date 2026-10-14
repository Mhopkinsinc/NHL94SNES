; Unidentified routine.
CODE_9B8792:
	stz.b d0
	inc.b d0
	bit.w #$0100
	bne CODE_9B87C9
	dec.b d0
	dec.b d0
	bit.w #$0200
	bne CODE_9B87C9
	bit.w #DMA_OAM
	bne CODE_9B87B2
	inc.b d0
	inc.b d0
	bit.w #$0800
	beq CODE_9B880D
CODE_9B87B2:
	lda.b d0
	clc
	adc.w $1D8B
	bmi CODE_9B880D
	cmp.w $1D9F
	bpl CODE_9B880D
	sta.w $1D8B
	jsl.l CODE_9B8810
	jmp.w CODE_9B880D
