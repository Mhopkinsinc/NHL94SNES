; Unidentified routine.
CODE_8085DE:
	lda.w JoyPad
	and.b $14
	beq CODE_8085D0
	rtl
