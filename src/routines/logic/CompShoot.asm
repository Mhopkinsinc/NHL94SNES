; Computer player X shoots
CompShoot:
	pla
	sep #$20
	pla
	rep #$30
	lda.w pucky
	sta.b d0
	lda.w pfgoal,x
	bne .1
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.1:
	lda.w #$0108
	sec
	sbc.b d0
	lsr a
	lsr a
	lsr a
	cmp.w #$0014
	bcc .2
	lda.w #$0014
.2:
	sta.b d1
	stz.w $1023,x
	lda.b d1
	sta.w $10A3,x
	lda.w #$0013
	sta.b d0
	jmp.w assreplace
