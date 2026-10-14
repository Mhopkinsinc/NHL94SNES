; Computer player X shoots
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
	jmp.w CODE_9E8BE6

.t1:
	lda.w temp1,x
	sta.b d0
	stz.b d2
	lda.w temp2b,x
	sec
	sbc.b d7
	sta.w temp2b,x
	bpl ShotMode
	lda.w #$0080
	tsb.b d2
	bra ShotMode
