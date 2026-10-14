; Unidentified routine.
CODE_9BC9FD:
	pha
	jsl.l CODE_9BCAB8
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.w #$0003
	sta.w $0A4A
	phx
	ldy.b d5
	tyx
	lda.l PasstoText,x
	plx
	sta.w $0A4C
	lda.w #$0000
	sta.b $8F
	lda.w #$0A4A
	sta.b a1
	inc.w printx
	dec.w printy
	dec.w printy
	jsl.l print
	pla
	sta.b d5
	jsl.l CODE_9BCAB8
	jsl.l CODE_9D80DD
	phx
	ldy.b d5
	tyx
	lda.l PasstoText,x
	plx
	sta.w $0A4C
	lda.w #$0000
	sta.b $8F
	lda.w #$0A4A
	sta.b a1
	inc.w printx
	dec.w printy
	dec.w printy
	jsl.l print
	lda.w #$007E
	sta.b $8B
	lda.w #$34F4
	sta.b a0
	ldy.b d4
	sep #$20
	lda.b d5
	sta.b [a0],y
	rep #$30
	jmp.w CODE_9BC949
