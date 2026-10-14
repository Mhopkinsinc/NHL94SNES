; Unidentified routine.
CODE_9EF226:
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.b a2
	pha
	lda.b $93
	pha
	lda.b a3
	pha
	lda.b $97
	pha
	lda.b d0
	pha
	lda.b $A7
	pha
	phx
	ldx.w $0D29
	stx.b a3
	stz.b a2
	lda.w #$0002
	sta.b a1
	txa
	cmp.w #$000C
	bmi CODE_9EF258
	lda.w #$0002
	sta.b a2
	stz.b a1
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
	ldy.b a2
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
