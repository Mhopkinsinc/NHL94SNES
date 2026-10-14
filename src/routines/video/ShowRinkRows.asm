; Queue the rink map rows that the vertical scroll brought on screen
ShowRinkRows:
	lda.w sfhormode
	beq .t2
	rtl

.t2:
	lda.w Vscroll
	clc
	adc.w #$0170
	lsr a
	lsr a
	lsr a
	tax
	sec
	sbc.w Oldrow
	bne .t1
	jmp.w CODE_9FC072

.t1:
	bpl CODE_9FBFE6
	stx.w Oldrow
	eor.w #$FFFF
	inc a
	cmp.w #$0019
	bcs CODE_9FBFDA
	sta.b tmp1
	lda.w vramrow
	sec
	sbc.b tmp1
	and.w #$001F
	sta.w vramrow
	sta.b tmp2
	bra CODE_9FC00D
