; Unidentified routine.
CODE_9DC5FC:
	stx.b xsave
	ldx.w #$0000
.loop:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0014
	bne .loop
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
	bpl .1
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuGoalie
	sta.b a1
	lda.w #$0010
	sta.b $08
.1:
	phx
	ldx.b d1
.loop2:
	dex
	bmi .t1
	lda.b a1
	clc
	adc.b [a1]
	adc.w #$0004
	sta.b a1
	bra .loop2

.t1:
	lda.b a1
	clc
	adc.b [a1]
	sta.b a1
	lda.b [a1]
	sta.b $B7
	ldy.w #$0002
	lda.b [a1],y
	sta.b d4
	plx
	lda.w $1D9B
	sta.b d0
	lda.w #$0000
	sta.l $7E35F2
	jsl.l CalcAttrib
	lda.b d0
	sta.b $00
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	stx.b xsave
	ldx.w #$0012
.loopx:
	pla
	sta.b d0,x
	dex
	dex
	bpl .loopx
	ldx.b xsave
	lda.b $00
	sta.b d0
	rtl
