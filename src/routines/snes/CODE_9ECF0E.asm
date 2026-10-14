; Unidentified routine.
CODE_9ECF0E:
	lda.l $9ABD6F
	clc
	adc.l $7E35AE
	adc.l printfontset
	ora.w $0D0D
	ldx.b d1
	sta.l textmap,x
	sta.l $7E3834,x
	txa
	lsr a
	cmp.w textdirtylo
	bcs CODE_9ECF32
	sta.w textdirtylo
CODE_9ECF32:
	clc
	adc.w #$0020
	cmp.w textdirtyhi
	bcc CODE_9ECF07
	sta.w textdirtyhi
	bra CODE_9ECF07
