; Unidentified routine.
CODE_9EB892:
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.b $A5
	cmp.w #$000E
	bne CODE_9EB8AB
CODE_9EB8AB:
	sec
	sbc.w #$000E
	bmi CODE_9EB8D8
	lda.l $7E35E0
	clc
	adc.w #$00C8
	sta.l $7E35E0
	lda.w #$002D
	sta.b $81
	lda.w pfteam,x
	beq CODE_9EB8D8
	lda.l $7E35E0
	sec
	sbc.w #$00C8
	bcs CODE_9EB8D4
	lda.w #$0000
CODE_9EB8D4:
	sta.l $7E35E0
CODE_9EB8D8:
	lda.w #$0000
	sta.b $8F
	lda.w #$15DE
	sta.b $8D
	lda.w #$001F
	sta.b $A9
CODE_9EB8E7:
	lda.b [$8D]
	inc.b $8D
	inc.b $8D
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB8E7
	tay
	beq CODE_9EB8FE
	dec.b $A9
	bpl CODE_9EB8E7
	bra CODE_9EB939
