; Unidentified routine.
CODE_9FB9A4:
	stx.b xsave
	ldx.w #$0000
.loop:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0038
	bne .loop
	ldx.b xsave
	lda.w $0AD3
	beq .1
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	jsl.l CODE_9F96E6
	lda.w #$000A
	sta.w $0AD1
.1:
	stz.w sfhormode
	lda.w #$03E7
	sta.w Oldrow
	jsl.l SprSort
	lda.w sflags
	bit.w #$0001
	bne .2
	jsl.l CODE_9DD977
	stz.w textdirtylo
	lda.w #$03FF
	sta.w textdirtyhi
	jsl.l CODE_9F9B36
.2:
	lda.w #$007E
	sta.b $0E
	lda.w #$35F4
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0080
	jsl.l CODE_808723
	stx.b xsave
	ldx.w #$0036
.loop2:
	pla
	sta.b a0,x
	dex
	dex
	bpl .loop2
	ldx.b xsave
	ldx.b a3
	rtl
