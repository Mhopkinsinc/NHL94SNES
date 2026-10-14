; Unidentified routine.
CODE_9FB64A:
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9FB69D
	lda.b [a0]
	xba
	and.w #$007F
	asl a
	tay
	lda.w #$0058
	sta.b d1
	lda.w pfgoal,y
	bne CODE_9FB678
	lda.w #$FFA8
	sta.b d1
	cmp.l $7E3138
	bmi CODE_9FB69D
	lda.w #$FFBF
	sta.l $7E3138
	bra CODE_9FB687
