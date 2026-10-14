; Fill $7EF000 with the 26 team numbers in random order (RandomWord, no repeats)
ShuffleTitleTeams:
	stz.w $0BD5
	ldx.w #$0000
	lda.w #$0000
.1:
	jsl.l RandomWord
	and.w #$001F
	cmp.w #$001A
	bcs .1
	phx
	ldx.w #$0000
.loop:
	cpx.w $0BD5
	bcs .t2
	cmp.l $7EF000,x
	beq .t1
	inx
	inx
	bra .loop

.t1:
	plx
	bra .1

.t2:
	plx
	sta.l $7EF000,x
	inx
	inx
	stx.w $0BD5
	cpx.w #$0034
	bcc .1
	stz.w $0BD5
	rts
