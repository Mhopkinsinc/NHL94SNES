; Unidentified routine.
CODE_9FC299:
	lda.w gmclock
	bne CODE_9FC298
	ldy.w #$0000
	lda.w pfteam,x
	beq .1
	ldy.w #$0002
.1:
	lda.w $1D55,y
	bpl CODE_9FC298
	lda.b d4
	sta.w $1D55,y
	jmp.w CODE_9FD2FE
