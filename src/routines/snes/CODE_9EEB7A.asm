; Unidentified routine.
CODE_9EEB7A:
	lda.w facedir,y
CODE_9EEB7D:
	and.w #$0007
	asl a
	tax
	lda.l $9DEF6E,x
	tax
	lda.l $9D0000,x
	ldx.b a3
	ldy.b a0
	sta.w $0D97,y
	lda.b a0
	jsl.l CODE_9BC002
	ldy.b a0
	pla
	sta.w $0D97,y
	lda.b d1
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	sta.b d1
	lda.b d0
	clc
	adc.w Xpos,y
	sec
	sbc.w $0D71
	sta.b d0
	lda.w #$0018
	sta.b d6
	lda.b d6
	asl a
	asl a
	asl a
	asl a
	ldy.b a0
	ldx.w $0EC3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b d0
	sta.b d2
	lda.b d6
	asl a
	asl a
	asl a
	asl a
	ldx.w $0EE3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b d1
	sta.b d3
	ldy.b d2
	jsl.l CODE_9CA554
	sta.b d4
	asl a
	tax
	lda.w #$0003
	jsl.l DivX8U
	cmp.w #$0040
	bcc CODE_9EEC10
	cmp.w #$0050
	bcc CODE_9EEC4D
	ldx.b d4
	lda.w #$0005
	jsl.l DivX8U
	sta.b d6
	lda.w #$0050
	bra CODE_9EEC19
