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
	lda.w pflags,x
	bit.w #$0002
	beq .t2
	and.w #$FFFD
	sta.w pflags,x
	bra SetShotMode

.t2:
	lda.w sflags
	bit.w #$0008
	bne .t1
	jmp.w CODE_9E8BE6

.t1:
	lda.w $1003,x
	sta.b d0
	stz.b d2
	lda.w $10A3,x
	sec
	sbc.b d7
	sta.w $10A3,x
	bpl ShotMode
	lda.w #$0080
	tsb.b d2
	bra ShotMode
