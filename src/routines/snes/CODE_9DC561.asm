; Unidentified routine.
CODE_9DC561:
	stx.b $87
	ldx.w #$0000
CODE_9DC566:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9DC566
	ldx.b $87
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuSkater
	sta.b $8D
	stz.b $08
	jsl.l GoalieCount
	lda.w $1D9B
	cmp.b $A5
	bpl CODE_9DC5A4
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuGoalie
	sta.b $8D
	lda.w #$0010
	sta.b $08
CODE_9DC5A4:
	phx
	ldx.b $A9
CODE_9DC5A7:
	dex
	bmi CODE_9DC5B6
	lda.b $8D
	clc
	adc.b [$8D]
	adc.w #$0004
	sta.b $8D
	bra CODE_9DC5A7
