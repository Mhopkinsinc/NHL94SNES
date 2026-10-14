; Unidentified routine.
CODE_9FC1EC:
	lda.w $0B7D,x
	cmp.w #$BCC7
	beq CODE_9FC1CD
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FC200
	ldy.w #$0002
CODE_9FC200:
	lda.w $1D55,y
	ply
	cmp.w #$0000
	bmi CODE_9FC20D
	cmp.b $B5
	bne CODE_9FC222
CODE_9FC20D:
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FC219
	ldy.w #$0002
CODE_9FC219:
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne CODE_9FC273
CODE_9FC222:
	lda.b $A9
	bit.w #$2000
	bne CODE_9FC299
	cpx.w $0AD9
	bne CODE_9FC231
	jmp.w CODE_9FC2CE
