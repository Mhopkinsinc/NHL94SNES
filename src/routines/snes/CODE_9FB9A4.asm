; Unidentified routine.
CODE_9FB9A4:
	stx.b $87
	ldx.w #$0000
CODE_9FB9A9:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0038
	bne CODE_9FB9A9
	ldx.b $87
	lda.w $0AD3
	beq CODE_9FB9CC
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	jsl.l CODE_9F96E6
	lda.w #$000A
	sta.w $0AD1
CODE_9FB9CC:
	stz.w sfhormode
	lda.w #$03E7
	sta.w $0D23
	jsl.l SprSort
	lda.w sflags
	bit.w #$0001
	bne CODE_9FB9F2
	jsl.l CODE_9DD977
	stz.w $0CD5
	lda.w #$03FF
	sta.w $0CD7
	jsl.l CODE_9F9B36
CODE_9FB9F2:
	lda.w #$007E
	sta.b $0E
	lda.w #$35F4
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0080
	jsl.l CODE_808723
	stx.b $87
	ldx.w #$0036
CODE_9FBA0B:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FBA0B
	ldx.b $87
	ldx.b $95
	rtl
