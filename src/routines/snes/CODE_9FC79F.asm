; Unidentified routine.
CODE_9FC79F:
	lda.w #$FFFF
	sta.l $7E35D6
	stz.b d3
	stz.b $B3
	lda.w HomeTeam
	sta.b d0
	jsr.w CODE_9FC7EC
	lda.w VisTeam
	sta.b d0
	jsr.w CODE_9FC7EC
	ldx.w #$0000
.loop:
	jsr.w CODE_9FC7D7
	lda.b d0
	sta.l $7E3528,x
	jsr.w CODE_9FC7D7
	lda.b d0
	sta.l $7E3538,x
	inx
	inx
	cpx.w #$0010
	bne .loop
	rtl
