; Unidentified routine.
CODE_9FDBD0:
	lda.l $7E34C6
	cmp.w #$0002
	beq CODE_9FDC4B
	lda.w pucky
	sta.b d0
	lda.w pfgoal,x
	bne CODE_9FDBEB
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
CODE_9FDBEB:
	lda.b d0
	bmi CODE_9FDC4B
	sec
	sbc.w #$0058
	bpl CODE_9FDC4B
	lda.w $0792
	and.w #$0003
	bne CODE_9FDC4B
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FDC09
	ldy.w #$0002
CODE_9FDC09:
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne CODE_9FDC4B
	stz.b a2
	lda.w #$0002
	sta.b a1
	lda.w pfteam,x
	beq CODE_9FDC25
	stz.b a1
	lda.w #$0002
	sta.b a2
CODE_9FDC25:
	jsl.l CODE_9FDD19
	lda.b d0
	cmp.w #$0C01
	bcs CODE_9FDC4B
	lda.w $163A
	bne CODE_9FDC4B
	lda.l $7E34C6
	beq CODE_9FDC4B
	jsl.l CODE_9FDA53
	jsl.l setpersonel
	jsl.l CODE_9F9B36
	jml.l CompShoot
