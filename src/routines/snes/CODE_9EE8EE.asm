; Unidentified routine.
CODE_9EE8EE:
	ldy.b d0
	sty.b a0
	lda.w position,y
	beq CODE_9EE8ED
	bmi CODE_9EE8ED
	lda.w pflags,y
	and.w #$1000
	ora.w pfalock,y
	bne CODE_9EE8ED
	lda.w Ypos,y
	sta.b d0
	lda.w Ypos,x
	sta.b d1
	lda.w pfgoal,x
	bne CODE_9EE923
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
CODE_9EE923:
	lda.w gmode
	bit.w #$0020
	beq CODE_9EE93D
	lda.b d0
	sec
	sbc.w #$0058
	sta.b tmp0
	lda.b d1
	sec
	sbc.w #$0058
	eor.b tmp0
	bmi CODE_9EE8ED
CODE_9EE93D:
	lda.b d0
	cmp.w #$0058
	bpl CODE_9EE950
	lda.b d0
	sec
	sbc.b d1
	sta.b d0
	cmp.w #$FFF1
	bmi CODE_9EE9A2
CODE_9EE950:
	lda.w $0B5D,y
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w passdir
	lda.w $0B3D,y
	sta.b d2
	lda.w #$0005
	sta.b d3
	ldy.w #$0000
	stz.b a1
	cpx.w #$000C
	bcs CODE_9EE974
	ldy.w #$000C
CODE_9EE974:
	lda.b d2
	cmp.w $0B3D,y
	bcc CODE_9EE98A
	lda.w $0B5D,y
	sec
	sbc.w #$0004
	and.w #$0007
	cmp.w passdir
	beq CODE_9EE9A2
CODE_9EE98A:
	iny
	iny
	dec.b d3
	bpl CODE_9EE974
	jsl.l CODE_9EE9BF
	lda.w position,x
	beq CODE_9EE9A2
	pla
	sep #$20
	pla
	rep #$30
	jmp.w CODE_9E8BE6
