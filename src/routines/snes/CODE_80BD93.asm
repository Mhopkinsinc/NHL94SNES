; Unidentified routine.
CODE_80BD93:
	ldx.b #$0E
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
