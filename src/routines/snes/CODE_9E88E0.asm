; Unidentified routine.
CODE_9E88E0:
	lda.w #$FF28
	sta.b $A9
CODE_9E88E5:
	lda.w pfgoal,x
	bne CODE_9E88F2
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9E88F2:
	jmp.w $A5A4
