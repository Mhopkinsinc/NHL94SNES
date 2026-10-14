; Unidentified routine.
CODE_9ECE33:
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	sta.b d1
	lda.b [a1],y
	bit.w #$0080
	beq CODE_9ECE4B
	jmp.w CODE_9ECF40
