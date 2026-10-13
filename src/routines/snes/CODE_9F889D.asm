; Unidentified routine.
CODE_9F889D:
	cmp.w $17B0
	bcs CODE_9F88A8
	sta.w $17B0
	stx.w $17B4
CODE_9F88A8:
	ply
	pla
	jsl.l CODE_9CA568
	ldx.b $E4
	sta.w $0B1D,x
	cpx.w #$0018
	bcs CODE_9F88F6
	cmp.w #$001E
	bcs CODE_9F88F6
	lda.w iflags
	bit.w #$0004
	beq CODE_9F88F6
	bit.w #$0001
	bne CODE_9F88F6
	and.w #$0002
	beq CODE_9F88D6
	lda.w pfgoal,x
	bne CODE_9F88F6
	bra CODE_9F88DB
