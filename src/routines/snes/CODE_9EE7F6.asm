; Unidentified routine.
CODE_9EE7F6:
	lda.w #$000A
	sta.w $1203,x
	lda.w SPAnum,x
	cmp.w #$0010
	bcs CODE_9EE7F3
	txa
	jsl.l GetHot
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
	jsl.l ApproxLength
	cmp.w #$0008
	bcs .5
	stz.w SPAcnt,x
	cmp.w #$000C
	bcs .5
	stx.w puckc
	ldy.w $19D4,x
	bmi .t1
.1:
	lda.w $0AA4,y
	sta.w passdir
	bra .4

.t1:
	lda.w #$0008
	sta.w passdir
.4:
	lda.w #$0024
	sta.w passspeed
	sta.w pfalock,x
	lda.w gmclock
	bne .2
	phy
	ldy.w #$0000
	cpx.w #$000C
	bmi .1x
	ldy.w #$0002
.1x:
	lda.w $17D6,y
	inc a
	sta.w $17D6,y
	ply
.2:
	lda.w #$0001
	sta.w $1E89
	lda.w $19BE
	clc
	adc.w #$000A
	bmi .3
	sta.w $19BE
.3:
	lda.b a2
	pha
	stx.b a2
	jsl.l a2touchpuck
	pla
	sta.b a2
	jsl.l doshot
	jmp.w CODE_9EE77E
.5:
	lda.w puckc
	bmi .t1x
.1xx:
	cpx.w puckc
	beq .t1x
	jmp.w CODE_9EE77E

.t1x:
	rtl
