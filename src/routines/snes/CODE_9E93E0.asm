; Unidentified routine.
CODE_9E93E0:
	lda.b d0
	pha
	lda.b d1
	pha
	lda.w $0792
	and.w #$01C0
	bne CODE_9E9429
	lda.w SPA,x
	cmp.w #$F342
	bne CODE_9E9429
	ldy.b a2
	lda.w pucky
	sec
	sbc.w Ypos,y
	cmp.w #$FF80
	bmi CODE_9E9429
	cmp.w #$0080
	bpl CODE_9E9429
	lda.w $0EC3,x
	sta.b d0
	lda.w $0EE3,x
	sta.b d1
	cmp.w #$DFFF
	bmi CODE_9E9430
	cmp.w #$2001
	bpl CODE_9E9430
	lda.b d0
	cmp.w #$DFFF
	bmi CODE_9E9430
	cmp.w #$2001
	bpl CODE_9E9430
CODE_9E9429:
	pla
	sta.b d1
	pla
	sta.b d0
CODE_9E942F:
	rts
