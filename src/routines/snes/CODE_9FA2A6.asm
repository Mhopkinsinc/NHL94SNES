; Unidentified routine.
CODE_9FA2A6:
	jsl.l SetupTeamForIntermission
	lda.w #$0000
	ldy.w #$001E
CODE_9FA2B0:
	sta.w Xpos,y
	dey
	dey
	bpl CODE_9FA2B0
	lda.b $83
	ldy.b $85
	sta.w $0D51
	sty.w $0D53
	lda.w #$0001
	trb.w sflags
	lda.w gsp
	cmp.w #$0004
	beq CODE_9FA2D1
	bra CODE_9FA2D1
