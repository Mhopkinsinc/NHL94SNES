; Unidentified routine.
GetShifter:
	lda.w #$FFF0
	sta.b $AD
	lda.w #$0010
	sta.b $A9
	lda.l $7E35D4
	tay
CODE_9D98C4:
	lda.b $AD
	clc
	adc.b $A9
	sta.b $AD
	lsr.b $A9
	dey
	bpl CODE_9D98C4
	dec.b $A9
	rtl
