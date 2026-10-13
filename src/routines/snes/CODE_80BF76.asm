; Unidentified routine.
CODE_80BF76:
	ldx.b #$02
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
