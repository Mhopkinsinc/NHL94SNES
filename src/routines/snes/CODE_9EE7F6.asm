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
	stx.w shotPlIdx
	ldy.w $19D4,x
	bmi .t1
.1:
	lda.w $0AA4,y
	sta.w passdir
	bra CODE_9EE84A

.t1:
	lda.w #$0008
	sta.w passdir
CODE_9EE84A:
	lda.w #$0024
	sta.w passspeed
	sta.w pfalock,x
	lda.w gmclock
	bne .2
	phy
	ldy.w #$0000
	cpx.w #$000C
	bmi .1
	ldy.w #$0002
.1:
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
	jsl.l CODE_9EE220
	jmp.w CODE_9EE77E
