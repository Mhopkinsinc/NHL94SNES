; Unidentified routine.
CODE_9FCD5E:
	lda.w #$0001
	ldy.w pfgoal,x
	bne CODE_9FCD69
	lda.w #$0002
CODE_9FCD69:
	sta.b $A9
	phx
	ldy.b $B5
	ldx.w #$0000
	lda.w $1C84,y
	cmp.w #$0001
	beq CODE_9FCD7C
	ldx.w #$000C
CODE_9FCD7C:
	lda.w #$0005
	sta.b $A5
CODE_9FCD81:
	lda.w position,x
	cmp.b $A9
	beq CODE_9FCD90
	inx
	inx
	dec.b $A5
	bpl CODE_9FCD81
	bra CODE_9FCDAA
