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
	sta.b $A9
	lda.b [$8D],y
	bit.w #$0080
	beq CODE_9ECE4B
	jmp.w CODE_9ECF40
