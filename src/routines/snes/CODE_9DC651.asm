; Unidentified routine.
CODE_9DC651:
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
	jsl.l CODE_9F992E
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
CODE_9DC689:
	pla
	sta.b d0,x
	dex
	dex
	bpl CODE_9DC689
	ldx.b xsave
	lda.b $00
	sta.b d0
	rtl
