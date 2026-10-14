; Unidentified routine.
CODE_9FF992:
	ldx.w #$0000
	ldy.w #$0001
.loop:
	lda.l $7F4000,x
	pha
	and.w #$001F
	cmp.w #$001F
	beq .1
	clc
	adc.w #$0001
	and.w #$001F
.1:
	sta.l $7F4000,x
	pla
	pha
	and.w #$03E0
	cmp.w #$03E0
	beq .2
	clc
	adc.w #$0020
	and.w #$03E0
.2:
	ora.l $7F4000,x
	sta.l $7F4000,x
	pla
	and.w #$7C00
	cmp.w #$7C00
	beq .3
	clc
	adc.w #DMA_OAM
	and.w #$7C00
.3:
	ora.l $7F4000,x
	sta.l $7F4000,x
	and.w #$7FFF
	cmp.w #$7FFF
	beq .4
	ldy.w #$0000
.4:
	inx
	inx
	cpx.w #$0020
	bmi .loop
	tya
	rts
