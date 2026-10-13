; Unidentified routine.
CODE_80BD46:
	ldx.b #$10
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
