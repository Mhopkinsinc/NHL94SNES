; Unidentified routine.
CODE_9DA94A:
	lda.b d3
	clc
	adc.b d2
	cmp.w #$0000
	beq CODE_9DA966
	cmp.w #$0003
	beq CODE_9DA966
	cmp.w #$0005
	beq CODE_9DA966
CODE_9DA95E:
	sta.b d3
	lda.b d3
	sta.b [a2],y
	bra CODE_9DA920
