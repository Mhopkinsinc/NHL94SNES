; Unidentified routine.
SuperAdd:
	phx
	lda.l $7E3508
	clc
	adc.b $A5
	sta.l $7E3508
	bcc CODE_9BB4C6
	ldx.w #$0002
CODE_9BB4B4:
	lda.l $7E3508,x
	inc a
	sta.l $7E3508,x
	bne CODE_9BB4C6
	inx
	inx
	cpx.w #$0010
	bne CODE_9BB4B4
CODE_9BB4C6:
	plx
	clc
	rtl
