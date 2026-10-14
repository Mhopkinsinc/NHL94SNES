; Unidentified routine.
CODE_9ECA05:
	inc.b $91
	lda.b [$91]
	inc.w $0D3F
	and.w #$00FF
	cmp.w #$0072
	bne CODE_9ECA17
	jmp.w CODE_9ECC4B
