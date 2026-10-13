; Unidentified routine.
CompShoot:
	pla
	sep #$20
	pla
	rep #$30
	lda.w pucky
	sta.b $A5
	lda.w pfgoal,x
	bne CODE_9EE123
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EE123:
	lda.w #$0108
	sec
	sbc.b $A5
	lsr a
	lsr a
	lsr a
	cmp.w #$0014
	bcc CODE_9EE134
	lda.w #$0014
CODE_9EE134:
	sta.b $A9
	stz.w temp2,x
	lda.b $A9
	sta.w temp2b,x
	lda.w #$0013
	sta.b $A5
	jmp.w $8C18
