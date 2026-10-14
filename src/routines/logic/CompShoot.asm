; Computer player X shoots
CompShoot:
	pla
	sep #$20
	pla
	rep #$30
	lda.w pucky
	sta.b d0
	lda.w pfgoal,x
	bne CODE_9EE123
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
CODE_9EE123:
	lda.w #$0108
	sec
	sbc.b d0
	lsr a
	lsr a
	lsr a
	cmp.w #$0014
	bcc CODE_9EE134
	lda.w #$0014
CODE_9EE134:
	sta.b d1
	stz.w $1023,x
	lda.b d1
	sta.w $10A3,x
	lda.w #$0013
	sta.b d0
	jmp.w assreplace
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EE156
	and.w #$FFFD
	sta.w pflags,x
	bra SetShotMode
