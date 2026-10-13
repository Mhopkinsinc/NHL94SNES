; Unidentified routine.
CODE_9DC5B6:
	lda.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
	lda.b [$8D]
	sta.b $B7
	ldy.w #$0002
	lda.b [$8D],y
	sta.b $B5
	plx
	lda.w $1D9B
	sta.b $A5
	lda.w #$0001
	sta.l $7E35F2
	jsl.l CODE_9F992E
	lda.b $A5
	sta.b $00
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	stx.b $87
	ldx.w #$0012
CODE_9DC5EE:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9DC5EE
	ldx.b $87
	lda.b $00
	sta.b $A5
	rtl
