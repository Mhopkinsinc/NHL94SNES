; Print string [a1] into the text map at printx / printy
print:
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
	adc.w printm
	tax
	lda.l $7E35B6
	adc.l printfontset
	ora.w $0D0D
	sta.b $14
CODE_9EC7DF:
	tya
	cmp.b [a1]
	bne CODE_9EC7E7
	jmp.w CODE_9EC881
