; Unidentified routine.
CODE_9E828B:
	lda.w sflags
	and.w #sf2pwrtm
	rtl
	cpx.w $0AD9
	bne CODE_9E829C
	lda.w $19D4,x
	bmi asseben
CODE_9E829C:
	jmp.w CODE_9E8BE6
