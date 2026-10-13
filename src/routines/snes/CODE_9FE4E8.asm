; Unidentified routine.
CODE_9FE4E8:
	lda.w #$0010
	sta.w $1EB9
	lda.w #$0000
	sta.w $1EB7
CODE_9FE4F4:
	lda.w $0D13
	clc
	adc.w #$0005
	cmp.w $1EB9
	bcc CODE_9FE503
	dec.w $0D13
CODE_9FE503:
	rtl
