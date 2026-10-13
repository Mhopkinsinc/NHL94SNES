; Unidentified routine.
CODE_9E828B:
	lda.w sflags
	and.w #$4000
	rtl
	cpx.w $0AD9
	bne CODE_9E829C
	lda.w $19D4,x
	bmi CODE_9E82A7
CODE_9E829C:
	jmp.w $8BE6
