; Unidentified routine.
CODE_8085F7:
	lda.w $0778
	and.b $14
	beq CODE_8085E9
	rtl
