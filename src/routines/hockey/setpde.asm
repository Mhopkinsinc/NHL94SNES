; Unidentified routine.
setpde:
	lda.b $91
	beq CODE_9FDCDA
	lda.w #$0034
CODE_9FDCDA:
	clc
	adc.b $A9
	tay
	lda.b $A5
	bpl CODE_9FDCE7
	lda.w #$0000
	sta.b $A5
CODE_9FDCE7:
	sta.w tmpde,y
	rtl
