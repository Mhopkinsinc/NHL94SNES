; Unidentified routine.
CODE_9EE8EE:
	ldy.b $A5
	sty.b $89
	lda.w position,y
	beq CODE_9EE8ED
	bmi CODE_9EE8ED
	lda.w pflags,y
	and.w #$1000
	ora.w $14E3,y
	bne CODE_9EE8ED
	lda.w Ypos,y
	sta.b $A5
	lda.w Ypos,x
	sta.b $A9
	lda.w pfgoal,x
	bne CODE_9EE923
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9EE923:
	lda.w gmode
	bit.w #$0020
	beq CODE_9EE93D
	lda.b $A5
	sec
	sbc.w #$0058
	sta.b $C5
	lda.b $A9
	sec
	sbc.w #$0058
	eor.b $C5
	bmi CODE_9EE8ED
CODE_9EE93D:
	lda.b $A5
	cmp.w #$0058
	bpl CODE_9EE950
	lda.b $A5
	sec
	sbc.b $A9
	sta.b $A5
	cmp.w #$FFF1
	bmi CODE_9EE9A2
CODE_9EE950:
	lda.w $0B5D,y
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w passdir
	lda.w $0B3D,y
	sta.b $AD
	lda.w #$0005
	sta.b $B1
	ldy.w #$0000
	stz.b $8D
	cpx.w #$000C
	bcs CODE_9EE974
	ldy.w #$000C
CODE_9EE974:
	lda.b $AD
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
	dec.b $B1
	bpl CODE_9EE974
	jsl.l CODE_9EE9BF
	lda.w position,x
	beq CODE_9EE9A2
	pla
	sep #$20
	pla
	rep #$30
	jmp.w $8BE6
