; Unidentified routine.
CODE_9ECF0E:
	lda.l $9ABD6F
	clc
	adc.l $7E35AE
	adc.l $7E35A8
	ora.w printa
	ldx.b $A9
	sta.l $7E37F4,x
	sta.l $7E3834,x
	txa
	lsr a
	cmp.w $0CD5
	bcs CODE_9ECF32
	sta.w $0CD5
CODE_9ECF32:
	clc
	adc.w #$0020
	cmp.w $0CD7
	bcc CODE_9ECF07
	sta.w $0CD7
	bra CODE_9ECF07
