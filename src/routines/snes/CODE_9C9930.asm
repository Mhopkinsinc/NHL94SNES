; Unidentified routine.
CODE_9C9930:
	lda.l $7E35E0
	cmp.w #$0380
	bcc CODE_9C993C
	lda.w #$0380
CODE_9C993C:
	clc
	adc.w #$0080
	asl a
	asl a
	asl a
	asl a
	sta.w $093C
	phx
	tax
	lda.w #$0015
	jsl.l DivX8U
	plx
	clc
	adc.w #$0253
	sta.w $094C
	lda.w $093C
	cmp.w #$2733
	bcs CODE_9C9967
	lda.w #$0100
	sta.w $093A
	rtl
