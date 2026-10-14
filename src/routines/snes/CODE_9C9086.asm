; Unidentified routine.
CODE_9C9086:
	lda.b [a0]
	clc
	adc.b a2
	tay
	lda.w $0000,y
	sta.b d0
	inc.b a0
	inc.b a0
	lda.b [a0]
	clc
	adc.b a2
	tay
	lda.w $0000,y
	sta.b d1
	lda.b d0
	cmp.b d1
	bpl CODE_9C90B8
	ldx.w #$0064
	jsl.l CODE_808F4C
	tax
	lda.b d1
	beq CODE_9C90BF
	jsl.l DivX8U
	bra CODE_9C90BF
