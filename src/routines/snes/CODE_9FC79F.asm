; Unidentified routine.
CODE_9FC79F:
	lda.w #$FFFF
	sta.l $7E35D6
	stz.b $B1
	stz.b $B3
	lda.w HomeTeam
	sta.b $A5
	jsr.w CODE_9FC7EC
	lda.w VisTeam
	sta.b $A5
	jsr.w CODE_9FC7EC
	ldx.w #$0000
CODE_9FC7BD:
	jsr.w CODE_9FC7D7
	lda.b $A5
	sta.l $7E3528,x
	jsr.w CODE_9FC7D7
	lda.b $A5
	sta.l $7E3538,x
	inx
	inx
	cpx.w #$0010
	bne CODE_9FC7BD
	rtl
