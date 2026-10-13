; Unidentified routine.
CODE_9EB76A:
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	lda.w sflags
	bit.w #$4000
	beq CODE_9EB784
	jsl.l updatepwrplay_clr
	lda.w #$4000
	trb.w sflags
CODE_9EB784:
	lda.w #$2000
	tsb.w sflags
	bne CODE_9EB791
	ldx.b $95
	inc.w $1746,x
CODE_9EB791:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF718
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l GetLowestPen
	lda.w gmclock
	bne CODE_9EB7FB
	lda.b $A5
	cmp.w #$0005
	bcs CODE_9EB7FB
	cmp.w #$0001
	beq CODE_9EB7CE
	lda.w #$7000
	sta.b $64
	lda.w #$0005
	jsl.l CODE_80A17D
	bra CODE_9EB7FB
