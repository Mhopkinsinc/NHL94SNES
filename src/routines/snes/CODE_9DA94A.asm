; Unidentified routine.
CODE_9DA94A:
	lda.b $B1
	clc
	adc.b $AD
	cmp.w #$0000
	beq CODE_9DA966
	cmp.w #$0003
	beq CODE_9DA966
	cmp.w #$0005
	beq CODE_9DA966
CODE_9DA95E:
	sta.b $B1
	lda.b $B1
	sta.b [$91],y
	bra CODE_9DA920
