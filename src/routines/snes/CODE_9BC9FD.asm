; Unidentified routine.
CODE_9BC9FD:
	pha
	jsl.l CODE_9BCAB8
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	lda.w #$0003
	sta.w $0A4A
	phx
	ldy.b $B9
	tyx
	lda.l PasstoText,x
	plx
	sta.w $0A4C
	lda.w #$0000
	sta.b $8F
	lda.w #$0A4A
	sta.b $8D
	inc.w printx
	dec.w printy
	dec.w printy
	jsl.l CODE_9EC7BE
	pla
	sta.b $B9
	jsl.l CODE_9BCAB8
	jsl.l CODE_9D80DD
	phx
	ldy.b $B9
	tyx
	lda.l PasstoText,x
	plx
	sta.w $0A4C
	lda.w #$0000
	sta.b $8F
	lda.w #$0A4A
	sta.b $8D
	inc.w printx
	dec.w printy
	dec.w printy
	jsl.l CODE_9EC7BE
	lda.w #$007E
	sta.b $8B
	lda.w #$34F4
	sta.b $89
	ldy.b $B5
	sep #$20
	lda.b $B9
	sta.b [$89],y
	rep #$30
	jmp.w CODE_9BC949
