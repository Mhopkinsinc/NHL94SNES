; Unidentified routine.
CODE_9EE7F6:
	lda.w #$000A
	sta.w $1203,x
	lda.w SPAnum,x
	cmp.w #$0010
	bcs CODE_9EE7F3
	txa
	jsl.l CODE_9BC002
	lda.w Xpos,x
	clc
	adc.b d0
	sec
	sbc.w $0D71
	sta.b d0
	lda.w Ypos,x
	clc
	adc.b d1
	sec
	sbc.w pucky
	sta.b d1
	ldy.b d0
	jsl.l CODE_9CA554
	cmp.w #$0008
	bcs CODE_9EE891
	stz.w SPAcnt,x
	cmp.w #$000C
	bcs CODE_9EE891
	stx.w $0AD9
	ldy.w $19D4,x
	bmi CODE_9EE844
CODE_9EE83C:
	lda.w $0AA4,y
	sta.w passdir
	bra CODE_9EE84A
