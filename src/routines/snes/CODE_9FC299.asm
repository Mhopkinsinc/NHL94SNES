; Unidentified routine.
CODE_9FC299:
	lda.w gmclock
	bne CODE_9FC298
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FC2A9
	ldy.w #$0002
CODE_9FC2A9:
	lda.w $1D55,y
	bpl CODE_9FC298
	lda.b $B5
	sta.w $1D55,y
	jmp.w $D2FE
