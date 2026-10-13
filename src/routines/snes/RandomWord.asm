; Unidentified routine.
RandomWord:
	lda.w $0792
	beq CODE_808679
	asl a
	bcc CODE_808663
	eor.w #$1D87
CODE_808663:
	sta.w $0792
	lda.w $0794
	beq CODE_80867E
	asl a
	bcc CODE_808671
	eor.w #$1D87
CODE_808671:
	sta.w $0794
	clc
	adc.w $0792
	rtl
