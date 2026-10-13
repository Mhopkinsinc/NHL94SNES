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
	ldx.b $95
	ldy.b $89
	sta.w frame,y
	lda.b $89
	jsl.l CODE_9BC002
	ldy.b $89
	pla
	sta.w frame,y
	lda.b $A9
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	sta.b $A9
	lda.b $A5
	clc
	adc.w Xpos,y
	sec
	sbc.w puckx
	sta.b $A5
	lda.w #$0018
	sta.b $BD
	lda.b $BD
	asl a
	asl a
	asl a
	asl a
	ldy.b $89
	ldx.w Xvel,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b $A5
	sta.b $AD
	lda.b $BD
	asl a
	asl a
	asl a
	asl a
	ldx.w Yvel,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b $A9
	sta.b $B1
	ldy.b $AD
	jsl.l CODE_9CA554
	sta.b $B5
	asl a
	tax
	lda.w #$0003
	jsl.l DivX8U
	cmp.w #$0040
	bcc CODE_9EEC10
	cmp.w #$0050
	bcc CODE_9EEC4D
	ldx.b $B5
	lda.w #$0005
	jsl.l DivX8U
	sta.b $BD
	lda.w #$0050
	bra CODE_9EEC19
