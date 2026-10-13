; Unidentified routine.
CODE_9D98D3:
	jsl.l RandomWord
	and.w #$001F
	sta.b $A5
CODE_9D98DC:
	lda.b $A5
	inc a
	and.w #$001F
	sta.b $A5
	asl a
	asl a
	asl a
	asl a
	adc.w #$ED59
	sta.b $89
	lda.w #$009C
	sta.b $8B
	lda.w #$000F
	sta.b $A9
	lda.l $7E34BE
	sta.b $AD
	cmp.w #$001A
	bcc CODE_9D9907
	lda.w #$0019
	sta.b $AD
CODE_9D9907:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	cmp.b $AD
	beq CODE_9D9918
	dec.b $A9
	bpl CODE_9D9907
	bra CODE_9D98DC
