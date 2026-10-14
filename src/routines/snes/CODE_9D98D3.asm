; Unidentified routine.
CODE_9D98D3:
	jsl.l RandomWord
	and.w #$001F
	sta.b d0
CODE_9D98DC:
	lda.b d0
	inc a
	and.w #$001F
	sta.b d0
	asl a
	asl a
	asl a
	asl a
	adc.w #$ED59
	sta.b a0
	lda.w #$009C
	sta.b $8B
	lda.w #$000F
	sta.b d1
	lda.l $7E34BE
	sta.b d2
	cmp.w #$001A
	bcc CODE_9D9907
	lda.w #$0019
	sta.b d2
CODE_9D9907:
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	cmp.b d2
	beq CODE_9D9918
	dec.b d1
	bpl CODE_9D9907
	bra CODE_9D98DC
