; Unidentified routine.
CODE_9ECD05:
	lda.w tmdata
	sta.b $8D
CODE_9ECD0A:
	lda.w #$009C
	sta.b $8F
	ldy.w #$0004
	lda.b $8D
	clc
	adc.b [$8D],y
	sta.b $8D
CODE_9ECD19:
	lda.w #$0000
	sta.b $97
	lda.w #$0A2A
	sta.b $95
	lda.w #$0002
	sta.b [$95]
	jsl.l appstring
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
CODE_9ECD36:
	ldy.w #$0003
CODE_9ECD39:
	lda.b [$8D],y
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9ECD76
	lda.b [$8D]
	pha
	tya
	dec a
	dec a
	sta.b $B5
	tya
	sta.b [$8D]
	lda.b $8D
	pha
	jsl.l CODE_9ECD7C
	dec.w $0D3F
	pla
	sta.b $8D
	lda.b $8D
	clc
	adc.b $B5
	sta.b $8D
	pla
	sec
	sbc.b $B5
	sta.b [$8D]
	lda.b $A5
	cmp.w #$0015
	bmi CODE_9ECD73
	lda.b $B5
	sta.b $A5
CODE_9ECD73:
	ldy.w #$0002
CODE_9ECD76:
	iny
	tya
	cmp.b [$8D]
	bmi CODE_9ECD39
CODE_9ECD7C:
	inc.w $0D3F
	lda.b $A5
	clc
	adc.b [$8D]
	dec a
	sta.b $A5
	lda.b [$8D]
	dec a
	tay
	dec a
	sta.b $A9
	lda.b [$8D],y
	and.w #$00FF
	beq CODE_9ECD98
	jmp.w CODE_9ECB2B
