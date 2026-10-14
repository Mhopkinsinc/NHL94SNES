; Unidentified routine.
CODE_9EC7BE:
	phx
	ldy.w #$0002
CODE_9EC7C2:
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	adc.w $0CD9
	tax
	lda.l $7E35B6
	adc.l $7E35A8
	ora.w $0D0D
	sta.b $14
CODE_9EC7DF:
	tya
	cmp.b [$8D]
	bne CODE_9EC7E7
	jmp.w CODE_9EC881
