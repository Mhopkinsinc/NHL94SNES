; a2 = the team of the controller that paused (0 home, 2 visitors), from its side ($1C84)
GetPadTeam:
	stz.b a2
	lda.w #$0001
	sta.b $93
	ldx.w pausepad
	bpl .t1
	txa
	eor.w #$FFFF
	inc a
	sta.b $93
	ldx.w #$0000
.loop:
	lda.w cont1team,x
	cmp.b $93
	beq .t1
	inx
	inx
	cpx.w #$000A
	bcc .loop
	bra .1

.t1:
	lda.w cont1team,x
	cmp.w #$0001
	beq .1
	inc.b a2
	inc.b a2
.1:
	rtl
