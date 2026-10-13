; Unidentified routine.
CODE_9C8E9C:
	jsr.w $8F36
	lda.w $1DBD
	dec a
	bmi CODE_9C8E3A
	sta.w $1DBD
	inc.w $1DC5
	jsr.w CODE_808F7D
	dec.w $1DC5
	jsl.l WaitFrame
	lda.w #$000D
	sta.w $1DF3
CODE_9C8EBB:
	jsl.l WaitFrame
	dec.w $1DF3
	dec.w $1DF3
	lda.w $1DF3
	cmp.w #$0001
	bne CODE_9C8EBB
	jsr.w CODE_808F7D
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w $8E22
