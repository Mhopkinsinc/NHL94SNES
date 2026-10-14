; Unidentified routine.
CODE_9DC561:
	stx.b xsave
	ldx.w #$0000
CODE_9DC566:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9DC566
	ldx.b xsave
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuSkater
	sta.b a1
	stz.b $08
	jsl.l GoalieCount
	lda.w $1D9B
	cmp.b d0
	bpl CODE_9DC5A4
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuGoalie
	sta.b a1
	lda.w #$0010
	sta.b $08
CODE_9DC5A4:
	phx
	ldx.b d1
CODE_9DC5A7:
	dex
	bmi CODE_9DC5B6
	lda.b a1
	clc
	adc.b [a1]
	adc.w #$0004
	sta.b a1
	bra CODE_9DC5A7
