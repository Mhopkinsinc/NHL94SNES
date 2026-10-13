; Unidentified routine.
CODE_9EF226:
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	lda.b $95
	pha
	lda.b $97
	pha
	lda.b $A5
	pha
	lda.b $A7
	pha
	phx
	ldx.w $0D29
	stx.b $95
	stz.b $91
	lda.w #$0002
	sta.b $8D
	txa
	cmp.w #$000C
	bmi CODE_9EF258
	lda.w #$0002
	sta.b $91
	stz.b $8D
CODE_9EF258:
	ldy.w #$177A
	lda.w pfteam,x
	beq CODE_9EF262
	iny
	iny
CODE_9EF262:
	lda.w $0000,y
	inc a
	sta.w $0000,y
	ldy.b $91
	bne CODE_9EF28A
	lda.w tmap
	sec
	sbc.w $17A8
	beq CODE_9EF2A5
	bmi CODE_9EF281
	lda.w $175A
	inc a
	sta.w $175A
	bra CODE_9EF2A5
