; Unidentified routine.
CODE_9D9454:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D945A:
	txa
	clc
	adc.b #$0F
	tax
	lda.b $03,s
	and.b #$04
	beq CODE_9D946D
	lda.b #$7F
	sta.l $7F6700,x
	bra CODE_9D9473
