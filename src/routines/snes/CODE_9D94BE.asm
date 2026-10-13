; Unidentified routine.
CODE_9D94BE:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D94C4:
	txa
	clc
	adc.b #$0F
	tax
	lda.b $03,s
	and.b #$04
	beq CODE_9D94D7
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D94DD
