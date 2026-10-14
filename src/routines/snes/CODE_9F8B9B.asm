; Unidentified routine.
CODE_9F8B9B:
	lda.w #$0008
	sta.b d0
	ldx.w #$0000
	stx.b a3
	lda.l $7E35D4
	cmp.w #$0003
	bne CODE_9F8C17
	lda.w $0ACF
	cmp.w #$0007
	beq CODE_9F8BEE
	lda.l $7E35D6
	asl a
	sta.b a0
	tax
	stz.b d3
	lda.l $7E3598,x
	bit.w #$0001
	beq CODE_9F8BCE
	lda.w #$0010
	sta.b d3
CODE_9F8BCE:
	lda.w $178E
	cmp.w $1790
	bpl CODE_9F8BDD
	lda.b d3
	eor.w #$0010
	sta.b d3
CODE_9F8BDD:
	lda.b a0
	clc
	adc.b d3
	phx
	tax
	lda.l $7E3548,x
	plx
	cmp.w #$0003
	bne CODE_9F8C17
CODE_9F8BEE:
	lda.l $7E34BC
	cmp.w #$0000
	beq CODE_9F8C17
	inc.b $0C
	lda.w #$0009
	sta.b d0
	lda.w #$000B
	sta.b d2
CODE_9F8C03:
	lda.w pflags,x
	and.w #$FFF7
	sta.w pflags,x
	inx
	inx
	dec.b d2
	bpl CODE_9F8C03
	ldx.w #$0000
	stx.b a3
CODE_9F8C17:
	lda.w #$0005
	sta.b d2
	lda.w $178E
	cmp.w $1790
	beq CODE_9F8C96
	bpl CODE_9F8C2B
	ldx.w #$000C
	stx.b a3
CODE_9F8C2B:
	lda.w position,x
	beq CODE_9F8C3B
	bmi CODE_9F8C3B
	jsl.l assinsert
	lda.w #$0008
	sta.b d0
CODE_9F8C3B:
	inx
	inx
	stx.b a3
	dec.b d2
	bpl CODE_9F8C2B
CODE_9F8C43:
	jsl.l ClearPenaltyBuffer
	lda.l $7E35E0
	clc
	adc.w #$03E8
	sta.l $7E35E0
	lda.w #$003C
	sta.b $81
	lda.w #$0040
	sta.w gmclock
	tsb.w gmode
	lda.w $178E
	cmp.w $1790
	bmi CODE_9F8C7F
	lda.w #$0000
	sta.l $7E35E0
	lda.w #$0003
	sta.w $0CE7
	lda.b $83
	sec
	sbc.w #$0096
	sta.w $0CE9
CODE_9F8C7F:
	lda.w #$0004
	sta.b d0
	jsl.l CODE_9EB88A
	lda.b $0C
	beq CODE_9F8C95
	lda.w #$0032
	sta.b d0
	jsl.l CODE_9EB88A
CODE_9F8C95:
	rtl
