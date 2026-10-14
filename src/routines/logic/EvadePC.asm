; A skateto callback near the puck carrier: d0 = the direction away from him
EvadePC:
	lda.w puckc
	bmi .rtl
	lda.w $0EC4,x
	sec
	sbc.w $0EE0
	and.w #$00FF
	bit.w #$0080
	beq .2xx
	ora.w #$FF00
.2xx:
	clc
	adc.w Xpos,x
	sec
	sbc.w $0D71
	cmp.w #$FFD7
	bmi .rtl
	cmp.w #$0029
	bpl .rtl
	lda.w $0EE4,x
	sec
	sbc.w $0F00
	and.w #$00FF
	bit.w #$0080
	beq .3x
	ora.w #$FF00
.3x:
	clc
	adc.w Ypos,x
	sec
	sbc.w pucky
	cmp.w #$FFD7
	bmi .rtl
	cmp.w #$0029
	bpl .rtl
	lda.w Xpos,x
	sec
	sbc.w $0D71
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w pucky
	sta.b d1
	jml.l vtoa

.rtl:
	rtl
