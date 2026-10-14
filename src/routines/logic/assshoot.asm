; Assignment: computer shooting: wind up, then shoot
assshoot:
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
	jmp.w assexit

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
