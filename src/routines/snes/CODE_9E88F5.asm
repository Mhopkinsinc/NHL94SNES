; Unidentified routine.
CODE_9E88F5:
	ldy.w #$0062
	lda.w pfgoal,x
	beq .1
	ldy.w #$FF9E
.1:
	sty.b d1
	bra CODE_9E88F2
	lda.w $0AD9
	bmi .t1
	lda.w $0EC4,x
	sec
	sbc.w $0EE0
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:
	clc
	adc.w Xpos,x
	sec
	sbc.w $0D71
	cmp.w #$FFD7
	bmi .t1
	cmp.w #$0029
	bpl .t1
	lda.w $0EE4,x
	sec
	sbc.w $0F00
	and.w #$00FF
	bit.w #$0080
	beq .3
	ora.w #$FF00
.3:
	clc
	adc.w Ypos,x
	sec
	sbc.w pucky
	cmp.w #$FFD7
	bmi .t1
	cmp.w #$0029
	bpl .t1
	lda.w Xpos,x
	sec
	sbc.w $0D71
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w pucky
	sta.b d1
	jml.l vtoa

.t1:
	rtl
	ldy.w $0AD9
	bmi CODE_9E8981
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E8981
	lda.w #$0004
	sta.b d0
	jmp.w assreplace
