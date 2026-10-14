; Unidentified routine.
CODE_9E8373:
	rtl
	lda.b d0
	and.w #$00FF
	bit.w #$0080
	beq .2
.1:
	ora.w #$FF00
.2:
	sta.b d0
	lda.w $0EC4,x
	and.w #$00FF
	bit.w #$0080
	beq .3
	ora.w #$FF00
.3:
	clc
	adc.w puckx
	sta.b d2
	lda.w $0EE4,x
	and.w #$00FF
	bit.w #$0080
	beq .4
	ora.w #$FF00
.4:
	clc
	adc.w pucky
	sta.b d3
	stz.w $0D2D
	lda.w #$0005
	sta.b d4
	stz.b a0
	cpx.w #$000C
	bcs .6
.5:
	lda.w #$000C
	sta.b a0
.6:
	ldy.b a0
	lda.w $0EC4,y
	and.w #$00FF
	bit.w #$0080
	beq .7
	ora.w #$FF00
.7:
	clc
	adc.w Xpos,y
	sec
	sbc.b d2
	cmp.w #$FFEB
	bmi .9
	cmp.w #$0015
	bpl .9
	lda.w $0EE4,y
	and.w #$00FF
	bit.w #$0080
	beq .8
	ora.w #$FF00
.8:
	clc
	adc.w Ypos,y
	sec
	sbc.b d3
	cmp.w #$FFEB
	bmi .9
	cmp.w #$0015
	bpl .9
	inc.w $0D2D
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	jsl.l vtoa
	lda.w facedir,x
	eor.w #$0004
	cmp.b d0
	bne .9
	lda.w $0794
	and.w #$0001
	clc
	adc.b d0
	and.w #$0007
	sta.b d0
.9:
	inc.b a0
	inc.b a0
	dec.b d4
	bmi .t1
	jmp.w .6

.t1:
	rtl
