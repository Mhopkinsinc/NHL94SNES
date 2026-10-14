; Unidentified routine.
CODE_9BC989:
	stz.b d0
	dec.b d0
	bit.w #$4000
	bne CODE_9BC9C0
	stz.b d0
	inc.b d0
	bit.w #$8080
	bne CODE_9BC9C0
	bit.w #$0100
	bne CODE_9BC9F0
	stz.b d0
	dec.b d0
	bit.w #$0200
	bne CODE_9BC9F0
	ldy.w #$0006
	sty.b d0
	bit.w #DMA_OAM
	bne CODE_9BC9F0
	ldy.w #$FFFA
	sty.b d0
	bit.w #$0800
	bne CODE_9BC9F0
	jmp.w CODE_9BC949
