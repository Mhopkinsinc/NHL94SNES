; Unidentified routine.
CODE_9D927C:
	lda.w #$0002
	sta.b $B3
CODE_9D9281:
	lda.w Hscroll
	clc
	adc.b $B3
	cmp.b $AF
	bcs CODE_9D928E
	jmp.w CODE_9D9394
