; Unidentified routine.
CODE_9C9086:
	lda.b [$89]
	clc
	adc.b $91
	tay
	lda.w $0000,y
	sta.b $A5
	inc.b $89
	inc.b $89
	lda.b [$89]
	clc
	adc.b $91
	tay
	lda.w $0000,y
	sta.b $A9
	lda.b $A5
	cmp.b $A9
	bpl CODE_9C90B8
	ldx.w #$0064
	jsl.l CODE_808F4C
	tax
	lda.b $A9
	beq CODE_9C90BF
	jsl.l DivX8U
	bra CODE_9C90BF
