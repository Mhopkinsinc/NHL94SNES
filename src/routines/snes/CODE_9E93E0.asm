; Unidentified routine.
CODE_9E93E0:
	lda.b $A5
	pha
	lda.b $A9
	pha
	lda.w seed
	and.w #$01C0
	bne CODE_9E9429
	lda.w SPA,x
	cmp.w #SPAburst
	bne CODE_9E9429
	ldy.b $91
	lda.w pucky
	sec
	sbc.w Ypos,y
	cmp.w #$FF80
	bmi CODE_9E9429
	cmp.w #$0080
	bpl CODE_9E9429
	lda.w Xvel,x
	sta.b $A5
	lda.w Yvel,x
	sta.b $A9
	cmp.w #$DFFF
	bmi CODE_9E9430
	cmp.w #$2001
	bpl CODE_9E9430
	lda.b $A5
	cmp.w #$DFFF
	bmi CODE_9E9430
	cmp.w #$2001
	bpl CODE_9E9430
CODE_9E9429:
	pla
	sta.b $A9
	pla
	sta.b $A5
CODE_9E942F:
	rts
